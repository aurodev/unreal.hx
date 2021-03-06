package uhx.build;
import haxe.io.Path;
import uhx.build.Log.*;
import sys.FileSystem;
import sys.io.File;

using Lambda;
using StringTools;

class UhxBuild extends UhxBaseBuild {
  private static var VERSION_LEVEL = 5;
  private static inline var PARALLEL_DEP_CHECK = true;

  var haxeDir:String;
  var targetModule:String;
  var definitions = [];
  var version:{ MajorVersion:Int, MinorVersion:Int, PatchVersion:Null<Int> };
  var srcDir:String;

  var scriptPaths:Array<String>;
  var modulePaths:Array<String>;
  var defineVer:String;
  var definePatch:String;
  var outputStatic:String;
  var outputDir:String;
  var buildName:String;
  var shortBuildName:String;
  var debugSymbols:Bool;
  var compserver:String;
  var externsFolder:String;
  var cppiaEnabled:Bool;

  var stampOverride:Float;

  var ranExternBaker:Bool;
  var externsToCompile:Map<String, Bool>;

  var threadPool:uhx.build.ThreadPool;

  public function new(data, ?config:UhxBuildConfig) {
    super(data, config);
    this.haxeDir = data.projectDir + '/Haxe';
    this.targetModule = this.data.targetName;
    if (this.targetModule.endsWith("Editor")) {
      this.targetModule = this.targetModule.substr(0,this.targetModule.length - "Editor".length);
    }

    this.externsToCompile = new Map();
    this.threadPool = new uhx.build.ThreadPool(this.config.numProcessors);
  }

  private function getStampOverride() {
    var stamp = getNewerStampRec([data.pluginDir + '/Haxe/Static/uhx/compiletime',
      data.pluginDir + '/Haxe/BuildTool/interp/'
    ]);
    function addStamp(file:String) {
      if (FileSystem.exists(file)) {
        var curStamp = FileSystem.stat(file).mtime.getTime();
        if (curStamp >= stamp) {
          stamp = curStamp;
        }
      }
    }
    addStamp(this.haxeDir + '/arguments.hxml');
    addStamp(this.outputDir+'/Data/needed-configs.txt');

    return stamp;
  }

  private function getNeededConfigs() {
    var vars = ['dce','extraCompileArgs','extraCppiaCompileArgs','extraStaticClasspaths',
                'extraScriptClasspaths', 'disableCppia', 'noStatic', 'disableUObject',
                'debugger', 'noDynamicObjects', 'compilationServer', 'haxeInstallPath',
                'haxelibPath'];
    var buf = new StringBuf();
    buf.add('engine=${this.version};');
    for (v in vars) {
      var val:Dynamic = Reflect.field(this.config, v);
      if (val != null) {
        buf.add('$v=$val;');
      }
    }
    return buf.toString();
  }

  private function consolidateNeededConfigs() {
    var needed = getNeededConfigs();
    var target = this.outputDir+'/Data/needed-configs.txt';
    if (!FileSystem.exists(target) || File.getContent(target).trim() != needed) {
      sys.io.File.saveContent(target, needed);
    }
  }

  private function hasNewModules(modulesFile:String, dirs:Array<String>, traceFiles:Bool, phase:String):Bool {
    if (!FileSystem.exists(modulesFile)) {
      if (traceFiles) {
        log('compiling $phase because the modules file $modulesFile was not found');
      }
      return true;
    }
    var modules = new Map();
    for (mod in sys.io.File.getContent(modulesFile).split('\n')) {
      modules[mod] = true;
    }

    function recurse(dir:String, mod:String) {
      for (file in FileSystem.readDirectory(dir)) {
        if (file.endsWith('.hx')) {
          var name = mod + file.substr(0,file.length-3);
          if (!modules.exists(name)) {
            if (traceFiles) {
              log('compiling $phase because there is a new module $name');
            }
            return true;
          }
        } else if (FileSystem.isDirectory('$dir/$file')) {
          if (recurse('$dir/$file', mod + file + '.')) {
            return true;
          }
        }
      }
      return false;
    }

    for (dir in dirs) {
      if (FileSystem.exists(dir)) {
        if (recurse(dir, '')) {
          return true;
        }
      }
    }
    return false;
  }

  inline private function shouldBuildEditor() {
    return data.targetType == Editor;
  }

  private function shouldCompileCppia() {
    if (this.data.targetType == Program) {
      return false;
    }

    if (this.config.disableCppia) {
      return false;
    }

    var buildEditor = shouldBuildEditor();

    if (!buildEditor) {
      // only editor builds will use cppia
      return false;
    }

    if (this.config.dce != null && this.config.dce != DceNo) {
      trace('DCE enabled: cppia will be disabled');
      return false;
    }
    return true;
  }

  private function getLibLocation() {
    var libName = switch(data.targetPlatform) {
      case Win64 | Win32 | XboxOne: // TODO: see if XboxOne follows windows' path names
        'haxeruntime.lib';
      case _:
        'libhaxeruntime.a';
    };
    var config = data.targetConfiguration;
    if (config == DebugGame) {
      config = Development;
    }
    var platform = data.targetPlatform;
    switch(platform) {
    case Win32 | Win64 | WinRT | WinRT_ARM:
      platform = "Win";
    case _:
    }
    this.buildName = '${targetModule}-${platform}-${config}-${data.targetType}';
    var bn = this.buildName.split('-');
    bn.shift();
    switch(bn[1]) {
    case 'Development':
      bn[1] = 'Dev';
    case 'Shipping':
      bn[1] = 'Ship';
    case 'Debug':
      bn[1] = 'Dbg';
    }
    this.shortBuildName = bn.join('-');
    this.outputDir = this.data.projectDir + '/Intermediate/Haxe/$buildName';
    if (!FileSystem.exists(this.outputDir + '/Data')) {
      FileSystem.createDirectory(this.outputDir + '/Data');
    }

    return '$outputDir/$libName';
  }

  private function getBakerChangedFiles(stampPath:String, cps:Array<String>, modulesToCompile:Map<String, Bool>,
                                        processed:Map<String, Bool>, traceFiles:Bool, force:Bool, outputDir:String) {
    var stamp = .0;
    if (!force) {
      if (FileSystem.exists(stampPath)) {
        stamp = FileSystem.stat(stampPath).mtime.getTime();
      } else {
        if (traceFiles) {
          log('Baking everything because no time stamp was found');
        }
      }
      if (this.stampOverride >= stamp) {
        stamp = .0; // recompile everything
        if (traceFiles) {
          log('baking everything because Unreal.hx has updated');
        }
      }
    }

    var depList = new DepList(stampPath);
    if (stamp != 0) {
      if (!depList.readHeader()) {
        if (traceFiles) {
          log('Baking everything because the dependency list header was invalid');
        }
        stamp = .0;
      }
    }

    function recurse(base:String, dir:String, pack:String) {
      var path = '$base/$dir';
      for (file in FileSystem.readDirectory(path)) {
        if (file.endsWith('.hx')) {
          var name = file.substr(0,file.length-3);
          var module = '$pack${name}';
          var isExtra = name.endsWith('_Extra');
          processed[module] = true;
          var reason = null,
              shouldCompile = false;
          if (stamp <= 0) {
            shouldCompile = true;
          } else if (!isExtra && !FileSystem.exists('$outputDir/$dir/$file')) {
            shouldCompile = true;
            reason = 'target file does not exist';
          } else if (FileSystem.stat('$path/$file').mtime.getTime() >= stamp) {
            shouldCompile = true;
            reason = 'it is out of date';
          }
          if (shouldCompile) {
            if (traceFiles && reason != null) {
              log(' baking $module because $reason');
            }
            modulesToCompile.set(module, true);
            if (isExtra) {
              modulesToCompile.set(pack + name.substr(0, name.length - '_Extra'.length), true);
            }
          }
        } else if (FileSystem.isDirectory('$path/$file')) {
          recurse(base, '$dir/$file', '$pack$file.');
        }
      }
    }

    for (cp in cps) {
      recurse(cp, '', '');
    }

    if (stamp != 0) {
      depList.readDependencies(modulesToCompile, processed, traceFiles);
    }
    return { depList:depList, compiledEverything: stamp <= 0 };
  }

  private function checkRecursive(stampPath:String, paths:Array<String>, traceFiles:Bool, allFiles=false) {
    if (!FileSystem.exists(stampPath)) {
      if (traceFiles) {
        log('File $stampPath does not exist');
      }
      return true; // the file needs to be rebuilt
    }

    var stamp = FileSystem.stat(stampPath).mtime.getTime();
    if (FileSystem.exists('${haxeDir}/arguments.hxml')) {
      if (FileSystem.stat('$haxeDir/arguments.hxml').mtime.getTime() >= stamp) {
        return true;
      }
    }
    paths.push('${data.pluginDir}/Haxe/Static/uhx/compiletime');

    function recurse(path) {
      for (file in FileSystem.readDirectory(path)) {
        if (FileSystem.isDirectory('$path/$file')) {
          var ret = recurse('$path/$file');
          if (ret) {
            return true;
          }
        } else if (allFiles || file.endsWith('.hx')) {
          if (FileSystem.stat('$path/$file').mtime.getTime() >= stamp) {
            if (traceFiles) {
              log('File $path/$file has changed');
            }
            return true;
          }
        }
      }
      return false;
    }
    for (path in paths) {
      if (FileSystem.exists(path)) {
        if (recurse(path)) {
          return true;
        }
      }
    }
    return false;
  }

  public function getSourceDir() {
    var srcDir = '${this.data.projectDir}/Source';
    if (!FileSystem.exists(srcDir)) {
      err('getSourceDir(): The directory ${this.data.projectDir}/Source does not exist');
      return null;
    }
    if (FileSystem.exists('$srcDir/$targetModule')) {
      return '$srcDir/$targetModule';
    }
    var dirs = [];
    for (file in FileSystem.readDirectory(srcDir)) {
      var path = '$srcDir/$file';
      if (FileSystem.isDirectory(path)) {
        dirs.push(file);
      }
    }

    if (dirs.length == 0) {
      err('No source dir was found at ${this.data.projectDir}/Source');
      return null;
    } else if (dirs.length == 1) {
      return '$srcDir/${dirs[0]}';
    } else {
      err('Found more than one potential target source directory (${dirs.join(", ")})');
      return null;
    }
  }

  private function findUhtManifest(target:String) {
    var base = this.data.projectDir + '/Intermediate/Build/$target';
    if (!FileSystem.exists(base)) {
      err('Giving up on finding a previous UHT manifest because $base could not be found: perhaps this is the first build?');
      return null;
    }

    function testPath(path:String) {
      if (FileSystem.exists(path) && FileSystem.isDirectory(path)) {
        for (file in FileSystem.readDirectory(path)) {
          if (file.toLowerCase().endsWith('.uhtmanifest')) {
            return '$path/$file';
          }
        }
      }
      return null;
    }
    function testTarget(targetName:String) {
      if (FileSystem.exists('$base/${targetName}')) {
        var ret = testPath('$base/${targetName}/${this.data.targetConfiguration}');
        if (ret != null) {
          return ret;
        }
        var path = '$base/${targetName}';
        for (file in FileSystem.readDirectory(path)) {
          var ret = testPath('$path/$file');
          if (ret != null) {
            return ret;
          }
        }
      }
      return null;
    }
    var ret = testTarget(this.data.targetName + 'Editor');
    if (ret != null) {
      return ret;
    }
    ret = testTarget(this.data.targetName);
    if (ret != null) {
      return ret;
    }

    for (dir in FileSystem.readDirectory(base)) {
      if (FileSystem.isDirectory('$base/$dir')) {
        for (file in FileSystem.readDirectory('$base/$dir')) {
          if (FileSystem.isDirectory('$base/$dir/$file')) {
            var ret = testPath('$base/$dir/$file');
            if (ret != null) {
              return ret;
            }
          }
        }
      }
    }
    return null;
  }

  private function generateExterns() {
    var tcheck = timer('check generated headers');

    var target = switch(Sys.systemName()) {
      case 'Windows':
        'Win64';
      case 'Mac':
        'Mac';
      case 'Linux':
        'Linux';
      case _:
        throw 'assert';
    };
    var baseManifest = findUhtManifest(target);
    if (baseManifest == null) {
      err('No prebuilt manifest found for version ${version.MajorVersion}.${version.MinorVersion}. Cannot generate externs');
      return;
    }
    log('Found base UHT manifest: $baseManifest');

    var proj:{ Modules:Array<{Name:String}>, Plugins:Array<{Name:String, Enabled:Bool}> } = haxe.Json.parse(sys.io.File.getContent(this.data.projectFile));
    var targets = [{ name:this.targetModule, path:this.srcDir, headers:[] }],
        uhtDir = this.outputDir + '/UHT';

    if (proj.Modules != null) {
      for (module in proj.Modules) {
        if (module.Name != this.targetModule) {
          var targetPath = this.srcDir + '/../' + module.Name;
          if (FileSystem.exists(targetPath)) {
            targets.push({ name:module.Name, path:targetPath, headers:[] });
          } else {
            warn('The target ${module.Name}\'s path was not found (assumed $targetPath). Ignoring');
          }
        }
      }
    }
    var plugins = new Map();
    if (proj.Plugins != null) {
      for (plugin in proj.Plugins) {
        plugins[plugin.Name.toLowerCase()] = plugin.Name;
      }
      for (plugin in FileSystem.readDirectory(this.data.projectDir + '/Plugins')) {
        var path = this.data.projectDir + '/Plugins/' + plugin;
        if (FileSystem.isDirectory(path)) {
          for (file in FileSystem.readDirectory(path)) {
            if (file.toLowerCase().endsWith('.uplugin')) {
              var name = file.substr(0,file.length - '.uplugin'.length).toLowerCase();
              if (plugins.exists(name)) {
                plugins.remove(name);
                var proj:{ Modules:Array<{Name:String}> } = haxe.Json.parse(sys.io.File.getContent('$path/$file'));
                if (proj.Modules != null) {
                  for (mod in proj.Modules) {
                    if (FileSystem.exists('$path/Source/${mod.Name}')) {
                      targets.push({ name:mod.Name, path:'$path/Source/${mod.Name}', headers:[] });
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    var lastRun = FileSystem.exists('$uhtDir/generated.stamp') ? FileSystem.stat('$uhtDir/generated.stamp').mtime.getTime() : 0.0;
    var shouldRun = lastRun == 0;

    var manifest:UhtManifest = haxe.Json.parse(sys.io.File.getContent(baseManifest));
    if (!FileSystem.exists(uhtDir)) {
      FileSystem.createDirectory(uhtDir);
    }
    if (!FileSystem.exists('$uhtDir/deps.deps')) {
      sys.io.File.saveContent('$uhtDir/deps.deps', '');
    }
    manifest.RootLocalPath = this.data.engineDir + '/..';
    manifest.RootBuildPath = this.data.engineDir + '/../';
    manifest.ExternalDependenciesFile = '$uhtDir/deps.deps';
    manifest.TargetName = this.targetModule;
    // manifest.Modules = manifest.Modules.filter(function(v) return !targets.exists(function (target) return target.name == v.Name));

    for (target in targets) {
      var old = manifest.Modules.find(function(v) return v.Name == target.name);
      if (old == null) {
        old = {
          Name: target.name,
          ModuleType: 'GameRuntime',
          BaseDirectory: target.path,
          IncludeBase: target.path,
          OutputDirectory: uhtDir,
          ClassesHeaders: [],
          PublicHeaders: [],
          PrivateHeaders: [],
          PCH: "",
          GeneratedCPPFilenameBase: uhtDir + '/' + target.name + '.generated',
          SaveExportedHeaders: false,
          UHTGeneratedCodeVersion: 'None'
        }
        manifest.Modules.push(old);
      }
      old.SaveExportedHeaders = false;
      var concat = old.PublicHeaders.concat(old.PrivateHeaders).concat(old.ClassesHeaders);
      old.ClassesHeaders = [];
      old.PrivateHeaders = [];
      old.PublicHeaders = concat;
      shouldRun = collectUhtHeaders(target.path, concat, lastRun) || shouldRun;
    }

    var externModules = [for (target in targets) target.name];
    for (plugin in plugins) {
      externModules.push(plugin);
      if (!shouldRun) {
        var mod = manifest.Modules.find(function(v) return v.Name == plugin);
        if (mod != null) {
          for (file in mod.ClassesHeaders.concat(mod.PrivateHeaders).concat(mod.PublicHeaders)) {
            if (!FileSystem.exists(file) || FileSystem.stat(file).mtime.getTime() >= lastRun) {
              shouldRun = true;
              break;
            }
          }
        }
      }
    }

    for (module in manifest.Modules) {
      module.SaveExportedHeaders = false;
    }

    tcheck();
    if (!shouldRun) {
      log('Skipping extern generation because no new header was found on the project');
      return;
    }

    var tsave = timer('save uhtmanifest');
    sys.io.File.saveContent(uhtDir + '/externs.uhtmanifest', haxe.Json.stringify(manifest));
    proj.Plugins = [{ Name:'UnrealHxGenerator', Enabled:true }];
    sys.io.File.saveContent(uhtDir + '/proj.uproject', haxe.Json.stringify(proj));
    tsave();
    // Call UHT
    var oldEnvs = setEnvs([
      'GENERATE_EXTERNS' => '1',
      'EXTERN_MODULES' => externModules.join(','),
      'EXTERN_OUTPUT_DIR' => this.data.projectDir
    ]);
    var args = [uhtDir + '/proj.uproject','$uhtDir/externs.uhtmanifest', '-PLUGIN=UnrealHxGenerator', '-Unattended', '-stdout'];
    if (config.verbose) {
      args.push('-AllowStdOutLogVerbosity');
    }

    var tgenerate = timer('generate externs through UHT');
    if (this.callUHT(args) != 0) {
      warn('==========================================================');
      warn('UHT: Unable to generate the externs. Build will continue');
      warn('==========================================================');
    } else {
      sys.io.File.saveContent('$uhtDir/generated.stamp', '');
    }
    if (oldEnvs != null) {
      setEnvs(oldEnvs);
    }
    tgenerate();
  }

  private static function collectUhtHeaders(dir:String, arr:Array<String>, lastRun:Float):Bool {
    var processed = new Map();
    for (a in arr) {
      processed[haxe.io.Path.withoutDirectory(a).toLowerCase()] = true;
    }

    function recurse(path:String, recursive:Bool) {
      var shouldRun = false;
      for (file in FileSystem.readDirectory(path)) {
        var path = '$path/$file';
        var f = file.toLowerCase();
        if (f.endsWith('.h')) {
          if (lastRun != 0 && !shouldRun && recursive) {
            shouldRun = FileSystem.stat(path).mtime.getTime() >= lastRun;
          }

          if (!processed.exists(f)) {
            arr.push(path);
          }
        } else if (recursive && FileSystem.isDirectory(path)) {
          var ret = recurse(path, f != 'generated');
          if (ret) {
            shouldRun = true;
          }
        }
      }
      return shouldRun;
    }
    return recurse(dir, true);
  }

  private function expandVariables(str:String, target:String) {
    var idx = str.indexOf('$');
    if (idx < 0) {
      return str;
    }

    var buf = new StringBuf(),
        lastIdx = -1;
    buf.add(str.substring(0, idx));
    do {
      var next = str.indexOf('/',idx);
      if (next < 0) {
        next = str.length;
      }
      switch(str.substring(idx, next)) {
      case "$EngineDir":
        buf.add(this.data.engineDir);
      case "$TargetPlatform":
        buf.add(target);
      case i:
        warn('Unknown identifier $i at "$str"');
        buf.add(i);
      }
      lastIdx = next;
      idx = str.indexOf('$', next);
    } while (idx >= 0);

    if (lastIdx >= 0) {
      buf.add(str.substr(lastIdx));
    }
    return buf.toString();
  }

  private function getStaticCps() {
    var cps = [
      'arguments.hxml',
      '-cp $haxeDir/Generated/$externsFolder',
      '-cp ${data.pluginDir}/Haxe/Static',
    ];

    for (path in this.modulePaths) {
      cps.push('-cp $path');
    }
    return cps;
  }

  private function bakeExterns(modulesToCompile:Map<String, Bool>) {
    // Windows paths have '\' which needs to be escaped for macro arguments
    var escapedHaxeDir = haxeDir.replace('\\','\\\\');
    var escapedPluginPath = data.pluginDir.replace('\\','\\\\');
    var forceCreateExterns = this.config.forceBakeExterns == null ? Sys.getEnv('BAKE_EXTERNS') != null : this.config.forceBakeExterns;

    var ueExternDir = 'UE${this.version.MajorVersion}.${this.version.MinorVersion}.${this.version.PatchVersion}';
    if (!FileSystem.exists('${data.pluginDir}/Haxe/Externs/$ueExternDir')) {
      ueExternDir = 'UE${this.version.MajorVersion}.${this.version.MinorVersion}';
      if (!FileSystem.exists('${data.pluginDir}/Haxe/Externs/$ueExternDir')) {
        throw new BuildError('Cannot find an externs directory for the unreal version ${this.version.MajorVersion}.${this.version.MinorVersion}');
      }
    }

    var targetStamp = '$outputDir/Data/$externsFolder.deps',
        targetStampPart = '$outputDir/Data/$externsFolder-part', //.deps
        targetFiles = '$outputDir/Data/$externsFolder'; //.files
    var processed = new Map();

    var escapedTargetStampPart = targetStampPart.replace('\\','\\\\'),
        escapedTargetFiles = targetFiles.replace('\\','\\\\');

    var tdeps = timer('baker dependency check');
    var deps = this.getBakerChangedFiles(targetStamp, [
      '${data.pluginDir}/Haxe/Externs/Common',
      '${data.pluginDir}/Haxe/Externs/$ueExternDir',
      '$haxeDir/Externs'
    ], modulesToCompile, processed, this.config.verbose, forceCreateExterns, '$haxeDir/Generated/$externsFolder');
    tdeps();
    var depList = deps.depList,
        compiledEverything = deps.compiledEverything;

    var ret = 0,
        nfiles = 0;
    var modules = [ for (c in modulesToCompile.keys()) c ];
    if (modules.length == 0) {
      trace('Skipping extern baker since there is nothing to compile');
    } else {
      var partitioned = [[]],
          minArrLen = 100,
          cur = partitioned[0];
      var arrLen = Std.int(modules.length / this.threadPool.size);
      if (arrLen < minArrLen) {
        arrLen = minArrLen;
      }
      for (mod in modules) {
        if (!mod.endsWith('_Extra')) {
          cur.push(mod);
          if (modulesToCompile.exists(mod + '_Extra')) {
            cur.push(mod + '_Extra');
          }
          if (cur.length >= arrLen) {
            cur = [];
            partitioned.push(cur);
          }
        }
      }
      nfiles = partitioned.length;
      var fns = [];

      for (n in 0...partitioned.length) {
        var modulesToCompile = partitioned[n];
        var files = sys.io.File.write(targetFiles + '-$n.files');
        files.writeString("BAKERFILES1"); // version
        files.writeByte('\n'.code);
        for (module in modulesToCompile) {
          files.writeString(module);
          files.writeByte('\n'.code);
        }
        files.close();

        var bakeArgs = [
          '# this pass will bake the extern type definitions into glue code',
          FileSystem.exists('$haxeDir/baker-arguments.hxml') ? 'baker-arguments.hxml' : '',
          '-cp ${data.pluginDir}/Haxe/Static',
          '-cp ${data.pluginDir}/Haxe/Externs/Common',
          '-cp ${data.pluginDir}/Haxe/Externs/$ueExternDir',
          '-cp ${haxeDir}/Externs',
          '-D use-rtti-doc', // we want the documentation to be persisted
          '-D bake-externs',
          '-D ${this.defineVer}',
          '-D ${this.definePatch}',
          '-D UHX_STATIC_BASE_DIR=$outputDir',
          this.config.verbose ? '-D UHX_VERBOSE' : '',
          '',
          '-cpp $haxeDir/Generated/$externsFolder',
          '--no-output', // don't generate cpp files; just execute our macro
          '--macro uhx.compiletime.main.ExternBaker.process(["$escapedPluginPath/Haxe/Externs/Common", "$escapedPluginPath/Haxe/Externs/$ueExternDir", "$escapedHaxeDir/Externs"], ' +
                                                            '"$escapedTargetStampPart-$n.deps","$escapedTargetFiles-$n.files")'
        ];
        if (shouldBuildEditor()) {
          bakeArgs.push('-D WITH_EDITOR');
          bakeArgs.push('-D WITH_EDITORONLY_DATA');
        }
        if (data.targetType == Program) {
          bakeArgs.push('-D IS_PROGRAM');
        }
        if (this.config.disableUObject) {
          bakeArgs.push('-D UHX_NO_UOBJECT');
        }

        bakeArgs.push('-D BUILDTOOL_VERSION_LEVEL=$VERSION_LEVEL');
        fns.push(function() return compileSources(bakeArgs) == 0);
      }

      trace('baking externs');
      var tbake = timer('bake externs');
      ret = this.threadPool.runCollection(fns)() ? 0 : 1;
      tbake();
      this.ranExternBaker = true;
    }

    if (ret == 0) {
      var tupdate = timer('update dependencies');
      if (this.ranExternBaker) {
        if (compiledEverything && nfiles == 1) {
          File.copy(targetStampPart + '-0.deps', targetStamp);
        } else {
          for (i in 0...nfiles) {
            // read dependency lists
            var newDeps = new DepList(targetStampPart + '-$i.deps');
            if (!newDeps.readHeader()) {
              err('New target stamp part file $targetStampPart-$i.deps is invalid');
              return -1;
            }
            newDeps.readDependencies(null, null, false);
            // merge dependency lists
            depList.merge(newDeps);
          }
        }
      }
      // go through the generated files and delete untouched files
      var base = '$haxeDir/Generated/$externsFolder';
      function recurse(pack:String, path:String) {
        var target = '$base$path';
        for (file in FileSystem.readDirectory(target)) {
          if (file.endsWith('.hx')) {
            var module = '$pack${file.substr(0,file.length-3)}';
            if (!processed.exists(module)) {
              log('Deleting uneeded baked extern $module ($target/$file)');
              this.ranExternBaker = true; // make sure to re-compile if anything depends on baked files
              FileSystem.deleteFile('$target/$file');
              depList.markDeleted(module);
            }
          } else if (FileSystem.isDirectory('$target/$file')) {
            var targetPack = '$pack$file.';
            if (targetPack != 'uhx.glues.') {
              recurse(targetPack, '$path/$file');
            }
          }
        }
      }
      recurse('', '');
      // save new dependency list
      if (!compiledEverything || nfiles > 1) {
        depList.save(targetStamp);
      }
      tupdate();
    }
    return ret;
  }

  private static function addConfigurationDefines(defines:Array<String>, config:TargetConfiguration) {
    switch(config) {
      case Development | DebugGame:
        defines.push('-D UE_BUILD_DEVELOPMENT');
      case Shipping:
        defines.push('-D UE_BUILD_SHIPPING');
      case Debug:
        defines.push('-D UE_BUILD_DEBUG');
      case Test:
        defines.push('-D UE_BUILD_TEST');
    }
  }

  private static function addTargetDefines(defines:Array<String>, type:TargetType) {
    switch(type) {
      case Game:
        defines.push('-D UE_GAME');
        defines.push('-D WITH_SERVER_CODE');
      case Client:
        defines.push('-D UE_GAME');
      case Editor:
        defines.push('-D WITH_SERVER_CODE');
        defines.push('-D WITH_EDITOR');
        defines.push('-D WITH_EDITORONLY_DATA');
        defines.push('-D UE_EDITOR');
      case Server:
        defines.push('-D WITH_SERVER_CODE');
        defines.push('-D UE_SERVER');
      case Program:
        defines.push('-D IS_PROGRAM');
    }
  }

  private static function addPlatformDefines(defines:Array<String>, platform:TargetPlatform) {
    switch(platform) {
      case Win32 | Win64 | WinRT | WinRT_ARM:
        defines.push('-D PLATFORM_WINDOWS');
      case Mac:
        defines.push('-D PLATFORM_MAC');
      case XboxOne:
        defines.push('-D PLATFORM_XBOXONE');
      case PS4:
        defines.push('-D PLATFORM_PS4');
      case IOS:
        defines.push('-D PLATFORM_IOS');
      case Android:
        defines.push('-D PLATFORM_ANDROID');
      case HTML5:
        defines.push('-D PLATFORM_HTML5');
      case Linux:
        defines.push('-D PLATFORM_LINUX');
      case TVOS:
        defines.push('-D PLATFORM_TVOS');
      case _:
        throw new BuildError('Unknown platform $platform');
    }
  }

  private function compileCppia(showErrors:Bool) {
    var cps = getStaticCps();
    for (module in scriptPaths) {
      cps.push('-cp $module');
    }

    var args = cps.concat([
        '',
        '-main UnrealCppia',
        '',
        '-D cppia',
        '-D ${this.defineVer}',
        '-D ${this.definePatch}',
        '-D UHX_STATIC_BASE_DIR=$outputDir',
        '-D UHX_PLUGIN_PATH=${data.pluginDir}',
        '-D UHX_UE_CONFIGURATION=${data.targetConfiguration}',
        '-D UHX_UE_TARGET_TYPE=${data.targetType}',
        '-D UHX_UE_TARGET_PLATFORM=${data.targetPlatform}',
        '-D UHX_BUILD_NAME=$buildName',
        '-D UHX_BAKE_DIR=$haxeDir/Generated/$externsFolder',
        '-cppia ${data.projectDir}/Binaries/Haxe/game.cppia',
        '--macro uhx.compiletime.main.CreateCppia.run(' +toMacroDef(this.modulePaths) +', ' + toMacroDef(scriptPaths) + ',' + (config.cppiaModuleExclude == null ? 'null' : toMacroDef(config.cppiaModuleExclude)) + ')',
    ]);
    if (debugSymbols) {
      args.push('-debug');
    }
    if (this.config.noGlueUnityBuild) {
      args.push('-D no_unity_build');
    }
    addTargetDefines(args, data.targetType);
    addConfigurationDefines(args, data.targetConfiguration);
    if (config.extraCppiaCompileArgs != null) {
      args = args.concat(config.extraCppiaCompileArgs);
    }

    if (!FileSystem.exists('${data.projectDir}/Binaries/Haxe')) {
      FileSystem.createDirectory('${data.projectDir}/Binaries/Haxe');
    }

    var extraArgs = ['-D use-rrti-doc'];
    if (this.compserver != null) {
      extraArgs.push('--connect ${this.compserver}');
    }
    var tcppia = timer('Cppia compilation');
    args.push('-D BUILDTOOL_VERSION_LEVEL=$VERSION_LEVEL');
    var cppiaRet = compileSources(extraArgs.concat(args), showErrors);

    tcppia();
    if (!this.data.ueEditorRecompile && !this.data.ueEditorCompile) {
      this.createHxml('build-script', args.concat(['-D use-rrti-doc']));
      var complArgs = ['--cwd ${data.projectDir}/Haxe', '--no-output'].concat(args);
      this.createHxml('compl-script', complArgs.filter(function(v) return !v.startsWith('--macro')));
    }
    return cppiaRet;
  }

  private function compileStatic() {
    trace('compiling Haxe');
    if (!FileSystem.exists('$outputDir/Static')) FileSystem.createDirectory('$outputDir/Static');

    var curStamp:Null<Date> = null;
    if (this.data.ueEditorRecompile || this.data.ueEditorCompile) {
      if (FileSystem.exists(this.outputStatic)) {
        curStamp = FileSystem.stat(this.outputStatic).mtime;
      }
    }

    var curSourcePath = this.srcDir;
    var cps = getStaticCps();
    var args = cps.concat([
      '',
      '-main UnrealInit',
      '',
      '-D static_link',
      '-D destination=${this.outputStatic}',
      '-D UHX_UNREAL_SOURCE_DIR=$curSourcePath',
      '-D UHX_PLUGIN_PATH=${data.pluginDir}',
      '-D UHX_UE_CONFIGURATION=${data.targetConfiguration}',
      '-D UHX_UE_TARGET_TYPE=${data.targetType}',
      '-D UHX_UE_TARGET_PLATFORM=${data.targetPlatform}',
      '-D UHX_BAKE_DIR=$haxeDir/Generated/$externsFolder',
      '-D UHX_BUILD_NAME=$buildName',
      '-D HXCPP_DLL_EXPORT',
      '-D ${this.defineVer}',
      '-D ${this.definePatch}',

      '-cpp $outputDir/Static',
      '--macro uhx.compiletime.main.CreateGlue.run(' +toMacroDef(this.modulePaths) +', ' + toMacroDef(this.scriptPaths) + ')',
    ]);
    if (!FileSystem.exists('$outputDir/Data')) {
      FileSystem.createDirectory('$outputDir/Data');
    }
    if (!FileSystem.exists('$outputDir/Static/toolchain')) {
      FileSystem.createDirectory('$outputDir/Static/toolchain');
    }
    for (file in FileSystem.readDirectory('${data.pluginDir}/Haxe/BuildTool/toolchain')) {
      File.saveBytes('$outputDir/Static/toolchain/$file', File.getBytes('${data.pluginDir}/Haxe/BuildTool/toolchain/$file'));
    }

    addTargetDefines(args, data.targetType);
    addConfigurationDefines(args, data.targetConfiguration);
    addPlatformDefines(args, data.targetPlatform);
    if (this.config.disableUObject || data.targetType == Program) {
      args.push('-D UHX_NO_UOBJECT');
    }
    if (this.config.noGlueUnityBuild) {
      args.push('-D no_unity_build');
    }

    if (this.config.dce != null) {
      args.push('-dce ${this.config.dce}');
    }

    if (debugSymbols) {
      args.push('-debug');
      if (this.config.debugger) {
        args.push('-lib hxcpp-debugger');
        args.push('-D HXCPP_DEBUGGER');
      }
    }

    switch (data.targetPlatform) {
    case Win32:
      args.push('-D HXCPP_M32');
      if (debugSymbols)
        args.push('-D HXCPP_DEBUG_LINK');
    case Win64:
      args.push('-D HXCPP_M64');
    case _:
      args.push('-D HXCPP_M64');
    }

    // set correct ABI
    switch (data.targetPlatform) {
    case Win64 | Win32 | XboxOne: // TODO: see if XboxOne follows windows' path names
      args.push('-D ABI=-MD');
    case _:
    }

    var noDynamicObjects = config.noDynamicObjects;
    if (this.cppiaEnabled) {
      args = args.concat(['-D scriptable', '-D WITH_CPPIA']);
    } else {
      noDynamicObjects = true;
    }
    if (noDynamicObjects) {
      args = args.concat(['-D NO_DYNAMIC_UCLASS']);
    }

    var isCrossCompiling = false;
    var extraArgs = null,
        oldEnvs = null;
    var thirdPartyDir = this.data.engineDir + '/Source/ThirdParty';
    Sys.putEnv('ThirdPartyDir', thirdPartyDir);
    switch(Std.string(data.targetPlatform)) {
    case "Linux" if (Sys.systemName() != "Linux"):
      // cross compiling
      isCrossCompiling = true;
      var crossPath = Sys.getEnv("LINUX_MULTIARCH_ROOT");
      if (crossPath != null) {
        crossPath = '$crossPath/x86_64-unknown-linux-gnu';
      } else {
        crossPath = Sys.getEnv("LINUX_ROOT");
      }

      if (crossPath != null) {
        trace('Cross compiling using $crossPath');
        extraArgs = [
          '-D toolchain=linux',
          '-D linux',
          '-D HXCPP_CLANG',
          '-D xlinux_compile',
          '-D magiclibs',
          '-D HXCPP_VERBOSE'
        ];
        var disabledWarnings =
          '-Wno-null-dereference -Wno-parentheses-equality';
        oldEnvs = setEnvs([
          'PATH' => Sys.getEnv("PATH") + (Sys.systemName() == "Windows" ? ";" : ":") + crossPath + '/bin',
          'CXX' => (Sys.getEnv("CROSS_LINUX_SYMBOLS") == null ?
            'clang++ --sysroot "$crossPath" $disabledWarnings -target x86_64-unknown-linux-gnu -nostdinc++ \"-I$${ThirdPartyDir}/Linux/LibCxx/include\" \"-I$${ThirdPartyDir}/Linux/LibCxx/include/c++/v1\"' :
            'clang++ --sysroot "$crossPath" $disabledWarnings -target x86_64-unknown-linux-gnu -g -nostdinc++ \"-I$${ThirdPartyDir}/Linux/LibCxx/include\" \"-I$${ThirdPartyDir}/Linux/LibCxx/include/c++/v1\"'),
          'CC' => 'clang --sysroot "$crossPath" -target x86_64-unknown-linux-gnu',
          'HXCPP_AR' => 'x86_64-unknown-linux-gnu-ar',
          'HXCPP_AS' => 'x86_64-unknown-linux-gnu-as',
          'HXCPP_LD' => 'x86_64-unknown-linux-gnu-ld',
          'HXCPP_RANLIB' => 'x86_64-unknown-linux-gnu-ranlib',
          'HXCPP_STRIP' => 'x86_64-unknown-linux-gnu-strip'
        ]);
      } else {
        warn('Cross-compilation was detected but no LINUX_ROOT environment variable was set');
      }
    case "Linux" if(!shouldBuildEditor()):
      oldEnvs = setEnvs([
          'CXX' => "clang++ -nostdinc++ \"-I${ThirdPartyDir}/Linux/LibCxx/include\" \"-I${ThirdPartyDir}/Linux/LibCxx/include/c++/v1\"",
      ]);
    case "Mac":
      extraArgs = [
        '-D toolchain=mac-libc'
      ];
    }

    if (extraArgs != null) {
      args = args.concat(extraArgs);
    }
    if (this.config.extraCompileArgs != null) {
      args = args.concat(this.config.extraCompileArgs);
    }

    var compileOnlyArgs = ['-D use-rtti-doc'];
    if (this.compserver != null) {
      File.saveContent('$outputDir/Data/compserver.txt','1');
      // Sys.putEnv("HAXE_COMPILATION_SERVER", this.compserver);
      compileOnlyArgs.push('--connect ${this.compserver}');
    } else {
      File.saveContent('$outputDir/Data/compserver.txt','0');
    }

    var thaxe = timer('Haxe compilation');
    args.push('-D BUILDTOOL_VERSION_LEVEL=$VERSION_LEVEL');
    var ret = compileSources(args.concat(compileOnlyArgs));
    thaxe();
    if (!isCrossCompiling) {
      this.createHxml('build-static', args.concat(['-D use-rtti-doc']));
      var complArgs = ['--cwd $haxeDir', '--no-output'].concat(args);
      this.createHxml('compl-static', complArgs.filter(function(v) return !v.startsWith('--macro')));
    }

    if (oldEnvs != null) {
      setEnvs(oldEnvs);
    }

    if (ret == 0 && isCrossCompiling) {
      // somehow -D destination doesn't do anything when cross compiling
      var hxcppDestination = '$outputDir/Static/libUnrealInit';
      if (debugSymbols) {
        hxcppDestination += '-debug.a';
      } else {
        hxcppDestination += '.a';
      }

      var shouldCopy =
        !FileSystem.exists(this.outputStatic) ||
        (FileSystem.exists(hxcppDestination) &&
         FileSystem.stat(hxcppDestination).mtime.getTime() > FileSystem.stat(this.outputStatic).mtime.getTime());
      if (shouldCopy) {
        File.saveBytes(this.outputStatic, File.getBytes(hxcppDestination));
      }
    }

    if (this.data.ueEditorRecompile || this.data.ueEditorCompile) {
      if (ret == 0 && (curStamp == null || FileSystem.stat(outputStatic).mtime.getTime() > curStamp.getTime()))
      {
        // when compiling through the editor, -skiplink is set - so UBT won't even try to find the right
        // dependencies unless we give it a little nudge
        var dep = this.config.noGlueUnityBuild ?
          '${this.srcDir}/Generated/HaxeInit.cpp' :
          '${this.srcDir}/Generated/Unity/${shortBuildName}/HaxeRuntime.${shortBuildName}.uhxglue.cpp';
        trace('Touching $dep to trigger hot-reload');
        // touch the file
        File.saveContent(dep, File.getContent(dep));
      }
    }

    return ret;
  }

  private function callUnrealBuild(platform:Null<String>, project:String, config:String, ?extraArgs:Array<String>) {
    var args = [];
    var path = switch(Sys.systemName()) {
      case 'Windows':
        if (platform == null) {
          platform = 'Win64';
        }
        this.data.engineDir + '/Build/BatchFiles/Build.bat';
      case 'Mac':
        if (platform == null) {
          platform = 'Mac';
        }
        this.data.engineDir + '/Build/BatchFiles/Mac/Build.sh';
      case 'Linux':
        if (platform == null) {
          platform = 'Linux';
        }
        this.data.engineDir + '/Build/BatchFiles/Linux/Build.sh';
      case name:
        warn('Cannot call unreal build for platform $name');
        return 1;
    };

    return this.call(path, [platform,project,config].concat(extraArgs == null ? [] : extraArgs), true);
  }

  private function callUHT(args:Array<String>) {
    var path = switch(Sys.systemName()) {
      case 'Windows':
        this.data.engineDir + '/Binaries/Win64/UnrealHeaderTool.exe';
      case 'Mac':
        this.data.engineDir + '/Binaries/Mac/UnrealHeaderTool';
      case 'Linux':
        this.data.engineDir + '/Binaries/Linux/UnrealHeaderTool';
      case name:
        warn('Cannot call unreal header tool for platform $name');
        return 1;
    };

    log('Calling UHT ${args}');
    return this.call(path, args, true);
  }

  private function hasProjectEnabled(name:String) {
    var uproject:{ Plugins:Array<{ Name:String, Enabled:Bool }> } = haxe.Json.parse(sys.io.File.getContent( data.projectFile ));
    if (uproject.Plugins == null) {
      return false;
    }
    for (p in uproject.Plugins) {
      if (p.Name == name) {
        return p.Enabled;
      }
    }
    return false;
  }

  private function setupVars() {
    this.version = getEngineVersion(this.config);
    this.srcDir = this.getSourceDir();
    this.defineVer = 'UE_VER=${this.version.MajorVersion}.${this.version.MinorVersion}';
    this.definePatch = 'UE_PATCH=${this.version.PatchVersion == null ? 0 : this.version.PatchVersion}';
    this.outputStatic = getLibLocation();
    this.debugSymbols = data.targetConfiguration != Shipping && config.noDebug != true;
    if (config.noDebug == false) {
      this.debugSymbols = false;
    }
    if (config.compilationServer != null) {
      this.compserver = Std.string(config.compilationServer);
    }
    if (this.compserver == null) {
      this.compserver = Sys.getEnv("HAXE_COMPILATION_SERVER_DEFER");
    }
    if (this.compserver == null || this.compserver == '') {
      this.compserver = Sys.getEnv("HAXE_COMPILATION_SERVER");
    }
    if (this.compserver == '') {
      this.compserver = null;
    }

    this.externsFolder = shouldBuildEditor() ? 'Externs_Editor' : 'Externs';

    // get all modules that need to be compiled
    this.modulePaths = ['$haxeDir/Static'];
    this.scriptPaths = ['$haxeDir/Scripts'];
    if (this.config.extraStaticClasspaths != null) {
      this.modulePaths = this.modulePaths.concat(this.config.extraStaticClasspaths);
    }
    if (this.config.extraScriptClasspaths != null) {
      this.scriptPaths = this.scriptPaths.concat(this.config.extraScriptClasspaths);
    }
    if (this.config.noStatic) {
      this.scriptPaths = this.modulePaths.concat(this.scriptPaths);
      this.modulePaths = [];
    }
    this.cppiaEnabled = shouldCompileCppia();
    if (!this.cppiaEnabled) {
      this.modulePaths = this.modulePaths.concat(this.scriptPaths);
      this.scriptPaths = [];
    }
    consolidateNeededConfigs();
    this.stampOverride = getStampOverride();
  }

  override public function run()
  {
#if !cpp
    if (!config.interp) {
      var tbuilder = timer('uhx builder');
      if (checkOrBuildBuilder()) {
        var ret = this.callBuilder();
        tbuilder();
        return;
      } else {
        tbuilder();
        log('Builder build failed. Running the interpreted version');
      }
    }
#end
    this.setupVars();
    if (srcDir == null) {
      throw new BuildError('Build failed');
    }

    if (!FileSystem.exists(haxeDir)) {
      FileSystem.createDirectory(haxeDir);
    }

    if (!FileSystem.exists('$haxeDir/arguments.hxml')) {
      sys.io.File.saveContent('$haxeDir/arguments.hxml',
          '# put here your additional haxe arguments\n' +
          '# please do not add a target (like -cpp) as they will be added automatically\n' +
          '# (see gen-build-scripts.hxml and gen-build-static.hxml)');
    }

    updateProject(this.targetModule, this.version.MajorVersion + '.' + this.version.MinorVersion);

    if (!FileSystem.exists(this.outputDir)) FileSystem.createDirectory(this.outputDir);

    if (this.cppiaEnabled) {
      this.config.dce = DceNo;
    } else if (config.noStatic) {
      warn('`config.noStatic` is set to true, but cppia is disabled. Everything will still be compiled as static');
    }

    var teverything = timer('Haxe setup (all compilation times included)');
    if (Sys.systemName() != 'Windows' && Sys.getEnv('PATH').indexOf('/usr/local/bin') < 0) {
      Sys.putEnv('PATH', Sys.getEnv('PATH') + ":/usr/local/bin");
    }

    // check if haxe compiler / sources are present
    var hasHaxe = callHaxe(['-version'], false) == 0;
    if (!FileSystem.exists('${this.outputDir}/Data')) {
      FileSystem.createDirectory('${this.outputDir}/Data');
    }

    if (hasHaxe)
    {
      var ret = 0;
      if (!this.data.skipBake && !this.config.skipBake) {
        if (this.config.generateExterns) {
          this.generateExterns();
        }

        ret = this.bakeExterns(this.externsToCompile);
      } else {
        trace('Skipping bake externs');
      }

      var needsStatic = false;
      // compile static
      if (ret == 0)
      {
        var compFile = '${this.outputDir}/Data/staticCompile.stamp';
        var depCheck = timer('static dependency check');
        needsStatic = compilationParamsChanged();
        if (needsStatic && this.config.verbose) {
          log('compiling static because latest compilation was compiled with different arguments');
        }
        if (!needsStatic) {
          var templatePath = this.data.pluginDir + '/Haxe/Templates';
          var fns = [
            checkDependencies.bind('${this.outputDir}/Data/staticDeps.txt', this.outputStatic, compFile,  this.config.verbose, 'static'),
            this.hasNewModules.bind('${this.outputDir}/Data/staticModules.txt', this.modulePaths, this.config.verbose, 'static'),
            this.checkProducedFiles.bind('${this.outputDir}/Data/staticProducedFiles.txt', this.config.verbose, 'static'),
            this.checkRecursive.bind('${this.outputDir}/Data/staticDeps.txt', [templatePath], this.config.verbose, true)
          ];
          if (PARALLEL_DEP_CHECK) {
            // we need to invert the logic as the thread pool short cirtcuits when a false is returned
            var collection = this.threadPool.runCollection([for (fn in fns) function() return !fn()]);
            needsStatic = !collection();
          } else {
            for (fn in fns) {
              needsStatic = fn();
              if (needsStatic) {
                break;
              }
            }
          }
        }
        depCheck();
        if (!needsStatic) {
          log('Skipping static compilation because it was not needed');
        } else {
          ret = this.compileStatic();
          // regardless if it succeeded or not, we want to make sure that if we change the arguments
          // it will compile again, so save them
          saveCompilationParams();
          if (ret == 0) {
            if (FileSystem.exists(compFile)) {
              FileSystem.deleteFile(compFile);
            }
          }
        }
      }
      if (ret != 0)
      {
        throw new BuildError('Haxe compilation failed');
      }

      // compile cppia
      if (this.cppiaEnabled) {
        var compFile = '${this.outputDir}/Data/cppiaCompile.stamp';
        var depCheck = timer('script dependency check');
        var targetFile = '${data.projectDir}/Binaries/Haxe/game.cppia';

        var needsCppia = checkDependencies('${this.outputDir}/Data/cppiaDeps.txt', targetFile, compFile, this.config.verbose, 'cppia');
        if (!needsCppia) {
          needsCppia = this.hasNewModules('${this.outputDir}/Data/cppiaModules.txt', this.scriptPaths, this.config.verbose, 'cppia');
        }
        depCheck();
        if (!needsCppia) {
          log('Skipping cppia compilation because it was not needed');
        } else {
          this.hadUhxErr = false;
          var cppiaRet = compileCppia(needsStatic);
          if (cppiaRet != 0) {
            if (this.data.cppiaRecompile) {
              throw new BuildError('Cppia compilation failed. Please check the output log for more information');
            }
            err('=============================');
            err('Cppia compilation failed');
            err('=============================');
          } else {
            if (!needsStatic && this.hadUhxErr) {
              log('Cppia requested a full hxcpp compilation');
              ret = this.compileStatic();
            }
            if (FileSystem.exists(compFile)) {
              FileSystem.deleteFile(compFile);
            }
          }
        }
      }
    } else {
      warn("Haxe compiler was not found!");
    }
    teverything();
    if (this.config.disabled) {
      var gen = '$srcDir/Generated';
      if (FileSystem.exists(gen)) {
        InitPlugin.deleteRecursive(gen,true);
      }
      if (FileSystem.exists(this.outputStatic)) {
        FileSystem.deleteFile(this.outputStatic);
      }
    }

    // add the output static linked library
    if (this.config.disabled || !FileSystem.exists(this.outputStatic))
    {
      warn('Haxe support is disabled');
    } else {
      if (this.config.disableUObject) {
        this.definitions.push('UHX_NO_UOBJECT=1');
      }
    }
  }

  private function getProjectName() {
    return new Path(this.data.projectFile).file;
  }

  private function getCurCompilationParams() {
    return 'TargetType=${this.data.targetType};TargetConfiguration=${this.data.targetConfiguration};TargetPlatform=${this.data.targetPlatform}';
  }

  private function compilationParamsChanged() {
    var file = this.data.projectDir + '/Intermediate/Haxe/lastCompilation.txt';
    if (!FileSystem.exists(file)) {
      return true;
    }
    return File.getContent(file).trim() != getCurCompilationParams();
  }

  private function saveCompilationParams() {
    var file = this.data.projectDir + '/Intermediate/Haxe/lastCompilation.txt';
    File.saveContent(file, getCurCompilationParams());
  }

  private function checkDependencies(deps:String, targetFile:String, compFile:String, traceFiles:Bool, phase:String) {
    if (FileSystem.exists(compFile)) {
      if (traceFiles) {
        log('compiling $phase because last compilation failed');
      }
      return true;
    }
    if (!FileSystem.exists(targetFile)) {
      if (traceFiles) {
        log('compiling $phase because target file does not exist');
      }
      return true;
    }
    if (!FileSystem.exists(deps)) {
      if (traceFiles) {
        log('compiling $phase because no previous compilation was found');
      }
      return true;
    }
    var stamp = FileSystem.stat(deps).mtime.getTime(),
        targetStamp = FileSystem.stat(targetFile).mtime.getTime();
    if (stamp < targetStamp) {
      stamp = targetStamp;
    }
    if (this.stampOverride >= stamp) {
      if (traceFiles) {
        log('compiling $phase because Unreal.hx has changed');
      }
      return true;
    }
    var ret = false;
    var file = File.read(deps);
    try {
      while(true) {
        var kind = file.readByte();
        var path = file.readLine();
        if (kind == 'E'.code) {
          if (this.ranExternBaker) {
            var module = path.substr(0,path.length-3).replace('\\','/');
            module = [ for (part in module.split('/')) if(part.length != 0) part].join('.');
            if (externsToCompile.exists(module)) {
              if (traceFiles) {
                log('compiling $phase because the extern module $module has changed');
              }
              ret = true;
              break;
            }
          }
        } else if (kind == 'C'.code) {
          if (!FileSystem.exists(path)) {
            if (traceFiles) {
              log('compiling $phase because the file $path does not exist anymore');
            }
            ret = true;
            break;
          } else if (FileSystem.stat(path).mtime.getTime() >= stamp) {
            if (traceFiles) {
              log('compiling $phase because the file $path has changed');
            }
            ret = true;
            break;
          }
        }
      }
    }
    catch(e:haxe.io.Eof) {}

    file.close();
    if (ret) {
      sys.io.File.saveContent(compFile, '');
    }

    return ret;
  }

  /**
    Adds the HaxeRuntime module to the game project if it isn't there, and updates
    the template files
   **/
  private function updateProject(targetModule:String, ver:String)
  {
    var proj = getProjectName();
    if (proj == null) throw new BuildError('Build failed');
    InitPlugin.updateProject(this.data.projectDir, this.haxeDir, this.data.pluginDir, proj, ver, this.data.targetType == Program, false, targetModule);
  }

  private function getEngineVersion(config:UhxBuildConfig):{ MajorVersion:Int, MinorVersion:Int, PatchVersion:Null<Int> } {
    var engineDir = this.data.engineDir;
    if (FileSystem.exists('$engineDir/Build/Build.version')) {
      return haxe.Json.parse( sys.io.File.getContent('$engineDir/Build/Build.version') );
    } else if (config.engineVersion != null) {
      var vers = config.engineVersion.split('.');
      var ret = { MajorVersion:Std.parseInt(vers[0]), MinorVersion:Std.parseInt(vers[1]), PatchVersion:Std.parseInt(vers[2]) };
      if (ret.MajorVersion == null || ret.MinorVersion == null) {
        throw new BuildError('The engine version is not in the right pattern (Major.Minor.Patch)');
      }
      return ret;
    } else {
      throw new BuildError('The engine build version file at $engineDir/Build/Build.version could not be found, and neither was an overridden version set on the uhxconfig.local file');
    }
  }

  private static function setEnvs(envs:Map<String,String>):Map<String,String> {
    var oldEnvs = new Map();
    for (key in envs.keys()) {
      var old = Sys.getEnv(key);
      oldEnvs[key] = old == null ? "" : old;
      Sys.putEnv(key, envs[key]);
    }
    return oldEnvs;
  }

  private function createHxml(name:String, args:Array<String>) {
    var hxml = new StringBuf();
    hxml.add('# this file is here for convenience only (e.g. to make your IDE work or to compile without invoking UE4 Build)\n');
    hxml.add('# this is not used by the build pipeline, and is recommended to be ignored by your SCM\n');
    hxml.add('# please change "arguments.hxml" instead\n\n');
    var i = -1;
    for (arg in args)
      hxml.add(arg + '\n');
    File.saveContent('$haxeDir/gen-$name.hxml', hxml.toString());
  }

  private function compileSources(args:Array<String>, ?realOutput:String, ?showErrors=true)
  {
    var cmdArgs = [];
    for (arg in args) {
      if (arg == '' || arg.charCodeAt(0) == '#'.code) continue;

      if (arg.charCodeAt(0) == '-'.code) {
        var idx = arg.indexOf(' ');
        if (idx > 0) {
          var cmd = arg.substr(0,idx);
          cmdArgs.push(cmd);
          if (cmd == '-cpp' && realOutput != null)
            cmdArgs.push(realOutput);
          else
            cmdArgs.push(arg.substr(idx+1));
          continue;
        }
      }
      cmdArgs.push(arg);
    }
    cmdArgs = ['--cwd', haxeDir].concat(cmdArgs);
    if (this.config.enableTimers) {
      cmdArgs.push('--times');
      // if (this.config.enableMacroTimers) {
        cmdArgs.push('-D');
        cmdArgs.push('macro_times');
      // }
    }

    return callHaxe(cmdArgs, showErrors);
  }

  private function getModules(name:String, modules:Array<String>)
  {
    function recurse(path:String, pack:String)
    {
      if (pack == 'uhx.' || pack == 'unreal.') return;
      for (file in FileSystem.readDirectory(path))
      {
        if (file.toLowerCase().endsWith('.hx'))
          modules.push(pack + file.substr(0,-3));
        else if (FileSystem.isDirectory('$path/$file'))
          recurse('$path/$file', pack + file + '.');
      }
    }

    var game = '${data.projectDir}/Haxe/$name';
    if (FileSystem.exists(game)) recurse(game, '');
    var templ = '${data.pluginDir}/Haxe/$name';
    if (FileSystem.exists(templ)) recurse(templ, '');
  }

  public function haxelibPath(name:String):String
  {
    try
    {
      var haxelib = new sys.io.Process('haxelib',['path', name]);
      var found = null;
      if (haxelib.exitCode() == 0)
      {
        for (ln in haxelib.stdout.readAll().toString().split('\n'))
        {
          if (FileSystem.exists(ln))
          {
            found = ln;
            break;
          }
        }
        if (found == null)
          err('Cannot find a valid path for haxelib path $name');
      } else {
        err('Error while calling haxelib path $name: ${haxelib.stderr.readAll()}');
      }
      haxelib.close();
      return found;
    }
    catch(e:Dynamic)
    {
      err('Error while calling haxelib path $name: $e');
      return null;
    }
  }

  private static function toMacroDef(arr:Array<String>):String {
    return '[' + [for (val in arr) '"' + val.replace('\\','/') + '"'].join(', ') + ']';
  }

  private function checkProducedFiles(producedFile:String, verbose:Bool, pass:String):Bool {
    if (!FileSystem.exists(producedFile)) {
      if (verbose) {
        log('compiling $pass because the produced files descriptor does not exist');
      }
      return true;
    }

    for (file in File.getContent(producedFile).split('\n')) {
      if (!FileSystem.exists(file)) {
        if (verbose) {
          log('compiling $pass because the produced file $file does not exist');
        }
        return true;
      }
    }
    return false;
  }
}
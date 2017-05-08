package ue4hx.internal;
import haxe.macro.Expr;
import haxe.macro.Type;

class MacroHelpers
{
  public static function hasMeta(metas:Metadata, name:String):Bool {
    if (metas == null) return false;
    for (meta in metas) {
      if (meta.name == name)
        return true;
    }
    return false;
  }

  public static function extractStrings(metas:MetaAccess, name:String):Array<String> {
    var ret = [];
    for (field in metas.extract(name)) {
      if (field.params != null) {
        for (param in field.params) {
          switch(param.expr) {
          case EConst(CString(s)):
            ret.push(s);
          case EConst(CIdent(s)):
            ret.push(s);
          case _:
            throw 'assert: $param';
          }
        }
      }
    }
    return ret;
  }

  public static function extractMetaDef(metas:MetaAccess, name:String):Array<{ name:String, ?value:String, ?isMeta:Bool }> {
    var ret = [];
    if (metas == null) return ret;
    for (field in metas.extract(name)) {
      if (field.params != null) {
        for (param in field.params) {
          extractMetaDefFromParam(param, ret);
        }
      }
    }
    return ret;
  }

  private static function extractMetaDefFromParam(param:Expr, ret:Array<{ name:String, ?value:String, ?isMeta:Bool }>) {
    switch(param.expr) {
    case EConst(CString(s)):
      ret.push({ name: s });
    case EConst(CIdent(s)):
      ret.push({ name: s });
    case EBinop(OpAssign,{ expr: EConst(CIdent(name) | CString(name)) }, { expr:EConst(CIdent(value) | CString(value)) }):
      ret.push({ name: name, value:value });
    case EBinop(OpAssign,{ expr: EConst(CIdent(name) | CString(name)) }, { expr:EArrayDecl(arr) }):
      if (name.toLowerCase() == "meta") {
        var i = ret.length;
        for (value in arr) {
          extractMetaDefFromParam(value, ret);
        }
        for (i in (i+1)...ret.length) {
          ret[i].isMeta = true;
        }
      } else {
        for (value in arr) {
          switch(value.expr) {
          case EConst(CString(s) | CIdent(s)):
            ret.push({ name:name, value:s });
          case _:
            // TODO error?
          }
        }
      }
    case _:
    // TODO error?
    // TODO handle cases like HideCategories=[SomeValue,Another]
    //   throw 'assert: $param';
    }
  }

  public static function extractMeta(metas:Metadata, name:String):Null<MetadataEntry> {
    if (metas == null) return null;
    for (meta in metas) {
      if (meta.name == name)
        return meta;
    }
    return null;
  }

  public static function extractStringsFromMetadata(metas:Metadata, name:String):Array<String> {
    var ret = [];
    for (field in metas) {
      if (field.name != name) continue;
      if (field.params != null) {
        for (param in field.params) {
          switch(param.expr) {
          case EConst(CString(s)):
            ret.push(s);
          case _:
            throw 'assert: $param';
          }
        }
      }
    }
    return ret;
  }

  private static var classpaths:Array<String>;

  public static function getPath(filePath:String) {
    if (classpaths == null) {
      classpaths = haxe.macro.Context.getClassPath();
    }
    if (sys.FileSystem.exists(filePath)) return filePath;
    for (cp in classpaths) {
      var path = '$cp/$filePath';
      if (sys.FileSystem.exists(path)) {
        return path;
      }
    }

    return null;
  }

  public static function getUName(cf:{ var name(default, null):String; var meta(default,null):MetaAccess; }) {
    var uname = MacroHelpers.extractStrings(cf.meta, ':uname')[0];
    return uname != null ? uname : cf.name;
  }
}

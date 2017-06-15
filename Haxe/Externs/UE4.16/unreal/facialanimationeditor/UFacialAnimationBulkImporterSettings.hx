/**
   * 
   * WARNING! This file was autogenerated by: 
   *  _   _ _   _ __   __ 
   * | | | | | | |\ \ / / 
   * | | | | |_| | \ V /  
   * | | | |  _  | /   \  
   * | |_| | | | |/ /^\ \ 
   *  \___/\_| |_/\/   \/ 
   * 
   * This file was autogenerated by UE4HaxeExternGenerator using UHT definitions. It only includes UPROPERTYs and UFUNCTIONs. Do not modify it!
   * In order to add more definitions, create or edit a type with the same name/package, but with an `_Extra` suffix
**/
package unreal.facialanimationeditor;


/**
  WARNING: This type was defined as MinimalAPI on its declaration. Because of that, its properties/methods are inaccessible
  
  
**/
@:umodule("FacialAnimationEditor")
@:glueCppIncludes("Private/FacialAnimationBulkImporterSettings.h")
@:uextern @:uclass extern class UFacialAnimationBulkImporterSettings extends unreal.UObject {
  
  /**
    Node in the FBX scene that contains the curves we are interested in
  **/
  @:uproperty public var CurveNodeName : unreal.FString;
  
  /**
    The path to import files to
  **/
  @:uproperty public var TargetImportPath : unreal.FDirectoryPath;
  
  /**
    The path to import files from
  **/
  @:uproperty public var SourceImportPath : unreal.FDirectoryPath;
  
}
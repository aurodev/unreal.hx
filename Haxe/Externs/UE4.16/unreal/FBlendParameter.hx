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
package unreal;


/**
  WARNING: This type is defined as NoExport by UHT. It will be empty because of it
  
  
**/
@:glueCppIncludes("Animation/BlendSpaceBase.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FBlendParameter {
  
  /**
    The number of grid divisions for this parameter (axis).
  **/
  @:uproperty public var GridNum : unreal.Int32;
  
  /**
    Max value for this parameter.
  **/
  @:uproperty public var Max : unreal.Float32;
  
  /**
    Min value for this parameter.
  **/
  @:uproperty public var Min : unreal.Float32;
  @:uproperty public var DisplayName : unreal.FString;
  
}
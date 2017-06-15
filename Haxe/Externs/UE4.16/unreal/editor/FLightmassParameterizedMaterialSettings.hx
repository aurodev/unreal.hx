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
package unreal.editor;


/**
  WARNING: This type is defined as NoExport by UHT. It will be empty because of it
  
  Structure for 'parameterized' Lightmass settings
**/
@:umodule("UnrealEd")
@:glueCppIncludes("Editor/UnrealEdTypes.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FLightmassParameterizedMaterialSettings {
  
  /**
    Scales the resolution that this material's attributes were exported at.
    This is useful for increasing material resolution when details are needed.
  **/
  @:uproperty public var ExportResolutionScale : unreal.editor.FLightmassScalarParameterValue;
  
  /**
    Scales the diffuse contribution of this material to static lighting.
  **/
  @:uproperty public var DiffuseBoost : unreal.editor.FLightmassScalarParameterValue;
  
  /**
    Scales the emissive contribution of this material to static lighting.
  **/
  @:uproperty public var EmissiveBoost : unreal.editor.FLightmassScalarParameterValue;
  
  /**
    If true, forces translucency to cast static shadows as if the material were masked.
  **/
  @:uproperty public var CastShadowAsMasked : unreal.editor.FLightmassBooleanParameterValue;
  
}
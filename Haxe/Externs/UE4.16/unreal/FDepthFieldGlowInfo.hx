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
 * This file was autogenerated by UnrealHxGenerator using UHT definitions.
 * It only includes UPROPERTYs and UFUNCTIONs. Do not modify it!
 * In order to add more definitions, create or edit a type with the same name/package, but with an `_Extra` suffix
**/
package unreal;

/**
  info for glow when using depth field rendering
**/
@:glueCppIncludes("Engine/EngineTypes.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FDepthFieldGlowInfo {
  
  /**
    if bEnableGlow, outline glow inner radius (0 to 1, 0.5 is edge of character silhouette)
    glow influence will be 1 at GlowInnerRadius.X and 0 at GlowInnerRadius.Y
  **/
  @:uproperty public var GlowInnerRadius : unreal.FVector2D;
  
  /**
    if bEnableGlow, outline glow outer radius (0 to 1, 0.5 is edge of character silhouette)
    glow influence will be 0 at GlowOuterRadius.X and 1 at GlowOuterRadius.Y
  **/
  @:uproperty public var GlowOuterRadius : unreal.FVector2D;
  
  /**
    base color to use for the glow
  **/
  @:uproperty public var GlowColor : unreal.FLinearColor;
  
  /**
    whether to turn on the outline glow (depth field fonts only)
  **/
  @:uproperty public var bEnableGlow : Bool;
  
}
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

@:glueCppIncludes("PhysicsEngine/PhysicsAsset.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FPhysicalAnimationProfile {
  
  /**
    Physical animation parameters used to drive animation
  **/
  @:uproperty public var PhysicalAnimationData : unreal.FPhysicalAnimationData;
  
  /**
    Profile name used to identify set of physical animation parameters
  **/
  @:uproperty public var ProfileName : unreal.FName;
  
}

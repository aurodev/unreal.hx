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
package unreal.physxvehicles;

/**
  Vehicle-specific wheel setup
**/
@:umodule("PhysXVehicles")
@:glueCppIncludes("WheeledVehicleMovementComponent.h")
@:uextern @:ustruct extern class FWheelSetup {
  
  /**
    Additional offset to give the wheels for this axle.
  **/
  @:uproperty public var AdditionalOffset : unreal.FVector;
  
  /**
    Bone name on mesh to create wheel at
  **/
  @:uproperty public var BoneName : unreal.FName;
  
  /**
    The wheel class to use
  **/
  @:uproperty public var WheelClass : unreal.TSubclassOf<unreal.physxvehicles.UVehicleWheel>;
  
}

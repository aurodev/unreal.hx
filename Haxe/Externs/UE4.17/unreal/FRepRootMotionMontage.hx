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
  Replicated data when playing a root motion montage.
**/
@:glueCppIncludes("GameFramework/Character.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FRepRootMotionMontage {
  
  /**
    Velocity
  **/
  @:uproperty public var LinearVelocity : unreal.FVector_NetQuantize10;
  
  /**
    Acceleration
  **/
  @:uproperty public var Acceleration : unreal.FVector_NetQuantize10;
  
  /**
    State of Root Motion Sources on Authority
  **/
  @:uproperty public var AuthoritativeRootMotion : unreal.FRootMotionSourceGroup;
  
  /**
    Whether rotation is relative or absolute.
  **/
  @:uproperty public var bRelativeRotation : Bool;
  
  /**
    Additional replicated flag, if MovementBase can't be resolved on the client. So we don't use wrong data.
  **/
  @:uproperty public var bRelativePosition : Bool;
  
  /**
    Bone on the MovementBase, if a skeletal mesh.
  **/
  @:uproperty public var MovementBaseBoneName : unreal.FName;
  
  /**
    Movement Relative to Base
  **/
  @:uproperty public var MovementBase : unreal.UPrimitiveComponent;
  
  /**
    Rotation
  **/
  @:uproperty public var Rotation : unreal.FRotator;
  
  /**
    Location
  **/
  @:uproperty public var Location : unreal.FVector_NetQuantize100;
  
  /**
    Track position of Montage
  **/
  @:uproperty public var Position : unreal.Float32;
  
  /**
    AnimMontage providing Root Motion
  **/
  @:uproperty public var AnimMontage : unreal.UAnimMontage;
  
  /**
    Whether this has useful/active data.
  **/
  @:uproperty public var bIsActive : Bool;
  
}

/**
   * 
   * WARNING! This file was autogenerated by: 
   *  _   _ _____     ___   _   _ __   __ 
   * | | | |  ___|   /   | | | | |\ \ / / 
   * | | | | |__    / /| | | |_| | \ V /  
   * | | | |  __|  / /_| | |  _  | /   \  
   * | |_| | |___  \___  | | | | |/ /^\ \ 
   *  \___/\____/      |_/ \_| |_/\/   \/ 
   * 
   * This file was autogenerated by UE4HaxeExternGenerator using UHT definitions. It only includes UPROPERTYs and UFUNCTIONs. Do not modify it!
   * In order to add more definitions, create or edit a type with the same name/package, but with an `_Extra` suffix
**/
package unreal.aimodule;

@:umodule("AIModule")
@:glueCppIncludes("Navigation/CrowdFollowingComponent.h")
@:uextern @:uclass extern class UCrowdFollowingComponent extends unreal.aimodule.UPathFollowingComponent implements unreal.aimodule.ICrowdAgentInterface {
  
  /**
    DEPRECATED: Will NOT avoid other agents if they are in one of specified groups, higher priority than GroupsToAvoid - use property from CharacterMovementComponent instead
  **/
  @:deprecated @:uproperty private var GroupsToIgnore_DEPRECATED : unreal.FNavAvoidanceMask;
  
  /**
    DEPRECATED: Will avoid other agents if they are in one of specified groups - use property from CharacterMovementComponent instead
  **/
  @:deprecated @:uproperty private var GroupsToAvoid_DEPRECATED : unreal.FNavAvoidanceMask;
  
  /**
    DEPRECATED: Group mask for this agent - use property from CharacterMovementComponent instead
  **/
  @:deprecated @:uproperty private var AvoidanceGroup_DEPRECATED : unreal.FNavAvoidanceMask;
  @:uproperty private var CharacterMovement : unreal.UCharacterMovementComponent;
  @:uproperty public var CrowdAgentMoveDirection : unreal.FVector;
  
  /**
    master switch for crowd steering & avoidance
  **/
  @:ufunction public function SuspendCrowdSteering(bSuspend : Bool) : Void;
  // CrowdAgentInterface interface implementation
  
}

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
package unreal.aimodule;

/**
  Decorator for accessing blackboard values
**/
@:umodule("AIModule")
@:glueCppIncludes("BehaviorTree/Decorators/BTDecorator_Blackboard.h")
@:uname("EBTBlackboardRestart.Type")
@:uextern @:uenum extern enum EBTBlackboardRestart {
  
  /**
    Restart on every change of observed blackboard value
    @DisplayName On Value Change
  **/
  @DisplayName("On Value Change")
  ValueChange;
  
  /**
    Restart only when result of evaluated condition is changed
    @DisplayName On Result Change
  **/
  @DisplayName("On Result Change")
  ResultChange;
  
}

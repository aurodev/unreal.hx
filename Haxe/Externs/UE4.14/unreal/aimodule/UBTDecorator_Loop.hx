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


/**
  Loop decorator node.
  A decorator node that bases its condition on whether its loop counter has been exceeded.
**/
@:umodule("AIModule")
@:glueCppIncludes("BehaviorTree/Decorators/BTDecorator_Loop.h")
@:uextern @:uclass extern class UBTDecorator_Loop extends unreal.aimodule.UBTDecorator {
  
  /**
    timeout (when looping infinitely, when we finish a loop we will check whether we have spent this time looping, if we have we will stop looping). A negative value means loop forever.
  **/
  @:uproperty public var InfiniteLoopTimeoutTime : unreal.Float32;
  
  /**
    infinite loop
  **/
  @:uproperty public var bInfiniteLoop : Bool;
  
  /**
    number of executions
  **/
  @:uproperty public var NumLoops : unreal.Int32;
  
}

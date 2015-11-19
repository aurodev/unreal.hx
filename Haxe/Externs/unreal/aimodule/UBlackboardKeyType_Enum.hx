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
@:glueCppIncludes("BehaviorTree/Blackboard/BlackboardKeyType_Enum.h")
@:uextern extern class UBlackboardKeyType_Enum extends unreal.aimodule.UBlackboardKeyType {
  
  /**
    set when EnumName override is valid and active
  **/
  public var bIsEnumNameValid : Bool;
  
  /**
    name of enum defined in c++ code, will take priority over asset from EnumType property
  **/
  public var EnumName : unreal.FString;
  public var EnumType : unreal.UEnum;
  
}
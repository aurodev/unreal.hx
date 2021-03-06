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
package unreal.enginemessages;

/**
  Implements a message for responding to a request to discover engine instances on the network.
**/
@:umodule("EngineMessages")
@:glueCppIncludes("EngineServiceMessages.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FEngineServicePong {
  
  /**
    Holds the time in seconds since the world was loaded.
  **/
  @:uproperty public var WorldTimeSeconds : unreal.Float32;
  
  /**
    Holds the identifier of the session that the application belongs to.
  **/
  @:uproperty public var SessionId : unreal.FGuid;
  
  /**
    Holds the type of the engine instance.
  **/
  @:uproperty public var InstanceType : unreal.FString;
  
  /**
    Holds the instance identifier.
  **/
  @:uproperty public var InstanceId : unreal.FGuid;
  
  /**
    Holds a flag indicating whether game play has begun.
  **/
  @:uproperty public var HasBegunPlay : Bool;
  
  /**
    Holds the engine version.
  **/
  @:uproperty public var EngineVersion : unreal.Int32;
  
  /**
    Holds the name of the currently loaded level, if any.
  **/
  @:uproperty public var CurrentLevel : unreal.FString;
  
}

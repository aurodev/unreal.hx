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
package unreal.gameplayabilities;

@:umodule("GameplayAbilities")
@:glueCppIncludes("Abilities/Tasks/AbilityTask_NetworkSyncPoint.h")
@:uname("EAbilityTaskNetSyncType")
@:class @:uextern @:uenum extern enum EAbilityTaskNetSyncType {
  
  /**
    Both client and server wait until the other signals
  **/
  BothWait;
  
  /**
    Only server will wait for the client signal. Client will signal and immediately continue without waiting to hear from Server.
  **/
  OnlyServerWait;
  
  /**
    Only client will wait for the server signal. Server will signal and immediately continue without waiting to hear from Client.
  **/
  OnlyClientWait;
  
}

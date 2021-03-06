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
package unreal;


/**
  WARNING: This type was defined as MinimalAPI on its declaration. Because of that, its properties/methods are inaccessible
  
  
**/
@:glueCppIncludes("Matinee/InterpTrackAnimControl.h")
@:uextern @:uclass extern class UInterpTrackAnimControl extends unreal.UInterpTrackFloatBase {
  
  /**
    Skip all anim notifiers *
  **/
  @:uproperty public var bSkipAnimNotifiers : Bool;
  
  /**
    Track of different animations to play and when to start playing them.
  **/
  @:uproperty public var AnimSeqs : unreal.TArray<unreal.FAnimControlTrackKey>;
  
  /**
    Name of slot to use when playing animation. Passed to Actor.
    When multiple tracks use the same slot name, they are each given a different ChannelIndex when SetAnimPosition is called.
  **/
  @:uproperty public var SlotName : unreal.FName;
  
}

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
  WARNING: This type is defined as NoExport by UHT. It will be empty because of it
  
  Structure containing information on a SoundMix to activate passively.
**/
@:glueCppIncludes("Sound/SoundClass.h")
@:noCopy @:noEquals @:uextern extern class FPassiveSoundMixModifier {
  
  /**
    Maximum volume level required to activate SoundMix. Above this value the SoundMix will not be active.
  **/
  public var MaxVolumeThreshold : unreal.Float32;
  
  /**
    Minimum volume level required to activate SoundMix. Below this value the SoundMix will not be active.
  **/
  public var MinVolumeThreshold : unreal.Float32;
  
  /**
    The SoundMix to activate
  **/
  public var SoundMix : unreal.USoundMix;
  
}
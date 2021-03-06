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
  Called as a sound plays on the audio component to allow BP to perform actions based on playback percentage.
  Computed as samples played divided by total samples, taking into account pitch.
  Not currently implemented on all platforms.
  @param PlayingSoundWave
  @param PlaybackPercent
  
**/
@:glueCppIncludes("Components/AudioComponent.h")
@:uParamName("PlayingSoundWave")
@:uParamName("PlaybackPercent")
typedef FOnAudioPlaybackPercent = unreal.DynamicMulticastDelegate<FOnAudioPlaybackPercent, unreal.Const<unreal.USoundWave>->unreal.Float32->Void>;
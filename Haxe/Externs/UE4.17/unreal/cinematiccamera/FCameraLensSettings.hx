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
package unreal.cinematiccamera;

/**
  #note, this struct has a details customization in CameraLensSettingsCustomization.cpp/h
**/
@:umodule("CinematicCamera")
@:glueCppIncludes("CineCameraComponent.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FCameraLensSettings {
  
  /**
    Shortest distance this lens can focus on.
  **/
  @:uproperty public var MinimumFocusDistance : unreal.Float32;
  
  /**
    Minimum aperture for this lens (e.g. 2.8 for an f/2.8 lens)
  **/
  @:uproperty public var MaxFStop : unreal.Float32;
  
  /**
    Minimum aperture for this lens (e.g. 2.8 for an f/2.8 lens)
  **/
  @:uproperty public var MinFStop : unreal.Float32;
  
  /**
    Maximum focal length for this lens
  **/
  @:uproperty public var MaxFocalLength : unreal.Float32;
  
  /**
    Minimum focal length for this lens
  **/
  @:uproperty public var MinFocalLength : unreal.Float32;
  
}

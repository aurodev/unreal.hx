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
   * This file was autogenerated by UE4HaxeExternGenerator using UHT definitions. It only includes UPROPERTYs and UFUNCTIONs. Do not modify it!
   * In order to add more definitions, create or edit a type with the same name/package, but with an `_Extra` suffix
**/
package unreal.moviescenetracks;


/**
  WARNING: This type is defined as NoExport by UHT. It will be empty because of it
  
  A curve of events
**/
@:umodule("MovieSceneTracks")
@:glueCppIncludes("Sections/MovieSceneEventSection.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FMovieSceneEventSectionData {
  
  /**
    Array of values that correspond to each key time
  **/
  @:uproperty public var KeyValues : unreal.TArray<unreal.moviescenetracks.FEventPayload>;
  
  /**
    Sorted array of key times
  **/
  @:uproperty public var KeyTimes : unreal.TArray<unreal.Float32>;
  
}
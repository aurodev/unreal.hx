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
package unreal.moviescenetracks;

/**
  Handles manipulation of byte properties in a movie scene
**/
@:umodule("MovieSceneTracks")
@:glueCppIncludes("Tracks/MovieSceneEnumTrack.h")
@:uextern @:uclass extern class UMovieSceneEnumTrack extends unreal.moviescenetracks.UMovieScenePropertyTrack {
  @:uproperty private var Enum : unreal.UEnum;
  
}

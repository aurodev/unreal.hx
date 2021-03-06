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
package unreal.moviescene;

/**
  Generic evaluation options for any track
**/
@:umodule("MovieScene")
@:glueCppIncludes("MovieSceneTrack.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FMovieSceneTrackEvalOptions {
  @:deprecated @:uproperty public var bEvaluateNearestSection_DEPRECATED : Bool;
  
  /**
    Evaluate this track as part of its parent sub-section's post-roll, if applicable
  **/
  @:uproperty public var bEvaluateInPostroll : Bool;
  
  /**
    Evaluate this track as part of its parent sub-section's pre-roll, if applicable
  **/
  @:uproperty public var bEvaluateInPreroll : Bool;
  
  /**
    When evaluating empty space on a track, will evaluate the last position of the previous section (if possible), or the first position of the next section, in that order of preference.
  **/
  @:uproperty public var bEvalNearestSection : Bool;
  
  /**
    true when the value of bEvalNearestSection is to be considered for the track
  **/
  @:uproperty public var bCanEvaluateNearestSection : Bool;
  
}

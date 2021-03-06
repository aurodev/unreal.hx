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
package unreal.umg;

/**
  WARNING: This type was defined as MinimalAPI on its declaration. Because of that, its properties/methods are inaccessible
  
  
**/
@:umodule("UMG")
@:glueCppIncludes("UMG.h")
@:uextern @:uclass extern class UWidgetAnimation extends unreal.moviescene.UMovieSceneSequence {
  
  /**
    Get the start time of this animation.
    
    @return Start time in seconds.
    @see GetEndTime
  **/
  @:ufunction @:thisConst @:final public function GetStartTime() : unreal.Float32;
  
  /**
    Get the end time of this animation.
    
    @return End time in seconds.
    @see GetStartTime
  **/
  @:ufunction @:thisConst @:final public function GetEndTime() : unreal.Float32;
  @:uproperty public var AnimationBindings : unreal.TArray<unreal.umg.FWidgetAnimationBinding>;
  
  /**
    Pointer to the movie scene that controls this animation.
  **/
  @:uproperty public var MovieScene : unreal.moviescene.UMovieScene;
  
  /**
    Fires when the widget animation is finished.
  **/
  @:uproperty public var OnAnimationFinished : unreal.umg.FOnWidgetAnimationPlaybackStatusChanged;
  
  /**
    Fires when the widget animation starts playing.
  **/
  @:uproperty public var OnAnimationStarted : unreal.umg.FOnWidgetAnimationPlaybackStatusChanged;
  
}

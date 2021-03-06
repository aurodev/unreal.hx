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
  this is anim segment that defines what animation and how *
**/
@:glueCppIncludes("Animation/AnimCompositeBase.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FAnimSegment {
  @:uproperty public var LoopingCount : unreal.Int32;
  
  /**
    Playback speed of this animation. If you'd like to reverse, set -1
  **/
  @:uproperty public var AnimPlayRate : unreal.Float32;
  
  /**
    Time to end playing the AnimSequence at.
  **/
  @:uproperty public var AnimEndTime : unreal.Float32;
  
  /**
    Time to start playing AnimSequence at.
  **/
  @:uproperty public var AnimStartTime : unreal.Float32;
  
  /**
    Start Pos within this AnimCompositeBase
  **/
  @:uproperty public var StartPos : unreal.Float32;
  
  /**
    Anim Reference to play - only allow AnimSequence or AnimComposite *
  **/
  @:uproperty public var AnimReference : unreal.UAnimSequenceBase;
  
}

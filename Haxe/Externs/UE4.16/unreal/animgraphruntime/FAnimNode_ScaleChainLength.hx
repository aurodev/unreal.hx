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
package unreal.animgraphruntime;

@:umodule("AnimGraphRuntime")
@:glueCppIncludes("BoneControllers/AnimNode_ScaleChainLength.h")
@:uextern @:ustruct extern class FAnimNode_ScaleChainLength extends unreal.FAnimNode_Base {
  @:uproperty public var bBoneIndicesCached : Bool;
  @:uproperty public var AlphaScaleBias : unreal.FInputScaleBias;
  @:uproperty public var Alpha : unreal.Float32;
  @:uproperty public var TargetLocation : unreal.FVector;
  @:uproperty public var ChainEndBone : unreal.FBoneReference;
  @:uproperty public var ChainStartBone : unreal.FBoneReference;
  
  /**
    Default chain length, as animated.
  **/
  @:uproperty public var DefaultChainLength : unreal.Float32;
  @:uproperty public var InputPose : unreal.FPoseLink;
  
}

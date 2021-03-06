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
package unreal.animgraphruntime;


/**
  This represents a baked transition
**/
@:umodule("AnimGraphRuntime")
@:glueCppIncludes("AnimNodes/AnimNode_TwoWayBlend.h")
@:uextern @:ustruct extern class FAnimationNode_TwoWayBlend extends unreal.FAnimNode_Base {
  @:uproperty public var AlphaScaleBias : unreal.FInputScaleBias;
  @:uproperty public var Alpha : unreal.Float32;
  @:uproperty public var B : unreal.FPoseLink;
  @:uproperty public var A : unreal.FPoseLink;
  
}

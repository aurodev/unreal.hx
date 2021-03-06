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
  A priority for sorting scene elements by depth.
  Elements with higher priority occlude elements with lower priority, disregarding distance.
**/
@:glueCppIncludes("Engine/EngineTypes.h")
@:uname("ESceneDepthPriorityGroup")
@:uextern @:uenum extern enum ESceneDepthPriorityGroup {
  
  /**
    World scene DPG.
  **/
  SDPG_World;
  
  /**
    Foreground scene DPG.
  **/
  SDPG_Foreground;
  
}

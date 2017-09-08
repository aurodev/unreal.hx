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
package unreal.editor;

@:umodule("UnrealEd")
@:glueCppIncludes("Settings/LevelEditorPlaySettings.h")
@:uname("EPlayModeType")
@:uextern @:uenum extern enum EPlayModeType {
  
  /**
    Runs from within the editor.
  **/
  PlayMode_InViewPort;
  
  /**
    Runs in a new window.
  **/
  PlayMode_InEditorFloating;
  
  /**
    Runs a mobile preview in a new process.
  **/
  PlayMode_InMobilePreview;
  
  /**
    Runs a mobile preview targeted to a particular device in a new process.
  **/
  PlayMode_InTargetedMobilePreview;
  
  /**
    Runs a vulkan preview in a new process.
  **/
  PlayMode_InVulkanPreview;
  
  /**
    Runs in a new process.
  **/
  PlayMode_InNewProcess;
  
  /**
    Runs in VR.
  **/
  PlayMode_InVR;
  
  /**
    Simulates in viewport without possessing the player.
  **/
  PlayMode_Simulate;
  
  /**
    The number of different Play Modes.
  **/
  PlayMode_Count;
  
}
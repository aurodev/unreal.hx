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

/**
  Enumerates modes for the viewport's rotation grid.
**/
@:umodule("UnrealEd")
@:glueCppIncludes("Settings/LevelEditorViewportSettings.h")
@:uname("ERotationGridMode")
@:uextern @:uenum extern enum ERotationGridMode {
  
  /**
    Using Divisions of 360 degrees (e.g 360/2. 360/3, 360/4, ... ).
  **/
  GridMode_DivisionsOf360;
  
  /**
    Uses the user defined grid values.
  **/
  GridMode_Common;
  
}

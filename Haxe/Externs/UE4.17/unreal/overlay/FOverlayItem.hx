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
package unreal.overlay;

@:umodule("Overlay")
@:glueCppIncludes("Overlays.h")
@:uextern @:ustruct extern class FOverlayItem {
  
  /**
    The position of the text on screen (Between 0.0 and 1.0)
  **/
  @:uproperty public var Position : unreal.FVector2D;
  
  /**
    Text that appears onscreen when the overlay is shown
  **/
  @:uproperty public var Text : unreal.FString;
  
  /**
    When the overlay should be cleared
  **/
  @:uproperty public var EndTime : unreal.FTimespan;
  
  /**
    When the overlay should be displayed
  **/
  @:uproperty public var StartTime : unreal.FTimespan;
  
}

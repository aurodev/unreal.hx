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
package unreal.slatecore;

/**
  Enumerates ways in which an image can be drawn.
**/
@:umodule("SlateCore")
@:glueCppIncludes("Styling/SlateBrush.h")
@:uname("ESlateBrushDrawType.Type")
@:uextern @:uenum extern enum ESlateBrushDrawType {
  
  /**
    Don't do anything
    @DisplayName None
  **/
  @DisplayName("None")
  NoDrawType;
  
  /**
    Draw a 3x3 box, where the sides and the middle stretch based on the Margin
  **/
  Box;
  
  /**
    Draw a 3x3 border where the sides tile and the middle is empty
  **/
  Border;
  
  /**
    Draw an image; margin is ignored
  **/
  Image;
  
}

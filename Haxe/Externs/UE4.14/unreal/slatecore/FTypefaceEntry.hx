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
package unreal.slatecore;


/**
  A single entry in a typeface
**/
@:umodule("SlateCore")
@:glueCppIncludes("Fonts/CompositeFont.h")
@:uextern @:ustruct extern class FTypefaceEntry {
  
  /**
    Raw font data for this font
  **/
  @:uproperty public var Font : unreal.slatecore.FFontData;
  
  /**
    Name used to identify this font within its typeface
  **/
  @:uproperty public var Name : unreal.FName;
  
}

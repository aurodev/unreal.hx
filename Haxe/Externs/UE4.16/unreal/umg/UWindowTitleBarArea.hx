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
  A panel for defining a region of the UI that should allow users to drag the window on desktop platforms.
**/
@:umodule("UMG")
@:glueCppIncludes("UMG.h")
@:uextern @:uclass extern class UWindowTitleBarArea extends unreal.umg.UContentWidget {
  
  /**
    Should double clicking the title bar area toggle fullscreen instead of maximizing the window.
  **/
  @:uproperty public var bDoubleClickTogglesFullscreen : Bool;
  @:ufunction @:final public function SetPadding(InPadding : unreal.slatecore.FMargin) : Void;
  @:ufunction @:final public function SetHorizontalAlignment(InHorizontalAlignment : unreal.slatecore.EHorizontalAlignment) : Void;
  @:ufunction @:final public function SetVerticalAlignment(InVerticalAlignment : unreal.slatecore.EVerticalAlignment) : Void;
  
}

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
package unreal.umg;


/**
  Common data for all widgets that use shaped text.
  Contains the common options that should be exposed for the underlying Slate widget.
**/
@:umodule("UMG")
@:glueCppIncludes("UMG.h")
@:uextern extern class FShapedTextOptions {
  
  /**
    Which text flow direction should the text within this widget use? (unset to use the default returned by GetDefaultTextFlowDirection)
  **/
  public var TextFlowDirection : unreal.slate.ETextFlowDirection;
  
  /**
    Which text shaping method should the text within this widget use? (unset to use the default returned by GetDefaultTextShapingMethod)
  **/
  public var TextShapingMethod : unreal.slatecore.ETextShapingMethod;
  public var bOverride_TextFlowDirection : Bool;
  public var bOverride_TextShapingMethod : Bool;
  
}
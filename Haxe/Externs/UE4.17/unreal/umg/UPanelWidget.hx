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
  The base class for all UMG panel widgets.  Panel widgets layout a collection of child widgets.
**/
@:umodule("UMG")
@:glueCppIncludes("UMG.h")
@:uextern @:uclass extern class UPanelWidget extends unreal.umg.UWidget {
  
  /**
    The slots in the widget holding the child widgets of this panel.
  **/
  @:uproperty private var Slots : unreal.TArray<unreal.umg.UPanelSlot>;
  
  /**
    Gets number of child widgets in the container.
  **/
  @:ufunction @:thisConst @:final public function GetChildrenCount() : unreal.Int32;
  
  /**
    Gets the widget at an index.
    @param Index The index of the widget.
    @return The widget at the given index, or nothing if there is no widget there.
  **/
  @:ufunction @:thisConst @:final public function GetChildAt(Index : unreal.Int32) : unreal.umg.UWidget;
  
  /**
    Gets the index of a specific child widget
  **/
  @:ufunction @:thisConst @:final public function GetChildIndex(Content : unreal.umg.UWidget) : unreal.Int32;
  
  /**
    @return true if panel contains this widget
  **/
  @:ufunction @:thisConst @:final public function HasChild(Content : unreal.umg.UWidget) : Bool;
  
  /**
    Removes a child by it's index.
  **/
  @:ufunction @:final public function RemoveChildAt(Index : unreal.Int32) : Bool;
  
  /**
    Adds a new child widget to the container.  Returns the base slot type,
    requires casting to turn it into the type specific to the container.
  **/
  @:ufunction @:final public function AddChild(Content : unreal.umg.UWidget) : unreal.umg.UPanelSlot;
  
  /**
    Removes a specific widget from the container.
    @return true if the widget was found and removed.
  **/
  @:ufunction @:final public function RemoveChild(Content : unreal.umg.UWidget) : Bool;
  
  /**
    @return true if there are any child widgets in the panel
  **/
  @:ufunction @:thisConst @:final public function HasAnyChildren() : Bool;
  
  /**
    Remove all child widgets from the panel widget.
  **/
  @:ufunction @:final public function ClearChildren() : Void;
  
}

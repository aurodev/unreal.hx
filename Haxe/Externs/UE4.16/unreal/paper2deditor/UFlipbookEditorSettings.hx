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
   * This file was autogenerated by UE4HaxeExternGenerator using UHT definitions. It only includes UPROPERTYs and UFUNCTIONs. Do not modify it!
   * In order to add more definitions, create or edit a type with the same name/package, but with an `_Extra` suffix
**/
package unreal.paper2deditor;


/**
  WARNING: This type was not defined as DLL export on its declaration. Because of that, its properties/methods are inaccessible
  
  Settings for the Paper2D sprite editor
**/
@:umodule("Paper2DEditor")
@:glueCppIncludes("Private/FlipbookEditor/FlipbookEditorSettings.h")
@:noClass @:uextern @:uclass extern class UFlipbookEditorSettings extends unreal.UObject {
  
  /**
    Should the grid be shown by default when the editor is opened?
  **/
  @:uproperty public var bShowGridByDefault : Bool;
  
  /**
    Background color in the flipbook editor
  **/
  @:uproperty public var BackgroundColor : unreal.FColor;
  
}
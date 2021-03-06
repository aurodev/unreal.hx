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
package unreal;


/**
  WARNING: This type was defined as MinimalAPI on its declaration. Because of that, its properties/methods are inaccessible
  
  
**/
@:glueCppIncludes("Layers/Layer.h")
@:uextern @:uclass extern class ULayer extends unreal.UObject {
  
  /**
    Basic stats regarding the number of Actors and their types currently assigned to the Layer
  **/
  @:uproperty public var ActorStats : unreal.TArray<unreal.FLayerActorStats>;
  
  /**
    Whether actors associated with the layer are visible in the viewport
  **/
  @:uproperty public var bIsVisible : Bool;
  
  /**
    The display name of the layer
  **/
  @:uproperty public var LayerName : unreal.FName;
  
}

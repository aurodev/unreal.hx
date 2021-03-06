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
@:glueCppIncludes("Animation/AnimCompress_RemoveEverySecondKey.h")
@:uextern @:uclass extern class UAnimCompress_RemoveEverySecondKey extends unreal.UAnimCompress {
  
  /**
    If bStartAtSecondKey is true, remove keys 1,3,5,etc.
    If bStartAtSecondKey is false, remove keys 0,2,4,etc.
  **/
  @:uproperty public var bStartAtSecondKey : Bool;
  
  /**
    Animations with fewer than MinKeys will not lose any keys.
  **/
  @:uproperty public var MinKeys : unreal.Int32;
  
}

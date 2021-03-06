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

@:glueCppIncludes("Engine/BlueprintCore.h")
@:uextern @:uclass extern class UBlueprintCore extends unreal.UObject {
  
  /**
    BackCompat:  Whether or not we need to purge references in this blueprint to the skeleton generated during compile-on-load
  **/
  @:uproperty public var bLegacyNeedToPurgeSkelRefs : Bool;
  
  /**
    Pointer to the 'most recent' fully generated class
  **/
  @:uproperty public var GeneratedClass : unreal.TSubclassOf<unreal.UObject>;
  
  /**
    Pointer to the skeleton class; this is regenerated any time a member variable or function is added but
          is usually incomplete (no code or hidden autogenerated variables are added to it)
  **/
  @:uproperty public var SkeletonGeneratedClass : unreal.TSubclassOf<unreal.UObject>;
  
}

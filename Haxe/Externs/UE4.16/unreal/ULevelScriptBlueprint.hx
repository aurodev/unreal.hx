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
package unreal;

/**
  WARNING: This type was defined as MinimalAPI on its declaration. Because of that, its properties/methods are inaccessible
  
  A level blueprint is a specialized type of blueprint. It is used to house
  global, level-wide logic. In a level blueprint, you can operate on specific
  level-actor instances through blueprint's node-based interface. UE3 users
  should be familiar with this concept, as it is very similar to Kismet.
  
  @see https://docs.unrealengine.com/latest/INT/Engine/Blueprints/UserGuide/Types/LevelBlueprint/index.html
  @see https://docs.unrealengine.com/latest/INT/Engine/Blueprints/index.html
  @see UBlueprint
  @see ALevelScriptActor
**/
@:glueCppIncludes("Engine/LevelScriptBlueprint.h")
@:uextern @:uclass extern class ULevelScriptBlueprint extends unreal.UBlueprint {
  #if WITH_EDITORONLY_DATA
  
  /**
    The friendly name to use for UI
  **/
  @:uproperty public var FriendlyName : unreal.FString;
  #end // WITH_EDITORONLY_DATA
  
}

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
  StaticMeshActor is an instance of a UStaticMesh in the world.
  Static meshes are geometry that do not animate or otherwise deform, and are more efficient to render than other types of geometry.
  Static meshes dragged into the level from the Content Browser are automatically converted to StaticMeshActors.
  
  @see https://docs.unrealengine.com/latest/INT/Engine/Actors/StaticMeshActor/
  @see UStaticMesh
**/
@:glueCppIncludes("Engine/StaticMeshActor.h")
@:uextern @:uclass extern class AStaticMeshActor extends unreal.AActor {
  @:uproperty public var NavigationGeometryGatheringMode : unreal.ENavDataGatheringMode;
  
  /**
    This static mesh should replicate movement. Automatically sets the RemoteRole and bReplicateMovement flags. Meant to be edited on placed actors (those other two properties are not)
  **/
  @:uproperty public var bStaticMeshReplicateMovement : Bool;
  @:uproperty public var StaticMeshComponent : unreal.UStaticMeshComponent;
  
}
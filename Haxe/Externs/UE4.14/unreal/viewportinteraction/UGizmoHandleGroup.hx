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
package unreal.viewportinteraction;


/**
  Base class for gizmo handles
**/
@:umodule("ViewportInteraction")
@:glueCppIncludes("VIGizmoHandle.h")
@:uextern @:uclass extern class UGizmoHandleGroup extends unreal.USceneComponent {
  
  /**
    All the StaticMeshes for this handle type
  **/
  @:uproperty private var Handles : unreal.TArray<unreal.viewportinteraction.FGizmoHandle>;
  
  /**
    Gizmo material (translucent)
  **/
  @:uproperty private var TranslucentGizmoMaterial : unreal.UMaterialInterface;
  
  /**
    Gizmo material (opaque)
  **/
  @:uproperty private var GizmoMaterial : unreal.UMaterialInterface;
  
}

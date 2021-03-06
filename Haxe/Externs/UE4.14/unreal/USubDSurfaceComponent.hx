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
  Subdivision Surface Component (Experimental, Early work in progress)
**/
@:glueCppIncludes("Components/SubDSurfaceComponent.h")
@:uextern @:uclass extern class USubDSurfaceComponent extends unreal.UPrimitiveComponent {
  @:uproperty public var DisplayMeshComponent : unreal.UStaticMeshComponent;
  
  /**
    Refinement Level of the SubD mesh
  **/
  @:uproperty public var DebugLevel : unreal.Int32;
  
  /**
    Change the SubDSurface used by this instance.
  **/
  @:ufunction public function SetMesh(NewMesh : unreal.USubDSurface) : Bool;
  
}

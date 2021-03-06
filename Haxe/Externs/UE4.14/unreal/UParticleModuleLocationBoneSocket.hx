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

@:glueCppIncludes("Particles/Location/ParticleModuleLocationBoneSocket.h")
@:uextern @:uclass extern class UParticleModuleLocationBoneSocket extends unreal.UParticleModuleLocationBase {
  #if WITH_EDITORONLY_DATA
  
  /**
    The name of the skeletal mesh to use in the editor
  **/
  @:uproperty public var EditorSkelMesh : unreal.USkeletalMesh;
  #end // WITH_EDITORONLY_DATA
  
  /**
    When we have no source locations and we need to track bone velocities due to bInheritBoneVelocity, we pre select a set of bones to use each frame. This property determines how big the list is.
    Too low and the randomness of selection may suffer, too high and memory will be wasted.
  **/
  @:uproperty public var NumPreSelectedIndices : unreal.Int32;
  
  /**
    The parameter name of the skeletal mesh actor that supplies the SkelMeshComponent for in-game.
  **/
  @:uproperty public var SkelMeshActorParamName : unreal.FName;
  
  /**
    A scale on how much of the bone's velocity a particle will inherit.
  **/
  @:uproperty public var InheritVelocityScale : unreal.Float32;
  
  /**
    If true, particles inherit the associated bone velocity when spawned
  **/
  @:uproperty public var bInheritBoneVelocity : Bool;
  
  /**
    If true, rotate mesh emitter meshes to orient w/ the socket
  **/
  @:uproperty public var bOrientMeshEmitters : Bool;
  
  /**
    If true, update the particle locations each frame with that of the bone/socket
  **/
  @:uproperty public var bUpdatePositionEachFrame : Bool;
  
  /**
    The method by which to select the bone/socket to spawn at.
    
    SEL_Sequential                  - loop through the bone/socket array in order
    SEL_Random                              - randomly select a bone/socket from the array
  **/
  @:uproperty public var SelectionMethod : unreal.ELocationBoneSocketSelectionMethod;
  
  /**
    The name(s) of the bone/socket(s) to position at. If this is empty, the module will attempt to spawn from all bones or sockets.
  **/
  @:uproperty public var SourceLocations : unreal.TArray<unreal.FLocationBoneSocketInfo>;
  
  /**
    An offset to apply to each bone/socket
  **/
  @:uproperty public var UniversalOffset : unreal.FVector;
  
  /**
    Whether the module uses Bones or Sockets for locations.
    
    BONESOCKETSOURCE_Bones          - Use Bones as the source locations.
    BONESOCKETSOURCE_Sockets        - Use Sockets as the source locations.
  **/
  @:uproperty public var SourceType : unreal.ELocationBoneSocketSource;
  
}

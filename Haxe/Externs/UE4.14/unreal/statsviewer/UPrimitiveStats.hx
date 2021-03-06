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
package unreal.statsviewer;


/**
  WARNING: This type was defined as MinimalAPI on its declaration. Because of that, its properties/methods are inaccessible
  
  Statistics page for primitives.
**/
@:umodule("StatsViewer")
@:glueCppIncludes("PrimitiveStats.h")
@:uextern @:uclass extern class UPrimitiveStats extends unreal.UObject {
  
  /**
    Average radius of bounding sphere of instance in map
  **/
  @:uproperty public var RadiusAvg : unreal.Float32;
  
  /**
    Maximum radius of bounding sphere of instance in map
  **/
  @:uproperty public var RadiusMax : unreal.Float32;
  
  /**
    Minimum radius of bounding sphere of instance in map
  **/
  @:uproperty public var RadiusMin : unreal.Float32;
  
  /**
    Light/shadow map resolution
  **/
  @:uproperty public var LMSMResolution : unreal.Float32;
  
  /**
    Light map data in KB
  **/
  @:uproperty public var LightMapData : unreal.Float32;
  
  /**
    Avg OL * Sections
  **/
  @:uproperty public var ObjLightCost : unreal.Float32;
  
  /**
    (Avg OL + Avg LM) / Count
  **/
  @:uproperty public var LightsTotal : unreal.Float32;
  
  /**
    Average number of other lights relevant to each instance
  **/
  @:uproperty public var LightsOther : unreal.Float32;
  
  /**
    Average number of lightmap lights relevant to each instance
  **/
  @:uproperty public var LightsLM : unreal.Int32;
  
  /**
    Per component vertex color stat for static meshes in KB
  **/
  @:uproperty public var InstVertexColorMem : unreal.Float32;
  
  /**
    Vertex color stat for static and skeletal meshes in KB
  **/
  @:uproperty public var VertexColorMem : unreal.Float32;
  
  /**
    Resource size in KB
  **/
  @:uproperty public var ResourceSize : unreal.Float32;
  
  /**
    Triangle count of all mesh occurances (Count * Tris)
  **/
  @:uproperty public var InstTriangles : unreal.Int32;
  
  /**
    Triangle count of mesh
  **/
  @:uproperty public var Triangles : unreal.Int32;
  
  /**
    Instanced section count of mesh
  **/
  @:uproperty public var InstSections : unreal.Int32;
  
  /**
    Section count of mesh
  **/
  @:uproperty public var Sections : unreal.Int32;
  
  /**
    Number of occurrences in map
  **/
  @:uproperty public var Count : unreal.Int32;
  
  /**
    Type name
  **/
  @:uproperty public var Type : unreal.FString;
  
  /**
    Actor(s) that use the resource - click to select & zoom Actor(s)
  **/
  @:uproperty public var Actors : unreal.TArray<unreal.TWeakObjectPtr<unreal.AActor>>;
  
  /**
    Resource (e.g. UStaticMesh, USkeletalMesh, UModelComponent, UTerrainComponent, etc
  **/
  @:uproperty public var Object : unreal.TWeakObjectPtr<unreal.UObject>;
  
}

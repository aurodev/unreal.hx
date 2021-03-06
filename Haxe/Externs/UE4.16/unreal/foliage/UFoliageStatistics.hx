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
package unreal.foliage;

@:umodule("Foliage")
@:glueCppIncludes("FoliageStatistics.h")
@:uextern @:uclass extern class UFoliageStatistics extends unreal.UBlueprintFunctionLibrary {
  
  /**
    Counts how many foliage instances overlap a given sphere
    
    @param        Mesh                    The static mesh we are interested in counting
    @param        CenterPosition  The center position of the sphere
    @param        Radius                  The radius of the sphere.
    
    return number of foliage instances with their mesh set to Mesh that overlap the sphere
  **/
  @:ufunction static public function FoliageOverlappingSphereCount(WorldContextObject : unreal.UObject, StaticMesh : unreal.Const<unreal.UStaticMesh>, CenterPosition : unreal.FVector, Radius : unreal.Float32) : unreal.Int32;
  
  /**
    Gets the number of instances overlapping a provided box
    @param StaticMesh Mesh to count
    @param Box Box to overlap
  **/
  @:ufunction static public function FoliageOverlappingBoxCount(WorldContextObject : unreal.UObject, StaticMesh : unreal.Const<unreal.UStaticMesh>, Box : unreal.FBox) : unreal.Int32;
  
}

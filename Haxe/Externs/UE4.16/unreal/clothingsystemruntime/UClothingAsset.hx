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
   * This file was autogenerated by UE4HaxeExternGenerator using UHT definitions. It only includes UPROPERTYs and UFUNCTIONs. Do not modify it!
   * In order to add more definitions, create or edit a type with the same name/package, but with an `_Extra` suffix
**/
package unreal.clothingsystemruntime;

@:umodule("ClothingSystemRuntime")
@:glueCppIncludes("Assets/ClothingAsset.h")
@:uextern @:uclass extern class UClothingAsset extends unreal.clothingsystemruntimeinterface.UClothingAssetBase {
  
  /**
    Custom data applied by the importer depending on where the asset was imported from
  **/
  @:uproperty public var CustomData : unreal.clothingsystemruntime.UClothingAssetCustomData;
  
  /**
    Bone to treat as the root of the simulation space
  **/
  @:uproperty public var ReferenceBoneIndex : unreal.Int32;
  
  /**
    List of the indices for the bones in UsedBoneNames, used for remapping
  **/
  @:uproperty public var UsedBoneIndices : unreal.TArray<unreal.Int32>;
  
  /**
    List of bones this asset uses inside its parent mesh
  **/
  @:uproperty public var UsedBoneNames : unreal.TArray<unreal.FName>;
  
  /**
    Tracks which clothing LOD each skel mesh LOD corresponds to (LodMap[SkelLod]=ClothingLod)
  **/
  @:uproperty public var LodMap : unreal.TArray<unreal.Int32>;
  
  /**
    The actual asset data, listed by LOD
  **/
  @:uproperty public var LodData : unreal.TArray<unreal.clothingsystemruntime.FClothLODData>;
  
  /**
    Configuration of the cloth, contains all the parameters for how the clothing behaves
  **/
  @:uproperty public var ClothConfig : unreal.clothingsystemruntime.FClothConfig;
  
}
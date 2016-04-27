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
package unreal.editor;


/**
  WARNING: This type was defined as MinimalAPI on its declaration. Because of that, its properties/methods are inaccessible
  
  Fbx_AddToBlueprint UMETA(DisplayName = "Add to an existing Blueprint asset"),
**/
@:umodule("UnrealEd")
@:glueCppIncludes("Factories/FbxSceneImportOptions.h")
@:uextern extern class UFbxSceneImportOptions extends unreal.UObject {
  
  /**
    If enabled, creates LOD models for Unreal skeletal meshes from LODs in the import file; If not enabled, only the base skeletal mesh from the LOD group is imported.
  **/
  public var bImportSkeletalMeshLODs : Bool;
  
  /**
    If enabled, creates LOD models for Unreal static meshes from LODs in the import file; If not enabled, only the base static mesh from the LOD group is imported.
  **/
  public var bImportStaticMeshLODs : Bool;
  public var ImportUniformScale : unreal.Float32;
  public var ImportRotation : unreal.FRotator;
  public var ImportTranslation : unreal.FVector;
  
  /**
    Choose if you want to generate the scene hierarchy with normal level actors or one actor with multiple components or one blueprint asset with multiple components.
  **/
  public var HierarchyType : unreal.editor.EFBXSceneOptionsCreateHierarchyType;
  
  /**
    If checked, the mobility of all actors or component will be dynamic. If not it will be static
  **/
  public var bImportAsDynamic : Bool;
  
  /**
    If check, a folders hierarchy will be create under the import asset path. All the create folders will match the actor hierarchy. In case there is more then one actor that link to an asset, the shared asset will be place at the first actor place.
  **/
  public var bCreateContentFolderHierarchy : Bool;
  
}
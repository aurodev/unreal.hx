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
  WARNING: This type was defined as MinimalAPI on its declaration. Because of that, its properties/methods are inaccessible
  
  Material Instances may be used to change the appearance of a material without incurring an expensive recompilation of the material.
  General modification of the material cannot be supported without recompilation, so the instances are limited to changing the values of
  predefined material parameters. The parameters are statically defined in the compiled material by a unique name, type and default value.
**/
@:glueCppIncludes("Materials/MaterialInstanceConstant.h")
@:uextern @:uclass extern class UMaterialInstanceConstant extends unreal.UMaterialInstance {
  #if WITH_EDITORONLY_DATA
  
  /**
    Unique ID for this material instance's parameter set
    Updated on changes in the editor to allow those changes to be detected
  **/
  @:uproperty public var ParameterStateId : unreal.FGuid;
  #end // WITH_EDITORONLY_DATA
  
}

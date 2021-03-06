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
  
  
**/
@:glueCppIncludes("Materials/MaterialExpressionVectorNoise.h")
@:uextern @:uclass extern class UMaterialExpressionVectorNoise extends unreal.UMaterialExpression {
  
  /**
    How many units in each tile (if Tiling is on)
    For Perlin noise functions, Tile Size must be a multiple of three
  **/
  @:uproperty public var TileSize : unreal.FakeUInt32;
  
  /**
    Whether tile the noise pattern, useful for baking to seam-free repeating textures
  **/
  @:uproperty public var bTiling : Bool;
  
  /**
    For noise functions where applicable, lower numbers are faster and lower quality, higher numbers are slower and higher quality
  **/
  @:uproperty public var Quality : unreal.Int32;
  
  /**
    Noise function, affects performance and look
  **/
  @:uproperty public var NoiseFunction : unreal.EVectorNoiseFunction;
  
  /**
    2 to 3 dimensional vector
  **/
  @:uproperty public var Position : unreal.FExpressionInput;
  
}

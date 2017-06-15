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
package unreal;


/**
  WARNING: This type was defined as MinimalAPI on its declaration. Because of that, its properties/methods are inaccessible
  
  
**/
@:glueCppIncludes("Particles/Collision/ParticleModuleCollisionGPU.h")
@:uextern @:uclass extern class UParticleModuleCollisionGPU extends unreal.UParticleModuleCollisionBase {
  @:uproperty public var CollisionMode : unreal.EParticleCollisionMode;
  
  /**
    How particles respond to a collision event.
  **/
  @:uproperty public var Response : unreal.EParticleCollisionResponse;
  
  /**
    Bias applied to the collision radius.
  **/
  @:uproperty public var RadiusBias : unreal.Float32;
  
  /**
    Scale applied to the size of the particle to obtain the collision radius.
  **/
  @:uproperty public var RadiusScale : unreal.Float32;
  
  /**
    Controls bouncing particles distribution (1 = uniform distribution; 2 = squared distribution).
  **/
  @:uproperty public var RandomDistribution : unreal.Float32;
  
  /**
    Controls how wide the bouncing particles are distributed (0 = disabled).
  **/
  @:uproperty public var RandomSpread : unreal.Float32;
  
  /**
    Friction applied to all particles during a collision or while moving
    along a surface.
  **/
  @:uproperty public var Friction : unreal.Float32;
  
  /**
    Scales the bounciness of the particle over its life.
  **/
  @:uproperty public var ResilienceScaleOverLife : unreal.FRawDistributionFloat;
  
  /**
    The bounciness of the particle.
  **/
  @:uproperty public var Resilience : unreal.FRawDistributionFloat;
  
}
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
  
  Used to create fogging effects such as clouds.
**/
@:glueCppIncludes("Atmosphere/AtmosphericFogComponent.h")
@:uextern @:uclass extern class UAtmosphericFogComponent extends unreal.USceneComponent {
  @:deprecated @:uproperty public var IrradianceTexture_DEPRECATED : unreal.UTexture2D;
  @:deprecated @:uproperty public var TransmittanceTexture_DEPRECATED : unreal.UTexture2D;
  @:uproperty private var PrecomputeParams : unreal.FAtmospherePrecomputeParameters;
  
  /**
    Disable Color scattering from ground.
  **/
  @:uproperty public var bDisableGroundScattering : Bool;
  
  /**
    Disable Sun Disk rendering.
  **/
  @:uproperty public var bDisableSunDisk : Bool;
  
  /**
    Default light color. Used when there is no sunlight placed in the level.
  **/
  @:uproperty public var DefaultLightColor : unreal.FColor;
  
  /**
    Default light brightness. Used when there is no sunlight placed in the level. Unit is lumens
  **/
  @:uproperty public var DefaultBrightness : unreal.Float32;
  
  /**
    Distance offset, in km (to handle large distance)
  **/
  @:uproperty public var SunDiscScale : unreal.Float32;
  
  /**
    Start Distance.
  **/
  @:uproperty public var StartDistance : unreal.Float32;
  
  /**
    Ground offset.
  **/
  @:uproperty public var GroundOffset : unreal.Float32;
  
  /**
    Distance offset, in km (to handle large distance)
  **/
  @:uproperty public var DistanceOffset : unreal.Float32;
  
  /**
    Altitude scale (only Z scale).
  **/
  @:uproperty public var AltitudeScale : unreal.Float32;
  
  /**
    Distance scale.
  **/
  @:uproperty public var DistanceScale : unreal.Float32;
  
  /**
    Fog density offset to control opacity [-1.f ~ 1.f].
  **/
  @:uproperty public var DensityOffset : unreal.Float32;
  
  /**
    Fog density control factor.
  **/
  @:uproperty public var DensityMultiplier : unreal.Float32;
  
  /**
    Scattering factor on object.
  **/
  @:uproperty public var FogMultiplier : unreal.Float32;
  
  /**
    Global scattering factor.
  **/
  @:uproperty public var SunMultiplier : unreal.Float32;
  
}

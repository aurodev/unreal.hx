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
  
  -> will be exported to EngineDecalClasses.h
**/
@:glueCppIncludes("Components/BoxReflectionCaptureComponent.h")
@:uextern @:uclass extern class UBoxReflectionCaptureComponent extends unreal.UReflectionCaptureComponent {
  @:uproperty public var PreviewCaptureBox : unreal.UBoxComponent;
  @:uproperty public var PreviewInfluenceBox : unreal.UBoxComponent;
  
  /**
    Adjust capture transition distance
  **/
  @:uproperty public var BoxTransitionDistance : unreal.Float32;
  
}

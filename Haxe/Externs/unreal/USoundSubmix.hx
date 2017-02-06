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

@:glueCppIncludes("Sound/SoundSubmix.h")
@:uextern extern class USoundSubmix extends unreal.UObject {
  
  /**
    The output wet level to use for the output of this submix in parent submixes
  **/
  public var OutputWetLevel : unreal.Float32;
  public var SubmixEffectChain : unreal.TArray<unreal.USoundEffectSubmixPreset>;
  public var ParentSubmix : unreal.USoundSubmix;
  
  /**
    Child submixes to this sound mix
  **/
  public var ChildSubmixes : unreal.TArray<unreal.USoundSubmix>;
  
}
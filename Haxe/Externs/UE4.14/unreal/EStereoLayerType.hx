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
  Used by IStereoLayer
**/
@:glueCppIncludes("Components/StereoLayerComponent.h")
@:uname("EStereoLayerType")
@:uextern @:uenum extern enum EStereoLayerType {
  
  /**
    Location within the world
    @DisplayName World Locked
  **/
  @DisplayName("World Locked")
  SLT_WorldLocked;
  
  /**
    Location within the HMD tracking space
    @DisplayName Tracker Locked
  **/
  @DisplayName("Tracker Locked")
  SLT_TrackerLocked;
  
  /**
    Location within the view space
    @DisplayName Face Locked
  **/
  @DisplayName("Face Locked")
  SLT_FaceLocked;
  
}

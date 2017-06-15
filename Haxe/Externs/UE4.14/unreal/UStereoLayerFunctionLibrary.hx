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
  StereoLayer Extensions Function Library
**/
@:glueCppIncludes("Kismet/StereoLayerFunctionLibrary.h")
@:uextern @:uclass extern class UStereoLayerFunctionLibrary extends unreal.UBlueprintFunctionLibrary {
  
  /**
    Set splash screen attributes
    
    @param Texture                        (in) A texture to be used for the splash. B8R8G8A8 format.
    @param Scale                          (in) Scale of the texture.
    @param Offset                         (in) Position from which to start rendering the texture.
    @param ShowLoadingMovie       (in) Whether the splash screen presents loading movies.
  **/
  @:ufunction static public function SetSplashScreen(Texture : unreal.UTexture, @:opt("(X=1.000,Y=1.000)") Scale : unreal.FVector2D, @:opt("(X=0.000,Y=0.000)") Offset : unreal.FVector2D, bShowLoadingMovie : Bool = false, bShowOnSet : Bool = false) : Void;
  
  /**
    Show the splash screen and override the VR display
  **/
  @:ufunction static public function ShowSplashScreen() : Void;
  
  /**
    Hide the splash screen and return to normal display.
  **/
  @:ufunction static public function HideSplashScreen() : Void;
  
  /**
    Enables/disables splash screen to be automatically shown when LoadMap is called.
    
    @param       bAutoShowEnabled        (in)    True, if automatic showing of splash screens is enabled when map is being loaded.
  **/
  @:ufunction static public function EnableAutoLoadingSplashScreen(InAutoShowEnabled : Bool) : Void;
  
}
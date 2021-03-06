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
package unreal.mididevice;

@:glueCppIncludes("MIDIDeviceController.h")
@:uextern extern class UMIDIDeviceController extends unreal.UObject {
  
  /**
    The name of this device.  This name comes from the MIDI hardware, any might not be unique
  **/
  private var DeviceName : unreal.FString;
  
  /**
    The unique ID of this device
  **/
  private var DeviceID : unreal.Int32;
  
}

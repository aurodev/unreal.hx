package unreal;

@:glueCppIncludes("GenericPlatform/GenericPlatformOutputDevices.h")
@:uextern extern class FGenericPlatformOutputDevices {
  static function GetAbsoluteLogFilename():FString;
}

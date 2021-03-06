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
  Delegate for notification when a sleep event is fired by physics
  @param SleepingComponent
  @param BoneName
  
**/
@:glueCppIncludes("Components/PrimitiveComponent.h")
@:uParamName("SleepingComponent")
@:uParamName("BoneName")
typedef FComponentSleepSignature = unreal.DynamicMulticastDelegate<FComponentSleepSignature, unreal.UPrimitiveComponent->unreal.FName->Void>;
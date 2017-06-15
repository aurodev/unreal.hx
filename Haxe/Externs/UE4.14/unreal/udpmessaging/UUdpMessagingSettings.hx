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
package unreal.udpmessaging;


/**
  WARNING: This type was not defined as DLL export on its declaration. Because of that, its properties/methods are inaccessible
  
  
**/
@:umodule("UdpMessaging")
@:glueCppIncludes("Private/Shared/UdpMessagingSettings.h")
@:noClass @:uextern @:uclass extern class UUdpMessagingSettings extends unreal.UObject {
  
  /**
    The IP endpoints of remote tunnel nodes.
    
    Use this setting to connect to remote tunnel services.
    The format is IP_ADDRESS:PORT_NUMBER.
  **/
  @:uproperty public var RemoteTunnelEndpoints : unreal.TArray<unreal.FString>;
  
  /**
    The IP endpoint to send multicast packets to.
    
    The format is IP_ADDRESS:PORT_NUMBER.
    The multicast IP address must be in the range 224.0.0.0 to 239.255.255.255.
  **/
  @:uproperty public var TunnelMulticastEndpoint : unreal.FString;
  
  /**
    The local IP endpoint to listen to and send packets from.
    
    The format is IP_ADDRESS:PORT_NUMBER.
  **/
  @:uproperty public var TunnelUnicastEndpoint : unreal.FString;
  
  /**
    Whether the UDP tunnel is enabled.
  **/
  @:uproperty public var EnableTunnel : Bool;
  
  /**
    The IP endpoints of static devices.
    
    Use this setting to list devices on other subnets, such as mobile phones on a WiFi network.
    The format is IP_ADDRESS:PORT_NUMBER.
  **/
  @:uproperty public var StaticEndpoints : unreal.TArray<unreal.FString>;
  
  /**
    The time-to-live (TTL) for sent multicast packets.
  **/
  @:uproperty public var MulticastTimeToLive : unreal.UInt8;
  
  /**
    The IP endpoint to send multicast packets to.
    
    The format is IP_ADDRESS:PORT_NUMBER.
    The multicast IP address must be in the range 224.0.0.0 to 239.255.255.255.
  **/
  @:uproperty public var MulticastEndpoint : unreal.FString;
  
  /**
    The IP endpoint to listen to and send packets from.
    
    The format is IP_ADDRESS:PORT_NUMBER.
    0.0.0.0:0 will bind to the default network adapter on Windows,
    and all available network adapters on other operating systems.
  **/
  @:uproperty public var UnicastEndpoint : unreal.FString;
  
  /**
    Whether the UDP transport channel is enabled.
  **/
  @:uproperty public var EnableTransport : Bool;
  
}
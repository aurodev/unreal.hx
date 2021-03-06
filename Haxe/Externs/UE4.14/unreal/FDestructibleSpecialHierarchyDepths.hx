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
  WARNING: This type is defined as NoExport by UHT. It will be empty because of it
  
  Special hierarchy depths for various behaviors.
**/
@:glueCppIncludes("Engine/DestructibleMesh.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FDestructibleSpecialHierarchyDepths {
  
  /**
    The chunk hierarchy depth up to which chunks will always be processed.  These chunks are considered
    to be essential either for gameplay or visually.
    The minimum value is 0, meaning the level 0 chunk is always considered essential.
    Default value is 0.
  **/
  @:uproperty public var EssentialDepth : unreal.Int32;
  
  /**
    The hierarchy depth at which chunks are considered to be "debris."
  **/
  @:uproperty public var DebrisDepth : unreal.Int32;
  
  /**
    Enables debris at a specific depth level.
    @see DebrisDepth
  **/
  @:uproperty public var bEnableDebris : Bool;
  
  /**
    The chunks will not be broken free below this depth.
  **/
  @:uproperty public var MinimumFractureDepth : unreal.Int32;
  
  /**
    The chunk hierarchy depth at which to create a support graph.  Higher depth levels give more detailed support,
    but will give a higher computational load.  Chunks below the support depth will never be supported.
  **/
  @:uproperty public var SupportDepth : unreal.Int32;
  
}

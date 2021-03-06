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
package unreal.leapmotion;


/**
  The HandList class represents a list of Hand objects.
  
  Leap API reference: https://developer.leapmotion.com/documentation/cpp/api/Leap.HandList.html
**/
@:glueCppIncludes("LeapHandList.h")
@:uextern extern class ULeapHandList extends unreal.UObject {
  
  /**
    The number of hands in this list.
  **/
  public var Count : unreal.Int32;
  
  /**
    Whether the list is empty.
  **/
  public var IsEmpty : Bool;
  
  /**
    The member of the list that is farthest to the front within the standard Leap Motion frame of reference (i.e has the largest X coordinate).
    
    @return       The frontmost hand, or invalid if list is empty.
  **/
  @:final public function Frontmost() : unreal.leapmotion.ULeapHand;
  
  /**
    The member of the list that is farthest to the left within the standard Leap Motion frame of reference (i.e has the smallest Y coordinate).
    
    @return       The leftmost hand, or invalid if list is empty.
  **/
  @:final public function Leftmost() : unreal.leapmotion.ULeapHand;
  
  /**
    The member of the list that is farthest to the right within the standard Leap Motion frame of reference (i.e has the largest Y coordinate).
    
    @return       The rightmost hand, or invalid if list is empty.
  **/
  @:final public function Rightmost() : unreal.leapmotion.ULeapHand;
  
  /**
    Access a list member by its position in the list.
    
    @param        Index   The zero-based list position index.
    @return       The Hand object at the specified index.
  **/
  @:final public function GetIndex(Index : unreal.Int32) : unreal.leapmotion.ULeapHand;
  
}

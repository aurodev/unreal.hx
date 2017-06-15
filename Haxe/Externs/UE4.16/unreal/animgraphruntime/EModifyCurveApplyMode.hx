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
   * This file was autogenerated by UE4HaxeExternGenerator using UHT definitions. It only includes UPROPERTYs and UFUNCTIONs. Do not modify it!
   * In order to add more definitions, create or edit a type with the same name/package, but with an `_Extra` suffix
**/
package unreal.animgraphruntime;

@:umodule("AnimGraphRuntime")
@:glueCppIncludes("AnimNodes/AnimNode_ModifyCurve.h")
@:uname("EModifyCurveApplyMode")
@:class @:uextern @:uenum extern enum EModifyCurveApplyMode {
  
  /**
    Add new value to input curve value
  **/
  Add;
  
  /**
    Scale input value by new value
  **/
  Scale;
  
  /**
    Blend input with new curve value, using Alpha setting on the node
  **/
  Blend;
  
}
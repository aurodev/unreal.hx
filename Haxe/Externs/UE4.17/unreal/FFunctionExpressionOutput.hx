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
  Struct that stores information about a function output which is needed to maintain connections and implement the function call.
**/
@:glueCppIncludes("Materials/MaterialExpressionMaterialFunctionCall.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FFunctionExpressionOutput {
  
  /**
    Actual output struct which stores information about how this output is connected in the material.
  **/
  @:uproperty public var Output : unreal.FExpressionOutput;
  
  /**
    Id of the FunctionOutput, used to link ExpressionOutput.
  **/
  @:uproperty public var ExpressionOutputId : unreal.FGuid;
  
  /**
    Reference to the FunctionOutput in the material function.
    This is a reference to a private object so it can't be saved, and must be generated by UpdateFromFunctionResource or SetMaterialFunction.
  **/
  @:uproperty public var ExpressionOutput : unreal.UMaterialExpressionFunctionOutput;
  
}

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
package unreal.aimodule;

@:umodule("AIModule")
@:glueCppIncludes("BehaviorTree/BTCompositeNode.h")
@:noCopy @:noEquals @:uextern @:ustruct extern class FBTCompositeChild {
  
  /**
    logic operations for decorators
  **/
  @:uproperty public var DecoratorOps : unreal.TArray<unreal.aimodule.FBTDecoratorLogic>;
  
  /**
    execution decorators
  **/
  @:uproperty public var Decorators : unreal.TArray<unreal.aimodule.UBTDecorator>;
  @:uproperty public var ChildTask : unreal.aimodule.UBTTaskNode;
  
  /**
    child node
  **/
  @:uproperty public var ChildComposite : unreal.aimodule.UBTCompositeNode;
  
}

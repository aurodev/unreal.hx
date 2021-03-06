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

@:glueCppIncludes("Kismet/DataTableFunctionLibrary.h")
@:uextern @:uclass extern class UDataTableFunctionLibrary extends unreal.UBlueprintFunctionLibrary {
  @:ufunction static public function EvaluateCurveTableRow(CurveTable : unreal.UCurveTable, RowName : unreal.FName, InXY : unreal.Float32, OutResult : unreal.PRef<unreal.EEvaluateCurveTableResult>, OutXY : unreal.Float32, ContextString : unreal.FString) : Void;
  @:ufunction static public function GetDataTableRowNames(Table : unreal.UDataTable, OutRowNames : unreal.PRef<unreal.TArray<unreal.FName>>) : Void;
  
  /**
    Get a Row from a DataTable given a RowName
  **/
  @:ufunction static public function GetDataTableRowFromName(Table : unreal.UDataTable, RowName : unreal.FName, OutRow : unreal.PRef<unreal.FTableRowBase>) : Bool;
  
}

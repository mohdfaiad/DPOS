unit GFunctions;

interface

Function RepeatedKey(TableName, WhereCond : String): Boolean;
function GetDBValue(ReqField, TableName, Criteria : String):String ;

implementation

uses Main , SimpleDS;

Function RepeatedKey(TableName, WhereCond : String): Boolean;
Begin
   fmMainForm.qry_Main.Close;
   fmMainForm.qry_Main.DataSet.Close;
   fmMainForm.qry_Main.DataSet.CommandText := 'Select * From ' + TableName + ' Where ' + WhereCond;
   fmMainForm.qry_Main.Open;
   Result := fmMainForm.qry_Main.RecordCount >= 1;
end;

function GetDBValue(ReqField, TableName, Criteria : String):String ;
Var
  TempQry : TSimpleDataSet;
  SQLText : String;
begin
     TempQry := TSimpleDataSet.Create(nil);
     TempQry.Connection := fmMainForm.MainConnection;
     TempQry.Close;
     TempQry.DataSet.Close;
     TempQry.DataSet.CommandText := ''
        + ' Select ' + ReqField
        + ' FROM ' + TableName
        + ' Where 1=1' + Criteria ;
     TempQry.Open;
     SQLText := TempQry.Fields[0].AsString;
     TempQry.Free ;
     Result := SQLText ;
end ;


end.

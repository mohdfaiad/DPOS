{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit ppParameter;

interface

{$I ppIfDef.pas}

uses
  {$IFDEF Delphi6} Variants, {$ENDIF}
  Windows,
  Classes, SysUtils, Typinfo,
  ppRTTI, ppRelatv, ppTypes, ppUtils;

const
  {note: only these datatypes are supported by TppParameter}
  cValidParameterDataTypes: TppDataTypeSet = [dtString,
                                              dtInteger, dtLargeInt,
                                              dtCurrency, dtSingle, dtDouble,
                                              dtBoolean,
                                              dtDateTime];

type

{$IFNDEF Delphi6}
  {D5 does not have a TVarType}
  TVarType = Integer;
{$ENDIF}

  {@TppParameter

    TppParameter represents a named parameter in a TppParameterList.

    The Name, DataType, and Value properties describe the parameter. Use the
    EqualTo method to compare one parameter value to another. The AsBoolean,
    AsInteger, and AsString properties return the parameter value as a
    specific data type. The PickList property can be used to define a list
    of valid parameter values.}


  {@TppParameter.AsBoolean

    Returns the parameter's value as a boolean data type.}

  {@TppParameter.AsInteger

    Returns the parameter's value as an integer data type.}

  {@TppParameter.AsString

    Returns the parameter's value as a string data type.}


  {@TppParameter.DataType

    Specifies the native data type of the parameter value. Defaults to dtString.

    <Table>
    Value	        Meaning
    ----------    --------
    dtBoolean     Data is a boolean value
    dtCurrency    Data is a currency value
    dtDateTime    Data is a datetime value
    dtDouble      Data is a double value
    dtLargeInt    Data is a large integer (Int64)
    dtInteger	    Data is an integer value
    dtSingle	    Data is a single value
    dtString      Data is a string value
    </Table>}

  {@TppParameter.OnValueChange

    Occurs whenver the parameter value is modified.

    The OnValueChange event is used internally by the TppParameterList object.}

  {@TppParameter.Name

    Specifies the parameter name.}

  {@TppParameter.PickList

    Use the PickList property to define a list of valid parameter values.

    This is especially useful for a report server application in which the client
    retrieves the parameters from the server. The PickList can be populated
    on the server side, perhaps from a database, and then sent to the client.}

  {@TppParameter.Value

    Specifies the parameter value. Defaults to Unassigned.}

  TppParameter = class(TppRelative)
    private
      FDataType: TppDataType;
      FValue: Variant;
      FNull: Boolean;
      FPickList: TStrings;
      FOnValueChange: TNotifyEvent;

      function GetAsBoolean: Boolean;
      function GetAsInteger: Integer;
      function GetAsString: String;
      function GetPickList: TStrings;

      procedure SetAsBoolean(aValue: Boolean);
      procedure SetAsString(aValue: String);
      procedure SetAsInteger(aValue: Integer);
      procedure SetDataType(aDataType: TppDataType);
      procedure SetPickList(aPickList: TStrings);

    protected
      procedure DoOnValueChange; virtual;
      function MapVarTypeToDataType(aVarType: TVarType): TppDataType; virtual;
      function MapDataTypeToVarType(aDataType: TppDataType): TVarType; virtual;

      procedure SetValue(aValue: Variant); virtual;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      function IsNull: Boolean;
      procedure Assign(Source: TPersistent); override;
      function EqualTo(aParameter: TppParameter): Boolean;

      property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
      property AsInteger: Integer read GetAsInteger write SetAsInteger;
      property AsString: String read GetAsString write SetAsString;

      property OnValueChange: TNotifyEvent read FOnValueChange write FOnValueChange;

    published
      property DataType: TppDataType read FDataType write SetDataType;
      property Name;
      property Value: Variant read FValue write SetValue;
      property PickList: TStrings read GetPickList write SetPickList;
      
  end;

  {@TppParameterList

    TppParameterList is used to manage a collection of TppParameter items.

    Use the Add, Remove, and Clear methods to maintain the list of TppParameter
    items.

    The Values array property provides access to the parameter values. The
    Items and ItemsByIndex array properties provide access to the TppParameter
    items in the list.

    TppParameterList can be used to define custom parameters that are sent
    between a client and a report server.}

  {@TppParameterList.Count

   Read-only. Returns the number of parameters in the list.}

  {@TppParameterList.Items

   Default property. Provides parameter name access to the TppParameter objects
   in the list.

   Use InsertMode to control whether this property automatically adds new
   item to the list.}

  {@TppParameterList.ItemsByIndex

    Provides index access to the TppParameter objects in the list.

    Use the Items and Count properties to iterate through the parameter list.}

  {@TppParameterList.InsertMode

   Defaults to True. Determines whether the array automatically adds new
   items to the list.
   
   If InsertMode is set to True, the Items array can automatically add
   new items to the list. When setting a parameter value for a named item
   that does not appear in the list, a new parameter is implicitly added.
   When accessing a parameter value that does not appear in the list, a
   temporary parameter is returned that contains an empty value.

   If InsertMode is set to False, specifying a parameter name that does not
   exist in the list, results in an EParameterError exception being raised.}


  TppParameterList = class(TppRelative)
    private
      FNullParameter: TppParameter;
      FInsertMode: Boolean;

      procedure AssignParameterList(aSource: TppParameterList);
      function GetParameterForIndex(aIndex: Integer): TppParameter;

    protected
      procedure NullParameterValueChangeEvent(Sender: TObject);
      function GetParameterForName(aName: String): TppParameter; 
      function GetItemForName(aName: String): TppParameter; virtual;
      function GetValueForName(aName: String): Variant; virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;
      procedure AssignValues(aSource: TppParameterList);
      function EqualTo(aSource: TppParameterList): Boolean;
      function InList(aName: String): Boolean;

      function Add(aName: String): TppParameter; overload;
      function Add(aName: String; aValue: String): TppParameter; overload;
      function Add(aName: String; aDataType: TppDataType; aValue: Variant): TppParameter; overload;
      function Add(aParameters: TppParameterList): TppParameter; overload;
      procedure Clear;
      procedure Remove(aName: String); overload;
      procedure Remove(aNames: array of String); overload;

      property InsertMode: Boolean read FInsertMode write FInsertMode;
      property Count: Integer read GetChildCount;
      property Values[Name: String]: Variant read GetValueForName;
      property Items[Name: String]: TppParameter read GetItemForName; default;
      property ItemsByIndex[Index: Integer]: TppParameter read GetParameterForIndex;

  end;

  {TppParameterDataTypeInfo
    - used by the property editor}
  TppParameterDataTypeInfo = class
    public
      class procedure GetEnumNames(aList: TStrings);
      class function IsValidType(aDataType: TppDataType): Boolean;
      class function GetEnumName(aDataType: TppDataType): String;
    end;

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  {@TraTppParameterListRTTI }
  TraTppParameterListRTTI = class(TraTppRelativeRTTI)
  private
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppParameterListRTTI}




implementation

{$IFNDEF Delphi6}

{Delphi5 does not have support for VarIsClear}
function VarIsClear(const V: Variant): Boolean;
begin
  Result := VarIsEmpty(V);
end;
{$ENDIF}



{******************************************************************************
 *
 ** P A R A M E T E R
 *
{******************************************************************************}

{@TppParameter.Create}

constructor TppParameter.Create(AOwner: TComponent);
begin
  inherited;

  FDataType := dtString;
  FValue := '';
  FNull := False;
  FPickList := nil;

end;

destructor TppParameter.Destroy;
begin

  FPickList.Free;

  inherited;

end;


{@TppParameter.Assign

  Assigns the Name, DataType and Value of one parameter to another.}

procedure TppParameter.Assign(Source: TPersistent);
var
  lSource: TppParameter;
begin

  if (Source is TppParameter) then
    begin
      lSource := TppParameter(Source);

      Name := lSource.Name;
      FDataType := lSource.DataType;
      FNull := lSource.FNull;
      SetValue(lSource.Value);

      if (lSource.FPickList <> nil) then
        SetPickList(lSource.FPickList)
      else if (FPickList <> nil) then
        FPickList.Clear;
    end
  else
    inherited Assign(Source);

end;


{@TppParameter.EqualTo

  Compares two parameters for equality. Two parameters are equal if they
  have the same Name, DataType, and Value.}

function TppParameter.EqualTo(aParameter: TppParameter): Boolean;
begin

  if IsNull then
    Result := (Name = aParameter.Name) and
              (FDataType = aParameter.DataType) and
              (aParameter.IsNull)
  else
    Result := (Name = aParameter.Name) and
              (FDataType = aParameter.DataType) and
              (FValue = aParameter.Value);
end;

{@TppParameter.GetAsString}

function TppParameter.GetAsString: String;
{$IFDEF Delphi6}
var
  lLargeInt: Int64;
{$ENDIF}
begin

  if IsNull then
    Result := ''

  else case FDataType of

    dtString: Result := FValue;
    dtInteger: Result := IntToStr(FValue);
{$IFDEF Delphi6}
    dtLargeInt:
      begin
        lLargeInt := FValue;
        Result := IntToStr(lLargeInt);
      end;
{$ENDIF}
    dtBoolean: if FValue then
                 Result := 'True'
               else
                 Result := 'False';
    dtSingle: Result := FloatToStrF(FValue, ffGeneral, 7, 0);
    dtDouble: Result := FloatToStrF(FValue, ffGeneral, 15, 0);
    dtCurrency: Result := CurrToStr(FValue);
    dtDateTime: Result := DateTimeToStr(FValue);

  end; {case }

end;

{@TppParameter.GetAsBoolean}

function TppParameter.GetAsBoolean: Boolean;
begin

  if IsNull then
    Result := False

  else case FDataType of
    dtString:  if (FValue = '1') or SameText(FValue, 'T') or SameText(FValue, 'True') then
                 Result := True
               else
                 Result := False;
    dtInteger,
    dtLargeInt: Result := (FValue > 0);
    dtBoolean: Result := FValue;

  else
    Result := False;

  end;    {case }

end;

{@TppParameter.GetAsInteger}

function TppParameter.GetAsInteger: Integer;
begin

  if IsNull then
    Result := 0

  else case FDataType of
    dtString:  Result := StrToIntDef(FValue, 0);
    dtInteger,
    dtLargeInt: Result := FValue;
    dtBoolean: if FValue then
                 Result := 1
               else
                 Result := 0;

    dtSingle, dtDouble: Result := Integer(FValue);
    dtCurrency: Result := Integer(FValue);
    dtDateTime: Result := Integer(FValue);

  else
    Result := 0;
    
  end { case }


end;

{@TppParameter.SetAsString}

procedure TppParameter.SetAsString(aValue: String);
var
  lSingleValue: Single;
  lDoubleValue: Double;
  lValue: Variant;
begin

  case FDataType of
    dtString: lValue := aValue;
    dtInteger: lValue := StrToIntDef(aValue, 0);
{$IFDEF Delphi6}
    dtLargeInt: lValue := StrToInt64(aValue);
{$ENDIF}
    dtBoolean: if (aValue = '1') or SameText(aValue, 'T') or SameText(aValue, 'True') then
                 lValue := True
               else
                 lValue := False;
    dtSingle:
      begin
        lSingleValue := StrToFloat(aValue);
        lValue := lSingleValue;
      end;
   dtDouble:
      begin
        lDoubleValue := StrToFloat(aValue);
        lValue := lDoubleValue;
      end;
    dtCurrency: lValue := StrToCurr(aValue);
    dtDateTime: lValue := StrToDateTime(aValue);

  end;    { case }

  SetValue(lValue);

end;

{@TppParameter.SetAsBoolean}

procedure TppParameter.SetAsBoolean(aValue: Boolean);
var
  lValue: Variant;
begin

  case FDataType of
    dtString: if aValue then
                lValue := 'T'
              else
                lValue := 'F';

    dtInteger,
    dtLargeInt: if aValue then
                lValue := 1
              else
                lValue := 0;

    dtBoolean: lValue := aValue;

  end;    { case }

  SetValue(lValue);

    
end;

{@TppParameter.SetAsInteger}

procedure TppParameter.SetAsInteger(aValue: Integer);
var
  lValue: Variant;
begin

  case FDataType of
    dtString: lValue := IntToStr(aValue);

    dtInteger,
    dtLargeInt: lValue := aValue;

    dtBoolean: if (aValue > 0) then
                 lValue := True
               else
                 lValue := False;
    dtSingle, dtDouble: lValue := aValue;
    dtCurrency: lValue := aValue;
    dtDateTime: lValue := aValue;

  end;    { case }

  SetValue(lValue);

    
end;


{@TppParameter.IsNull

  Indicates whether the value assigned to the parameter is NULL.}

function TppParameter.IsNull: Boolean;
begin
  Result := FNull or VarIsNull(FValue) or VarIsClear(FValue);

end;

{$IFDEF Delphi6}

{@TppParameter.MapVarTypeToDataType}

function TppParameter.MapVarTypeToDataType(aVarType: TVarType): TppDataType;
begin

  case aVarType of
    varByte,
    varWord,
    varLongWord,
    varSmallint,
    varShortInt,
    varInteger: Result := dtInteger;
    varInt64: Result := dtLargeInt;
    varSingle: Result := dtSingle;
    varDouble: Result := dtDouble;
    varCurrency: Result := dtCurrency;
    varDate: Result := dtDateTime;
    varBoolean: Result := dtBoolean;
    varString, varOleStr, varStrArg: Result := dtString;

  else
    Result := dtNotKnown;

  end;


end;

{@TppParameter.MapDataTypeToVarType}

function TppParameter.MapDataTypeToVarType(aDataType: TppDataType): TVarType;
begin

  case aDataType of
    dtInteger: Result := varInteger;
    dtLargeInt: Result := varInt64;
    dtSingle: Result := varSingle;
    dtDouble: Result := varDouble;
    dtCurrency: Result := varCurrency;
    dtDateTime: Result := varDate;
    dtBoolean: Result := varBoolean;
    dtString: Result := varString;
  else
    Result := varUnknown;

  end;

end;

{$ELSE}

{Delphi5 has a smaller set of var types}

{@TppParameter.MapVarTypeToDataType}

function TppParameter.MapVarTypeToDataType(aVarType: TVarType): TppDataType;
begin

  case aVarType of
    varByte,
    varSmallint,
    varInteger: Result := dtInteger;
    varSingle: Result := dtSingle;
    varDouble: Result := dtDouble;
    varCurrency: Result := dtCurrency;
    varDate: Result := dtDateTime;
    varBoolean: Result := dtBoolean;
    varString, varOleStr, varStrArg: Result := dtString;

  else
    Result := dtNotKnown;

  end;


end;

{@TppParameter.MapDataTypeToVarType}

function TppParameter.MapDataTypeToVarType(aDataType: TppDataType): TVarType;
begin

 case aDataType of
   dtInteger: Result := varInteger;
   dtSingle: Result := varSingle;
   dtDouble: Result := varDouble;
   dtCurrency: Result := varCurrency;
   dtDateTime: Result := varDate;
   dtBoolean: Result := varBoolean;
   dtString: Result := varString;
 else
   Result := varUnknown;

 end;


end;

{$ENDIF}

{@TppParameter.SetValue}

procedure TppParameter.SetValue(aValue: Variant);
begin

  FNull := VarIsClear(aValue) or VarIsNull(aValue);

  if not(FNull) then
   begin
     FValue := VarAsType(aValue, MapDataTypeToVarType(FDataType));
     DoOnValueChange;
   end;

end;

{@TppParameter.DoOnValueChange}

procedure TppParameter.DoOnValueChange;
begin
  if Assigned(FOnValueChange) then FOnValueChange(Self);

end;

{@TppParameter.SetDataType}

procedure TppParameter.SetDataType(aDataType: TppDataType);
var
  lsEnumName: String;
begin

  if not TppParameterDataTypeInfo.IsValidType(aDataType) then
    begin
      lsEnumName := GetEnumName(TypeInfo(TppDataType), Ord(aDataType));
      raise EParameterError.CreateFmt('TppParameter.SetDataType: %s data type is not supported', [lsEnumName]);
    end;

  if (FDataType <> aDataType) and not(csReading in ComponentState) and not(csLoading in ComponentState) then
    begin

      {toggle default numeric, value as needed}
      if (FDataType = dtString) and (FValue = '') then
        FValue := VarAsType(0, MapDataTypeToVarType(aDataType))

      else if (aDataType = dtString) and (FValue = 0) then
        FValue := VarAsType('', MapDataTypeToVarType(aDataType))

      else
        FValue := VarAsType(FValue, MapDataTypeToVarType(aDataType));

    end;

  FDataType := aDataType;

end;

{******************************************************************************
 *
 ** P A R A M E T E R   L I S T
 *
{******************************************************************************}

{@TppParameterList.Create}

constructor TppParameterList.Create(aOwner: TComponent);
begin

  inherited;

  FInsertMode := True;
  
  FNullParameter := TppParameter.Create(nil);
  FNullParameter.OnValueChange := NullParameterValueChangeEvent;

end;

{@TppParameterList.Destroy}

destructor TppParameterList.Destroy;
begin

  FNullParameter.Free;
  
  inherited;
  
end;

{ TppParameterList.Assign }

procedure TppParameterList.Assign(Source: TPersistent);
begin

  if (Source is TppParameterList) then
    AssignParameterList(TppParameterList(Source))
  else if (Source = nil) then
    Clear
  else    
    inherited Assign(Source);

end;

{ TppParameterList.AssignParameterList }

procedure TppParameterList.AssignParameterList(aSource: TppParameterList);
var
  liIndex: Integer;
  lParameter: TppParameter;
  lSourceParameter: TppParameter;
begin

  FreeChildren;

  for liIndex := 0 to aSource.Count-1 do
    begin
      lSourceParameter := aSource.GetParameterForIndex(liIndex);

      lParameter := TppParameter.Create(Owner);

      lParameter.Assign(lSourceParameter);

      lParameter.Parent := Self;

    end;

end;

{@TppParameterList.AssignValues}

procedure TppParameterList.AssignValues(aSource: TppParameterList);
var
  liIndex: Integer;
  lParameter: TppParameter;
  lSourceParameter: TppParameter;
begin

  for liIndex := 0 to aSource.Count-1 do
    begin
      lSourceParameter := aSource.GetParameterForIndex(liIndex);

      lParameter := GetParameterForName(lSourceParameter.Name);

      if (lParameter <> nil) and (lParameter.DataType = lSourceParameter.DataType) then
        lParameter.Value := lSourceParameter.Value;

    end;

end;

{------------------------------------------------------------------------------}
{@TppParameterList.EqualTo

  Compares one parameter lists to another and returns true if the lists contain
  the same parameter names and values.}

function TppParameterList.EqualTo(aSource: TppParameterList): Boolean;
var
  liIndex: Integer;
  lParameter: TppParameter;
  lSourceParameter: TppParameter;
begin

  Result := (aSource <> nil) and (aSource.Count = Count);

  liIndex := 0;

  while Result and (liIndex < Count) do
    begin
      lParameter := GetParameterForIndex(liIndex);

      lSourceParameter := aSource.GetParameterForName(lParameter.Name);

      if (lSourceParameter = nil) then
        Result := False
      else
        Result :=  lParameter.EqualTo(lSourceParameter);

      Inc(liIndex);

    end;

end; {function, EqualTo}


{@TppParameterList.Add

  Adds a new parameter to the list and returns the new TppParameter object as
  the result.}

function TppParameterList.Add(aName: String): TppParameter;
begin

  if (GetParameterForName(aName) <> nil) then
    raise EParameterError.CreateFmt('TppParameterList.Add: a Parameter named, %s, already exists.', [aName]);

  Result := TppParameter.Create(nil);
  Result.Parent := Self;

  Result.Name := aName;

end;

function TppParameterList.Add(aName, aValue: String): TppParameter;
begin
  Result := Add(aName, dtString, aValue);

end;


function TppParameterList.Add(aName: String; aDataType: TppDataType; aValue: Variant): TppParameter;
begin

  Result := Add(aName);
  Result.DataType := aDataType;
  Result.Value := aValue;

end;


function TppParameterList.Add(aParameters: TppParameterList): TppParameter;
var
  liIndex: Integer;
  lParam: TppParameter;
begin

  Result := nil;
  
  for liIndex := 0 to aParameters.Count-1 do
    begin
      lParam := aParameters.ItemsByIndex[liIndex];

      Add(lParam.Name, lParam.DataType, lParam.Value);

      Result := lParam;

    end;

end;

{@TppParameterList.Clear

  Removes and destroys all parameter objects in the list.}

procedure TppParameterList.Clear;
begin
  FreeChildren;

end;

{@TppParameterList.GetValueForName}

function TppParameterList.GetValueForName(aName: String): Variant;
var
  lParameter: TppParameter;
begin

  lParameter := GetItemForName(aName);

  if (lParameter <> nil) then
    Result := lParameter.Value
  else
    Result := '';

end;

{@TppParameterList.GetItemForName}

function TppParameterList.GetItemForName(aName: String): TppParameter;
begin

  Result := GetParameterForName(aName);

  {return a dummy null parameter, if no param exist for aName}
  if (Result = nil) and (FInsertMode) then
    begin
      Result := FNullParameter;
      Result.Name := aName;
    end;

  if (Result = nil) then
    raise EParameterError.CreateFmt('TppParameterList.GetItemForName: No parameter named, %s, exists', [aName]);

end;


{@TppParameterList.GetParameterForIndex}

function TppParameterList.GetParameterForIndex(aIndex: Integer): TppParameter;
begin
  Result := TppParameter(Children[aIndex]);

end;


{@TppParameterList.GetParameterForName}

function TppParameterList.GetParameterForName(aName: String): TppParameter;
var
  liIndex: Integer;
  lParameter: TppParameter;
begin

  Result := nil;
  liIndex := 0;

  while (Result = nil) and (liIndex < ChildCount) do
    begin
      lParameter := TppParameter(Children[liIndex]);

      if AnsiSameText(lParameter.Name, aName) then
        Result := lParameter
      else
        Inc(liIndex);

    end; {while}


end;

{@TppParameterList.InList

  Indicates whether a parameter with a specified name appears in the list.}

function TppParameterList.InList(aName: String): Boolean;
begin
  Result := GetParameterForName(aName) <> nil;
end;

{@TppParameterList.Remove

 Removes a named parameter object from the list and destroys it.}

procedure TppParameterList.Remove(aName: String);
var
  lParameter: TppParameter;
begin

  lParameter := GetParameterForName(aName);

  if (lParameter <> nil) then
    lParameter.Free;

end;

{@TppParameterList.Remove

  Removes parameters corresponding to a array of names.}

procedure TppParameterList.Remove(aNames: array of String);
var
  liIndex: Integer;
  lsParameterName: String;
begin

  for liIndex := Low(aNames) to High(aNames) do
    begin

      lsParameterName := aNames[liIndex];

      if InList(lsParameterName) then
        Items[lsParameterName].Free;

    end;

end;

{@TppParameterList.NullParameterValueChangeEvent}

procedure TppParameterList.NullParameterValueChangeEvent(Sender: TObject);
begin

  {add Null parameter to the list}
  FNullParameter.Parent := Self;
  FNullParameter.OnValueChange := nil;

  {create a new null parameter}
  FNullParameter := TppParameter.Create(nil);
  FNullParameter.OnValueChange := NullParameterValueChangeEvent;

end;


{******************************************************************************
 *
 ** P A R A M E T E R  D A T A T Y P E   I N F O
 *
{******************************************************************************}


{@TppParameterDataTypeInfo.IsValidType}

class function TppParameterDataTypeInfo.IsValidType(aDataType: TppDataType): Boolean;
begin
  Result := (aDataType in cValidParameterDataTypes);

end;

{@TppParameterDataTypeInfo.GetEnumName}

class function TppParameterDataTypeInfo.GetEnumName(aDataType: TppDataType): String;
begin
  Result := TypInfo.GetEnumName(TypeInfo(TppDataType), Ord(aDataType));
end;

{@TppParameterDataTypeInfo.GetEnumNames}

class procedure TppParameterDataTypeInfo.GetEnumNames(aList: TStrings);
var
  lDataType: TppDataType;
  lsEnumName: String;
begin

  for lDataType := Low(TppDataType) to High(TppDataType) do

    if IsValidType(lDataType) then
      begin
        lsEnumName := GetEnumName(lDataType);
        aList.Add(lsEnumName)

      end;

end;



{******************************************************************************
 *
 ** P A R A M E T E R  L I S T  R T T I
 *
{******************************************************************************}

{@TraTppParameterListRTTI.RefClass}

class function TraTppParameterListRTTI.RefClass: TClass;
begin
  Result := TppParameterList;
end;

{@TraTppParameterListRTTI.GetPropList}

class procedure TraTppParameterListRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited;

  {add methods}
  aPropList.AddMethod('Assign');
  aPropList.AddMethod('EqualTo');
  
  aPropList.AddMethod('AddName');
  aPropList.AddMethod('Add');
  aPropList.AddMethod('Clear');
  aPropList.AddMethod('InList');
  aPropList.AddMethod('Remove');

  {add public props}
  aPropList.AddProp('Count');
  aPropList.AddProp('InsertMode');
  aPropList.AddProp('Items');
  aPropList.AddProp('ItemsByIndex');
  aPropList.AddProp('Values');


end;

{@TraTppParameterListRTTI.GetPropRec}

class function TraTppParameterListRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin
  Result := True;

  {properties & methods}
  if ppEqual(aPropName, 'Count') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'InsertMode') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'Items')  then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if ppEqual(aPropName, 'ItemsByIndex')  then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if ppEqual(aPropName, '') or ppEqual(aPropName, 'Values') then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if ppEqual(aPropName, 'Assign') then
    MethodToRec(aPropName, True, aPropRec)
    
  else if ppEqual(aPropName, 'EqualTo') then
    MethodToRec(aPropName, True, aPropRec)

  else if ppEqual(aPropName, 'AddName') then
    MethodToRec(aPropName, True, aPropRec)
    
  else if ppEqual(aPropName, 'Add') then
    MethodToRec(aPropName, True, aPropRec)

  else if ppEqual(aPropName, 'Clear') then
    MethodToRec(aPropName, False, aPropRec)

  else if ppEqual(aPropName, 'InList') then
    MethodToRec(aPropName, True, aPropRec)

  else if ppEqual(aPropName, 'Remove') then
    MethodToRec(aPropName, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end;

{@TraTppParameterListRTTI.GetParams}

class function TraTppParameterListRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if ppEqual(aMethodName, '') or ppEqual(aMethodName, 'Values') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Name', daString, nil, '', False, False);
      Result.AddParam('Result', daVariant, nil, '', False, False);
    end

  else if ppEqual(aMethodName, 'Items') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Name', daString, nil, '', False, False);
      Result.AddParam('Result', daClass, TppParameter, '', False, False);
    end
    
  else if ppEqual(aMethodName, 'ItemsByIndex') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppParameter, '', False, False);
    end

  else if ppEqual(aMethodName, 'Assign') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Source', daObject, TppParameterList, '', False, False);
    end
    
  else if ppEqual(aMethodName, 'EqualTo') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Source', daObject, TppParameterList, '', False, False);
      Result.AddParam('Result', daBoolean, nil, '', False, False);
    end

  else if ppEqual(aMethodName, 'AddName') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Name', daString, nil, '', False, False);
      Result.AddParam('Result', daClass, TppParameter, '', False, False);
    end

  else if ppEqual(aMethodName, 'Add') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Name', daString, nil, '', False, False);
      Result.AddParam('DataType', daEnum, nil, 'TppDataType', False, False);
      Result.AddParam('Value', daVariant, nil, '', False, False);
      Result.AddParam('Result', daClass, TppParameter, '', False, False);
    end
  else if ppEqual(aMethodName, 'InList') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Name', daString, nil, '', False, False);
      Result.AddParam('Result', daBoolean, nil, '', False, False);
    end
  else if ppEqual(aMethodName, 'Remove') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Name', daString, nil, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);


end;


{@TraTppParameterListRTTI.GetPropValue}

class function TraTppParameterListRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Count') then
    Integer(aValue) := TppParameterList(aObject).Count

  else if ppEqual(aPropName, 'InsertMode') then
    Boolean(aValue) := TppParameterList(aObject).InsertMode

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);


end;

{ TraTppParameterListRTTI.SetPropValue }

class function TraTppParameterListRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'InsertMode') then
    TppParameterList(aObject).InsertMode := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{@TraTppParameterListRTTI.CallMethod}

class function TraTppParameterListRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lParameterList: TppParameterList;
  lParameter: TppParameter;
  lDataType: TppDataType;
  lsName: String;
  liIndex: Integer;
  lvValue: Variant;
  lbResult: Boolean;
begin

  Result := True;

  lParameterList := TppParameterList(aObject);

  if ppEqual(aMethodName, '') or ppEqual(aMethodName, 'Values') then
    begin
      aParams.GetParamValue(0, lsName);

      lvValue := lParameterList.Values[lsName];

      aParams.SetParamValue(1, lvValue);
    end

  else if ppEqual(aMethodName, 'Items') then
    begin
      aParams.GetParamValue(0, lsName);

      lParameter := lParameterList.Items[lsName];

      aParams.SetParamValue(1, lParameter);
    end
    
  else if ppEqual(aMethodName, 'ItemsByIndex') then
    begin
      aParams.GetParamValue(0, liIndex);

      lParameter := lParameterList.ItemsByIndex[liIndex];

      aParams.SetParamValue(1, lParameter);
    end

  else if ppEqual(aMethodName, 'AddName') then
    begin
      aParams.GetParamValue(0, lsName);

      lParameter := lParameterList.Add(lsName);

      aParams.SetParamValue(1, lParameter);
    end
    
  else if ppEqual(aMethodName, 'Add') then
    begin
      aParams.GetParamValue(0, lsName);
      aParams.GetParamValue(1, lDataType);
      aParams.GetParamValue(2, lvValue);

      lParameter := lParameterList.Add(lsName, lDataType, lvValue);

      aParams.SetParamValue(3, lParameter);
    end

  else if ppEqual(aMethodName, 'InList') then
    begin
      aParams.GetParamValue(0, lsName);

      lbResult := lParameterList.InList(lsName);

      aParams.SetParamValue(1, lbResult);
    end

  else if ppEqual(aMethodName, 'Clear') then
    lParameterList.Clear

  else if ppEqual(aMethodName, 'Remove') then
    begin
      aParams.GetParamValue(0, lsName);

      lParameterList.Remove(lsName);
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);


end;

{@TraTppParameterListRTTI.GetPickList}

function TppParameter.GetPickList: TStrings;
begin
  if (FPickList = nil) then
    FPickList := TStringList.Create;

  Result := FPickList;
    
end;

{@TppParameter.SetPickList}

procedure TppParameter.SetPickList(aPickList: TStrings);
begin
  GetPickList.Assign(aPickList);

end;

initialization
  RegisterClasses([TppParameter, TppParameterList]);
  raRegisterRTTI(TraTppParameterListRTTI);

finalization
  UnRegisterClasses([TppParameter, TppParameterList]);
  raUnRegisterRTTI(TraTppParameterListRTTI);

end.
 

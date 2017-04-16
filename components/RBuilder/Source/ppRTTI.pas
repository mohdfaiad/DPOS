{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit ppRTTI;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, SysUtils, TypInfo,
  ppUtils;

type

  TraParamList = class;
  
  pTraPropRec = ^TraPropRec;
  pTraParamRec = ^TraParamRec;

  TraDataType = (daUnknown, daInteger, daSingle, daDouble, daExtended, daCurrency, daChar,
                 daString, daDateTime, daDate, daTime, daBoolean, daVariant, daObject, daClass, daEnum,
                 daMethod);

  TraDataTypeSet = set of TraDataType;

  { TraPropRec }
  TraPropRec = record
    Name: ShortString;
    ClassType: TClass;
    EnumTypeName: ShortString;
    DataType: TraDataType;
    IsPublished: Boolean;
    IsReadOnly: Boolean;
    IsConstructor: Boolean;
    IsAccessSpecifier: Boolean;
    EventID: Integer;
    Params: TraParamList;
  end; {record, TraPropRec}


  {@TraPropList }
  TraPropList = class(TStringList)
    private

    public
      destructor Destroy; override;

      procedure AddMethod(const aMethodName: String);
      procedure AddProp(const aPropName: String);
      procedure RemoveMethod(const aMethodName: String);
      procedure RemoveProp(const aPropName: String);

  end; {class, TraPropList}

  {TraPropertyStringParser

    Converts a path name into a list of strings.}
  TraPropertyStringParser = class
    public
      class procedure Execute(const aString: String; aStrings: TStrings);

  end; {class, TrsPropertyStringParser}

  


  { TraParamRec }
  TraParamRec = record
    Name: ShortString;
    DataType: TraDataType;
    ClassType: TClass;
    EnumTypeName: ShortString;
    IsConst: Boolean;
    IsVar: Boolean;
    Value: Pointer;
  end; {record, TraParamRec}


  {@TraParamList }
  TraParamList = class(TStringList)
    private
      function GetParam(aIndex: Integer): TraParamRec;

    public
      destructor Destroy; override;

      function  AddParam(const aParamName: String; aDataType: TraDataType; aClassType: TClass; const aEnumTypeName: String; aIsConst, aIsVar: Boolean): Integer;
      procedure RemoveParam(const aParamName: String);

      function GetParamDataTypeDescription(aIndex: Integer): String;
      function CompareParamTypes(aParam1, aParam2: TraParamRec): Boolean;
      function GetEditorText: String;
      function GetSignatureText: String;
      
      procedure CreateValuePointer(aIndex: Integer; var aValue);
      procedure GetParamValue(aIndex: Integer; var aValue);
      procedure SetValuePointer(aIndex: Integer; aValuePointer: Pointer);
      procedure SetParamValue(aIndex: Integer; var aValue);
      procedure SetParamClassType(aIndex: Integer; aClass: TClass);

      property Params[Index: Integer]: TraParamRec read GetParam; default;
      property ParamCount: Integer read GetCount;

  end; {class, TraParamList}


  { TraRTTI -

    This is the ancestor RTTI class for all objects. It supports the published
    properties of any object (i.e. TObject descendant.) Where public properties
    and methods need to be made available, a descendant of TraRTTI must be
    created.  For example, the TComponent class in Delphi has two public
    attributes: Create and Owner which are made available in RAP. In order
    to support these public attributes, a descendant of TraRTTI
    (TraComponentRTTI) was created.

   RefClass
     Returns the class reference value for the descendant class
     (i.e. TraComponentRTTI returns, TComponent)

   GetPropList, GetEventList
     these two methods are not used by the compiler, but are used by the Code
     ToolBox, which displays the various parts of the RAP to the user and allows
     for drag and drop creation of the code.

   GetPropRec
     used to get information about a property when compiling.  If the property
     is published, then the PropRec is populated with values from Delphi's built-in
     RTTI.  If the property is not published, then an RTTI descendant must provide
     the appropriate PropRec for the given property.

   GetPropValue
     given an instance of TObject, a property name, and a var parameter, this
     method will typecast the TObject, retrieve the requested property value,
     and assign the value to var parameter.  For published properties this process
     is completed automatically. For public properties the process is handled in
     the RTTI descendant.

   SetPropValue
     Given an instance of TObject, a property name, and a var parameter this method
     will typecast the TObject and assign the value from var parameter to the
     appropriate property.

   CallMethod
     given an instance of TObject, a method name, and a list of parameter values,
     this routine typecasts the TObject and calls the method.

   GetParams
     whenever a method or event which has parameters is defined, this routine is used
     to return the list of parameters for the method.}

  {@TraRTTI }
  TraRTTI = class(TPersistent)
    private
      class function  PropInfoToDataType(apPropInfo: pPropInfo): TraDataType;
      class function  GetPublishedPropValue(aObject: TObject; apPropInfo: pPropInfo; var aValue): Boolean;
      class function  SetPublishedPropValue(aObject: TObject; apPropInfo: pPropInfo; var aValue): Boolean;

    protected
      class procedure AccessSpecifierToRec(const aMethodName: String; var aPropRec: TraPropRec);
      class procedure ClassPropToRec(const aPropName: String; aClass: TClass; aIsReadOnly: Boolean; var aPropRec: TraPropRec);
      class procedure ConstructorToRec(const aMethodName: String; aClass: TClass; var aPropRec: TraPropRec);
      class procedure EnumPropToRec(const aPropName: String; const aEnumTypeName: String; aIsReadOnly: Boolean; var aPropRec: TraPropRec);
      class procedure EventToRec(const aEventName: String; aEventID: Integer; aHasParams: Boolean; var aPropRec: TraPropRec);
      class procedure MethodToRec(const aMethodName: String; aHasParams: Boolean; var aPropRec: TraPropRec);
      class procedure PropToRec(const aPropName: String; aDataType: TraDataType; aIsReadOnly: Boolean; var aPropRec: TraPropRec);

    public
      {user-interface support}
      class procedure GetFilteredPropList(aClass: TClass; aPropList: TraPropList; aPropFilter: TTypeKinds);
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); virtual;
      class procedure GetEventList(aClass: TClass; aPropList: TraPropList); virtual;

      {property info routines (used during compilation)}
      class function  IsValidPropName(aObject: TObject; const aPropName: String): Boolean; overload;
      class function  IsValidPropName(aClass: TClass; const aPropName: String): Boolean; overload;
      class function  RefClass: TClass; virtual; {abstract; - removed to support CBuilder}
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; virtual;

      {property access routines (used during execution)}
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; virtual;
      class function  GetParams(const aMethodName: String): TraParamList; virtual;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; virtual;
      class function  GetPropValueAsString(aObject: TObject; aPropName: String): String; virtual;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; virtual;
      class function  SetPropValueFromString(aObject: TObject; aPropName: String; aStringValue: String): Boolean;

  end; {class, TraRTTI}


  {@TraTObjectRTTI }
  TraTObjectRTTI = class(TraRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTObjectRTTI}

  {@TraTPersistentRTTI }
  TraTPersistentRTTI = class(TraTObjectRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTPersistentRTTI}
  
  {@TraTComponentRTTI }
  TraTComponentRTTI = class(TraTPersistentRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTComponentRTTI}


  TraRTTIClass = class of TraRTTI;

  { TraRTTIClassRegistry }
  TraRTTIClassRegistry = class
    private
      class procedure AddClass(aRTTIClass: TraRTTIClass);
      class procedure RemoveClass(aRTTIClass: TraRTTIClass);
      class procedure Lock;
      class procedure UnLock;

    public
      class procedure Initialize;
      class procedure Finalize;

      class procedure Register(aRTTIClass: TraRTTIClass);
      class procedure UnRegister(aRTTIClass: TraRTTIClass);

      class function GetClass(const aClassName: String): TClass;
      class function GetRTTIClass(aClassType: TClass): TraRTTIClass;

  end; {class, TraRTTIClassRegistry}




  {registration routines - backward compatability}
  procedure raRegisterRTTI(aRTTIClass: TraRTTIClass);
  procedure raUnRegisterRTTI(aRTTIClass: TraRTTIClass);


const
  ctkIgnoreProperties: TTypeKinds =[tkUnknown, tkSet, tkArray, tkRecord, tkInterface];


  {TTypeKind = (tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
    tkString, tkSet, tkClass, tkMethod, tkWChar, tkLString, tkWString,
    tkVariant, tkArray, tkRecord, tkInterface, tkInt64, tkDynArray);  }

  ctkDataTypeMap: array[TTypeKind] of TraDataType = (
    daUnknown, daInteger, daChar, daEnum, daExtended,
    daString, daUnknown, daClass, daUnknown {daMethod},
    daUnknown {daVariant?}, daString, daString,
    daVariant, daUnknown, daUnknown, daUnknown, daUnknown, daUnknown);

implementation

var
  uRTTIClasses: TStrings = nil;
  uRegistryLock: TRTLCriticalSection;

{------------------------------------------------------------------------------}
{ raRegisterRTTI }

procedure raRegisterRTTI(aRTTIClass: TraRTTIClass);
begin

  TraRTTIClassRegistry.Register(aRTTIClass);

end; {procedure, raRegisterRTTI}

{------------------------------------------------------------------------------}
{ raUnRegisterRTTI }

procedure raUnRegisterRTTI(aRTTIClass: TraRTTIClass);
begin

  TraRTTIClassRegistry.UnRegister(aRTTIClass);

end; {procedure, raUnRegisterRTTI}


{******************************************************************************
 *
 ** P R O P   L I S T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraPropList.Destroy }

destructor TraPropList.Destroy;
var
  liObject: Integer;
  lpPropRec: pTraPropRec;
begin

  for liObject := 0 to Count - 1 do
    begin
      lpPropRec := pTraPropRec(GetObject(liObject));

      FreeMem(lpPropRec, SizeOf(TraPropRec));
    end;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}

{------------------------------------------------------------------------------}
{ TraPropList.AddMethod }

procedure TraPropList.AddMethod(const aMethodName: String);
begin
  Add(aMethodName);

end; {procedure, AddMethod}

{------------------------------------------------------------------------------}
{ TraPropList.AddProp }

procedure TraPropList.AddProp(const aPropName: String);
begin
  Add(aPropName);

end; {procedure, AddProp}

{------------------------------------------------------------------------------}
{ TraPropList.RemoveProp }

procedure TraPropList.RemoveProp(const aPropName: String);
var
  liIndex: Integer;
begin

  liIndex := IndexOf(aPropName);

  if liIndex < 0 then Exit;

  Delete(liIndex);

end; {procedure, Remove}

{------------------------------------------------------------------------------}
{ TraPropList.RemoveMethod }

procedure TraPropList.RemoveMethod(const aMethodName: String);
begin
  RemoveProp(aMethodName);
end; {procedure, RemoveMethod}



{******************************************************************************
 *
 ** P A R A M   L I S T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraParamList.Destroy }

destructor TraParamList.Destroy;
var
  liObject: Integer;
  lpParamRec: pTraParamRec;
begin

  for liObject := 0 to Count - 1 do
    begin
      lpParamRec := pTraParamRec(GetObject(liObject));

      FreeMem(lpParamRec, SizeOf(TraParamRec));
    end;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TraParamList.GetParam }

function TraParamList.GetParam(aIndex: Integer): TraParamRec;
begin
  Result := pTraParamRec(GetObject(aIndex))^;
end; {function, GetParam}

{------------------------------------------------------------------------------}
{ TraParamList.CreateValuePointer }

procedure TraParamList.CreateValuePointer(aIndex: Integer; var aValue);
begin
  pTraParamRec(GetObject(aIndex))^.Value := @aValue;
end; {procedure, CreateValuePointer}

{------------------------------------------------------------------------------}
{ TraParamList.SetValuePointer }

procedure TraParamList.SetValuePointer(aIndex: Integer; aValuePointer: Pointer);
begin
  pTraParamRec(GetObject(aIndex))^.Value := aValuePointer;
end; {procedure, SetValuePointer}

{------------------------------------------------------------------------------}
{ TraParamList.SetParamClassType }

procedure TraParamList.SetParamClassType(aIndex: Integer; aClass: TClass);
begin
  pTraParamRec(GetObject(aIndex))^.ClassType := aClass;
end; {procedure, SetParamClassType}

{------------------------------------------------------------------------------}
{ TraParamList.SetParamValue }

procedure TraParamList.SetParamValue(aIndex: Integer; var aValue);
var
  lParamRec: TraParamRec;
begin
  lParamRec := Params[aIndex];

  {dereference the pointer and set the value}
  case lParamRec.DataType of

    daString:
      String(lParamRec.Value^) := String(aValue);

    daInteger:
      Integer(lParamRec.Value^) := Integer(aValue);

    daBoolean:
      Boolean(lParamRec.Value^) := Boolean(aValue);

    daChar:
      Char(lParamRec.Value^) := Char(aValue);

    daSingle:
      Single(lParamRec.Value^) := Single(aValue);

    daDouble:
      Double(lParamRec.Value^) := Double(aValue);

    daExtended:
      Extended(lParamRec.Value^) := Extended(aValue);

    daCurrency:
      Currency(lParamRec.Value^) := Currency(aValue);

    daDateTime:
      TDateTime(lParamRec.Value^) := TDateTime(aValue);

    daDate:
      TDateTime(lParamRec.Value^) := TDateTime(aValue);

    daTime:
      TDateTime(lParamRec.Value^) := TDateTime(aValue);

    daClass:
      Integer(lParamRec.Value^) := Integer(aValue);

    daEnum:
      Byte(lParamRec.Value^) := Byte(aValue);

    daVariant:
      Variant(lParamRec.Value^) := Variant(aValue);

  end; {case, DataType}

end; {procedure, SetParamValue}

{------------------------------------------------------------------------------}
{ TraParamList.GetParamValue }

procedure TraParamList.GetParamValue(aIndex: Integer; var aValue);
var
  lParamRec: TraParamRec;
begin
  lParamRec := Params[aIndex];

  {dereference the pointer and set the value}
  case lParamRec.DataType of

    daString:
      String(aValue) := String(lParamRec.Value^);

    daInteger:
      Integer(aValue) := Integer(lParamRec.Value^);

    daBoolean:
      Boolean(aValue) := Boolean(lParamRec.Value^);

    daChar:
      Char(aValue) := Char(lParamRec.Value^);

    daSingle:
      Single(aValue) := Single(lParamRec.Value^);

    daDouble:
      Double(aValue) := Double(lParamRec.Value^);

    daExtended:
      Extended(aValue) := Extended(lParamRec.Value^);

    daCurrency:
      Currency(aValue) := Currency(lParamRec.Value^);

    daDateTime:
      TDateTime(aValue) := TDateTime(lParamRec.Value^);

    daDate:
      TDateTime(aValue) := TDateTime(lParamRec.Value^);

    daTime:
      TDateTime(aValue) := TDateTime(lParamRec.Value^);

    daClass:
      Integer(aValue) := Integer(lParamRec.Value^);

    daEnum:
      Byte(aValue) := Byte(lParamRec.Value^);

    daVariant:
      Variant(aValue) := Variant(lParamRec.Value^);

  end; {case, DataType}

end; {procedure, GetParamValue}

{------------------------------------------------------------------------------}
{ TraParamList.AddParam }

function TraParamList.AddParam(const aParamName: String; aDataType: TraDataType; aClassType: TClass; const aEnumTypeName: String; aIsConst, aIsVar: Boolean): Integer;
var
  lpParamRec: pTraParamRec;
begin

  {allocate memory}
  GetMem(lpParamRec, SizeOf(TraParamRec));

  lpParamRec^.Name := aParamName;
  lpParamRec^.DataType := aDataType;
  lpParamRec^.ClassType := aClassType;
  lpParamRec^.EnumTypeName := aEnumTypeName;
  lpParamRec^.IsConst := aIsConst;
  lpParamRec^.IsVar := aIsVar;

  lpParamRec^.Value := nil;

  {add the reference}
  Result := AddObject(lpParamRec^.Name, TObject(lpParamRec));

  {Result := lpParamRec^;}
  
end; {procedure, AddParam}

{------------------------------------------------------------------------------}
{ TraParamList.RemoveParam }

procedure TraParamList.RemoveParam(const aParamName: String);
var
  liIndex: Integer;
  lpParamRec: pTraParamRec;
begin

  liIndex := IndexOf(aParamName);

  if liIndex < 0 then Exit;

  lpParamRec := pTraParamRec(GetObject(liIndex));

  FreeMem(lpParamRec, SizeOf(TraParamRec));

  Delete(liIndex);

end; {procedure, RemoveParam}

{------------------------------------------------------------------------------}
{ TraParamList.GetParamDataTypeDescription }

function TraParamList.GetParamDataTypeDescription(aIndex: Integer): String;
var
  lPropRec: TraParamRec;
begin

  lPropRec := GetParam(aIndex);

  {return the class type, if applicable}
  if (lPropRec.DataType in [daClass, daMethod]) and (lPropRec.ClassType <> nil) then
    Result := lPropRec.ClassType.ClassName

  else if (lPropRec.DataType = daEnum) then
     {return the enum type name}
     Result := lPropRec.EnumTypeName

  else
    begin
      {convert datatype to a string description}
      Result := ppGetEnumName(TypeInfo(TraDataType), Ord(lPropRec.DataType));
      Result := Copy(Result, 3, Length(Result));
    end;

end; {function, GetParamDataTypeDescription}

{------------------------------------------------------------------------------}
{ TraParamList.CompareParamTypes }

function TraParamList.CompareParamTypes(aParam1, aParam2: TraParamRec): Boolean;
begin

  {check whether parameters are of the exact same type}
  Result :=  (aParam1.DataType = aParam2.DataType) and
             (aParam1.ClassType = aParam2.ClassType) and
             (aParam1.EnumTypeName = aParam2.EnumTypeName) and
             (aParam1.IsConst = aParam2.IsConst) and
             (aParam1.IsVar = aParam2.IsVar);

end; {function, CompareParamTypes}

{------------------------------------------------------------------------------}
{ TraParamList.GetEditorText }

function TraParamList.GetEditorText: String;
var
  liIndex: Integer;
  lParam: TraParamRec;
begin

  Result := '';

  {return comma delimited list of param names: '(ParamName1, ParamName2,..)'}
  for liIndex := 0 to Count-1 do
    begin
      lParam := GetParam(liIndex);

      {ommit the Result from the list}
      if (liIndex = Count-1) and (lParam.Name = 'Result') then
        Break;

      if (liIndex = 0) then
        Result := Result + '('
      else
        Result := Result + ', ';

      Result := Result + lParam.Name;

    end;

  if Count > 0 then
    Result := Result + ')';

end; {function, GetEditorText}

{------------------------------------------------------------------------------}
{ TraParamList.GetSignatureText }

function TraParamList.GetSignatureText: String;
var
  liIndex: Integer;
  lParam: TraParamRec;
  lPrevParam: TraParamRec;
  lbSameTypeAsPrevParam: Boolean;

begin

  Result := '';

  {return Pascal style signature '(aIndex: Integer; var Foo: TFooBar)'}
  for liIndex := 0 to Count-1 do
    begin
      lParam := GetParam(liIndex);

      if (liIndex = Count-1) and (lParam.Name = 'Result') then
        Break;

      // check whether param is same type as prev param
      lbSameTypeAsPrevParam := (liIndex > 0) and CompareParamTypes(lPrevParam, lParam);

      if (liIndex = 0) then
        Result := Result + '('

      else if lbSameTypeAsPrevParam then
        {comma delimit params of the same type}
        Result := Result + ', '
      else
        {append the datatype declaration for the previos param}
        Result := Result + ':' + GetParamDataTypeDescription(liIndex-1) + '; ';

      if not(lbSameTypeAsPrevParam) then
        begin
          {add a prefix for the current declaration, if needed}
          if lParam.IsConst then
            Result := Result + 'const '
          else if lParam.IsVar then
            Result := Result + 'var ';
        end;

      Result := Result + lParam.Name;

      lPrevParam := lParam;

    end;
  {add the DataType for the last parameter and add a Result DataType, if needed}
  if (lParam.Name = 'Result') then
    begin
      if Count > 1 then
        Result := Result + ':' + GetParamDataTypeDescription(Count-2) + ')';

      Result := Result + ':' +  GetParamDataTypeDescription(Count-1);
    end
  else if Count > 0 then
    begin

      Result := Result + ':' + GetParamDataTypeDescription(Count-1) + ')';

    end;

  Result := Result + ';';

end; {function, GetSignatureText}


{******************************************************************************
 *
 **  P R O P E R T Y   S T R I N G   P A R S E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraPropertyStringParser.Execute }

class procedure TraPropertyStringParser.Execute(const aString: String; aStrings: TStrings);
var
  lsString: String;
  liPosition: Integer;
begin

  aStrings.Clear;

  lsString := aString;

  liPosition := Pos('.', lsString);

  while (liPosition <> 0) do
    begin
      aStrings.Add(Copy(lsString, 1, liPosition - 1));

      lsString := Copy(lsString, liPosition + 1, Length(lsString));

      liPosition := Pos('.', lsString);
    end;

  if (Length(lsString) > 0) then
    aStrings.Add(lsString);

end; {procedure, Execute}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraRTTI.RefClass }

class function  TraRTTI.RefClass: TClass;
begin
  {treat as abstract - ancestors must override}
  Result := TObject;
end; {class procedure, AccessSpecifierToRec}

{------------------------------------------------------------------------------}
{ TraRTTI.AccessSpecifierToRec }

class procedure TraRTTI.AccessSpecifierToRec(const aMethodName: String; var aPropRec: TraPropRec);
begin
  MethodToRec(aMethodName, True, aPropRec);

  aPropRec.IsAccessSpecifier := True;

end; {class procedure, AccessSpecifierToRec}

{------------------------------------------------------------------------------}
{ TraRTTI.ClassPropToRec }

class procedure TraRTTI.ConstructorToRec(const aMethodName: String; aClass: TClass; var aPropRec: TraPropRec);
begin
  MethodToRec(aMethodName, True, aPropRec);

  {store the class to be created in the prop rec and the class param}
  aPropRec.ClassType := aClass;
  aPropRec.Params.AddParam('Class', daClass, aClass, '', False, False);
  aPropRec.Params.AddParam('Result', daClass, nil, '', False, False);

  aPropRec.IsConstructor := True;
end; {class procedure, ConstructorToRec}

{------------------------------------------------------------------------------}
{ TraRTTI.ClassPropToRec }

class procedure TraRTTI.ClassPropToRec(const aPropName: String; aClass: TClass; aIsReadOnly: Boolean; var aPropRec: TraPropRec);
begin
  PropToRec(aPropName, daClass, aIsReadOnly, aPropRec);

  aPropRec.ClassType := aClass;
end; {class procedure, ClassPropToRec}

{------------------------------------------------------------------------------}
{ TraRTTI.EnumPropToRec }

class procedure TraRTTI.EnumPropToRec(const aPropName: String; const aEnumTypeName: String; aIsReadOnly: Boolean; var aPropRec: TraPropRec);
begin
  PropToRec(aPropName, daEnum, aIsReadOnly, aPropRec);

  aPropRec.EnumTypeName := aEnumTypeName;
end; {class procedure, EnumPropToRec}

{------------------------------------------------------------------------------}
{ TraRTTI.EventToRec }

class procedure TraRTTI.EventToRec(const aEventName: String; aEventID: Integer; aHasParams: Boolean; var aPropRec: TraPropRec);
begin
  MethodToRec(aEventName, aHasParams, aPropRec);

  aPropRec.EventID := aEventID;
end; {class procedure, EventToRec}

{------------------------------------------------------------------------------}
{ TraRTTI.MethodToRec }

class procedure TraRTTI.MethodToRec(const aMethodName: String; aHasParams: Boolean; var aPropRec: TraPropRec);
var
  lLastParam: TraParamRec;
begin

  PropToRec(aMethodName, daMethod, True, aPropRec);

  if aHasParams then
    aPropRec.Params := GetParams(aMethodName);

  {if last param is Result, then set the class type}
  if (aPropRec.Params <> nil) and (aPropRec.Params.Count > 0) then
    begin
      lLastParam := aPropRec.Params[aPropRec.Params.Count-1];

      if (CompareText(lLastParam.Name, 'Result') = 0) and (lLastParam.DataType = daClass) then
        aPropRec.ClassType := lLastParam.ClassType;
    end;


end; {class procedure, MethodToRec}

{------------------------------------------------------------------------------}
{ TraRTTI.PropToRec }

class procedure TraRTTI.PropToRec(const aPropName: String; aDataType: TraDataType; aIsReadOnly: Boolean; var aPropRec: TraPropRec);
begin

  aPropRec.Name := aPropName;
  aPropRec.DataType := aDataType;
  aPropRec.IsReadOnly := aIsReadOnly;

  aPropRec.EnumTypeName := '';
  aPropRec.IsConstructor := False;
  aPropRec.IsAccessSpecifier := False;
  aPropRec.IsPublished := False;
  aPropRec.EventID := -1;
  aPropRec.Params := nil;
  aPropRec.ClassType := nil;

end;  {class procedure, PropToRec}

{------------------------------------------------------------------------------}
{ TraRTTI.PropInfoToDataType }

class function TraRTTI.PropInfoToDataType(apPropInfo: pPropInfo): TraDataType;
begin

  Result := ctkDataTypeMap[apPropInfo.PropType^.Kind];

  {for float types, must use FloatType to determine the exact datatype}
  if (apPropInfo.PropType^.Kind = tkFloat) then

    case GetTypeData(apPropInfo.PropType^)^.FloatType of
      ftSingle:
        Result := daSingle;

      ftDouble:
        Result := daDouble;

      ftExtended, ftComp:
        Result := daExtended;

      ftCurr:
        Result := daCurrency;
    end;

end;  {class function, PropInfoToDataType}

{------------------------------------------------------------------------------}
{ TraRTTI.IsValidPropName }

class function TraRTTI.IsValidPropName(aObject: TObject; const aPropName: String): Boolean;
var
  lPropRec: TraPropRec;
begin
  Result := GetPropRec(aObject.ClassType, aPropName, lPropRec);

end;

class function TraRTTI.IsValidPropName(aClass: TClass; const aPropName: String): Boolean;
var
  lPropRec: TraPropRec;
begin
  Result := GetPropRec(aClass, aPropName, lPropRec);

end;

{------------------------------------------------------------------------------}
{ TraRTTI.GetPropRec }

class function TraRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
var
  lpPropInfo: pPropInfo;
  lsEnumTypeName: String;
begin

  Result := False;

  if (aClass = nil) or (aClass.ClassInfo = nil) then Exit;

  lpPropInfo := TypInfo.GetPropInfo(aClass.ClassInfo, aPropName);

  if (lpPropInfo = nil) then Exit;


  PropToRec(lpPropInfo^.Name, PropInfoToDataType(lpPropInfo), False, aPropRec);

  if (aPropRec.DataType = daClass) then
    aPropRec.ClassType := GetTypeData(lpPropInfo.PropType^)^.ClassType

  else if (aPropRec.DataType = daEnum) then
    begin
      lsEnumTypeName := lpPropInfo.PropType^.Name;

      aPropRec.EnumTypeName := lsEnumTypeName;

      {convert data type to boolean, if appropriate}
      if (CompareText(lsEnumTypeName, 'Boolean') = 0) then
        aPropRec.DataType := daBoolean;
    end;

  aPropRec.IsPublished := True;
  aPropRec.IsReadOnly  := (lpPropInfo^.SetProc = nil);

  Result := True;

end;  {procedure, class function}

{------------------------------------------------------------------------------}
{ TraRTTI.GetFilteredPropList }

class procedure TraRTTI.GetFilteredPropList(aClass: TClass; aPropList: TraPropList; aPropFilter: TTypeKinds);
var
  liIndex: Integer;
  lpPropList: pPropList;
  liPropCount: Integer;
  liListSize: Integer;
  lpPropInfo: pPropInfo;
begin

  {get prop count}
  liPropCount := TypInfo.GetPropList(aClass.ClassInfo, aPropFilter, nil);

  {calc size of prop list and alloc memory}
  liListSize := liPropCount * SizeOf(Pointer);
  GetMem(lpPropList, liListSize);

  {get prop list}
  TypInfo.GetPropList(aClass.ClassInfo, aPropFilter, lpPropList);


  {add properties to RAP property list}
  for liIndex := 0 to liPropCount - 1 do
    begin
      lpPropInfo := lpPropList^[liIndex];

      aPropList.AddProp(lpPropInfo.Name);
    end;

  {free memory for Delphi property list}
  if lpPropList <> nil then
    FreeMem(lpPropList, liListSize);

end; {class procedure, GetFilteredPropList}

{------------------------------------------------------------------------------}
{ TraRTTI.GetPropList }

class procedure TraRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
var
  lPropFilter: TTypeKinds;
begin

  lPropFilter := tkProperties - ctkIgnoreProperties;

  GetFilteredPropList(aClass, aPropList, lPropFilter);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraRTTI.GetEventList }

class procedure TraRTTI.GetEventList(aClass: TClass; aPropList: TraPropList);
var
  lPropFilter: TTypeKinds;
begin

  lPropFilter := tkMethods;

  GetFilteredPropList(aClass, aPropList, lPropFilter);

end; {class procedure, GetEventList}

{------------------------------------------------------------------------------}
{ TraRTTI.GetPublishedPropValue }

class function TraRTTI.GetPublishedPropValue(aObject: TObject; apPropInfo: pPropInfo; var aValue): Boolean;
begin

  Result := True;

  case PropInfoToDataType(apPropInfo) of

    daString:
      String(aValue) := TypInfo.GetStrProp(aObject, apPropInfo);

    daInteger, daBoolean, daChar:
      Integer(aValue) := TypInfo.GetOrdProp(aObject, apPropInfo);

    daSingle:
      Single(aValue) := TypInfo.GetFloatProp(aObject, apPropInfo);

    daCurrency:
      Currency(aValue) := TypInfo.GetFloatProp(aObject, apPropInfo);

    daDouble:
      Double(aValue) := TypInfo.GetFloatProp(aObject, apPropInfo);

    daExtended:
      Extended(aValue) := TypInfo.GetFloatProp(aObject, apPropInfo);

    daDateTime, daDate, daTime:
      TDateTime(aValue) := TypInfo.GetFloatProp(aObject, apPropInfo);

    daClass:
      Integer(aValue) := TypInfo.GetOrdProp(aObject, apPropInfo);

    daEnum:
      Byte(aValue) := TypInfo.GetOrdProp(aObject, apPropInfo);

    daVariant:
      Variant(aValue) := TypInfo.GetVariantProp(aObject, aPPropInfo);

  else
    Result := False;

  end;  {case, DataType}

end; {function, GetPublishedPropValue}

{------------------------------------------------------------------------------}
{ TraRTTI.SetPublishedPropValue }

class function TraRTTI.SetPublishedPropValue(aObject: TObject; apPropInfo: pPropInfo; var aValue): Boolean;
begin

  Result := True;

  case PropInfoToDataType(apPropInfo) of

    daString:
      SetStrProp(aObject, apPropInfo, String(aValue));

    daInteger:
      SetOrdProp(aObject, apPropInfo, Integer(aValue));

    daBoolean:
      SetOrdProp(aObject, apPropInfo, Ord(Boolean(aValue)));

    daChar:
      SetOrdProp(aObject, apPropInfo, Ord(Char(aValue)));

    daSingle:
      SetFloatProp(aObject, apPropInfo, Single(aValue));

    daCurrency:
      SetFloatProp(aObject, apPropInfo, Currency(aValue));

    daDouble:
      SetFloatProp(aObject, apPropInfo, Double(aValue));

    daExtended:
      SetFloatProp(aObject, apPropInfo, Extended(aValue));

    daDateTime, daDate, daTime:
      SetFloatProp(aObject, apPropInfo, TDateTime(aValue));

    daClass:
      SetOrdProp(aObject, apPropInfo, Integer(aValue));

    daEnum:
      SetOrdProp(aObject, apPropInfo, Byte(aValue));

    daVariant:
      SetVariantProp(aObject, aPPropInfo, Variant(aValue));

  else
    Result := False;

  end; {case, DataType}

end; {function, SetPublishedPropValue}

{------------------------------------------------------------------------------}
{ TraRTTI.CallMethod }

class function TraRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
begin
  Result := False;
end;  {procedure, class function}

{------------------------------------------------------------------------------}
{ TraRTTI.GetParams }

class function TraRTTI.GetParams(const aMethodName: String): TraParamList;
begin
  Result := nil;
end; {function, GetParams}

{------------------------------------------------------------------------------}
{ TraRTTI.GetPropValue }

class function TraRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
var
  lpPropInfo: pPropInfo;
begin

  lpPropInfo := TypInfo.GetPropInfo(aObject.ClassInfo, aPropName);

  if (lpPropInfo <> nil) then
    Result := GetPublishedPropValue(aObject, lpPropInfo, aValue)
  else
    Result := False;

end;  {GetPropValue, class function}

{------------------------------------------------------------------------------}
{ TraRTTI.SetPropValue }

class function TraRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
var
  lpPropInfo: pPropInfo;
begin

  lpPropInfo := TypInfo.GetPropInfo(aObject.ClassInfo, aPropName);

  if (lpPropInfo <> nil) then
    Result := SetPublishedPropValue(aObject, lpPropInfo, aValue)
  else
    Result := False;

end;  {procedure, class function}

{------------------------------------------------------------------------------}
{ TraRTTI.GetPropValueAsString}

class function TraRTTI.GetPropValueAsString(aObject: TObject; aPropName: String): String;
var
  lPropRec: TraPropRec;
  lsStringValue: String;
  lbBooleanValue: Boolean;
  liIntegerValue: Integer;
  lSingleValue: Single;
  lDoubleValue: Double;
  lExtendedValue: Extended;
  lDateTimeValue: TDateTime;
  lEnumValue: Byte;
  lVariantValue: Variant;
  lCurrencyValue: Currency;
  lPPropInfo: PPropInfo;
begin

  GetPropRec(aObject.ClassType, aPropName, lPropRec);

  case lPropRec.DataType of

    daString:
      begin
        GetPropValue(aObject, aPropName, lsStringValue);
        Result := lsStringValue;
      end;

    daBoolean:
      begin
        GetPropValue(aObject, aPropName, lbBooleanValue);
        if lbBooleanValue then
          Result := 'True'
        else
          Result := 'False';
      end;

    daInteger, daChar:
      begin
        GetPropValue(aObject, aPropName, liIntegerValue);
        Result := IntToStr(liIntegerValue);
      end;

    daSingle:
      begin
        GetPropValue(aObject, aPropName, lSingleValue);
        Result := FloatToStrF(lSingleValue, ffGeneral, 8, 0);
      end;

    daDouble:
      begin
        GetPropValue(aObject, aPropName, lDoubleValue);
        Result := FloatToStrF(lDoubleValue, ffGeneral, 15, 0);
      end;

    daExtended:
      begin
        GetPropValue(aObject, aPropName, lExtendedValue);
        Result :=  FloatToStrF(lExtendedValue, ffGeneral, 18, 0);
      end;

    daCurrency:
      begin
        GetPropValue(aObject, aPropName, lCurrencyValue);
        Result := FloatToStrF(lCurrencyValue, ffCurrency, 15, 2);
      end;

    daDateTime:
      begin
        GetPropValue(aObject, aPropName, lDateTimeValue);
        Result := DateTimeToStr(lDateTimeValue);
      end;

    daDate:
      begin
        GetPropValue(aObject, aPropName, lDateTimeValue);
        Result := DateToStr(lDateTimeValue);
      end;

    daTime:
      begin
        GetPropValue(aObject, aPropName, lDateTimeValue);
        Result := TimeToStr(lDateTimeValue);
      end;

  { daClass: Integer(aValue) := TypInfo.GetOrdProp(aObject, apPropInfo);}

    daEnum:
        begin

          GetPropValue(aObject, aPropName, lEnumValue);

          lPPropInfo := TypInfo.GetPropInfo(aObject.ClassInfo, aPropName);

          if (lPPropInfo <> nil) then
            Result := ppGetEnumName(lPPropInfo^.PropType^, lEnumValue)
          else
            Result := '';
        end;

    daVariant:
      begin
        GetPropValue(aObject, aPropName, lVariantValue);
        Result := String(lVariantValue);
      end;

  else
    Result := '';

  end;

end; {class function, GetPropValueAsString}

{------------------------------------------------------------------------------}
{ TraRTTI.SetPropValueFromString}

class function TraRTTI.SetPropValueFromString(aObject: TObject; aPropName: String; aStringValue: String): Boolean;
var
  lPPropInfo: PPropInfo;
  lPropRec: TraPropRec;
  lbBooleanValue: Boolean;
  liIntegerValue: Integer;
  lSingleValue: Single;
  lDoubleValue: Double;
  lExtendedValue: Extended;
  lDateTimeValue: TDateTime;
  lEnumValue: Byte;
  lCurrencyValue: Currency;
begin

  GetPropRec(aObject.ClassType, aPropName, lPropRec);

  Result := True;

  try

    case lPropRec.DataType of

      daString:
        begin
          SetPropValue(aObject, aPropName, aStringValue);
        end;

      daBoolean:
        begin
          Result := (aStringValue = 'True') or
                    (aStringValue = 'False');
          if Result then
            begin
              lbBooleanValue := (aStringValue = 'True');
              SetPropValue(aObject, aPropName, lbBooleanValue);
            end;
        end;

      daInteger, daChar:
        begin
          liIntegerValue := StrToInt(aStringValue);
          SetPropValue(aObject, aPropName, liIntegerValue);
        end;

      daSingle:
        begin
          lSingleValue := StrToFloat(aStringValue);
          SetPropValue(aObject, aPropName, lSingleValue);
        end;

      daDouble:
        begin
          lDoubleValue := StrToFloat(aStringValue);
          SetPropValue(aObject, aPropName, lDoubleValue);
        end;

      daExtended:
        begin
          lExtendedValue := StrToFloat(aStringValue);
          SetPropValue(aObject, aPropName, lExtendedValue);
        end;

      daCurrency:
        begin
          lCurrencyValue := StrToCurr(aStringValue);
          SetPropValue(aObject, aPropName, lCurrencyValue);
        end;

      daDateTime:
        begin
          lDateTimeValue := ppStrToDateTime(aStringValue);
          SetPropValue(aObject, aPropName, lDateTimeValue);
        end;

      daDate:
        begin
          lDateTimeValue := StrToDate(aStringValue);
          SetPropValue(aObject, aPropName, lDateTimeValue);
        end;

      daTime:
        begin
          lDateTimeValue := StrToTime(aStringValue);
          SetPropValue(aObject, aPropName, lDateTimeValue);
        end;

    { daClass: Integer(aValue) := TypInfo.SetOrdProp(aObject, apPropInfo);}

      daEnum:
        begin

          lPPropInfo := TypInfo.GetPropInfo(aObject.ClassInfo, aPropName);

          Result := (lPPropInfo <> nil);

          if Result then
            begin
              lEnumValue := ppGetEnumStringAsByte(lPPropInfo^.PropType^, aStringValue);
              {check for invalid enum value}
              Result := lEnumValue <> 255;
              if Result then
                SetPropValue(aObject, aPropName, lEnumValue);
            end;
        end;

      daVariant:
        begin
          SetPropValue(aObject, aPropName, aStringValue);
        end;

    else
      Result := False;

    end;

  except
    Result := False;

  end;

end; {class function, SetPropValueAsString}


{******************************************************************************
 *
 ** O B J E C T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTObjectRTTI.RefClass }

class function TraTObjectRTTI.RefClass: TClass;
begin
  Result := TObject;
end; {class function, ClassRef}

{------------------------------------------------------------------------------}
{ TraTObjectRTTI.GetPropList }

class procedure TraTObjectRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddProp('ClassName');
  aPropList.AddProp('Create');
  aPropList.AddProp('Free');

end; {class function, ClassRef}

{------------------------------------------------------------------------------}
{ TraTObjectRTTI.GetPropRec }

class function TraTObjectRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'ClassName')   =  0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'Create') = 0) then
    ConstructorToRec(aPropName, aClass, aPropRec)

  else if (CompareText(aPropName, 'Free')   =  0) then
    MethodToRec(aPropName, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTObjectRTTI.GetParams }

class function TraTObjectRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if CompareText(aMethodName, 'Create') = 0 then
    {note: Class and Result params will be added automatically by ConstructorToRec}
    Result := TraParamList.Create

  else if CompareText(aMethodName, 'ClassName') = 0 then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Result', daString, nil, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {function, GetParams}

{------------------------------------------------------------------------------}
{ TraTObjectRTTI.CallMethod }

class function TraTObjectRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lClass: TClass;
  lObject: TObject;
  lsClassName: String;
begin

  Result := True;

  if CompareText(aMethodName, 'Create') = 0 then
    begin
      lClass := aParams[0].ClassType;

      lObject := lClass.Create;

      aParams.SetParamValue(1, Integer(lObject));
    end

  else if CompareText(aMethodName, 'Free') = 0 then
    aObject.Free

  else if CompareText(aMethodName, 'ClassName') = 0 then
    begin
      lsClassName := aObject.ClassName;

      aParams.SetParamValue(0, lsClassName);
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{******************************************************************************
 *
 ** P E R S I S T E N T    R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTPersistentRTTI.CallMethod }

class function TraTPersistentRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lPersistent: TPersistent;
  lObject: TObject;
begin

  Result := True;

  lPersistent := TPersistent(aObject);

  if (CompareText(aMethodName, 'Assign') = 0) then
    begin
      aParams.GetParamValue(0, lObject);

      lPersistent.Assign(TPersistent(lObject));
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end;

class function TraTPersistentRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, 'Assign') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Source', daClass, TPersistent, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end;

class procedure TraTPersistentRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public methods}
  aPropList.AddMethod('Assign');

end;

class function TraTPersistentRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Assign') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end;

class function TraTPersistentRTTI.RefClass: TClass;
begin
  Result := TPersistent;
end;


{******************************************************************************
 *
 ** C O M P O N E N T    R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTComponentRTTI.RefClass }

class function TraTComponentRTTI.RefClass: TClass;
begin
  Result := TComponent;
end; {class function, ClassRef}

{------------------------------------------------------------------------------}
{ TraTComponentRTTI.GetPropList }

class procedure TraTComponentRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddProp('Owner');

end; {class function, GetPropList}

{------------------------------------------------------------------------------}
{ TraTComponentRTTI.GetPropRec }

class function TraTComponentRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Create') = 0) then
    ConstructorToRec(aPropName, aClass, aPropRec)

  else if (CompareText(aPropName, 'Owner') = 0) then
    ClassPropToRec(aPropName, TComponent, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTComponentRTTI.GetParams }

class function TraTComponentRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if CompareText(aMethodName, 'Create') = 0 then
    begin
      {note: Class and Result params will be added automatically by ConstructorToRec}
      Result := TraParamList.Create;

      Result.AddParam('Owner', daClass, TComponent, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {function, GetParams}

{------------------------------------------------------------------------------}
{ TraTComponentRTTI.CallMethod }

class function TraTComponentRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lClass: TClass;
  lOwner: Integer;
  lComponent: TComponent;
begin

  Result := True;

  if CompareText(aMethodName, 'Create') = 0 then
    begin
      aParams.GetParamValue(0, lOwner);

      lClass := aParams[1].ClassType;

      lComponent := TComponentClass(lClass).Create(TComponent(lOwner));

      aParams.SetParamValue(2, Integer(lComponent));
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTComponentRTTI.GetPropValue }

class function TraTComponentRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'Owner') = 0 then
    Integer(aValue) := Integer(TComponent(aObject).Owner)

  else if CompareText(aPropName, 'Tag') = 0 then
    Integer(aValue) := TComponent(aObject).Tag

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTComponentRTTI.SetPropValue }

class function TraTComponentRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Tag') = 0) then
    TComponent(aObject).Tag := Integer(aValue) 

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}

{******************************************************************************
 *
 ** R T T I  C L A S S  R E G I S T R Y
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraRTTIClassRegistry.Lock }

class procedure TraRTTIClassRegistry.Lock;
begin
  EnterCriticalSection(uRegistryLock);

end; {class function, Lock}

{------------------------------------------------------------------------------}
{ TraRTTIClassRegistry.UnLock }

class procedure TraRTTIClassRegistry.UnLock;
begin
  LeaveCriticalSection(uRegistryLock);

end; {class function, UnLock}

{------------------------------------------------------------------------------}
{ TraRTTIClassRegistry.Register }

class procedure TraRTTIClassRegistry.Register(aRTTIClass: TraRTTIClass);
begin

  if (uRTTIClasses = nil) then
    Initialize;

  Lock;

  try
    AddClass(aRTTIClass);

  finally
    UnLock;

  end;

end; {class function, Register}

{------------------------------------------------------------------------------}
{ TraRTTIClassRegistry.UnRegister }

class procedure TraRTTIClassRegistry.UnRegister(aRTTIClass: TraRTTIClass);
begin

  if (uRTTIClasses <> nil) then
    begin
      Lock;

      try
        RemoveClass(aRTTIClass);

      finally
        UnLock;

      end;

    end;

end; {class function, UnRegister}

{------------------------------------------------------------------------------}
{ TraRTTIClassRegistry.AddClass }

class procedure TraRTTIClassRegistry.AddClass(aRTTIClass: TraRTTIClass);
var
  liIndex: Integer;
begin

  liIndex := uRTTIClasses.Indexof(aRTTIClass.RefClass.ClassName);

  if liIndex < 0 then
    begin
      RegisterClass(aRTTIClass);
      uRTTIClasses.AddObject(aRTTIClass.RefClass.ClassName, TObject(aRTTIClass));
    end;

end; {class function, AddFunction}

{------------------------------------------------------------------------------}
{ TraRTTIClassRegistry.RemoveFunction }

class procedure TraRTTIClassRegistry.RemoveClass(aRTTIClass: TraRTTIClass);
var
  liIndex: Integer;
  lRTTIClass: TraRTTIClass;
begin

  liIndex := uRTTIClasses.Indexof(aRTTIClass.RefClass.ClassName);

  if liIndex >= 0 then
    begin
      lRTTIClass := TraRTTIClass(uRTTIClasses.Objects[liIndex]);

      UnRegisterClass(lRTTIClass);

      uRTTIClasses.Delete(liIndex);
    end;

end; {class function, RemoveFunction}

{------------------------------------------------------------------------------}
{ TraRTTIClassRegistry.Initialize }

class procedure TraRTTIClassRegistry.Initialize;
begin

  if (uRTTIClasses = nil) then
    begin

      InitializeCriticalSection(uRegistryLock);

      Lock;

      try
        uRTTIClasses := TStringList.Create;

      finally
        UnLock;

      end;
      
  end;

end;

{------------------------------------------------------------------------------}
{ TraRTTIClassRegistry.Finalize }

class procedure TraRTTIClassRegistry.Finalize;
begin

  if (uRTTIClasses <> nil) then
    begin
      Lock;

      try
        uRTTIClasses.Free;
        uRTTIClasses := nil;

      finally
        UnLock;
        DeleteCriticalSection(uRegistryLock);

      end;
  end;

end;

{------------------------------------------------------------------------------}
{ TraRTTIClassRegistry.GetClass }

class function TraRTTIClassRegistry.GetClass(const aClassName: String): TClass;
var
  liIndex: Integer;
  lRTTIClass: TraRTTIClass;
begin

  {try Delphi first}
  Result := Classes.GetClass(aClassName);

  if (Result <> nil) then Exit;

  Lock;

  try

    liIndex := uRTTIClasses.IndexOf(aClassname);

    {look for class in our internal list}
    if (liIndex <> -1) then
      begin
        lRTTIClass := TraRTTIClass(uRTTIClasses.Objects[liIndex]);

        Result := lRTTIClass.RefClass;
      end;

  finally
    UnLock;

  end;

end;

{------------------------------------------------------------------------------}
{ TraRTTIClassRegistry.GetClass }

class function TraRTTIClassRegistry.GetRTTIClass(aClassType: TClass): TraRTTIClass;
var
  liIndex: Integer;
  lRTTIClass: TraRTTIClass;
begin

  Lock;

  try

    Result := nil;

    liIndex := uRTTIClasses.IndexOf(aClassType.ClassName);

    {look for class in our internal list}
    if (liIndex <> -1) then
      Result := TraRTTIClass(uRTTIClasses.Objects[liIndex])

    else
      begin
        liIndex := 0;

        while (liIndex < uRTTIClasses.Count) do
          begin
            lRTTIClass := TraRTTIClass(uRTTIClasses.Objects[liIndex]);

            if aClassType.InheritsFrom(lRTTIClass.RefClass) then
              begin
                if (Result = nil) or (lRTTIClass.InheritsFrom(Result)) then
                  Result := lRTTIClass;
              end;

            Inc(liIndex);
          end;
      end;

  finally
    UnLock;

  end;

end;

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}


initialization

  TraRTTIClassRegistry.Initialize;

  raRegisterRTTI(TraTObjectRTTI);
  raRegisterRTTI(TraTComponentRTTI);

finalization

  raUnRegisterRTTI(TraTObjectRTTI);
  raUnRegisterRTTI(TraTComponentRTTI);

  TraRTTIClassRegistry.Finalize;

end.

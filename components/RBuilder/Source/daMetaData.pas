{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit daMetaData;

interface

{$I ppIfDef.pas}

uses
  Classes,
  ppComm, ppDB, ppDsgnDB, ppUtils, ppTypes,
  daDB;

type

  TdaMetaData = class;
  TdaMetaCache = class;
  TdaMetaTable = class;
  TdaMetaField = class;


  { TdaMetaData

    All queries submitted to the database pass-thru this class, which maintains
    table, field and join information in memory.  When a data dictionary is being
    used, this class retrieves the data from the data dictionary tables.
    When a data dictionary is not being used, this class retrieves the data
    directly from the database.  Once field and table information is retrieved,
    it is stored in objects, so that subsequent requests for the same information
    can be quickly granted. }

  TdaMetaData = class(TppCommunicator)
    private
      FCache: TdaMetaCache;
      FDatabaseName: String;
      FSessionClassName: String;
      FDataDictionary: TppDataDictionary;
      FSession: TdaSession;

      function CreateMetaFieldFromDataSetField(aDataSetField: TppField): TdaMetaField;
      function FindField(aFieldName: String; aFields: TList): TdaMetaField;
      procedure GetFieldsFromDataSet(aMetaTable: TdaMetaTable; aFields: TList);
      procedure GetFieldLengthsFromDataSet(aMetaTable: TdaMetaTable; aFields: TList);
      procedure GetFieldNamesFromDataSet(aMetaTable: TdaMetaTable; aFields: TStrings);
      procedure GetFieldsFromDataDictionary(aMetaTable: TdaMetaTable; aFields: TList);
      function GetTable(aIndex: Integer): TdaMetaTable;
      function GetTableCount: Integer;
      procedure GetTablesFromSession(aTables: TList);
      procedure GetTableNamesFromSession(aTables: TStrings);
      procedure GetTablesFromDataDictionary(aTables: TList);
      procedure PopulateCache;
      procedure SetDatabaseName(aDatabaseName: String);
      procedure SetDataDictionary(aDataDictionary: TppDataDictionary);
      procedure SetSession(aSession: TdaSession);
      procedure ValidateFieldNames(aMetaTable: TdaMetaTable; aFields: TList);
      procedure ValidateTableNames(aTables: TList);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      procedure Clear;
      procedure GetFields(aTableName, aSQLTableName: String; aFields: TList);
      function GetMaxFieldAliasLength(aRawTableName: String): Integer;
      function GetTableAlias(aRawTableName: String): String;
      procedure GetTables(aTables: TList);

      property DatabaseName: String read FDatabaseName write SetDatabaseName;
      property DataDictionary: TppDataDictionary read FDataDictionary write SetDataDictionary;
      property SessionClassName: String read FSessionClassName;
      property Session: TdaSession read FSession write SetSession;

      property Tables[Index: Integer]: TdaMetaTable read GetTable;
      property TableCount: Integer read GetTableCount;

  end; {class, TdaMetaData}


  { TdaMetaCache

    Holds references to all instantiated objects which make up the meta data
    information }

  TdaMetaCache = class
    private
      FActive: Boolean;
      FTables: TList;
      FPopulated: Boolean;
      FDataDictionary: TppDataDictionary;

      procedure FreeTables;
      function GetTable(aIndex: Integer): TdaMetaTable;
      function GetTableCount: Integer;

    public
      constructor Create;
      destructor Destroy; override;

      procedure Clear;
      function GetTableForName(aTableName: String): TdaMetaTable;
      procedure GetTables(aTables: TList);
      procedure SetTables(aTables: TList);

      property Active: Boolean read FActive write FActive;
      property DataDictionary: TppDataDictionary read FDataDictionary write FDataDictionary;
      property Populated: Boolean read FPopulated;
      property Tables[Index: Integer]: TdaMetaTable read GetTable;
      property TableCount: Integer read GetTableCount;

  end; {class, TdaMetaCache}


  { TdaMetaTable

    Stores information for a given table }

  TdaMetaTable = class
    private
      FAlias: String;
      FFields: TList;
      FFileBased: Boolean;
      FMaxFieldAliasLength: Integer;
      FName: String;
      FOwnerName: String;
      FPopulated: Boolean;
      FSQLName: String;

      procedure FreeFields;
      function GetField(aIndex: Integer): TdaMetaField;
      function GetFieldCount: Integer;

    public
      constructor Create;
      destructor Destroy; override;

      procedure GetFields(aFields: TList);
      procedure SetFields(aFields: TList);
      function GetRawTableName: String;

      property Alias: String read FAlias write FAlias;
      property FileBased: Boolean read FFileBased write FFileBased;
      property MaxFieldAliasLength: Integer read FMaxFieldAliasLength write FMaxFieldAliasLength;
      property Name: String read FName write FName;
      property OwnerName: String read FOwnerName write FOwnerName;
      property SQLName: String read FSQLName write FSQLName;
      property Populated: Boolean read FPopulated;

      property Fields[Index: Integer]: TdaMetaField read GetField;
      property FieldCount: Integer read GetFieldCount;

  end; {class, TdaMetaTable}


  { TdaMetaField

    Stores information for a given field }

  TdaMetaField = class
    private
      FAlias: String;
      FAutoSearch: Boolean;
      FDataType: TppDataType;
      FDisplayFormat: String;
      FDisplayWidth: Integer;
      FName: String;
      FLength: Integer;
      FMandatory: Boolean;
      FSearchable: Boolean;
      FSelectable: Boolean;
      FSortable: Boolean;

    public
      constructor Create;
      destructor Destroy; override;

      property Alias: String read FAlias write FAlias;
      property AutoSearch: Boolean read FAutoSearch write FAutoSearch;
      property DataType: TppDataType read FDataType write FDataType;
      property DisplayFormat: String read FDisplayFormat write FDisplayFormat;
      property DisplayWidth: Integer read FDisplayWidth write FDisplayWidth;
      property Name: String read FName write FName;
      property Length: Integer read FLength write FLength;
      property Mandatory: Boolean read FMandatory write FMandatory;
      property Searchable: Boolean read FSearchable write FSearchable;
      property Selectable: Boolean read FSelectable write FSelectable;
      property Sortable: Boolean read FSortable write FSortable;

  end; {class, TdaMetaField}

implementation

uses
  SysUtils;

{*******************************************************************************
 *
 ** M E T A D A T A
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaMetaData.Create }

constructor TdaMetaData.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FCache := TdaMetaCache.Create;
  FDatabaseName := '';
  FDataDictionary := nil;
  FSessionClassName := '';
  FSession := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaMetaData.Destroy }

destructor TdaMetaData.Destroy;
begin

  FCache.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaMetaData.Notify }

procedure TdaMetaData.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation = ppopRemove) and (aCommunicator = FDataDictionary) then
    FDataDictionary := nil

  else if (aOperation = ppopRemove) and (aCommunicator = FSession) then
    FSession := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TdaMetaData.Clear }

procedure TdaMetaData.Clear;
begin
  FCache.Clear;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TdaMetaData.SetDatabaseName }

procedure TdaMetaData.SetDatabaseName(aDatabaseName: String);
begin

  if (FDatabaseName = aDatabaseName) then Exit;

  FDatabaseName := aDatabaseName;
  FCache.Clear;

end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TdaMetaData.SetDataDictionary }

procedure TdaMetaData.SetDataDictionary(aDataDictionary: TppDataDictionary);
begin

  if (FDataDictionary = aDataDictionary) then Exit;

  if (FDataDictionary <> nil) then
    FDataDictionary.RemoveNotify(Self);

  FDataDictionary := aDataDictionary;
  FCache.DataDictionary := aDataDictionary;
//  FCache.Clear;

  if (FDataDictionary <> nil) then
    FDataDictionary.AddNotify(Self);

end; {procedure, SetDataDictionary}

{------------------------------------------------------------------------------}
{ TdaMetaData.SetSession }

procedure TdaMetaData.SetSession(aSession: TdaSession);
begin

  if (FSession = aSession) then Exit;

  if (FSession <> nil) then
    FSession.RemoveNotify(Self);

  FSession := aSession;

  if (FSession <> nil) then
    begin
      FSession.AddNotify(Self);

      if (FSessionClassName <> FSession.ClassName) then
        begin
          FCache.Clear;
          FSessionClassName := FSession.ClassName;
        end;

    end;

end; {procedure, SetSession}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetTable }

function TdaMetaData.GetTable(aIndex: Integer): TdaMetaTable;
begin
  if (FCache.Active) and not(FCache.Populated) then
    PopulateCache;

  Result := FCache.Tables[aIndex];
end; {function, GetTable}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetTableCount }

function TdaMetaData.GetTableCount: Integer;
begin
  if (FCache.Active) and not(FCache.Populated) then
    PopulateCache;

  Result := FCache.TableCount;
end; {function, GetTableCount}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetTables }

procedure TdaMetaData.GetTables(aTables: TList);
begin

  if (FCache.Active) and (FCache.Populated) then
    FCache.GetTables(aTables)

  else if (FDataDictionary = nil) then
    begin
      GetTablesFromSession(aTables);

      FCache.SetTables(aTables);
    end

  else if (FDataDictionary <> nil) then
    begin
      GetTablesFromDataDictionary(aTables);

      if (FDataDictionary.ValidateTableNames) then
        ValidateTableNames(aTables);

      FCache.SetTables(aTables);
    end;

end; {procedure, GetTables}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetMaxFieldAliasLength }

function TdaMetaData.GetMaxFieldAliasLength(aRawTableName: String): Integer;
var
  liIndex: Integer;
  lTable: TdaMetaTable;
begin

  Result := 0;
  liIndex := 0;

  while (Result = 0) and (liIndex < TableCount) do
    begin

      lTable := Tables[liIndex];

      if (CompareText(lTable.GetRawTableName, aRawTableName) = 0) then
        Result := lTable.MaxFieldAliasLength
      else
        Inc(liIndex);

    end;

  { Default is 25 - if we didn't find the table for some reason, Result will
    still be 0 so correct that. }
  if (Result = 0) then
    Result := 25;

end; {function, GetMaxFieldAliasLength}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetTableAlias }

function TdaMetaData.GetTableAlias(aRawTableName: String): String;
var
  liIndex: Integer;
  lTable: TdaMetaTable;
begin

  Result := '';
  liIndex := 0;

  while (Result = '') and (liIndex < TableCount) do
    begin

      lTable := Tables[liIndex];

      if (CompareText(lTable.GetRawTableName, aRawTableName) = 0) then
        Result := lTable.Alias
      else
        Inc(liIndex);

    end;

end; {function, GetTableAlias}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetTablesFromDataDictionary }

procedure TdaMetaData.GetTablesFromDataDictionary(aTables: TList);
var
  lTableAliases: TStrings;
  lTableNames: TStrings;
  liIndex: Integer;
  lTable: TdaMetaTable;
  lsRawTableName: String;
  lsTableName: String;
  lsExtension: String;
  lbFileBased: Boolean;
  lDataSet: TdaDataSet;
begin
  
  aTables.Clear;

  lTableNames := TStringList.Create;
  lTableAliases := TStringList.Create;
  
  FDataDictionary.GetTableNames(lTableNames, lTableAliases);
  
  for liIndex := 0 to lTableNames.Count - 1 do
    begin
      lTable := TdaMetaTable.Create;

      lTable.Alias := lTableAliases[liIndex];

      lsRawTableName := lTableNames[liIndex];

      ppStripOffTableName(lsRawTableName, lsTableName, lsExtension, lbFileBased);

      if (lbFileBased) then
        lTable.Name := lsTableName + '.' + lsExtension
      else
        begin
          lTable.OwnerName := lsExtension;
          lTable.Name := lsTableName;
        end;

      lTable.FileBased := lbFileBased;

      {get max length of a SQL field alias}
      lDataSet := FSession.CreateDataSet(Self, FDatabaseName);

      try
        lDataSet.DataName := lsRawTableName;

        lTable.MaxFieldAliasLength := lDataSet.GetMaxFieldAliasLength;
      finally
        lDataSet.Free;
      end;

      aTables.Add(lTable);
    end;

  lTableAliases.Free;
  lTableNames.Free;

end; {procedure, GetTablesFromDataDictionary}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetTablesFromSession }

procedure TdaMetaData.GetTablesFromSession(aTables: TList);
var
  lTableNames: TStrings;
  liIndex: Integer;
  lTable: TdaMetaTable;
  lsRawTableName: String;
  lsTableName: String;
  lsTableAlias: String;
  lsExtension: String;
  lbFileBased: Boolean;
  lDataSet: TdaDataSet;
begin

  lTableNames := TStringList.Create;

  FSession.GetTableNames(FDatabaseName, lTableNames);

  for liIndex := 0 to lTableNames.Count - 1 do
    begin
      lTable := TdaMetaTable.Create;

      lsRawTableName := lTableNames[liIndex];

      ppStripOffTableName(lsRawTableName, lsTableName, lsExtension, lbFileBased);

      lsTableAlias := lsTableName;

      if (lbFileBased) then
        lTable.Name := lsTableName + '.' + lsExtension
      else
        begin
          lTable.OwnerName := lsExtension;
          lTable.Name := lsTableName;
        end;

      lTable.Alias := lsTableAlias;
      lTable.FileBased := lbFileBased;

      {get max length of a SQL field alias}
      lDataSet := FSession.CreateDataSet(Self, FDatabaseName);

      try
        lDataSet.DataName := lsRawTableName;

        lTable.MaxFieldAliasLength := lDataSet.GetMaxFieldAliasLength;
      finally
        lDataSet.Free;
      end;

      aTables.Add(lTable);
    end;

  lTableNames.Free;

end; {procedure, GetTablesFromSession}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetTableNamesFromSession }

procedure TdaMetaData.GetTableNamesFromSession(aTables: TStrings);
var
  lTables: TList;
  liIndex: Integer;
  lTable: TdaMetaTable;
begin

  lTables := TList.Create;

  GetTablesFromSession(lTables);

  aTables.Clear;

  for liIndex := 0 to lTables.Count - 1 do
    begin
      lTable := TdaMetaTable(lTables[liIndex]);

      aTables.AddObject(lTable.Name, lTable);
    end;

  lTables.Free;

end; {procedure, GetTableNamesFromSession}

{------------------------------------------------------------------------------}
{ TdaMetaData.ValidateTableNames }

procedure TdaMetaData.ValidateTableNames(aTables: TList);
var
  lSessionTables: TStrings;
  liIndex: Integer;
  lDataDictTable: TdaMetaTable;
  liPosition: Integer;
  lSessionTable: TdaMetaTable;
begin

  lSessionTables := TStringList.Create;

  GetTableNamesFromSession(lSessionTables);

  liIndex := 0;

  while (liIndex < aTables.Count) do
    begin
      lDataDictTable := TdaMetaTable(aTables[liIndex]);

      liPosition := lSessionTables.IndexOf(lDataDictTable.Name);

      if (liPosition = -1) then
        begin
          lDataDictTable.Free;
          aTables.Delete(liIndex);
        end

      else
        begin
          lSessionTable := TdaMetaTable(lSessionTables.Objects[liPosition]);

          lDataDictTable.FileBased := lSessionTable.FileBased;
          lDataDictTable.OwnerName := lSessionTable.OwnerName;

          Inc(liIndex);
        end;

    end;

  lSessionTables.Free;

end; {procedure, ValidateTableNames}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetFields }

procedure TdaMetaData.GetFields(aTableName, aSQLTableName: String; aFields: TList);
var
  lTable: TdaMetaTable;
begin

  if (FCache.Active) and not(FCache.Populated) then
    PopulateCache;

  if (FCache.Active) then
    begin
      if ((FDataDictionary <> nil) and (FDataDictionary.UseTableOwnerName)) then
        lTable := FCache.GetTableForName(aSQLTableName)
      else
        lTable := FCache.GetTableForName(aTableName);
    end
  else
    lTable := nil;

  if (lTable = nil) then
    raise EDesignError.Create('TdaMetaCache.GetFields: unable to find table ' +  aTableName + ' in cache.');


  if (lTable.Populated) then
    lTable.GetFields(aFields)

  else if (FDataDictionary = nil) then
    begin
      lTable.SQLName := aSQLTableName;

      GetFieldsFromDataSet(lTable, aFields);

      lTable.SetFields(aFields);
    end

  else if (FDataDictionary <> nil) then
    begin
      lTable.SQLName := aSQLTableName;

      GetFieldsFromDataDictionary(lTable, aFields);

      if (FDataDictionary.ValidateFieldNames) then
        ValidateFieldNames(lTable, aFields);

      lTable.SetFields(aFields);
    end;

end; {procedure, GetFields}

{------------------------------------------------------------------------------}
{ TdaMetaData.PopulateCache }

procedure TdaMetaData.PopulateCache;
var
  lTables: TList;
begin

  {calling GetTables populates the cache}
  lTables := TList.Create;

  GetTables(lTables);

  lTables.Free;

end; {procedure, PopulateCache}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetFieldsFromDataSet }

procedure TdaMetaData.GetFieldsFromDataSet(aMetaTable: TdaMetaTable; aFields: TList);
var
  lDataSet: TdaDataSet;
  lDataSetField: TppField;
  liIndex: Integer;
  lField: TdaMetaField;
begin

  aFields.Clear;

  lDataSet := FSession.CreateDataSet(Self, FDatabaseName);
  lDataSet.DataName := aMetaTable.SQLName;

  try
    lDataSet.Active := True;
  except
    raise EDataError.Create('TdaMetaData.GetFieldsFromDataSet: Unable to open dataset: ' + aMetaTable.SQLName);
  end;

  for liIndex := 0 to lDataSet.FieldCount - 1 do
    begin
      lDataSetField := lDataSet.Fields[liIndex];

      lField := CreateMetaFieldFromDataSetField(lDataSetField);

      {only set alias if it is blank or has the same value as the field name}
      if (lField.Alias = '') or (lField.Alias = lDataSetField.FieldName) then
        lField.Alias := lDataSetField.FieldName;

      aFields.Add(lField);
    end;

  lDataSet.Active := False;

  lDataSet.Free;

end; {procedure, GetFieldsFromDataSet}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetFieldNamesFromDataSet }

procedure TdaMetaData.GetFieldNamesFromDataSet(aMetaTable: TdaMetaTable; aFields: TStrings);
var
  lFields: TList;
  liIndex: Integer;
  lField: TdaMetaField;
begin

  lFields := TList.Create;

  GetFieldsFromDataSet(aMetaTable, lFields);

  aFields.Clear;

  for liIndex := 0 to lFields.Count - 1 do
    begin
      lField := TdaMetaField(lFields[liIndex]);

      aFields.AddObject(lField.Name, lField);
    end;

  lFields.Free;

end; {procedure, GetFieldNamesFromDataSet}

{------------------------------------------------------------------------------}
{ TdaMetaData.GetFieldsFromDataDictionary }

procedure TdaMetaData.GetFieldsFromDataDictionary(aMetaTable: TdaMetaTable; aFields: TList);
var
  liIndex: Integer;
  lDataSetField: TppField;
  lField: TdaMetaField;
begin

  aFields.Clear;

  if (FDataDictionary.UseTableOwnerName) and not(aMetaTable.FileBased) then
    begin
      if (Length(aMetaTable.OwnerName) > 0) then
        FDataDictionary.TableName := aMetaTable.OwnerName + '.' + aMetaTable.Name
      else
        FDataDictionary.TableName := aMetaTable.Name;
    end

  else
    FDataDictionary.TableName := aMetaTable.Name;

  for liIndex := 0 to FDataDictionary.FieldCount - 1 do
    begin
      lDataSetField := FDataDictionary.Fields[liIndex];

      lField := CreateMetaFieldFromDataSetField(lDataSetField);

      aFields.Add(lField);
    end;

  GetFieldLengthsFromDataSet(aMetaTable, aFields);

end; {procedure, GetFieldsFromDataDictionary}


{------------------------------------------------------------------------------}
{ TdaMetaData.GetFieldLengthsFromDataSet }

procedure TdaMetaData.GetFieldLengthsFromDataSet(aMetaTable: TdaMetaTable; aFields: TList);
var
  liIndex: Integer;
  lDataSet: TdaDataSet;
  lDataSetField: TppField;
  lField: TdaMetaField;
begin

  lDataSet := FSession.CreateDataSet(Self, FDatabaseName);
  lDataSet.DataName := aMetaTable.SQLName;

  try
    lDataSet.Active := True;
  except
    raise EDataError.Create('TdaMetaData.GetFieldLengthsFromDataSet: Unable to open dataset: ' + aMetaTable.SQLName);
  end;

  for liIndex := 0 to lDataSet.FieldCount - 1 do
    begin
      lDataSetField := lDataSet.Fields[liIndex];

      lField := FindField(lDataSetField.FieldName, aFields);

      if (lField <> nil) then
        begin
          lField.DisplayWidth := lDataSetField.FieldLength;
          lField.Length := lDataSetField.FieldLength;
        end;
    end;

  lDataSet.Active := False;

  lDataSet.Free;

end; {procedure, GetFieldLengthsFromDataSet}

{------------------------------------------------------------------------------}
{ TdaMetaData.FindField }

function TdaMetaData.FindField(aFieldName: String; aFields: TList): TdaMetaField;
var
  lField: TdaMetaField;
  liIndex: Integer;
begin

  Result := nil;
  liIndex := 0;
  
  while (Result = nil) and (liIndex < aFields.Count) do
    begin
      lField := TdaMetaField(aFields[liIndex]);

      if (CompareText(lField.Name, aFieldName) = 0) then
        Result := lField
      else
        Inc(liIndex);
    end;

end; {procedure, FindField}

{------------------------------------------------------------------------------}
{ TdaMetaData.CreateMetaFieldFromDataSetField }

function TdaMetaData.CreateMetaFieldFromDataSetField(aDataSetField: TppField): TdaMetaField;
begin

  Result := TdaMetaField.Create;

  Result.Alias := aDataSetField.FieldAlias;
  Result.AutoSearch := aDataSetField.AutoSearch;
  Result.DataType := aDataSetField.DataType;
  Result.DisplayFormat := aDataSetField.DisplayFormat;
  Result.DisplayWidth := aDataSetField.DisplayWidth;
  Result.Name := aDataSetField.FieldName;
  Result.Length := aDataSetField.FieldLength;
  Result.Mandatory := aDataSetField.Mandatory;
  Result.Selectable := aDataSetField.Selectable;
  Result.Searchable := aDataSetField.Searchable;
  Result.Sortable := aDataSetField.Sortable;

end; {function, CreateMetaFieldFromDataSetField}

{------------------------------------------------------------------------------}
{ TdaMetaData.ValidateFieldNames }

procedure TdaMetaData.ValidateFieldNames(aMetaTable: TdaMetaTable; aFields: TList);
var
  lDataSetFields: TStrings;
  liIndex: Integer;
  lDataDictField: TdaMetaField;
  liPosition: Integer;
  lDataSetField: TdaMetaField;
begin

  lDataSetFields := TStringList.Create;

  GetFieldNamesFromDataSet(aMetaTable, lDataSetFields);

  liIndex := 0;

  while (liIndex < lDataSetFields.Count) do
    begin
      if liIndex < aFields.Count then
        begin
          lDataDictField := TdaMetaField(aFields[liIndex]);
          liPosition := lDataSetFields.IndexOf(lDataDictField.Name);
        end
      else
        begin
          lDataDictField := nil;
          liPosition := -1;
        end;

      if (liPosition = -1) then
        begin
          if lDataDictField <> nil then
            aFields.Delete(liIndex);
          lDataDictField.Free;
        end

      else
        begin
          lDataSetField := TdaMetaField(lDataSetFields.Objects[liPosition]);

          lDataDictField.DisplayWidth := lDataSetField.Length;
          lDataDictField.Length := lDataSetField.Length;

        end;

      Inc(liIndex);

    end;

  lDataSetFields.Free;

end; {procedure, ValidateFieldNames}

{*******************************************************************************
 *
 ** M E T A   C A C H E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaMetaCache.Create }

constructor TdaMetaCache.Create;
begin

  inherited Create;

  FActive := True;
  FDataDictionary := nil;
  FTables := TList.Create;
  FPopulated := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaMetaCache.Destroy }

destructor TdaMetaCache.Destroy;
begin

  FreeTables;
  FTables.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaMetaCache.Clear }

procedure TdaMetaCache.Clear;
begin

  FreeTables;

  FPopulated := False;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TdaMetaCache.FreeTables }

procedure TdaMetaCache.FreeTables;
var
  liIndex: Integer;
begin

  for liIndex := 0 to FTables.Count - 1 do
    TdaMetaTable(FTables[liIndex]).Free;

  FTables.Clear;

end; {procedure, FreeTables}

{------------------------------------------------------------------------------}
{ TdaMetaCache.GetTable }

function TdaMetaCache.GetTable(aIndex: Integer): TdaMetaTable;
begin
  Result := TdaMetaTable(FTables[aIndex]);
end; {function, GetTable}

{------------------------------------------------------------------------------}
{ TdaMetaCache.GetTableCount }

function TdaMetaCache.GetTableCount: Integer;
begin
  Result := FTables.Count
end; {function, GetTableCount}

{------------------------------------------------------------------------------}
{ TdaMetaCache.GetTables }

procedure TdaMetaCache.GetTables(aTables: TList);
var
  liIndex: Integer;
begin

  aTables.Clear;

  for liIndex := 0 to FTables.Count - 1 do
    aTables.Add(FTables[liIndex]);

end; {function, GetTables}

{------------------------------------------------------------------------------}
{ TdaMetaCache.SetTables }

procedure TdaMetaCache.SetTables(aTables: TList);
var
  liIndex: Integer;
begin

  FreeTables;

  for liIndex := 0 to aTables.Count - 1 do
    FTables.Add(aTables[liIndex]);

  FPopulated := True;

end; {function, SetTables}

{------------------------------------------------------------------------------}
{ TdaMetaCache.GetTableForName }

function TdaMetaCache.GetTableForName(aTableName: String): TdaMetaTable;
var
  liIndex: Integer;
  lTable: TdaMetaTable;
  lsTableName: String;
begin

  Result := nil;
  liIndex := 0;

  while (Result = nil) and (liIndex < FTables.Count) do
    begin
      lTable := Tables[liIndex];

      if (FDataDictionary <> nil) and (FDataDictionary.UseTableOwnerName) then
        lsTableName := lTable.OwnerName + '.' + lTable.Name
      else
        lsTableName := lTable.Name;

      if (CompareText(lsTableName, aTableName) = 0) then
        Result := lTable
      else
        Inc(liIndex);
    end;

end; {function, GetTableForName}

{*******************************************************************************
 *
 ** M E T A   T A B L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaMetaTable.Create }

constructor TdaMetaTable.Create;
begin

  inherited Create;

  FAlias := '';
  FFields := TList.Create;
  FFileBased := False;
  FMaxFieldAliasLength := -1;
  FName := '';
  FOwnerName := '';
  FPopulated := False;
  FSQLName := '';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaMetaTable.Destroy }

destructor TdaMetaTable.Destroy;
begin

  FreeFields;

  FFields.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaMetaTable.FreeFields }

procedure TdaMetaTable.FreeFields;
var
  liIndex: Integer;
begin

  for liIndex := 0 to FFields.Count - 1 do
    TdaMetaField(FFields[liIndex]).Free;

end; {procedure, FreeFields}

{------------------------------------------------------------------------------}
{ TdaMetaTable.GetField }

function TdaMetaTable.GetField(aIndex: Integer): TdaMetaField;
begin
  Result := TdaMetaField(FFields[aIndex]);
end; {function, GetField}

{------------------------------------------------------------------------------}
{ TdaMetaTable.GetFieldCount }

function TdaMetaTable.GetFieldCount: Integer;
begin
  Result := FFields.Count
end; {function, GetFieldCount}

{------------------------------------------------------------------------------}
{ TdaMetaTable.GetFields }

procedure TdaMetaTable.GetFields(aFields: TList);
var
  liIndex: Integer;
begin

  aFields.Clear;

  for liIndex := 0 to FFields.Count - 1 do
    aFields.Add(FFields[liIndex]);

end; {function, GetFields}

{------------------------------------------------------------------------------}
{TdaMetaTable.GetRawTableName}

function TdaMetaTable.GetRawTableName: String;
begin
  if (Length(FOwnerName) > 0) then
    Result := FOwnerName + '.' + FName
  else
    Result := FName;
end; {function, GetRawTableName}

{------------------------------------------------------------------------------}
{ TdaMetaTable.SetFields }

procedure TdaMetaTable.SetFields(aFields: TList);
var
  liIndex: Integer;
begin

  FreeFields;

  for liIndex := 0 to aFields.Count - 1 do
    FFields.Add(aFields[liIndex]);

  FPopulated := True;

end; {function, SetFields}

{*******************************************************************************
 *
 ** M E T A   F I E L D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaMetaField.Create }

constructor TdaMetaField.Create;
begin

  inherited Create;

  FAlias := '';
  FAutoSearch := False;
  FDataType := dtNotKnown;
  FDisplayFormat := '';
  FDisplayWidth := 0;
  FName := '';
  FLength := 0;
  FMandatory := False;
  FSearchable := False;
  FSelectable := False;
  FSortable := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaMetaField.Destroy }

destructor TdaMetaField.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}


end.



{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2005                    BBBBB   }

unit ppASField;

interface

uses
  Classes, SysUtils, Graphics,
  ppTypes, ppUtils, ppComm, ppRelatv, ppRTTI;



type

  TppAutoSearchField = class;

  
  {IppAutoSearchFields

  Extract this interface from a TppProducer in order to access the autosearch
  fields. This is used in background printing in order to support autosearch
  without having to check the TppReport class type.}

  IppAutosearchFields = interface
    ['{B33DCD29-8809-4CAB-893B-C4776B75AEA3}']
    function iAutoSearchFieldCount: Integer;
    function iAutosearchFieldForIndex(aIndex: Integer): TppAutosearchField;
    function iCreateAutoSearchCriteria(const aDataPipelineName, aFieldName: String; aOperator: TppSearchOperatorType; const aExpression: String; aMandatory: Boolean): TppAutoSearchField;
    function iCreateAutoSearchField(const aTableName, aFieldName, aFieldAlias: String; aDataType: TppDataType; aOperator: TppSearchOperatorType; const aExpression: String; aMandatory: Boolean): TppAutoSearchField;
  end;

  
  {@TppAutoSearchField

    AutoSearch fields are used by ReportBuilder to store a search criteria
    value for a given field.  These components are usually created via the
    CreateAutoSearchField method of the report and can be accessed via the
    AutoSearchFields array property of the report.  AutoSearch fields are most
    commonly used in conjunction with the AutoSearch dialog, though they can
    also used to provide search criteria values to a report where the
    AutoSearch dialog is not displayed. For more on this capability, see
    AutoSearchFields.

    The AutoSearch field component contains a search criteria value in the 
    SearchExpression property, an operator in the SearchOperator property and
    the field to which the search expression applies in the FieldName
    property.  These properties are used to store the default value of the
    search criteria as well as values entered via AutoSearch dialog by the
    user.

    Once an AutoSearchField component contains a search criteria value, there 
    are several properties which assist in building a search expression string
    which is valid in the context of either a Table.Filter property, an SQL
    'WHERE' clause or SQL parameters.

    In order to create search expressions appropriate for an SQL 'WHERE'
    clause, use the Wildcard, Delimiter and DisplayFormat properties and
    retrieve the search expression from the SQLString function.

    To build search expressions suitable for the Table.Filter property use the
    Wildcard, Delimiter and DisplayFormat properties and retrieve the search
    expression from the FilterString function.

    And in order to assign search values to the parameters in a TQuery, use
    the Wildcard property and retrieve the search values using the Value or
    Values functions.

    An example for each of these techniques is provided in the
    ...\\RBuilder\\Demos\\5. AutoSearch directory.}

  {@TppAutoSearchField.AutoSearchPanel

    The AutoSearchPanel which has been created to represent the field in the
    AutoSearch dialog.  This property is only assigned while the AutoSearch
    dialog is displayed.}

  {@TppAutoSearchField.Criteria

    When an AutoSearch field has been created by a query dataview in the data
    workspace, then this property contains a pointer to the actual criteria
    object the field represents.  This property is used by the query dataview
    when assigning the results of AutoSearch entries to the criteria within the
    SQL object.}

  {@TppAutoSearchField.DataView

    When the AutoSearchField is created by a dataview in the data workspace,
    this property is assigned by the dataview.  The AutoSearchNotebook uses the
    dataview property to distinguish between AutoSearch fields from different
    dataviews.}

  {@TppAutoSearchField.Delimiter

    Indicates the delimiter that should be used when building a FilterString or
    SQLString for a search field with a DataType of dtString.}

  {@TppAutoSearchField.ParentControl

    This property contains the parent control to be used when instantiating the
    AutoSearchPanel for the field.  The AutoSearch dialog assigns this property
    when creating the AutoSearchPanels.  This property has a value only while
    the AutoSearchDialog is visible.}

  {@TppAutoSearchField.SearchExpression

    Specifies the search value or values that will be used along with the
    SearchOperator and FieldName to define a search condition that is
    applied to a SQL 'WHERE' clause.}

  {@TppAutoSearchField.SearchOperator

    The SearchOperator property determines how the search criteria will be
    evaluated. These are the possible values:


    <Table>
    Value	                  Meaning
    ----------------------  ---------
    soEqual                 The field value must be the same as the search
                            value.
    soNotEqual              The field value must not be the same as the search
                            value.
    soLessThan              The field value must be less than the search value.
    soLessThanOrEqualTo     The field value must be less than or equal to the
                            search value.
    soGreaterThan           The field value must be greater than the search
                            value.
    soGreaterThanOrEqualTo  The field value must be greater than or equal to the
                            search value.
    soLike                  The field value must begin with the search value.
                            A wildcard is automatically placed at the end of the
                            search criteria value which use this operator,
                            making it function as a 'begins with'
    soNotLike               The field value must not begins with the search
                            value.
    soBetween               The field value must fall between the two search
                            criteria values.
    soNotBetween            The field value must not fall between the two search
                            criteria values.
    soInList                The field value must appear in the list of search
                            values.
    soNotInList             The field value must not appear in the list of
                            search values.
    soBlank                 The field value must be null. (No search value is
                            required for this operator.)

    soNotBlank              The field value must not be null. (No search value
                            is required for this operator.)

    </Table>}

  {@TppAutoSearchField.Value

    The value of the SearchExpression as a variant.  The value is converted
    based on the DataType.  If you are using the Between or InList operators and
    have multiple values in the SearchExpression, use the Values property
    instead.}

  {@TppAutoSearchField.ValueCount

    The number of values which will be returned by the Values property.
    This property is applicable when the SearchOperator is Between or
    InList.}

  {@TppAutoSearchField.Values

    The values of the SearchExpression as variants.  The values are converted
    based on the DataType.  This function is only applicable when you are using
    the Between or InList operators and have multiple values in the
    SearchExpression.}

  {@TppAutoSearchField.WildCard

    Defaults to '%'.  The WildCard character which should be used when
    building strings for use with the Like operator.}


  TppAutoSearchField = class(TppRelative)
    private
      FAlignment: TAlignment;
      FAutoSearch: Boolean;
      FColumnWidth: Integer;
      FDataType: TppDataType;
      FDisplayFormat: String;
      FDisplayWidth: Integer;
      FFieldLength: Integer;
      FFieldAlias: String;
      FFieldName: String;
      FFirstField: Boolean;
      FGroupOrder: Integer;
      FIsDetail: Boolean;
      FLinkable: Boolean;
      FMandatory: Boolean;
      FReportComponent: TppCommunicator;
      FReportLabel: TppCommunicator;
      FSelectable: Boolean;
      FSelectOrder: Integer;
      FSearchable: Boolean;
      FSearch: Boolean;
      FSearchExpression: String;
      FSearchOrder: Integer;
      FSelectedIndex: Integer;
      FShowAllValues: Boolean;
      FSortable: Boolean;
      FSortOrder: Integer;
      FSort: Boolean;
      FSortExpression: String;
      FSortType: TppSortOrderType;
      FTableAlias: String;
      FTableName: String;

      FAsFilter: Boolean;
      FAutoSearchPanel: TComponent;
      FCriteria: TComponent;
      FDataPipelineName: String;
      FDataView: TComponent;
      FDelimiter: String;
      FEnabled: Boolean;
      FLastField: Boolean;
      FOnChange: TNotifyEvent;
      FParentControl: TComponent;
      FSearchOperator: TppSearchOperatorType;
      FWildCard: String;

      procedure SetDataType(aDataType: TppDataType);

      function  ConvertValue(const aValue: String): Variant;
      procedure DoOnChange;
      function  GetValue: Variant;
      function  GetValues(aIndex: Integer): Variant;
      function  GetValueCount: Integer;
      procedure SetCriteria(aCriteria: TComponent);
      procedure SetDataView(aDataView: TComponent);
      procedure SetDataPipelineName(const aName: String);
      procedure SetSearchOperator(aOperator: TppSearchOperatorType);

    protected
      procedure SetFieldName(const aFieldName: String);
      procedure SetMandatory(aValue: Boolean);
      procedure SetSearchExpression(const aExpression: String);
      procedure SetShowAllValues(aValue: Boolean);

    public
      constructor Create(aOwner: TComponent); override;

      procedure DisableCriteria;
      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      procedure Assign(aSource: TPersistent); override;
      function AssignSearchValuesFromField(aAutoSearchField: TppAutoSearchField): Boolean; virtual;
      function EqualTo(aSource: TppAutoSearchField): Boolean;

      function  HasParent: Boolean; override;

      function Description: String;
      function FilterString: String;
      function FormattedExpression: String;
      function FormatValue(aValue: String): String;
      function OperatorAsString: String;
      function OperatorDesc: String;
      function SQLString: String;
      function Valid: Boolean;

      {these properties used by the report wizard only}
      property AutoSearch: Boolean read FAutoSearch write FAutoSearch default False;
      property ColumnWidth: Integer read FColumnWidth write FColumnWidth;
      property FirstField: Boolean read FFirstField write FFirstField default False;
      property ReportComponent: TppCommunicator read FReportComponent write FReportComponent;
      property ReportLabel: TppCommunicator read FReportLabel write FReportLabel;

      {this property used by the FieldListBuilder}
      property SelectedIndex: Integer read FSelectedIndex write FSelectedIndex;

      property AutoSearchPanel: TComponent read FAutoSearchPanel write FAutoSearchPanel;
      property Criteria: TComponent read FCriteria write SetCriteria;
      property DataPipelineName: String read FDataPipelineName write SetDataPipelineName;
      property DataView: TComponent read FDataView write SetDataView;
      property Enabled: Boolean read FEnabled;
      property LastField: Boolean read FLastField write FLastField;
      property ParentControl: TComponent read FParentControl write FParentControl;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;
      property Value: Variant read GetValue;
      property Values[Index: Integer]: Variant read GetValues;
      property ValueCount: Integer read GetValueCount;

    published
      property Alignment: TAlignment read FAlignment write FAlignment default taLeftJustify;
      property FieldAlias: String read FFieldAlias write FFieldAlias;
      property FieldName: String read FFieldName write SetFieldName;
      property FieldLength: Integer read FFieldLength write FFieldLength;
      property IsDetail: Boolean read FIsDetail write FIsDetail default False;
      property Linkable: Boolean read FLinkable write FLinkable default True;
      property GroupOrder: Integer read FGroupOrder write FGroupOrder default -1;
      property DataType: TppDataType read FDataType write SetDataType default dtString;
      property DisplayFormat: String read FDisplayFormat write FDisplayFormat;
      property DisplayWidth: Integer read FDisplayWidth write FDisplayWidth;
      property Mandatory: Boolean read FMandatory write SetMandatory default False;
      property Position;
      property Selectable: Boolean read FSelectable write FSelectable default True;
      property SelectOrder: Integer read FSelectOrder write FSelectOrder default -1;
      property Searchable: Boolean read FSearchable write FSearchable default True;
      property Search: Boolean read FSearch write FSearch default False;
      property SearchExpression: String read FSearchExpression write SetSearchExpression;
      property SearchOrder: Integer read FSearchOrder write FSearchOrder default -1;
      property ShowAllValues: Boolean read FShowAllValues write SetShowAllValues default False;
      property Sortable: Boolean read FSortable write FSortable default True;
      property Sort: Boolean read FSort write FSort default False;
      property SortOrder: Integer read FSortOrder write FSortOrder default -1;
      property SortType: TppSortOrderType read FSortType write FSortType default soAscending;
      property SortExpression: String read FSortExpression write FSortExpression;
      property TableAlias: String read FTableAlias write FTableAlias;
      property TableName: String read FTableName write FTableName;

      property Delimiter: String read FDelimiter write FDelimiter;
      property SearchOperator: TppSearchOperatorType read FSearchOperator write SetSearchOperator default soEqual;
      property WildCard: String read FWildCard write FWildCard;

  end; {class, TppAutoSearchField}


  TppAutoSearchGroup = class;

  {@TppAutoSearchGroups

    Represents a collection of TppAutoSearchGroup objects which describe the
    autosearch fields (i.e. parameters) for a report.

    Use the Count and Groups array property to iterate through the list of
    TppAutoSearchGroup objects.}

  {@TppAutoSearchGroups.Count

    Returns the number of items in the Groups array.}

  {@TppAutoSearchGroups.Groups

    Provides access to the TppAutoSearchGroup objects.

    Each TppAutoSearchGroup object represents a collection of
    auto search fields associated with a dataview created using the
    query tools included with RB Professional and Enterprise. If the
    query tools are not used to create the search criteria, then a default
    TppAutoSearchGroup is used to represent the autosearch fields associated
    with the report.}

    
  TppAutoSearchGroups = class(TppRelative)
    private

      function GetGroupForIndex(aIndex: Integer): TppAutoSearchGroup;
      procedure AssignGroups(aSource: TppAutoSearchGroups); 

    protected

    public
      procedure Assign(aSource: TPersistent); override;
      procedure AssignAutoSearchFields(aAutoSearchFields: TList); virtual;
      function AssignSearchValuesFromGroups(aSource: TppAutoSearchGroups): Boolean;

      procedure AddAutoSearchField(aGroupDescription, aFieldName, aSearchExpression: String; aShowAllValues: Boolean); overload;
      procedure AddAutoSearchField(aAutoSearchField: TppAutoSearchField); overload;
      function AddGroup(aDescription: String): TppAutoSearchGroup;
      procedure Clear;
      function CompareStructure(aSource: TppAutoSearchGroups): Boolean;
      function EqualTo(aSource: TppAutoSearchGroups): Boolean;
      procedure GetAllFields(aAutoSearchFields: TList);
      function GetGroupForField(aAutoSearchField: TppAutoSearchField): TppAutoSearchGroup;
      function GetGroupForDescription(aDescription: String): TppAutoSearchGroup;
      function HasMandatoryField: Boolean;
      function IndexOfDescription(aDescription: String): Integer;

      property Count: Integer read GetChildCount;
      property Groups[Index: Integer]: TppAutoSearchGroup read GetGroupForIndex; default;

  end; {class, TppAutoSearchGroups}

  {@TppAutoSearchGroup

    Represents a collection of TppAutoSearchField objects which describe the
    autosearch fields (i.e. parameters) for a report.

    Use the FieldCount and Fields array property to iterate through the list of
    TppAutoSearchField objects.

    Use the FieldsByName property to access the TppAutoSearchField objects by
    name.}


  {@TppAutoSearchGroup.Description

    A text description of the dataview which created the autosearch fields.

    The Description is used by the auto search dialog's notebook for the case
    in which multiple dataviews contain auto search criteria.}

  {@TppAutoSearchGroup.FieldCount

    Returns the number of items in the Fields array.}

  {@TppAutoSearchGroup.FieldCount

    Returns the number of items in the Fields array.}

  {@TppAutoSearchGroup.Fields

    Provides access to the TppAutoSearchField objects by index.}

  {@TppAutoSearchGroup.Fields

    Provides access to the TppAutoSearchField objects by name.}

  {@TppAutoSearchGroup.FieldsByName

    Provides named access to the TppAutoSearchField objects.}

  {@TppAutoSearchGroup.TabOrder

    The tab order index the dataview which created the autosearch fields.

    The TabOrder is used by the auto search dialog's notebook for the case
    in which multiple dataviews contain auto search criteria.}

  TppAutoSearchGroup = class(TppRelative)
    private
      FDescription: String;
      FTabOrder: Integer;

      function GetDataView: TObject;
      function GetFieldForIndex(aIndex: Integer): TppAutoSearchField;
      function GetFieldForName(aFieldName: String): TppAutoSearchField;

    protected

    public
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      procedure AddField(aAutoSearchField: TppAutoSearchField); virtual;
      procedure Assign(aSource: TPersistent); override;
      procedure AssignGroup(aSource: TppAutoSearchGroup); virtual;
      function AssignSearchValuesFromGroup(aSource: TppAutoSearchGroup): Boolean;
      procedure Clear;  virtual;
      function CompareStructure(aSource: TppAutoSearchGroup): Boolean;
      function EqualTo(aSource: TppAutoSearchGroup): Boolean;
      function GetFieldForNameAndOperator(aFieldName: String; aSearchOperator: TppSearchOperatorType): TppAutoSearchField;

      property FieldCount: Integer read GetChildCount;
      property Fields[Index: Integer]: TppAutoSearchField read GetFieldForIndex; default;
      property FieldsByName[aFieldName: String]: TppAutoSearchField read GetFieldForName;

    published
      property Description: String read FDescription write FDescription;
      property TabOrder: Integer read FTabOrder write FTabOrder;

    end; {class, TppAutoSearchGroup}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  {@TraTppAutoSearchFieldRTTI }
  TraTppAutoSearchFieldRTTI = class(TraTppRelativeRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppAutoSearchFieldRTTI}




implementation
  
{******************************************************************************
 *
 ** A U T O   S E A R C H   F I E L D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Create }

constructor TppAutoSearchField.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAlignment        := taLeftJustify;
  FAutoSearch       := False;
  FColumnWidth      := 0;
  FDataType         := dtString;
  FDisplayFormat    := '';
  FDisplayWidth     := 10;
  FFieldAlias       := '';
  FFieldName        := '';
  FFieldLength      := 10;
  FGroupOrder       := -1;
  FLinkable         := True;
  FMandatory        := False;
  FReportComponent  := nil;
  FReportLabel      := nil;
  FSelectable       := True;
  FSelectOrder      := -1;
  FSearchable       := True;
  FSearch           := False;
  FSearchOrder      := -1;
  FSearchExpression := '';
  FSelectedIndex    := -1;
  FShowAllValues    := False;
  FSortable         := True;
  FSort             := False;
  FSortExpression   := '';
  FSortOrder        := -1;
//  FSortOrderType    := soAscending;
  FTableAlias       := '';
  FTableName        := '';


  FAsFilter := False;
  FAutoSearchPanel  := nil;
  FCriteria := nil;
  FDataView := nil;
  FDelimiter := '';
  FirstField := False;
  FOnChange := nil;
  FParentControl := nil;
  FSearchOperator := soEqual;
  FWildCard := '';
  FEnabled := True;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Notify }

procedure TppAutoSearchField.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator = FCriteria) then
    FCriteria := nil
    
  else if (aCommunicator = FDataView) then
    FDataView := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.HasParent }

function TppAutoSearchField.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Assign }

procedure TppAutoSearchField.Assign(aSource: TPersistent);
var
  lSource: TppAutoSearchField;
begin

  if (aSource is TppAutoSearchField) then
    begin
      lSource := TppAutoSearchField(aSource);

      FAlignment := lSource.Alignment;
      FFieldAlias := lSource.FieldAlias;
      FFieldName := lSource.FieldName;
      FFieldLength := lSource.FieldLength;
      FIsDetail := lSource.IsDetail;
      FLinkable := lSource.Linkable;
      FGroupOrder := lSource.GroupOrder;
      FDataType := lSource.DataType;
      FDisplayFormat := lSource.DisplayFormat;
      FDisplayWidth := lSource.DisplayWidth;
      FMandatory := lSource.Mandatory;
      Position  := lSource.Position;
      FSelectable := lSource.Selectable;
      FSelectOrder := lSource.SelectOrder;
      FSearchable := lSource.Searchable;
      FSearch := lSource.Search;
      FSearchExpression := lSource.SearchExpression;
      FSearchOrder := lSource.SearchOrder;
      FShowAllValues := lSource.ShowAllValues;
      FSortable := lSource.Sortable;
      FSort := lSource.Sort;
      FSortOrder := lSource.SortOrder;
      FSortType := lSource.SortType;
      FSortExpression := lSource.SortExpression;
      FTableAlias := lSource.TableAlias;
      FTableName := lSource.TableName;

      FDelimiter := lSource.Delimiter;
      FSearchOperator := lSource.SearchOperator;
      WildCard := lSource.WildCard;
    end
  else
    inherited Assign(aSource);

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.EqualTo }

function TppAutoSearchField.EqualTo(aSource: TppAutoSearchField): Boolean;
begin

  Result := (FAlignment = aSource.Alignment) and
            (FFieldAlias = aSource.FieldAlias) and
            (FFieldName = aSource.FieldName) and
            (FFieldLength = aSource.FieldLength) and
            (FIsDetail = aSource.IsDetail) and
            (FLinkable = aSource.Linkable) and
            (FGroupOrder = aSource.GroupOrder) and
            (FDataType = aSource.DataType) and
            (FDisplayFormat = aSource.DisplayFormat) and
            (FDisplayWidth = aSource.DisplayWidth) and
            (FMandatory = aSource.Mandatory) and
            (Position  = aSource.Position) and
            (FSelectable = aSource.Selectable) and
            (FSelectOrder = aSource.SelectOrder) and
            (FSearchable = aSource.Searchable) and
            (FSearch = aSource.Search) and
            (FSearchExpression = aSource.SearchExpression) and
            (FSearchOrder = aSource.SearchOrder) and
            (FShowAllValues = aSource.ShowAllValues) and
            (FSortable = aSource.Sortable) and
            (FSort = aSource.Sort) and
            (FSortOrder = aSource.SortOrder) and
            (FSortType = aSource.SortType) and
            (FSortExpression = aSource.SortExpression) and
            (FTableAlias = aSource.TableAlias) and
            (FTableName = aSource.TableName) and
            (FDelimiter = aSource.Delimiter) and
            (FSearchOperator = aSource.SearchOperator) and
            (WildCard = aSource.WildCard);

end; {procedure, EqualTo}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.AssignSearchValuesFromField }

function TppAutoSearchField.AssignSearchValuesFromField(aAutoSearchField: TppAutoSearchField): Boolean;
begin

  Result := (SearchExpression <> aAutoSearchField.SearchExpression) or
            (ShowAllValues    <> aAutoSearchField.ShowAllValues);

  if Result then
    begin
      SearchExpression := aAutoSearchField.SearchExpression;
      ShowAllValues    := aAutoSearchField.ShowAllValues;
    end;

end; {function, AssignSearchValuesFromField}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.DoOnChange }

procedure TppAutoSearchField.DoOnChange;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if Assigned(FOnChange) then FOnChange(Self);

end; {procedure, DoOnChange}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetMandatory }

procedure TppAutoSearchField.SetMandatory(aValue: Boolean);
begin

  FMandatory := aValue;

  if (FMandatory) then
    FShowAllValues := False;

  DoOnChange;

end; {procedure, SetMandatory}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetShowAllValues }

procedure TppAutoSearchField.SetShowAllValues(aValue: Boolean);
begin

  FShowAllValues := aValue;

  if (FShowAllValues) then
    FMandatory := False;

  DoOnChange;

end; {procedure, SetShowAllValues}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetFieldName }

procedure TppAutoSearchField.SetFieldName(const aFieldName: String);
begin

  {also set FieldAlias, if needed}
  if (FFieldName = FFieldAlias) then
    FFieldAlias := aFieldName;

  FFieldName:= aFieldName;

  PropertyChange;

  DoOnChange;

end; {procedure, SetFieldName}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetDataType }

procedure TppAutoSearchField.SetDataType(aDataType: TppDataType);
begin

  FDataType := aDataType;

end; {procedure, SetDataType}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetSearchExpression }

procedure TppAutoSearchField.SetSearchExpression(const aExpression: String);
var
  lValues: TStringList;
begin
  FSearchExpression := aExpression;

  // check for case in which there are multiple items and the expression
  // contains spaces but no double quotes
  if (FSearchOperator in [soInList, soNotInList, soBetween, soNotBetween]) then
    if (Pos(' ', aExpression) > 0) and (Pos('"', aExpression) = 0) then
      begin
        // backward compatibility for custom search panels that do not use
        // TStringList.CommaText to format multiple items. This is now required.
        lValues := TStringList.Create;

        ppUtils.ppParseString(aExpression, lValues);
        FSearchExpression := lValues.CommaText;

        lValues.Free;
      end;

  PropertyChange;

  DoOnChange;

end; {procedure, SetSearchExpression}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetCriteria }

procedure TppAutoSearchField.SetCriteria(aCriteria: TComponent);
begin

  if (FCriteria <> nil) then
    TppCommunicator(FCriteria).RemoveNotify(Self);

  FCriteria := aCriteria;

  if (FCriteria <> nil) then
    TppCommunicator(FCriteria).AddNotify(Self)

end; {procedure, SetCriteria}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetDataView }

procedure TppAutoSearchField.SetDataView(aDataView: TComponent);
begin

  if (FDataView <> nil) then
    TppCommunicator(FDataView).RemoveNotify(Self);

  FDataView := aDataView;

  if (FDataView <> nil) then
    TppCommunicator(FDataView).AddNotify(Self)

end; {procedure, DataView}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetDataPipelineName }

procedure TppAutoSearchField.SetDataPipelineName(const aName: String);
begin

  FDataPipelineName := aName;

  DoOnChange;

end; {procedure, SetDataPipelineName}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetSearchOperator }

procedure TppAutoSearchField.SetSearchOperator(aOperator: TppSearchOperatorType);
begin

  FSearchOperator := aOperator;

  DoOnChange;

end; {procedure, SetSearchOperator}


{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetEnabled }

procedure TppAutoSearchField.DisableCriteria;
begin

  FEnabled := False;

  DoOnChange;

end; {procedure, SetEnabled}


{------------------------------------------------------------------------------}
{ TppAutoSearchField.ConvertValue }

function TppAutoSearchField.ConvertValue(const aValue: String): Variant;
begin

  Result := '';

  if (aValue = '') then Exit; // backward compatibility
  

  case DataType of
    dtString, dtChar, dtMemo:
      begin
        if (Length(FWildCard) > 0) and (Pos(FWildCard, aValue) = 0) then
          Result := aValue + FWildCard
        else
          Result := aValue;
      end;

    dtDate, dtTime, dtDateTime: Result := ppStrToDateTime(aValue);
    dtInteger, dtLongint: Result := StrToInt(aValue);
    dtCurrency: Result := StrToCurr(aValue);
    dtSingle, dtDouble, dtExtended: Result := StrToFloat(aValue);
  end;

end; {function, ConvertValue}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.GetValue }

function TppAutoSearchField.GetValue: Variant;
var
  lValues: TStrings;
begin

  if not(FSearchOperator in [soInList, soNotInList, soBetween, soNotBetween]) then
    Result := ConvertValue(FSearchExpression)
  else
    begin
      lValues := TStringList.Create;

      lValues.CommaText := SearchExpression;

      if (lValues.Count > 0) then
        Result := ConvertValue(lValues[0]);

      lValues.Free;

  end;

end; {function, GetValue}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.GetValues }

function TppAutoSearchField.GetValues(aIndex: Integer): Variant;
var
  lValues: TStrings;
begin

  Result := '';

  lValues := TStringList.Create;

  lValues.CommaText := SearchExpression;

  if (lValues.Count > aIndex) then
    Result := ConvertValue(lValues[aIndex]);

  lValues.Free;

end; {function, GetValues}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.GetValueCount }

function TppAutoSearchField.GetValueCount: Integer;
var
  lValues: TStrings;
begin

  lValues := TStringList.Create;

  lValues.CommaText := SearchExpression;

  Result := lValues.Count;

  lValues.Free;

end; {function, GetValueCount}


{@TppAutoSearchField.FormatValue

 Formats an individual search criteria value.  Called by FormattedExpression.}

function TppAutoSearchField.FormatValue(aValue: String): String;
begin

  Result := aValue;

  if (DataType in [dtDate, dtDateTime]) and (Length(DisplayFormat) > 0) then
    Result := FormatDateTime(DisplayFormat, ppStrToDateTime(Result))

  else if (DataType in [dtInteger, dtLongint, dtSingle, dtDouble, dtExtended, dtCurrency]) then
    Result := ppFixUpFloatString(aValue, DisplayFormat)

  else if (DataType = dtBoolean) then
    begin
      if (Length(aValue) = 0) then
        Result := 'FALSE'

       else if (UpperCase(aValue[1])[1] in ['T', 'Y']) then
         Result := 'TRUE'

       else if (aValue[1] = '1') then
         Result := '1'

       else if (aValue[1] = '0') then
         Result := '0'

       else 
         Result := 'FALSE';
    end;

  if (Length(FDelimiter) > 0) then
    Result := FDelimiter + Result + FDelimiter;

end; {function, FormatValue}


{@TppAutoSearchField.FormattedExpression

 This function formats the search criteria values.  Called by FilterString and
 SQLString.}

function TppAutoSearchField.FormattedExpression: String;
var
  liIndex: Integer;
  lValues: TStrings;
begin

  Result := '';

  case FSearchOperator of

    soInList, soNotInList:
      begin
        lValues := TStringList.Create;

        lValues.CommaText := SearchExpression;

        if FAsFilter then
          begin
            for liIndex := 0 to lValues.Count - 1 do
              begin
                if (FSearchOperator = soInList) then
                  begin
                    Result := Result + '(' + FieldName + '=' + FormatValue(lValues[liIndex]) + ')';

                    if (liIndex < lValues.Count - 1) then
                      Result := Result + ' OR ';
                  end
                else
                  begin
                    Result := Result + '(' + FieldName + '<>' + FormatValue(lValues[liIndex]) + ')';

                    if (liIndex < lValues.Count - 1) then
                      Result := Result + ' AND ';
                  end;
              end;
          end

        else
          begin
            for liIndex := 0 to lValues.Count - 1 do
              begin
                Result := Result + FormatValue(lValues[liIndex]);

                if (liIndex < lValues.Count - 1) then
                  Result := Result + ',';
              end;

            Result := '(' + Result + ')';
          end;

        lValues.Free;

      end;

    soBetween, soNotBetween:
      begin
        lValues := TStringList.Create;

        lValues.CommaText := SearchExpression;

        if (lValues.Count = 2) then
          begin

            if FAsFilter then
              begin
                if (FSearchOperator = soBetween) then
                  Result := '(' + FieldName + ' >= ' + FormatValue(lValues[0]) + ')' + ' AND ' + '(' + FieldName + ' <= ' + FormatValue(lValues[1]) + ')'
                else
                  Result := '(' + FieldName + ' < ' + FormatValue(lValues[0]) + ')' + ' OR ' + '(' + FieldName + ' > ' + FormatValue(lValues[1]) + ')'
              end

            else
              Result := FormatValue(lValues[0]) + ' AND ' + FormatValue(lValues[1]);

          end;

        lValues.Free;
      end;

    soLike, soNotLike:
      begin
        if (Length(FWildCard) > 0) and (Pos(FWildCard, SearchExpression) = 0) then
          Result := SearchExpression + FWildCard;

        Result := FormatValue(Result);
      end;

    else
      begin
        Result := FormatValue(SearchExpression);
      end;
  end;


end; {function, FormattedExpression}


{@TppAutoSearchField.Description

 Returns a full description of the search condition contained in the
 AutoSearchField.  How the description begins depends upon the value of the
 FirstField property. A typical description: 'Show all data where the company
 name begins with 'T%'.  For an example of how to use the description, see the
 demo in the...RBuilder\\Demos\\AutoSearch\\6. Build Description of AutoSearch
 directory.}

function TppAutoSearchField.Description: String;
begin

  if (FirstField) then
    Result := ppLoadStr(54) {Show all data where the}
  else
    Result := ppLoadStr(55); {and the}

  if (ShowAllValues) then
    Result := Result + ' ' + FieldAlias + ' ' + ppLoadStr(1036)  {'has any value'}
  else
    Result := Result + ' ' + FieldAlias + ' ' + OperatorDesc + ' ' + SearchExpression;

end; {function, Description}


{@TppAutoSearchField.FilterString

 Returns the search criteria in a format appropriate for use in a
 Table.Filter property.}

function TppAutoSearchField.FilterString: String;
begin
  FAsFilter := True;

  if (FSearchOperator in [soInList, soNotInList, soBetween, soNotBetween]) then
    Result := '(' + FormattedExpression + ')'
  else
    Result := '(' + FieldName + ' ' + OperatorAsString + ' ' + FormattedExpression + ')';

  FAsFilter := False;
end; {function, FilterString}


{@TppAutoSearchField.SQLString

 Returns the search criteria in a format appropriate for use in an SQL 'WHERE'
 clause.}

function TppAutoSearchField.SQLString: String;
begin
  Result := TableName + '.' + FieldName + ' ' + OperatorAsString + ' ' + FormattedExpression;
end; {function, SQLString}


{@TppAutoSearchField.Valid

 Indicates whether a SearchExpression has been assigned to the field.  Only
 valid AutoSearch fields should be used when building a Table.Filter or SQL
 'WHERE' clause.}

function TppAutoSearchField.Valid: Boolean;
begin
  Result := not(ShowAllValues) and (Length(SearchExpression) > 0);
end; {function, Valid}


{@TppAutoSearchField.OperatorAsString

 Converts the SearchOperator setting to a value which can be used in a search
 expression.  For example, soGreaterThan is converted to '>'.}

function TppAutoSearchField.OperatorAsString: String;
begin

  if (FAsFilter) then
    case FSearchOperator of
      soEqual:                Result := '=';
      soNotEqual:             Result := '<>';
      soLessThan:             Result := '<';
      soLessThanOrEqualTo:    Result := '<=';
      soGreaterThan:          Result := '>';
      soGreaterThanOrEqualTo: Result := '>=';
      soLike:                 Result := '=';
      soNotLike:              Result := '<>';
      soBetween:              Result := '';
      soNotBetween:           Result := '';
      soInList:               Result := '';
      soNotInList:            Result := '';
      soBlank:                Result := '';
      soNotBlank:             Result := '';
    else
      Result := '=';
    end

  else
    case FSearchOperator of
      soEqual:                Result := '=';
      soNotEqual:             Result := '<>';
      soLessThan:             Result := '<';
      soLessThanOrEqualTo:    Result := '<=';
      soGreaterThan:          Result := '>';
      soGreaterThanOrEqualTo: Result := '>=';
      soLike:                 Result := 'LIKE';
      soNotLike:              Result := 'NOT LIKE';
      soBetween:              Result := 'BETWEEN';
      soNotBetween:           Result := 'NOT BETWEEN';
      soInList:               Result := 'IN';
      soNotInList:            Result := 'NOT IN';
      soBlank:                Result := 'IS NULL';
      soNotBlank:             Result := 'IS NOT NULL';
    else
      Result := '=';
    end;

end; {procedure, OperatorAsString}


{@TppAutoSearchField.OperatorDesc

 Returns a description of the SearchOperator.  The description is displayed in
 the OperatorLabel of the  AutoSearchPanels.}

function TppAutoSearchField.OperatorDesc: String;
begin

  case FSearchOperator of
    soEqual:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(92) {'is'}
        else
          Result := ppLoadStr(93) {'is equal to'}
      end;

    soNotEqual:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(94) {'is not'}
        else
          Result := ppLoadStr(95) {'is not equal to'}
      end;

    soLessThan:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(96) {'is before'}
        else
          Result := ppLoadStr(97); {'is less than'}
      end;

    soLessThanOrEqualTo:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(98) {'is on or before'}
        else
          Result := ppLoadStr(99) {'is less than or equal to'}
      end;

    soGreaterThan:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(100) {'is after'}
        else
          Result := ppLoadStr(1000); {'is greater than'}
      end;

    soGreaterThanOrEqualTo:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(1001) {'is on or after'}
        else
          Result := ppLoadStr(1002); {'is greater than or equal to'}
      end;

    soLike: Result := ppLoadStr(1003); {'begins with'}
    soNotLike: Result := ppLoadStr(1004); {'does not begin with'}
    soBetween: Result := ppLoadStr(1005); {'is between'}
    soNotBetween: Result := ppLoadStr(1006); {'is not between'}
    soInList: Result := ppLoadStr(1007); {'matches one of the values in this list'}
    soNotInList: Result := ppLoadStr(1027); {'does not match any of the values in this list'}
    soBlank: Result := ppLoadStr(1008); {'is blank'}
    soNotBlank: Result := ppLoadStr(1009); {'is not blank'}

  else
    Result := ppLoadStr(93); {'is equal to'}
  end;

end; {procedure, OperatorDesc}


{******************************************************************************
*
*  A U T O   S E A R C H   G R O U P S
*
******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAutoSearchGroups.GetGroupForIndex }

function TppAutoSearchGroups.GetGroupForIndex(aIndex: Integer): TppAutoSearchGroup;
begin
  if (aIndex < Count) then
    Result := TppAutoSearchGroup(Children[aIndex])
  else
    Result := nil;

end; {function, GetGroupForIndex}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.AssignAutoSearchFields

  Copies the AutoSearchField from the specified aAutoSearchFields list.}

procedure TppAutoSearchGroups.AssignAutoSearchFields(aAutoSearchFields: TList);
var
  liIndex: Integer;
  lAutoSearchField: TppAutoSearchField;
begin
  FreeChildren;

  for liIndex := 0 to aAutoSearchFields.Count-1 do
    begin
      lAutoSearchField := TppAutoSearchField(aAutoSearchFields[liIndex]);
      AddAutoSearchField(lAutoSearchField);
    end;

end; {procedure, AssignAutoSearchFields}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.AddAutoSearchField

  Copies a specified AutoSearchField.}

procedure TppAutoSearchGroups.AddAutoSearchField(aAutoSearchField: TppAutoSearchField);
var
  lDataView: TPersistent;
  lGroup: TppAutoSearchGroup;
  lsDescription: String;
  liTabOrder: Integer;
begin

  lDataView := TPersistent(aAutoSearchField.DataView);

  if (lDataView = nil) then
    begin
      lsDescription := '';
      liTabOrder := 0;
    end
  else
    begin
      lsDescription := ppGetStringPropValue(lDataView, 'Description');
      liTabOrder := ppGetOrdPropValue(lDataView, 'AutoSearchTabOrder');
    end;

  lGroup := AddGroup(lsDescription);
  lGroup.TabOrder := liTabOrder;

  lGroup.AddField(aAutoSearchField);

end; {procedure, AddAutoSearchField}

procedure TppAutoSearchGroups.AddAutoSearchField(aGroupDescription, aFieldName, aSearchExpression: String; aShowAllValues: Boolean);
var
  lAutoSearchField: TppAutoSearchField;
  lGroup: TppAutoSearchGroup;
begin

  lGroup := GetGroupForDescription(aGroupDescription);

  if (lGroup = nil) then
    lGroup := AddGroup(aGroupDescription);

  lAutoSearchField := TppAutoSearchField.Create(nil);

  lAutoSearchField.FieldName := aFieldName;
  lAutoSearchField.SearchExpression := aSearchExpression;
  lAutoSearchField.ShowAllValues := aShowAllValues;

  lGroup.AddField(lAutoSearchField);

end; {procedure, AddAutoSearchFieldForParams}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.AddGroup

  Adds a new TppAutoSearchGroup object with the specified description and
  returns a reference to the new object.}

function TppAutoSearchGroups.AddGroup(aDescription: String): TppAutoSearchGroup;
var
  liGroup: Integer;
begin

  liGroup := IndexOfDescription(aDescription);

  if (liGroup >= 0) then
    Result := GetGroupForIndex(liGroup)
  else
    begin
      Result := TppAutoSearchGroup.Create(Self);
      Result.Parent := Self;
      Result.Description := aDescription;
    end;

end; {function, AddGroup}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.Clear

  Clears all items in the Groups array.}

procedure TppAutoSearchGroups.Clear;
var
  liGroup: Integer;
begin

  for liGroup := Count-1 downto 0  do
    Groups[liGroup].Free;
//    Groups[liGroup].Clear;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.GetAllFields

  Iterates through the AutoSearchGroups structure and adds a reference for
  each of the autosearch fields to the aAutoSearchFields list.}

procedure TppAutoSearchGroups.GetAllFields(aAutoSearchFields: TList);
var
  liField: Integer;
  liGroup: Integer;
  lGroup: TppAutoSearchGroup;
begin

  aAutoSearchFields.Clear;

  for liGroup := 0 to Count-1 do
    begin
      lGroup := Groups[liGroup];

      for liField := 0 to lGroup.FieldCount-1 do
        aAutoSearchFields.Add(lGroup.Fields[liField]);

    end;

end; {function, GetAllFields}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.GetGroupForField

  Returns a reference to the TppAutoSearchGroup object associated with the
  specified AutoSearchField.}

function TppAutoSearchGroups.GetGroupForField(aAutoSearchField: TppAutoSearchField): TppAutoSearchGroup;
var
  lDataView: TObject;
  lsDescription: String;
begin

  lDataView := aAutoSearchField.DataView;

  if (lDataView <> nil) then
    lsDescription := ''
  else
    lsDescription := ppGetStringPropValue(lDataView, 'Description');

  Result := GetGroupForDescription(lsDescription);

end; {procedure, GetGroupForField}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.GetGroupForDescription

  Returns a reference to the TppAutoSearchGroup object corresponding to the
  specified description.}

function TppAutoSearchGroups.GetGroupForDescription(aDescription: String): TppAutoSearchGroup;
var
  liGroup: Integer;
begin
  liGroup := IndexOfDescription(aDescription);

  if (liGroup >= 0) then
    Result := GetGroupForIndex(liGroup)
  else
    Result := nil;

end; {function, GetGroupForDescription}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.HasMandatoryField

  Indicates whether the any AutoSearchFields have their Mandatory property value
  set to True.}

function TppAutoSearchGroups.HasMandatoryField: Boolean;
var
  liFieldIndex: Integer;
  liGroupIndex: Integer;
  lGroup: TppAutoSearchGroup;
begin

  Result := False;

  liGroupIndex := 0;

  while not(Result) and (liGroupIndex < Count) do
    begin

      lGroup := Groups[liGroupIndex];

      liFieldIndex := 0;

      while not(Result) and (liFieldIndex < lGroup.FieldCount) do
        begin

          if lGroup.Fields[liFieldIndex].Mandatory then
            Result := True
          else
            Inc(liFieldIndex);

        end;

      Inc(liGroupIndex);

    end;

end;

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.IndexOfDescription

  Returns the Groups array Index for a specified description.}

function TppAutoSearchGroups.IndexOfDescription(aDescription: String): Integer;
var
  liIndex: Integer;
begin

  liIndex := 0;
  Result := -1;

  while (Result < 0) and (liIndex < Count) do
    begin
      if Groups[liIndex].Description = aDescription then
        Result := liIndex
      else
        Inc(liIndex);
    end;

end; {procedure, IndexOfDescription}

{------------------------------------------------------------------------------}
{ TppAutoSearchGroups.CompareStructure }

function TppAutoSearchGroups.CompareStructure(aSource: TppAutoSearchGroups): Boolean;
var
  liIndex: Integer;
  lGroup: TppAutoSearchGroup;
  lSourceGroup: TppAutoSearchGroup;
begin

  Result := (aSource <> nil) and (aSource.Count = Count);

  liIndex := 0;

  while Result and (liIndex < Count) do
    begin
      lGroup := Groups[liIndex];

      lSourceGroup := aSource.GetGroupForDescription(lGroup.Description);

      if lSourceGroup = nil then
        Result := False
      else
        Result := (lGroup.Description = lSourceGroup.Description) and
                lGroup.CompareStructure(lSourceGroup);

      Inc(liIndex);

    end;

end; {function, CompareStructure}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.Assign

  Copies each of the AutoSearchGroup objects in aSource.}

procedure TppAutoSearchGroups.Assign(aSource: TPersistent);
begin

  if (aSource is TppAutoSearchGroups) then
    AssignGroups(TppAutoSearchGroups(aSource))
  else
    inherited Assign(aSource);

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.AssignGroups

  Copies each of the AutoSearchGroup objects in aSource.}

procedure TppAutoSearchGroups.AssignGroups(aSource: TppAutoSearchGroups);
var
  liIndex: Integer;
  lGroup: TppAutoSearchGroup;
  lSourceGroup: TppAutoSearchGroup;
begin

  FreeChildren;

  for liIndex := 0 to aSource.Count-1 do
    begin
      lSourceGroup := aSource[liIndex];

      lGroup := TppAutoSearchGroup.Create(nil);

      lGroup.Assign(lSourceGroup);

      lGroup.Parent := Self;

    end;

end; {procedure, AssignGroups}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.EqualTo

  Returns True, if aSource contains equivalent TppAutoSearchGroup objects.}

function TppAutoSearchGroups.EqualTo(aSource: TppAutoSearchGroups): Boolean;
var
  liIndex: Integer;
  lGroup: TppAutoSearchGroup;
  lSourceGroup: TppAutoSearchGroup;
begin

  Result := (aSource <> nil) and (aSource.Count = Count);

  liIndex := 0;

  while Result and (liIndex < Count) do
    begin
      lGroup := Groups[liIndex];

      lSourceGroup := aSource.GetGroupForDescription(lGroup.Description);

      if (lSourceGroup = nil) then
        Result := False
      else
        Result :=  lGroup.EqualTo(lSourceGroup);

      Inc(liIndex);

    end;

end; {function, EqualTo}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroups.AssignSearchValuesFromGroups

  Assigns the auto search values from aSource.}

function TppAutoSearchGroups.AssignSearchValuesFromGroups(aSource: TppAutoSearchGroups): Boolean;
var
  lbValueChange: Boolean;
  liIndex: Integer;
  lGroup: TppAutoSearchGroup;
  lSourceGroup: TppAutoSearchGroup;
begin

  Result := False;

  for liIndex := 0 to Count-1 do
    begin
      lGroup := Groups[liIndex];

      lSourceGroup := aSource.GetGroupForDescription(lGroup.Description);

      if (lGroup <> nil) then
        begin
          lbValueChange := lGroup.AssignSearchValuesFromGroup(lSourceGroup);

          if lbValueChange then
            Result := True;
        end;

    end;

end; {procedure, AssignSearchValuesFromGroups}


{******************************************************************************
*
*  A U T O   S E A R C H   G R O U P
*
******************************************************************************}

destructor TppAutoSearchGroup.Destroy;
var
  lDataView: TObject;
begin

  {if dataview is present, then update AutoSearchTabOrder}
  lDataView := GetDataView;

  if (lDataView <> nil) then
    ppSetOrdPropValue(lDataView, 'AutoSearchTabOrder', TabOrder);

  {free or remove fields as needed - can only free the fields that do not
   belong to the report.}
  Clear;
//  FreeChildren;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppAutoSearchGroup.Notify}

procedure TppAutoSearchGroup.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
var
  lbDone: Boolean;
  liIndex: Integer;
begin

  inherited Notify(aCommunicator, aOperation);

  if not(csDestroying in ComponentState) and (aOperation = ppopRemove) then
    begin

      liIndex := 0;
      lbDone := False;

      while (liIndex < ChildCount) and not(lbDone) do
        begin
          if (aCommunicator = Children[liIndex]) then
            begin
              RemoveChild(TppRelative(aCommunicator));

              lbDone := True;
            end;
//            raise EReportBuilderError.Create('TppAutoSearchGroup.Notify: Cannot free a child autosearch field.');

          Inc(liIndex);
        end;
    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppAutoSearchGroup.GetFieldForIndex }

function TppAutoSearchGroup.GetFieldForIndex(aIndex: Integer): TppAutoSearchField;
begin
  Result := TppAutoSearchField(Children[aIndex]);

end; {procedure, GetFieldForIndex}

{------------------------------------------------------------------------------}
{ TppAutoSearchGroup.GetFieldForName }

function TppAutoSearchGroup.GetFieldForName(aFieldName: String): TppAutoSearchField;
var
  liIndex: Integer;
  lField: TppAutoSearchField;
begin
  Result := nil;
  liIndex := 0;

  while (Result = nil) and (liIndex < FieldCount) do
    begin
      lField := TppAutoSearchField(Children[liIndex]);

      if lField.FieldName = aFieldName then
        Result := lField
      else
        Inc(liIndex);
    end;

end; {procedure, GetFieldForName}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroup.AddField

  Adds an item to the AutoSearchFields array.}

procedure TppAutoSearchGroup.AddField(aAutoSearchField: TppAutoSearchField);
begin
//  aAutoSearchField.Parent := Self;
  AddChild(aAutoSearchField);
  AddNotify(aAutoSearchField);
end; {procedure, AddField}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroup.Clear

  Removes all items from the AutoSearchFields array and destroys the fields for
  which this group is the parent.}

procedure TppAutoSearchGroup.Clear;
var
  liIndex: Integer;
  lField: TppAutoSearchField;
begin

  {free fields or remove them if they are part the report}
  for liIndex := FieldCount-1 downto 0 do
    begin
      lField := GetFieldForIndex(liIndex);

      if (lField.Parent = Self) then
        lField.Free
      else
        begin
          RemoveChild(lField);

          RemoveNotify(lField);
        end;

    end;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppAutoSearchGroup.GetDataView}

function TppAutoSearchGroup.GetDataView: TObject;
begin

  if FieldCount > 0 then
    Result := Fields[0].DataView
  else
    Result := nil;

end; {function, GetDataView}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroup.Assign

  Creates a copy of each AutoSearchGroup field in the source AutoSearchGroup.}

procedure TppAutoSearchGroup.Assign(aSource: TPersistent);
begin

  if (aSource is TppAutoSearchGroup) then
    AssignGroup(TppAutoSearchGroup(aSource))
  else
    inherited Assign(aSource);

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroup.AssignGroup

  Creates a copy of each AutoSearchGroup field in the source AutoSearchGroup.}

procedure TppAutoSearchGroup.AssignGroup(aSource: TppAutoSearchGroup);
var
  liIndex: Integer;
  lField: TppAutoSearchField;
  lSourceField: TppAutoSearchField;
begin

  FDescription := aSource.Description;
  FTabOrder := aSource.TabOrder;

  FreeChildren;

  for liIndex := 0 to aSource.FieldCount-1 do
    begin
      lSourceField := aSource.Fields[liIndex];

      lField := TppAutoSearchField.Create(nil);

      lField.Assign(lSourceField);

      lField.Parent := Self;

      lField.AddNotify(Self);
    end;

end; {procedure, AssignGroup}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroup.EqualTo

  Returns true if each aSource contains equivalent auto search field objects.}

function TppAutoSearchGroup.EqualTo(aSource: TppAutoSearchGroup): Boolean;
var
  lField: TppAutoSearchField;
  liIndex: Integer;
  lSourceField: TppAutoSearchField;
begin

  Result := (aSource <> nil) and (aSource.FieldCount = FieldCount) and
            (aSource.Description = Description);

  liIndex := 0;

  while Result and (liIndex < FieldCount) do
    begin
      lField := Fields[liIndex];

      lSourceField := aSource.FieldsByName[lField.FieldName];

      Result := lField.EqualTo(lSourceField);

      Inc(liIndex);

    end;

end; {function, EqualTo}

{------------------------------------------------------------------------------}
{ TppAutoSearchGroup.CompareStructure }

function TppAutoSearchGroup.CompareStructure(aSource: TppAutoSearchGroup): Boolean;
var
  lField: TppAutoSearchField;
  liIndex: Integer;
  lSourceField: TppAutoSearchField;
begin

 Result := (aSource <> nil) and (aSource.FieldCount = FieldCount) and
            (aSource.Description = Description);

  liIndex := 0;

  while Result and (liIndex < FieldCount) do
    begin
      lField := Fields[liIndex];

      lSourceField := aSource.GetFieldForNameAndOperator(lField.FieldName, lField.SearchOperator);

      Result := (lSourceField <> nil);

      Inc(liIndex);

    end;

end; {function, CompareStructure}

{------------------------------------------------------------------------------}
{ TppAutoSearchGroup.AssignSearchValuesFromGroup }

function TppAutoSearchGroup.AssignSearchValuesFromGroup(aSource: TppAutoSearchGroup): Boolean;
var
  lbValueChange: Boolean;
  lField: TppAutoSearchField;
  liIndex: Integer;
  lSourceField: TppAutoSearchField;
begin

  Result := False;
  lbValueChange := False;

  for liIndex := 0 to FieldCount-1 do
    begin
      lField := Fields[liIndex];

      lSourceField := aSource.Fields[liIndex];

      if (lField.FieldName <> lSourceField.FieldName) or
         (lField.SearchOperator <> lSourceField.SearchOperator) then
        lSourceField := aSource.GetFieldForNameAndOperator(lField.FieldName, lField.SearchOperator);

      if (lSourceField <> nil) then
        lbValueChange := lField.AssignSearchValuesFromField(lSourceField);

      if lbValueChange then
        Result := True;

    end;

end; {procedure, AssignSearchValuesFromGroup}

{------------------------------------------------------------------------------}
{@TppAutoSearchGroup.GetFieldForNameAndOperator

  Returns a reference to the AutoSearchField corresponding to a specified
  field name and search operator.}

function TppAutoSearchGroup.GetFieldForNameAndOperator(aFieldName: String; aSearchOperator: TppSearchOperatorType): TppAutoSearchField;
var
  lField: TppAutoSearchField;
  liIndex: Integer;
begin

  Result := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < FieldCount) do
    begin
      lField := Fields[liIndex];
      
      if (lField.FieldName = aFieldName) and (lField.SearchOperator = aSearchOperator) then
        Result := lField
      else
        Inc(liIndex);

    end;

end;


{******************************************************************************
 *
 ** A U T O S E A R C H   F I E L D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.RefClass }

class function TraTppAutoSearchFieldRTTI.RefClass: TClass;
begin
  Result := TppAutoSearchField;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetPropList }

class procedure TraTppAutoSearchFieldRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddMethod('DisableCriteria');

  {add public props}
  aPropList.AddProp('Value');
  aPropList.AddProp('Values');
  aPropList.AddProp('ValueCount');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetPropRec }

class function TraTppAutoSearchFieldRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {properties & methods}
  if ppEqual(aPropName, 'Value') then
    PropToRec(aPropName, daVariant, True, aPropRec)

  else if ppEqual(aPropName, 'Values')  then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if ppEqual(aPropName, 'ValueCount') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'DisableCriteria') then
    MethodToRec(aPropName, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetParams }

class function TraTppAutoSearchFieldRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if ppEqual(aMethodName, 'Values') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daVariant, nil, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.CallMethod }

class function TraTppAutoSearchFieldRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lField: TppAutoSearchField;
  liIndex: Integer;
  lvValue: Variant;
begin

  Result := True;

  lField := TppAutoSearchField(aObject);

  if ppEqual(aMethodName, 'Values') then
    begin
      aParams.GetParamValue(0, liIndex);

      lvValue := lField.Values[liIndex];

      aParams.SetParamValue(1, lvValue);
    end

  else if ppEqual(aMethodName, 'DisableCriteria') then
    lField.DisableCriteria

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetPropValue }

class function TraTppAutoSearchFieldRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Value') then
    Variant(aValue) := TppAutoSearchField(aObject).Value

  else if ppEqual(aPropName, 'ValueCount') then
    Integer(aValue) := TppAutoSearchField(aObject).ValueCount

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}


initialization

  RegisterClasses([TppAutoSearchField, TppAutoSearchGroup, TppAutoSearchGroups]);

  raRegisterRTTI(TraTppAutoSearchFieldRTTI);

finalization

  UnRegisterClasses([TppAutoSearchField, TppAutoSearchGroup, TppAutoSearchGroups]);

  raUnRegisterRTTI(TraTppAutoSearchFieldRTTI);


end.

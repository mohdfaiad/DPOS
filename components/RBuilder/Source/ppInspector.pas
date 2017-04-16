{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                    BBBBB   }

unit ppInspector;

interface                                                                                 

uses
//  windows,
//  dialogs,
  Controls,

  SysUtils,
  Classes,
  TypInfo,
  ppTypes,
  ppRTTI,
  ppCollectionBase,
  ppComm,

  ppJCLRTTI,
  ppJvInspector,
  ppJvInspExtraEditors,
  ppDesignControllers,
  ppDesignSelectionController;

type

  TppPropertyNameArray = array of string;


  {TppPropertyCategory
    - represent a category and associated property name list}
  TppPropertyCategory = class
  private
    FName: String;
    FPropertyNames: TStrings;
    
  public
    constructor Create(aName: String); virtual;
    destructor Destroy; override;

    function GetPropertyNamesAsArray: TppPropertyNameArray;

    property Name: String read FName;
    property PropertyNames: TStrings read FPropertyNames;
  end;

  {TppPropertyCategoryCollection
    - represents a collection of TppPropertyCategory items}
  TppPropertyCategoryCollection = class(TppCollectionBase)
  private

    function GetItemForIndex(Index: Integer): TppPropertyCategory;
    function GetItemForName(aCategoryName: String): TppPropertyCategory;

  public
    constructor Create; override;

    function Add(aCategoryName: String): TppPropertyCategory; overload;
    function Add(aCategoryName, aPropertyName: String): TppPropertyCategory; overload;
    function IndexOf(aCategoryName: String): Integer;
    function GetCategoryNameForProperty(aPropertyName: String; var aCategoryName: String): Boolean;

    procedure Remove(aCategoryName: String);

    property ItemByName[Name: String]: TppPropertyCategory read GetItemForName;
    property Items[Index: Integer]: TppPropertyCategory read GetItemForIndex; default;

  end;

  {TppPropertyCategoryManager
    - initializes and manages a singleton master PropertyCategoryCollection
    - the GetCategoryCollectionForComponent method can be called to build
      a property category collection for a specified component}
  TppPropertyCategoryManager = class
  private
    class procedure InitializeCategoryCollection;
    class procedure InitializeAppearanceCategory;
    class procedure InitializeDataCategory;
    class procedure InitializeFileOutputCategory;
    class procedure InitializeGenerationCategory;
    class procedure InitializeIdentityCategory;
    class procedure InitializeLayoutDynamicCategory;
    class procedure InitializeLayoutStaticCategory;
    class procedure InitializePreviewCategory;
    class procedure InitializeTextCategory;
    class procedure InitializeCalculationsCategory;
    class procedure InitializeDialogCategory;
    class procedure InitializeStorageCategory;
    class procedure InitializeIgnoreCategory;
    class procedure InitializeBarCodeCategory;
  public
    class function PropertyCategories: TppPropertyCategoryCollection;

    class function GetCategoryCollection(aPropList: TraPropList):
        TppPropertyCategoryCollection;

  end;
                                

  {TppInspector}
  TppInspector = class(TppJvInspector)
  private
    FSelectedComponent: TComponent;
    FOnSelectComponent: TNotifyEvent;
    FDesignControllers: TppDesignControllers;
    FWalkieTalkie: TppCommunicator;
  protected
    procedure DoAfterItemCreate(const Item: TppJvCustomInspectorItem); override;
    procedure DoSelectComponent; virtual;
    procedure WalkieTalkieNotifyEvent(Sender: TObject; aCommunicator: TppCommunicator; aOperation: TppOperationType);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SelectObject(const aObject: TComponent);

    property PopupMenu;
    property SelectedComponent: TComponent read FSelectedComponent;
    property DesignControllers: TppDesignControllers read FDesignControllers write FDesignControllers;
    property OnSelectComponent: TNotifyEvent read FOnSelectComponent write FOnSelectComponent;

  end;


  {TppInspectorPropData}
  TppInspectorSelectionData = class(TppJvInspectorPropData)
  private
    FDesignControllers: TppDesignControllers;
    function GetSelectionController: TppDesignSelectionController;
  protected
    procedure CheckWriteAccess; override;
    procedure SetAsFloat(const Value: Extended); override;
    procedure SetAsInt64(const Value: Int64); override;
    procedure SetAsOrdinal(const Value: Int64); override;
    procedure SetAsString(const Value: string); override;
    property SelectionController: TppDesignSelectionController read GetSelectionController;


  public
    class function NewByNames(const aDesignControllers: TppDesignControllers; const
        AParent: TppJvCustomInspectorItem; const AInstance: TObject; const NameList:
        array of string; const ExcludeList: Boolean = False; const TypeKinds:
        TTypeKinds = tkProperties): TppJvInspectorItemInstances; overload;
    property DesignControllers: TppDesignControllers read FDesignControllers write FDesignControllers;
    property Prop;

  end;

  TppInspectorClassItem = class(TppJvInspectorClassItem)
  protected
    procedure CreateMembers; override;
  public
  end;


  {TppInspectorFloatItem
    - adds display formatting for floats}
  TppInspectorFloatItem = class(TppJvCustomInspectorItem)
  protected
    function GetDisplayValue: string; override;
    procedure SetDisplayValue(const Value: string); override;
  end;


  {TppInspectorComponentItem
    - ancestor for ComboBox: list of components
    - adds the Component.Owner as the default Owner}
  TppInspectorComponentItem = class(TppJvInspectorComponentItem)
  protected
    function GetComponent: TComponent;
    procedure SetItemClassFlags(Value: TInspectorClassFlags); override;
  public
    constructor Create(const AParent: TppJvCustomInspectorItem; const AData: TppJvCustomInspectorData); override;

  end;

  {TppInspectorComponentItem
    - ComboBox: DataPipeline list}
  TppInspectorDataPipelineItem = class(TppInspectorComponentItem)
  protected
    procedure GetValueList(const Strings: TStrings); override;

  end;

  {TppShiftRelativeToItem
    - ComboBox: Stretchable Component list}
  TppShiftRelativeToItem = class(TppInspectorComponentItem)
  protected
    procedure GetValueList(const Strings: TStrings); override;
  public

  end;

  {TppDrillDownComponentItem
    - ComboBox: Clickable Component list}
  TppDrillDownComponentItem = class(TppInspectorComponentItem)
  protected
    procedure GetValueList(const Strings: TStrings); override;
  public

  end;

  {TppStringValueListItem
    - Ancesotr for ComboBox: list of string values}
  TppStringValueListItem = class(TppJvInspectorStringItem)
  protected
    function GetComponent: TPersistent;
    procedure SetFlags(const Value: TInspectorItemFlags); override;

  end;

  {TppDataFieldItem
    - ComboBox - list of datafields}
  TppDataFieldItem = class(TppStringValueListItem)
  protected
    procedure GetValueList(const Strings: TStrings); override;
  public

  end;

  {TppGraphicTypeItem}
  TppGraphicTypeItem = class(TppStringValueListItem)
  protected
    procedure GetValueList(const Strings: TStrings); override;
  public

  end;

  {TppDeviceTypeItem}
  TppDeviceTypeItem = class(TppStringValueListItem)
  protected
    procedure GetValueList(const Strings: TStrings); override;
  public

  end;


  {TppInspectorDialogItem}
  TppInspectorDialogItem = class(TppJvCustomInspectorItem)
  private
  protected
    function GetDisplayValue: string; override;

    function GetRTTIClass: TraRTTIClass;
    function GetComponent: TPersistent;
    function GetPropValue(const aPropName: String; var aValue): Boolean;
    function SetPropValue(const aPropName: String; var aValue): Boolean;
    
  public
    constructor Create(const AParent: TppJvCustomInspectorItem; const AData: TppJvCustomInspectorData); override;
  end;

  {TppInspectorStringsDialogItem}
  TppInspectorStringsDialogItem = class(TppInspectorDialogItem)
  protected
    procedure Edit; override;
  public
  end;

  {TppInspectorRichTextDialogItem}
  TppInspectorRichTextDialogItem = class(TppInspectorDialogItem)
  protected
    procedure Edit; override;
  public
  end;

  {TppInspectorImageDialogItem}
  TppInspectorImageDialogItem = class(TppInspectorDialogItem)
  protected
    procedure Edit; override;
  public
  end;

  {TppInspectorDisplayFormatDialogItem}
  TppInspectorDisplayFormatDialogItem = class(TppInspectorDialogItem)
  protected
    function GetDisplayValue: string; override;
    procedure Edit; override;

    procedure EditVariable;
    procedure EditDBText;
  public
  end;

  {TppInspectorCaclTimingDialogItem}
  TppInspectorCaclTimingDialogItem = class(TppInspectorDialogItem)
  private
  protected
    function GetDisplayValue: String; override;
    procedure Edit; override;
  public
  end;

  {TppInspectorCaclOrderDialogItem}
  TppInspectorCaclOrderDialogItem = class(TppInspectorDialogItem)
  private
  protected
    function GetDisplayValue: String; override;
    procedure Edit; override;
  public
  end;

 {TppInspectorParametersDialogItem}
  TppInspectorParametersDialogItem = class(TppInspectorDialogItem)
  private
  protected
    function GetDisplayValue: String; override;
    procedure Edit; override;
  public
  end;

implementation

uses
  Forms,
  Graphics,

  ppClasUt,
  ppTmplat,
  ppDevice,
  ppClass,
  ppReport,
  ppCtrls,
  ppVar,
  ppStrtch,
  ppDB,
  ppPopupMenus,
  ppForms,
  ppDesignerForms,
  ppRichTx,
  ppRichEd,
  ppParametersEd;

var
  uPropertyCategories: TppPropertyCategoryCollection;


{******************************************************************************}
{* Property Category Manager
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.GetCategoryCollectionForComponent }

class function TppPropertyCategoryManager.GetCategoryCollection(aPropList: TraPropList): TppPropertyCategoryCollection;
var
  liIndex: Integer;
  lCategoryCollection: TppPropertyCategoryCollection;
  lsCategoryName: String;
  lsPropertyName: String;
begin

  lCategoryCollection := TppPropertyCategoryCollection.Create;

  {build category collection}
  for liIndex := 0 to aPropList.Count-1 do
    begin

      lsPropertyName := aPropList[liIndex];

      {get the category from the master list}
      if not TppPropertyCategoryManager.PropertyCategories.GetCategoryNameForProperty(lsPropertyName, lsCategoryName) then
        lsCategoryName := 'Miscellaneous';

      {add property to the component category list}
      if not(lsCategoryName = 'Ignore') then
        lCategoryCollection.Add(lsCategoryName, lsPropertyName);

    end;

  Result := lCategoryCollection;

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.PropertyCategories }

class function TppPropertyCategoryManager.PropertyCategories: TppPropertyCategoryCollection;
begin

  if (uPropertyCategories = nil) then
    InitializeCategoryCollection;

  Result := uPropertyCategories;

end;


{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeCategoryCollection }

class procedure TppPropertyCategoryManager.InitializeCategoryCollection;
begin

  uPropertyCategories := TppPropertyCategoryCollection.Create;

  InitializeIdentityCategory;
  InitializeTextCategory;
  InitializeAppearanceCategory;
  InitializeLayoutStaticCategory;
  InitializeLayoutDynamicCategory;
  InitializeDataCategory;
  InitializeFileOutputCategory;
  InitializePreviewCategory;
  InitializeGenerationCategory;
  InitializeCalculationsCategory;
  InitializeDialogCategory;
  InitializeStorageCategory;
  InitializeBarCodeCategory;

  InitializeIgnoreCategory;

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeIgnoreCategory }

class procedure TppPropertyCategoryManager.InitializeIgnoreCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Ignore');

  lCategory.PropertyNames.Add('Owner');
  lCategory.PropertyNames.Add('Name');
  lCategory.PropertyNames.Add('Tag');

  lCategory.PropertyNames.Add('AutoDisplay');
  lCategory.PropertyNames.Add('Chart');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeIdentityCategory }

class procedure TppPropertyCategoryManager.InitializeIdentityCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Identity');

  lCategory.PropertyNames.Add('UserName');

  // ommit these
//  lCategory.PropertyNames.Add('Name');
//  lCategory.PropertyNames.Add('Tag');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeAppearanceCategory }

class procedure TppPropertyCategoryManager.InitializeAppearanceCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Appearance');

  lCategory.PropertyNames.Add('Color');
  lCategory.PropertyNames.Add('Shape');
  lCategory.PropertyNames.Add('Pen');
  lCategory.PropertyNames.Add('BackgroundColor');
  lCategory.PropertyNames.Add('Brush');
  lCategory.PropertyNames.Add('Border');
  lCategory.PropertyNames.Add('Transparent');
  lCategory.PropertyNames.Add('Visible');
  lCategory.PropertyNames.Add('Style');
  lCategory.PropertyNames.Add('Weight');
  lCategory.PropertyNames.Add('Position');  // line

  lCategory.PropertyNames.Add('Center');
  lCategory.PropertyNames.Add('MaintainAspectRatio');
  lCategory.PropertyNames.Add('Picture');
  lCategory.PropertyNames.Add('DirectDraw');

  lCategory.PropertyNames.Add('VarType');  // system variable

  lCategory.PropertyNames.Add('BlankWhenZero');  // dbtext
  lCategory.PropertyNames.Add('SuppressRepeatedValues');
  lCategory.PropertyNames.Add('ReprintOnSubsequent');
//  lCategory.PropertyNames.Add('ResetGroup');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeTextCategory }

class procedure TppPropertyCategoryManager.InitializeTextCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Text');

  lCategory.PropertyNames.Add('Alignment');
  lCategory.PropertyNames.Add('Angle');
  lCategory.PropertyNames.Add('TextAlignment');
  lCategory.PropertyNames.Add('DisplayFormat');
  lCategory.PropertyNames.Add('Caption');
  lCategory.PropertyNames.Add('CaptionLayout');
  lCategory.PropertyNames.Add('CharWrap');
  lCategory.PropertyNames.Add('Font');
  lCategory.PropertyNames.Add('WordWrap');
  lCategory.PropertyNames.Add('Text');
  lCategory.PropertyNames.Add('Leading');
  lCategory.PropertyNames.Add('Lines');
  lCategory.PropertyNames.Add('TabStopPositions');
  lCategory.PropertyNames.Add('ForceJustifyLastLine');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeLayoutStaticCategory }

class procedure TppPropertyCategoryManager.InitializeLayoutStaticCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Layout');

  lCategory.PropertyNames.Add('Units');
  lCategory.PropertyNames.Add('Left');
  lCategory.PropertyNames.Add('Top');
  lCategory.PropertyNames.Add('Width');
  lCategory.PropertyNames.Add('Height');
  lCategory.PropertyNames.Add('ParentWidth');
  lCategory.PropertyNames.Add('ParentHeight');

  //band
  lCategory.PropertyNames.Add('PrintOnFirstPage');
  lCategory.PropertyNames.Add('PrintOnLastPage');
  lCategory.PropertyNames.Add('NewPage');
  lCategory.PropertyNames.Add('PrintPosition');


  // report props
  lCategory.PropertyNames.Add('Columns');
  lCategory.PropertyNames.Add('ColumnPositions');
  lCategory.PropertyNames.Add('ColumnWidth');
  lCategory.PropertyNames.Add('PrinterSetup');
  lCategory.PropertyNames.Add('SavePrinterSetup');

  // subreport props
  lCategory.PropertyNames.Add('ParentPrinterSetup');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeLayoutDynamicCategory }

class procedure TppPropertyCategoryManager.InitializeLayoutDynamicCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Layout - Dynamic');

  lCategory.PropertyNames.Add('AutoSize');
  lCategory.PropertyNames.Add('Stretch');
  lCategory.PropertyNames.Add('ShiftRelativeTo');
  lCategory.PropertyNames.Add('ShiftWithParent');
  lCategory.PropertyNames.Add('StretchWithParent');
  lCategory.PropertyNames.Add('Anchors');
  lCategory.PropertyNames.Add('KeepTogether');
  lCategory.PropertyNames.Add('BottomOffset');
  lCategory.PropertyNames.Add('OverFlowOffset');
  lCategory.PropertyNames.Add('ReprintOnOverflow');
  lCategory.PropertyNames.Add('StopPosition');

  // band
  lCategory.PropertyNames.Add('PrintHeight');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeDataCategory }

class procedure TppPropertyCategoryManager.InitializeDataCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Data');

  lCategory.PropertyNames.Add('DataPipeline');
  lCategory.PropertyNames.Add('DataField');
  lCategory.PropertyNames.Add('ParentDataPipeline');
  lCategory.PropertyNames.Add('NoDataBehaviors');
  lCategory.PropertyNames.Add('TraverseAllData');

  lCategory.PropertyNames.Add('GraphicType');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeCalculationsCategory }

class procedure TppPropertyCategoryManager.InitializeCalculationsCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Calculations');

  lCategory.PropertyNames.Add('CalcType');
  lCategory.PropertyNames.Add('CalcOrder');
  lCategory.PropertyNames.Add('LookAhead');
  lCategory.PropertyNames.Add('CalcComponent');
  lCategory.PropertyNames.Add('ResetType');
  lCategory.PropertyNames.Add('ResetComponent');

  lCategory.PropertyNames.Add('DBCalcType');
  lCategory.PropertyNames.Add('ResetGroup');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeFileOutputCategory }

class procedure TppPropertyCategoryManager.InitializeFileOutputCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Output - File');

  // component & band props
  lCategory.PropertyNames.Add('Save');
  lCategory.PropertyNames.Add('SaveLength');
  lCategory.PropertyNames.Add('SaveOrder');

  // report props
  lCategory.PropertyNames.Add('AllowPrintToFile');
  lCategory.PropertyNames.Add('AllowPrintToArchive');
  lCategory.PropertyNames.Add('ArchiveFileName');
  lCategory.PropertyNames.Add('TextFileName');
  lCategory.PropertyNames.Add('TextFileType');
  lCategory.PropertyNames.Add('PDFSettings');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeGenerationCategory }

class procedure TppPropertyCategoryManager.InitializeGenerationCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Generation');

  // report props
  lCategory.PropertyNames.Add('AutoStop');
  lCategory.PropertyNames.Add('DeviceType');
  lCategory.PropertyNames.Add('PassSetting');
  lCategory.PropertyNames.Add('CachePages');
  lCategory.PropertyNames.Add('PageLimit');
  lCategory.PropertyNames.Add('BackgroundPrintSettings');
  lCategory.PropertyNames.Add('Parameters');
  lCategory.PropertyNames.Add('ParametersEditor');

  //subreport props
  lCategory.PropertyNames.Add('DrillDownComponent');
  lCategory.PropertyNames.Add('ExpandAll');
  lCategory.PropertyNames.Add('PrintBehavior');
  lCategory.PropertyNames.Add('NewPrintJob');
  lCategory.PropertyNames.Add('ResetPageNo');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeDialogCategory }

class procedure TppPropertyCategoryManager.InitializeDialogCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('User Interface');

  // report props
  lCategory.PropertyNames.Add('Icon');
  lCategory.PropertyNames.Add('Language');
  lCategory.PropertyNames.Add('ModalCancelDialog');
  lCategory.PropertyNames.Add('ModalPreview');
  lCategory.PropertyNames.Add('ShowPrintDialog');
  lCategory.PropertyNames.Add('ShowAutoSearchDialog');
  lCategory.PropertyNames.Add('ShowCancelDialog');

  // report props
  lCategory.PropertyNames.Add('EmailSettings');
  lCategory.PropertyNames.Add('OutlineSettings');
  lCategory.PropertyNames.Add('PreviewFormSettings');
  lCategory.PropertyNames.Add('TextSearchSettings');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializePreviewCategory }

class procedure TppPropertyCategoryManager.InitializePreviewCategory;
//var
//  lCategory: TppPropertyCategory;
begin
//  lCategory := uPropertyCategories.Add('User Interface - Preview');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeStorageCategory }

class procedure TppPropertyCategoryManager.InitializeStorageCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('Storage');

  // report props
  lCategory.PropertyNames.Add('Template');
  lCategory.PropertyNames.Add('SaveAsTemplate');

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryManager.InitializeBarCodeCategory }

class procedure TppPropertyCategoryManager.InitializeBarCodeCategory;
var
  lCategory: TppPropertyCategory;
begin
  lCategory := uPropertyCategories.Add('BarCode');

  lCategory.PropertyNames.Add('AddOnCode');
  lCategory.PropertyNames.Add('AutoEncode');
  lCategory.PropertyNames.Add('AutoSizeFont');
  lCategory.PropertyNames.Add('BarCodeType');
  lCategory.PropertyNames.Add('BarColor');
  lCategory.PropertyNames.Add('BarWidth');
  lCategory.PropertyNames.Add('BearerBars');
  lCategory.PropertyNames.Add('CalcCheckDigit');
  lCategory.PropertyNames.Add('Data');
  lCategory.PropertyNames.Add('Orientation');
  lCategory.PropertyNames.Add('PrintHumanReadable');
  lCategory.PropertyNames.Add('WideBarRatio');

  //2DBarCode
  lCategory.PropertyNames.Add('AutoScale');
  lCategory.PropertyNames.Add('BarHeight');
  lCategory.PropertyNames.Add('CarrierCountryCode');
  lCategory.PropertyNames.Add('CarrierPostalCode');
  lCategory.PropertyNames.Add('CarrierServiceClass');
  lCategory.PropertyNames.Add('ECCLevel');
  lCategory.PropertyNames.Add('ExtendedSyntax');
  lCategory.PropertyNames.Add('HorPixelsPerMM');
  lCategory.PropertyNames.Add('Mode');
  lCategory.PropertyNames.Add('NumColumns');
  lCategory.PropertyNames.Add('NumRows');
  lCategory.PropertyNames.Add('QuietZone');
  lCategory.PropertyNames.Add('RelativeBarHeight');
  lCategory.PropertyNames.Add('Truncated');
  lCategory.PropertyNames.Add('VerPixelsPerMM');

end;


{******************************************************************************}
{* Property Category
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPropertyCategory.Create }

constructor TppPropertyCategory.Create(aName: String);
begin

  inherited Create;

  FName := aName;

  FPropertyNames := TStringList.Create;
  TStringList(FPropertyNames).Sorted := True;
  TStringList(FPropertyNames).Duplicates := dupIgnore;

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategory.Destroy }

destructor TppPropertyCategory.Destroy;
begin
  FPropertyNames.Free;

  inherited;

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategory.GetPropertyNamesAsArray }

function TppPropertyCategory.GetPropertyNamesAsArray: TppPropertyNameArray;
var
  liIndex: Integer;
begin
  SetLength(Result, FPropertyNames.Count);

  for liIndex := 0 to FPropertyNames.Count-1 do
    Result[liIndex] := FPropertyNames[liIndex];

end;

{******************************************************************************}
{* Property Category Collection
{******************************************************************************}

constructor TppPropertyCategoryCollection.Create;
begin
  inherited;

  InnerList.OwnsObjects := True;

end;

{ TppPropertyCategoryCollection }

{------------------------------------------------------------------------------}
{ TppPropertyCategoryCollection.Add }

function TppPropertyCategoryCollection.Add(aCategoryName: String): TppPropertyCategory;
var
  liIndex: Integer;
begin
  liIndex := Indexof(aCategoryName);

  if (liIndex >=0) then
    Result := GetItemForIndex(liIndex)
  else
    begin
      Result := TppPropertyCategory.Create(aCategoryName);
      InnerList.Add(Result);
    end;

end;


function TppPropertyCategoryCollection.Add(aCategoryName, aPropertyName: String): TppPropertyCategory;
begin
  Result := Add(aCategoryName);
  Result.PropertyNames.Add(aPropertyName);

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryCollection.GetItemForIndex }

function TppPropertyCategoryCollection.GetItemForIndex(Index: Integer): TppPropertyCategory;
begin
  Result := TppPropertyCategory(InnerList[Index]);

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryCollection.GetItemForName }

function TppPropertyCategoryCollection.GetItemForName(aCategoryName: String): TppPropertyCategory;
var
  liIndex: Integer;
begin
  liIndex := IndexOf(aCategoryName);

  if liIndex >= 0 then
    Result := GetItemForIndex(liIndex)
  else
    Result := nil;


end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryCollection.GetCategoryNameForProperty }

function TppPropertyCategoryCollection.GetCategoryNameForProperty(aPropertyName: String; var aCategoryName: String): Boolean;
var
  liIndex: Integer;
  lbFound: Boolean;
  lCategory: TppPropertyCategory;
begin

  liIndex := 0;
  lbFound := False;
  lCategory := nil;

  while not(lbFound) and (liIndex < Count) do
    begin
      lCategory := GetItemForIndex(liIndex);

      if lCategory.PropertyNames.IndexOf(aPropertyName) >= 0 then
        lbFound := True
      else
        Inc(liIndex);
    end;

  Result := lbFound;
    
  if lbFound then
    aCategoryName := lCategory.Name
  else
    aCategoryName := '';
    
end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryCollection.IndexOf }

function TppPropertyCategoryCollection.IndexOf(aCategoryName: String): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
begin

  liIndex := 0;
  lbFound := False;

  while not(lbFound) and (liIndex < Count) do
    begin
      if (CompareText(GetItemForIndex(liIndex).Name, aCategoryName) = 0) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex
  else
    Result := -1;

end;

{------------------------------------------------------------------------------}
{ TppPropertyCategoryCollection.Remove }

procedure TppPropertyCategoryCollection.Remove(aCategoryName: String);
var
  liIndex: Integer;
begin
  liIndex := IndexOf(aCategoryName);

  if liIndex >= 0 then
    InnerList.Delete(liIndex);

end;


{******************************************************************************}
{* Inspector
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppInspector.Create }

constructor TppInspector.Create(AOwner: TComponent);
begin
  inherited;

  Painter :=  TppJvInspectorDotNETPainter.Create(nil);
  FWalkieTalkie := TppCommunicator.Create(nil);
  FWalkieTalkie.OnNotify := WalkieTalkieNotifyEvent;
  Divider := 120;
end;

{------------------------------------------------------------------------------}
{ TppInspector.Destroy }

destructor TppInspector.Destroy;
begin

  Painter.Free;
  Painter := nil;
  
  FWalkieTalkie.Free;
  FWalkieTalkie := nil;

  inherited;
  
end;

{------------------------------------------------------------------------------}
{ TppInspector.DoAfterItemCreate }

procedure TppInspector.DoAfterItemCreate(const Item: TppJvCustomInspectorItem);
begin
  inherited;

  if (Item is TppJvInspectorComponentItem) then
    TppJvInspectorComponentItem(Item).ItemClassFlags := []  // do  not expand component items
  else if (Item is TppJvInspectorBooleanItem) then
    TppJvInspectorBooleanItem(Item).ShowAsCheckbox := True; // use checkbox for boolean items

end;


{------------------------------------------------------------------------------}
{ TppInspector.SelectObject }

procedure TppInspector.SelectObject(const aObject: TComponent);
var
  lPropCategories: TppPropertyCategoryCollection;
  liIndex: Integer;
  lJvCategoryItem: TppJvInspectorCustomCategoryItem;
  lPropList: TraPropList;
begin

  if (csDestroying in ComponentState) then Exit;


  {clear items}
  Root.Clear;

  BeginUpdate;

  if (FSelectedComponent <> nil) and (FSelectedComponent is TppCommunicator) then
    TppCommunicator(FSelectedComponent).RemoveNotify(FWalkieTalkie);

  if (aObject = nil) or (csDestroying in aObject.ComponentState) then
    FSelectedComponent := nil
  else
    FSelectedComponent := aObject;

  if (FSelectedComponent <> nil) and (FSelectedComponent is TppCommunicator) then
    TppCommunicator(FSelectedComponent).AddNotify(FWalkieTalkie);


  {get property categories for the selected object}
  if (aObject <> nil) then
    begin

      lPropList := TraPropList.Create;
      lPropCategories := nil;

      try

        DesignControllers.SelectionController.GetAggregatePropList(lPropList);
        
        lPropCategories := TppPropertyCategoryManager.GetCategoryCollection(lPropList);

        {add property categories}
        for liIndex := 0 to lPropCategories.Count-1 do
          begin
            {add the category item}
            lJvCategoryItem := TppJvInspectorCustomCategoryItem.Create(Root, nil);
            lJvCategoryItem.DisplayName := lPropCategories[liIndex].Name;
            lJvCategoryItem.Expanded := True;

            {add the property items}
            TppInspectorSelectionData.NewByNames(DesignControllers, lJvCategoryItem, aObject, lPropCategories[liIndex].GetPropertyNamesAsArray);

          end;

      finally
        lPropList.Free;
        lPropCategories.Free;
      end;

    end;


  EndUpdate;


  DoSelectComponent;

end;

{------------------------------------------------------------------------------}
{ TppInspector.DoSelectComponent }

procedure TppInspector.DoSelectComponent;
begin

  if Assigned(FOnSelectComponent) then FOnSelectComponent(Self);

end;

{------------------------------------------------------------------------------}
{ TppInspector.WalkieTalkieNotifyEvent }

procedure TppInspector.WalkieTalkieNotifyEvent(Sender: TObject; aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  // notify toolwindow to update its caption
  if (FSelectedComponent = aCommunicator) then
    if (aOperation = ppopUserNameChange) then
      DoSelectComponent
    else if (aOperation = ppopRemove) then
      SelectObject(nil);

end; {procedure, WalkieTalkieNotifyEvent}


{******************************************************************************}
{* Inspector Float Item
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppInspector.GetDisplayValue }
function TppInspectorFloatItem.GetDisplayValue: string;
begin

  {apply format based upon the floattype}
  case GetTypeData(Data.TypeInfo).FloatType of
    ftSingle:
      Result := FloatToStrF(Data.AsFloat, ffGeneral, 8, 0);

    ftDouble:
      Result := FloatToStrF(Data.AsFloat, ffGeneral, 15, 0);

    ftCurr:
      Result := FloatToStrF(Data.AsFloat, ffCurrency, 15, 2);
  end;

end;

{------------------------------------------------------------------------------}
{ TppInspector.SetDisplayValue }

procedure TppInspectorFloatItem.SetDisplayValue(const Value: string);
begin
  Data.AsFloat := StrToFloat(Value);
end;

{******************************************************************************}
{* Inspector Component Item
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppInspectorComponentItem.Create }

constructor TppInspectorComponentItem.Create(const AParent: TppJvCustomInspectorItem; const AData: TppJvCustomInspectorData);
var
  lComponent: TComponent;
begin
  inherited;

  // add instance owner as the default
  lComponent := GetComponent;

  if (lComponent <> nil) and (lComponent.Owner <> nil) then
    AddOwner(lComponent.Owner);

end;

{------------------------------------------------------------------------------}
{ TppInspectorComponentItem.GetComponent }

function TppInspectorComponentItem.GetComponent: TComponent;
begin

  if (Data is TppJvInspectorPropData) and (TppJvInspectorPropData(Data).Instance is TComponent) then
    Result := TComponent(TppJvInspectorPropData(Data).Instance)
  else
    Result := nil;

end;

{------------------------------------------------------------------------------}
{ TppInspectorComponentItem.SetItemClassFlags }

procedure TppInspectorComponentItem.SetItemClassFlags(Value: TInspectorClassFlags);
begin
  inherited SetFlags([]);

end;

{******************************************************************************}
{* Inspector DataPipeline Item
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppInspectorDataPipelineItem.GetValueList }

procedure TppInspectorDataPipelineItem.GetValueList(const Strings: TStrings);
var
  lComponent: TComponent;
  lReport: TppCustomReport;
  lPipelineList: TppDataPipelineList;
begin

  lComponent := GetComponent;

  // get the report instance
  if (lComponent is TppComponent) then
    lReport := TppComponent(lComponent).Report

  else if (lComponent is TppCustomReport) then
    lReport := TppCustomReport(lComponent)

  else if (lComponent is TppGroup) then
    lReport := TppGroup(lComponent).Report

  else if (lComponent is TppBand) then
    lReport := TppBand(lComponent).Report
  else
    lReport := nil;

  // build the datapipeline list for the report
  if (lReport <> nil) then
     begin
       lPipelineList := TppDataPipelineList.Create(lReport.MainReport);

       Strings.Assign(lPipelineList);

       lPipelineList.Free;

     end;

end;

{******************************************************************************}
{* Inspector String Value List Item
{******************************************************************************}


{ TppStringValueListItem }

function TppStringValueListItem.GetComponent: TPersistent;
begin
  if (Data is TppJvInspectorPropData) and (TppJvInspectorPropData(Data).Instance is TPersistent) then
    Result := TPersistent(TppJvInspectorPropData(Data).Instance)
  else
    Result := nil;

end;


procedure TppStringValueListItem.SetFlags(const Value: TInspectorItemFlags);
var
  lFlags: TInspectorItemFlags;
begin
  lFlags := Value;
  Include(lFlags, iifValueList);
  inherited SetFlags(lFlags);
end;

{******************************************************************************}
{* Inspector DataField Item
{******************************************************************************}

{ TppDataFieldItem }

procedure TppDataFieldItem.GetValueList(const Strings: TStrings);
var
  lPersistent: TPersistent;
  lDataPipeline: TppDataPipeline;
begin

  lPersistent := GetComponent;

  // get the datapipeline instance
  if (lPersistent is TppComponent) then
    lDataPipeline := TppComponent(lPersistent).DataPipeline

//  else if (lComponent is TppGroup) and (TppGroup(lComponent).BreakComponent is TppDataPipeline) then
//    lDataPipeline := TppDataPipeline(TppGroup(lComponent).BreakComponent)

  else if lPersistent is TppTemplateDBSettings then
    lDataPipeline := TppTemplateDBSettings(lPersistent).DataPipeline
  else
    lDataPipeline := nil;

  // build the datapipeline list for the report
  if (lDataPipeline <> nil) then
    lDataPipeline.GetFieldNames(Strings);


end;

{******************************************************************************}
{* Inspector GraphicType Item
{******************************************************************************}

{ TppGraphicTypeItem }

procedure TppGraphicTypeItem.GetValueList(const Strings: TStrings);
begin
  Strings.Assign(ppGraphicClasses);

end;

{******************************************************************************}
{* Inspector DeviceType Item
{******************************************************************************}

{ TppDeviceTypeItem }

procedure TppDeviceTypeItem.GetValueList(const Strings: TStrings);
begin
  ppGetDeviceClasses(Strings);

end;

{******************************************************************************}
{* Inspector ShiftRelativeTo Item
{******************************************************************************}

{ TppShiftRelativeToItem }

{------------------------------------------------------------------------------}
{ TppShiftRelativeToItem.GetValueList }

procedure TppShiftRelativeToItem.GetValueList(const Strings: TStrings);
var
  lComponent: TppComponent;
begin
  lComponent := TppComponent(GetComponent);

  if (lComponent <> nil) then
    ppGetStretchableComponents(lComponent, Strings, True);

end;

{******************************************************************************}
{* Inspector DrillDownComponent Item
{******************************************************************************}

{ TppDrillDownComponentItem }

procedure TppDrillDownComponentItem.GetValueList(const Strings: TStrings);
var
  lComponent: TppComponent;
begin
  lComponent := TppComponent(GetComponent);

  if (lComponent <> nil) then
    ppGetClickableComponents(lComponent, Strings, True);

end;

{******************************************************************************}
{* Inspector DialogItem Item
{******************************************************************************}

{ TppInspectorDialogItem }

constructor TppInspectorDialogItem.Create(const AParent: TppJvCustomInspectorItem; const AData: TppJvCustomInspectorData);
begin
  inherited;

  Flags := Flags + [iifEditButton];

end;

function TppInspectorDialogItem.GetComponent: TPersistent;
begin
  if (Data is TppJvInspectorPropData) and (TppJvInspectorPropData(Data).Instance is TPersistent) then
    Result := TPersistent(TppJvInspectorPropData(Data).Instance)
  else
    Result := nil;

end;


function TppInspectorDialogItem.GetRTTIClass: TraRTTIClass;
begin

  Result := TraRTTIClassRegistry.GetRTTIClass(GetComponent.ClassType);

end;

function TppInspectorDialogItem.GetPropValue(const aPropName: String; var aValue): Boolean;
begin

  if GetRTTIClass.IsValidPropName(GetComponent, aPropName) then
    Result := GetRTTIClass.GetPropValue(GetComponent, aPropName, aValue)
  else
    Result := False;

end;

{------------------------------------------------------------------------------}
{ TppPopupMenu.SetPropValue }

function TppInspectorDialogItem.SetPropValue(const aPropName: String; var aValue): Boolean;
begin
  if GetRTTIClass.IsValidPropName(GetComponent, aPropName) then
    Result := GetRTTIClass.SetPropValue(GetComponent, aPropName, aValue)
  else
    Result := False;

end;



function TppInspectorDialogItem.GetDisplayValue: string;
var
  lObject: TObject;
begin

  if Data.TypeInfo.Kind in [tkString, tkLString, tkWString] then
    Result := '(Edit...)'
  else
    begin
      lObject := TObject(Data.AsOrdinal);
      if lObject <> nil then
        Result := Result + '('+ lObject.ClassName + ')'
      else
        Result := Result + '(' + GetTypeData(Data.TypeInfo).ClassType.ClassName + ')';
    end;

end;

{******************************************************************************}
{* Inspector Strings DialogItem Item
{******************************************************************************}

{ TppInspectorStringsDialogItem }

procedure TppInspectorStringsDialogItem.Edit;
var
  lMemoDlg : TppCustomMemoDialog;
  lFormClass: TFormClass;
  lLines: TStrings;
  lFont: TFont;
begin

  {display memo property dialog}
  lFormClass := ppGetFormClass(TppCustomMemoDialog);

  lMemoDlg := TppCustomMemoDialog(lFormClass.Create(Application));
  lMemoDlg.Position := poScreenCenter;

  // apply property values to dialog
  if GetPropValue('Font', lFont) then
    lMemoDlg.Font := lFont;

  if GetPropValue(Data.Name, lLines) then
    lMemoDlg.Lines := lLines;

//  lMemoDlg.PopupParent := Screen.ActiveForm;

  if (lMemoDlg.ShowModal = mrOK) then
    begin
      // update the property value
      lLines := lMemoDlg.Lines;
      SetPropValue(Data.Name, lLines);

    end;

  lMemoDlg.Release;

end;

{******************************************************************************}
{* Inspector RichText DialogItem Item
{******************************************************************************}

{ TppInspectorRichTextDialogItem }

procedure TppInspectorRichTextDialogItem.Edit;
begin
  TppRTFEditorController.Edit(TppRichText(GetComponent));

end;

{******************************************************************************}
{* Inspector Image DialogItem Item
{******************************************************************************}

{ TppInspectorImageDialogItem }

procedure TppInspectorImageDialogItem.Edit;
var
  lImagePopupMenu: TppImagePopupMenu;
begin
  lImagePopupMenu := TppImagePopupMenu.Create(nil);

  try
    lImagePopupMenu.Component := TppImage(GetComponent);

    lImagePopupMenu.Edit;

  finally
    lImagePopupMenu.Free;
  end;


end;

{******************************************************************************}
{* Inspector DisplayFormat DialogItem Item
{******************************************************************************}

{ TppInspectorDisplayFormatDialogItem }

function TppInspectorDisplayFormatDialogItem.GetDisplayValue: string;
begin
  GetPropValue('DisplayFormat', Result);

end;

procedure TppInspectorDisplayFormatDialogItem.Edit;
begin

  if GetComponent is TppCustomVariable then
    EditVariable
  else if GetComponent is TppDBText then
    EditDBText;

  InvalidateItem;

end;

procedure TppInspectorDisplayFormatDialogItem.EditVariable;
var
  lVariablePopupMenu: TppCustomVariablePopupMenu;
begin

  lVariablePopupMenu := TppCustomVariablePopupMenu.Create(nil);

  try
    lVariablePopupMenu.Component := TppCustomVariable(GetComponent);

    lVariablePopupMenu.EditFormat;

  finally
    lVariablePopupMenu.Free;
  end;


end;

procedure TppInspectorDisplayFormatDialogItem.EditDBText;
var
  lDBTextPopupMenu: TppDBTextPopupMenu;
begin

  lDBTextPopupMenu := TppDBTextPopupMenu.Create(nil);

  try
    lDBTextPopupMenu.Component := TppComponent(GetComponent);

    lDBTextPopupMenu.EditFormat;

  finally
    lDBTextPopupMenu.Free;
  end;


end;


{******************************************************************************}
{* Inspector CaclTiming DialogItem Item
{******************************************************************************}

{ TppInspectorCaclTimingDialogItem }

function TppInspectorCaclTimingDialogItem.GetDisplayValue: string;
var
  lComponent: TppComponent;
begin

  lComponent := TppComponent(Data.AsOrdinal);

  if lComponent <> nil then
    Result := lComponent.UserName;

end;


procedure TppInspectorCaclTimingDialogItem.Edit;
var
  lPopupMenu: TppVariablePopupMenu;
begin

  lPopupMenu := TppVariablePopupMenu.Create(nil);

  try
    lPopupMenu.Component := TppComponent(GetComponent);

    lPopupMenu.EditTiming;
    EditCtrl.Text := GetDisplayValue;

  finally
    lPopupMenu.Free;
  end;


end;

{******************************************************************************}
{* Inspector CaclOrder DialogItem Item
{******************************************************************************}

{ TppInspectorCaclOrderDialogItem }

function TppInspectorCaclOrderDialogItem.GetDisplayValue: String;
begin
  Result := ppJclTypedIntToStr(Integer(Data.AsOrdinal), Data.TypeInfo);
end;

procedure TppInspectorCaclOrderDialogItem.Edit;
var
  lPopupMenu: TppBandPopupMenu;
begin

  lPopupMenu := TppBandPopupMenu.Create(nil);

  try
    lPopupMenu.Band := TppComponent(GetComponent).Band;

    lPopupMenu.EditCalcOrder;

    EditCtrl.Text := GetDisplayValue;

  finally
    lPopupMenu.Free;
  end;

end;


{ TppInspectorParametersDialogItem }

procedure TppInspectorParametersDialogItem.Edit;
var
  lParamEditor: TppParameterEditor;
begin

  lParamEditor := TppParameterEditor.Create(nil);
  lParamEditor.Component := TppReport(GetComponent).Parameters;
  lParamEditor.ShowModal;

end;

function TppInspectorParametersDialogItem.GetDisplayValue: String;
begin

end;

resourcestring
  sJvInspDataNoSelectionController = 'TppInspectorSelectionData - SelectionController is nil';


procedure TppInspectorSelectionData.CheckWriteAccess;
begin
  inherited;

  if (FDesignControllers = nil) then
    raise EppJvInspectorData.Create(sJvInspDataNoSelectionController);

end;

function TppInspectorSelectionData.GetSelectionController: TppDesignSelectionController;
begin

  if (DesignControllers <> nil) then
    Result := DesignControllers.SelectionController
  else
    Result := nil;

end;

class function TppInspectorSelectionData.NewByNames(const aDesignControllers:
    TppDesignControllers; const AParent: TppJvCustomInspectorItem; const
    AInstance: TObject; const NameList: array of string; const ExcludeList:
    Boolean = False; const TypeKinds: TTypeKinds = tkProperties):
    TppJvInspectorItemInstances;
var
  liIndex: Integer;
begin

  Result := NewByNames(aParent, aInstance, NameList, ExcludeList, TypeKinds);

  for liIndex := 0 to High(Result) do
    TppInspectorSelectionData(Result[liIndex].Data).DesignControllers := aDesignControllers;

end;

procedure TppInspectorSelectionData.SetAsFloat(const Value: Extended);
begin
  CheckWriteAccess;

  if Prop.PropType^.Kind = tkFloat then
    SelectionController.SetPropValue(Prop, Value)
  else
    raise EppJvInspectorData.CreateFmt(sppJvInspDataNoAccessAs, ['Float']);

  InvalidateData;
  Invalidate;

end;

procedure TppInspectorSelectionData.SetAsInt64(const Value: Int64);
begin
  CheckWriteAccess;

  if Prop.PropType^.Kind = tkInt64 then
    SelectionController.SetPropValue(Prop, Value)
  else
    raise EppJvInspectorData.CreateFmt(sppJvInspDataNoAccessAs, ['Int64']);

  InvalidateData;
  Invalidate;
end;

procedure TppInspectorSelectionData.SetAsOrdinal(const Value: Int64);
begin

  CheckWriteAccess;

  if Prop.PropType^.Kind in [tkInteger, tkChar, tkEnumeration, tkSet, tkWChar, tkClass] then
    begin
      if GetTypeData(Prop.PropType^).OrdType = otULong then
        SelectionController.SetPropValue(Prop, Cardinal(Value))
      else
        SelectionController.SetPropValue(Prop, Longint(Value));
    end
  else
    raise EppJvInspectorData.CreateFmt(sppJvInspDataNoAccessAs, ['Ordinal']);

  InvalidateData;
  Invalidate;

end;

procedure TppInspectorSelectionData.SetAsString(const Value: string);
begin

  CheckWriteAccess;

  if Prop.PropType^.Kind in [tkString, tkLString, tkWString] then
    SelectionController.SetPropValue( Prop, Value)
  else
    raise EppJvInspectorData.CreateFmt(sppJvInspDataNoAccessAs, ['String']);

  InvalidateData;
  Invalidate;

end;

procedure TppInspectorClassItem.CreateMembers;
var
  lData: TppInspectorSelectionData;
  lMemberItems: TppJvInspectorItemInstances;
  liIndex: Integer;
begin
  lMemberItems := nil;
  if Data.IsInitialized and (Data.AsOrdinal <> 0) then
  begin
    Inspector.BeginUpdate;
    try
      DeleteMembers;
      lMemberItems := TppInspectorSelectionData.New(Self, TObject(Data.AsOrdinal));

      if (Data is TppInspectorSelectionData) then
        begin
          lData := TppInspectorSelectionData(Data);

          for liIndex := Low(lMemberItems) to High(lMemberItems) do

           if (lMemberItems[liIndex].Data is TppInspectorSelectionData) then
              TppInspectorSelectionData(lMemberItems[liIndex].Data).DesignControllers := lData.DesignControllers;

         end;

      LastMemberInstance := TObject(Data.AsOrdinal);
    finally
      Inspector.EndUpdate;
    end;
  end;
end;





initialization
  TppJvInspectorColorItem.RegisterAsDefaultItem;

  // register customer property items (i.e. prop editors)
// deferred  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorTypeKindRegItem.Create(TppInspectorClassItem, tkClass));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorTypeKindRegItem.Create(TppInspectorFloatItem, tkFloat));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorTypeInfoRegItem.Create(TppInspectorComponentItem, TypeInfo(TComponent)));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorTypeInfoRegItem.Create(TppInspectorDataPipelineItem, TypeInfo(TppDataPipeline)));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorTypeInfoRegItem.Create(TppInspectorStringsDialogItem, TypeInfo(TStrings)));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppDataFieldItem, nil, 'DataField', nil));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppGraphicTypeItem, nil, 'GraphicType', nil));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppDeviceTypeItem, nil, 'DeviceType', nil));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppShiftRelativeToItem, nil, 'ShiftRelativeTo', TypeInfo(TppStretchable)));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppDrillDownComponentItem, nil, 'DrillDownComponent', TypeInfo(TppComponent)));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppInspectorRichTextDialogItem, TppRichText, 'RichText', nil));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppInspectorImageDialogItem, TppImage, 'Picture', nil));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppInspectorDisplayFormatDialogItem, nil, 'DisplayFormat', nil));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppInspectorCaclTimingDialogItem, TppVariable, 'CalcComponent', nil));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppInspectorCaclTimingDialogItem, TppVariable, 'ResetComponent', nil));
  TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppInspectorCaclOrderDialogItem, TppVariable, 'CalcOrder', nil));
// not working
// TppJvCustomInspectorData.ItemRegister.Add(TppJvInspectorPropRegItem.Create(TppInspectorParametersDialogItem, TppReport, 'ParametersEditor', nil));

finalization
  uPropertyCategories.Free;


end.

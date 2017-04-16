{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                   BBBBB   }
  
unit ppDesignSelectionController;

interface

{$I ppIfDef.pas}
{x$Define CodeSite}

uses
{$IFDEF CodeSite}
  csIntf,
{$ENDIF}

  Windows,
  Types,
  SysUtils,
  TypInfo,
  Classes,
  Clipbrd,
  Graphics,
  Controls,
  Dialogs,
  Contnrs,
  Forms,
  StdCtrls,

  ppTypes,
  ppRTTI,
  ppUtils,
  ppComm,
  ppClass,
  ppUndo,

  ppCtrls,
  ppDB,
  ppPrintr,
  ppReport,

  ppDesignControls,
  ppDesignSelection,
  ppDesignerWorkspace,
  ppDesignWorkspaceView,
  ppDesignControllerBase,
  ppDesignEventHub;

var
  {clipboard format for report}
  CF_PPDATA : Word;

type

// UndoManager
// Selection
// Report

  TppAlignSelectionController = class;
  TppSizeSelectionController = class;
  TppStreamSelectionController = class;


  {TppDesignSelectionController}
  TppDesignSelectionController = class(TppDesignControllerBase)
  private
    FAnchorComponent: TppComponent;
    FBorderComponent: TppComponent;
    FColorComponent: TppComponent;
    FDefaultFont: TFont;
    FFontComponent: TppComponent;
    FGraphicComponent: TppCustomGraphic;
    FJustificationComponent: TppComponent;
    FLineComponent: TppLine;
    FAlignSelectionController: TppAlignSelectionController;
    FBorder: TppBorder;
    FDataPipelineList: TppDataPipelineList;
    FDefaultComponent: TppComponent;
    FFieldAliases: TStringList;
    FFontList: TppFontList;
    FPrinterName: String;
    FSizeSelectionController: TppSizeSelectionController;
    FStreamSelectionController: TppStreamSelectionController;

  protected
    procedure BeginTask;
    procedure DoOnAssignField(Sender: TObject);
    procedure DoOnGetAliasForField(Sender: TObject; aDataPipeline: TppDataPipeline; const aDataField: String; var aFieldAlias: String);
    procedure DoOnGetFieldForAlias(Sender: TObject; const aFieldAlias: String; var aDataPipeline: TppDataPipeline; var aDataField: String);
    procedure ehSelection_AfterChange(Sender, aEventParams: TObject);
    procedure ehWorkspace_KeyDown(Sender, aParameters: TObject);
    procedure EndTask;
    function GetFontComponent: TppComponent;
    procedure ModifyFontStyle(aFontStyle: TFontStyle; aAdd: Boolean);
    procedure SelectionChanged;
    procedure SetComponentPropValue(aComponent: TComponent; aPropInfo: PPropInfo; aValue: Int64); overload;
    procedure SetComponentPropValue(aComponent: TComponent; aPropInfo: PPropInfo; aValue: LongInt); overload;
    procedure SetComponentPropValue(aComponent: TComponent; aPropInfo: PPropInfo; aValue: String); overload;
    procedure SetComponentPropValue(aComponent: TComponent; aPropInfo: PPropInfo; aValue: Extended); overload;
    procedure SetEventHub(aEventHub: TppDesignEventHub); override;
    procedure SetWorkspaceView(const Value: TppDesignWorkspaceView); override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure AddFontStyle(aFontStyle: TFontStyle);
    procedure Align(aAlign: TppAlignType);
    procedure BringToFront;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure Delete;
    procedure GetAggregatePropList(aPropList: TraPropList);
    procedure Nudge(aDirection: TppDirectionType);
    procedure NudgeSize(aDirection: TppDirectionType);
    procedure PasteFromClipboard;
    procedure Redo;
    procedure RemoveFontStyle(aFontStyle: TFontStyle);
    procedure SelectAll;
    procedure SendToBack;
    procedure Size(aSize: TppSizeType);
    procedure Space(aAlign: TppAlignType);
    procedure UnDelete;
    procedure Undo;

    function GetAnchors(var aAnchors: TppAnchors): Boolean;
    function GetBorderPositions(var aBorderPositions: TppBorderPositions): Boolean;
    function GetDataFieldList(aList: TStrings): Boolean; overload;
    function GetDataFieldList(aDataPipeline: TppDataPipeline; aList: TStrings): Boolean; overload;
    function GetDataPipelineList(aList: TStrings): Boolean;
    function GetDefaultComponent(var aComponent: TppComponent): Boolean;
    function GetDefaultPropValue(var aValue: String): Boolean; overload;
    function GetDefaultPropValue(var aValue: String; aValueList: TStrings): Boolean; overload;
    function GetDefaultPropValueList(aList: TStrings): Boolean;
    function GetFillColor(var aColor: TColor; var aIsClear: Boolean): Boolean;
    function GetFontColor(var aColor: TColor): Boolean;
    function GetFontList(var aList: TppFontList): Boolean;
    function GetFontName(var aFont: TFont): Boolean;
    function GetFontSize(var aFontSize: Integer): Boolean;
    function GetFontStyle(var aFontStyle: TFontStyles): Boolean;
    function GetHighlightColor(var aColor: TColor; var aIsClear: Boolean): Boolean;
    function GetLineColor(var aColor: TColor; var aIsClear: Boolean): Boolean;
    function GetLineStyle(var aLineStyle: TPenStyle): Boolean;
    function GetLineThickness(var aLineThickness: Single; var aLineStyle: TppLineStyleType; var aAllowDoubleLines: Boolean): Boolean;
    function GetCurrentReport(var aReport: TppCustomReport): Boolean;
    function GetTextAlignment(var aTextAlignment: TppTextAlignment): Boolean;

    procedure SetAnchors(const Value: TppAnchors);
    procedure SetBorderPositions(const aBorderPositions: TppBorderPositions);
    procedure SetDefaultPropValue(var aValue: String; aValueList: TStrings); overload;
    procedure SetDefaultPropValue(var aValue: String); overload;
    procedure SetDefaultPropValue(aComponent: TppComponent; var aValue: String; aValueList: TStrings); overload;
    procedure SetFieldAliases(aFieldAliases: TStrings);
    procedure SetFillColor(aColor: TColor; aIsClear: Boolean);
    procedure SetFontColor(aColor: TColor);
    procedure SetFontName(const aFont: TFont);
    procedure SetFontSize(const aSize: Integer);
    procedure SetHighlightColor(Color: TColor; aIsClear: Boolean);
    procedure SetLineColor(aColor: TColor; aIsClear: Boolean);
    procedure SetLineStyle(aPenStyle: TPenStyle);
    procedure SetLineThickness(const aLineThickness: Single; const aLineStyle: TppLineStyleType);
    procedure SetPropValue(aPropInfo: PPropInfo; aValue: LongInt); overload;
    procedure SetPropValue(aPropInfo: PPropInfo; aValue: Extended); overload;
    procedure SetPropValue(aPropInfo: PPropInfo; aValue: String); overload;
    procedure SetPropValue(aPropInfo: PPropInfo; aValue: Int64); overload;
    procedure SetPropValue(aPropName: String; var aValue); overload;
    procedure SetTextAlignment(const aTextAlignment: TppTextAlignment);

  end;


  {TppAlignSelectionController}
  TppAlignSelectionController = class(TppDesignControllerBase)
  private
  protected
    procedure AlignSelection(aAction: TppAlignType);
    function CalcRequiredAlignment(aAction: TppAlignType): Integer;

    procedure CalcRequiredSpacing(aAction: TppAlignType; var aSortedSelection: TStringList; var aStartPos, aIncrement: Integer);
    procedure SpaceSelection(aAction: TppAlignType);

  public
    procedure Execute(aAlign: TppAlignType);
  end;


  {TppSizeSelectionController}
  TppSizeSelectionController = class(TppDesignControllerBase)
  private
  protected
    function CalcRequiredSize(aSize: TppSizeType): Integer;

  public
    procedure Execute(aSize: TppSizeType);
  end;


  {TppStreamSelectionController}
  TppStreamSelectionController = class(TppDesignControllerBase)
  private
    FClipboardMode: Boolean;
    FClipboardStream: TStream;
    FCopyBand: TppBand;
    FCopyPoint: TPoint;
    FOffset: TPoint;
    FPastePoint: TPoint;
    FPipelineList: TppDataPipelineList;
    FUnDeleteStream: TStream;
    procedure ehReader_OnSetName(Reader: TReader; Component: TComponent; var Name: string);
    procedure ehReader_OnFindMethod(Reader: TReader; const MethodName: string; var Address: Pointer; var Error: Boolean);
    procedure cbReader_ComponentReadCallback(Component: TComponent);
  protected
    procedure ReadFromClipboard(aStream: TStream);
    procedure WriteToClipboard(aStream: TStream);
    procedure ReadFromStream(aStream: TStream);
    procedure WriteToStream(aStream: TStream);

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure Delete;
    procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
        override;
    procedure PasteFromClipboard;
    procedure UnDelete;
  end;


implementation

uses
  ppPopupMenus;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.Create}

constructor TppDesignSelectionController.Create(aOwner: TComponent);
begin

  inherited;

  FDefaultFont := TFont.Create;

  FAlignSelectionController  := TppAlignSelectionController.Create(nil);
  FSizeSelectionController   := TppSizeSelectionController.Create(nil);
  FStreamSelectionController := TppStreamSelectionController.Create(nil);

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.Destroy}

destructor TppDesignSelectionController.Destroy;
begin

  FDefaultFont.Free;
  FDefaultFont := nil;

  FFieldAliases.Free;
  FFieldAliases := nil;

  FFontList.Free;
  FFontList := nil;
  
  FDataPipelineList.Free;
  FDataPipelineList := nil;

  FAlignSelectionController.Free;
  FAlignSelectionController := nil;

  FSizeSelectionController.Free;
  FSizeSelectionController := nil;

  FStreamSelectionController.Free;
  FStreamSelectionController := nil;

  inherited;
  
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.AddFontStyle}

procedure TppDesignSelectionController.AddFontStyle(aFontStyle: TFontStyle);
begin

  ModifyFontStyle(aFontStyle, True {Add});

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.Align}

procedure TppDesignSelectionController.Align(aAlign: TppAlignType);
begin

  FAlignSelectionController.Execute(aAlign);

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.BeginTask}

procedure TppDesignSelectionController.BeginTask;
begin
  Selection.BeginUpdate;
  UndoManager.BeginTask;
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.BringToFront}

procedure TppDesignSelectionController.BringToFront;
var
  liIndex : Integer;
begin

  UndoManager.BeginTask;

  try

    for liIndex := 0 to Selection.Count-1 do
      Selection[liIndex].BringToFront;

  finally
    UndoManager.EndTask;

  end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.Delete}

procedure TppDesignSelectionController.Delete;
begin

  if (CheckComponentDelete) then
    FStreamSelectionController.Delete;
  
end;

{------------------------------------------------------------------------------}
{ DoOnAssignField }

procedure TppDesignSelectionController.DoOnAssignField(Sender: TObject);
begin
  if (EventHub <> nil) then
    EventHub.EndUserEvents.mcAssignField.Notify(Sender, Sender);
end;

{------------------------------------------------------------------------------}
{ DoOnGetAliasForField }

procedure TppDesignSelectionController.DoOnGetAliasForField(Sender: TObject; aDataPipeline: TppDataPipeline; const aDataField: String; var aFieldAlias: String);
var
  lEventParams: TppFieldAliasEventParams;
begin

  if (EventHub <> nil) then
    begin

      lEventParams := TppFieldAliasEventParams.Create;
      lEventParams.DataPipeline := aDataPipeline;
      lEventParams.FieldName := aDataField;
      lEventParams.FieldAlias := aFieldAlias;

      EventHub.EndUserEvents.mcGetAliasForField.Notify(Sender, lEventParams);

      aFieldAlias := lEventParams.FieldAlias;

      lEventParams.Free;

    end;

end;

{------------------------------------------------------------------------------}
{ DoOnGetFieldForAlias }

procedure TppDesignSelectionController.DoOnGetFieldForAlias(Sender: TObject; const aFieldAlias: String; var aDataPipeline: TppDataPipeline; var aDataField: String);
var
  lEventParams: TppFieldAliasEventParams;
begin

  if (EventHub <> nil) then
    begin

      lEventParams := TppFieldAliasEventParams.Create;
      lEventParams.DataPipeline := aDataPipeline;
      lEventParams.FieldName := aDataField;
      lEventParams.FieldAlias := aFieldAlias;

      EventHub.EndUserEvents.mcGetFieldForAlias.Notify(Sender, lEventParams);

      aDataPipeline := lEventParams.DataPipeline;
      aDataField := lEventParams.FieldName;

      lEventParams.Free;

    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.EndTask}

procedure TppDesignSelectionController.EndTask;
begin
  Selection.EndUpdate;
  UndoManager.EndTask;
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.PasteFromClipboard}

procedure TppDesignSelectionController.PasteFromClipboard;
begin
  FStreamSelectionController.PasteFromClipboard;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetAnchors}

function TppDesignSelectionController.GetAnchors(var aAnchors: TppAnchors): Boolean;
begin

  Result := (FAnchorComponent <> nil);

  if Result then
    aAnchors := FAnchorComponent.Anchors;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetBorderPositions}

function TppDesignSelectionController.GetBorderPositions(var aBorderPositions: TppBorderPositions): Boolean;
begin

  Result := (FBorder <> nil);

  if Result then
    aBorderPositions := FBorder.BorderPositions

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetDataFieldList}

function TppDesignSelectionController.GetDataFieldList(aList: TStrings): Boolean;
begin

  Result := False;

  if (FFieldAliases <> nil) and (FFieldAliases.Count > 0) then
    begin
      Result := True;
      aList.Assign(FFieldAliases);
    end
  else if (FDefaultComponent <> nil) and (FDefaultComponent.DefaultPropEditType = etFieldList) then
    begin
      Result := GetDataFieldList(FDefaultComponent.DataPipeline, aList);

    end;


end;

{------------------------------------------------------------------------------}
{ GetFieldsForPipeline }

function TppDesignSelectionController.GetDataFieldList(aDataPipeline: TppDataPipeline; aList: TStrings): Boolean;
var
 liField: Integer;
 lField: TppField;
begin

  aList.Clear;
  Result := False;

  if (aDataPipeline = nil) then Exit;

  for liField := 0 to aDataPipeline.FieldCount - 1 do
    begin
      lField := aDataPipeline.Fields[liField];
      if lField.Selectable then
        aList.AddObject(lField.FieldAlias, lField);
    end;

  if (aList is TStringList) then
    TStringList(aList).Sort;
    
  Result := True;


end; {procedure, GetFieldsForPipeline}

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetDataPipelineList}

function TppDesignSelectionController.GetDataPipelineList(aList: TStrings): Boolean;
begin

  Result := (MainReport <> nil);

  if Result then
    begin

      if (FDataPipelineList = nil) then
        FDataPipelineList := TppDataPipelineList.Create(MainReport)
      else
        FDataPipelineList.Report := MainReport;

    end;

  if Result then
    aList.Assign(FDataPipelineList);

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetDefaultComponent}

function TppDesignSelectionController.GetDefaultComponent(var aComponent: TppComponent): Boolean;
begin

  aComponent := FDefaultComponent;

  Result := (aComponent <> nil);

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetDefaultPropValue}

function TppDesignSelectionController.GetDefaultPropValue(var aValue: String): Boolean;
begin

  Result := GetDefaultPropValue(aValue, nil);

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetDefaultPropValue}

function TppDesignSelectionController.GetDefaultPropValue(var aValue: String; aValueList: TStrings): Boolean;
var
  lOrdValue: Byte;
begin

  Result := (FDefaultComponent <> nil);

  if Result then

    case FDefaultComponent.DefaultPropEditType of

      etEdit, etAutoEdit:
        aValue := TraRTTI.GetPropValueAsString(FDefaultComponent, FDefaultComponent.DefaultPropName);

      etValueList:
        begin
          TraRTTI.GetPropValue(FDefaultComponent, FDefaultComponent.DefaultPropName, lOrdValue);

          if (aValueList <> nil) and (lOrdValue < aValueList.Count) then
            aValue := aValueList[lOrdValue];
        end;

      etFieldList:
        begin
          if (FFieldAliases <> nil) and (FFieldAliases.Count > 0) and not (csDesigning in FDefaultComponent.ComponentState) then
            begin
              DoOnGetAliasForField(FDefaultComponent, FDefaultComponent.DataPipeline, FDefaultComponent.DataField, aValue);

            end
          else
            begin

              if (FDefaultComponent.DataPipeline <> nil) then
                aValue := FDefaultComponent.DataPipeline.FieldAliasForFieldName(FDefaultComponent.DataField)
              else
                aValue := '';

            end;

        end;

      etDataPipelineList:
        if (FDefaultComponent.DataPipeline <> nil) then
          aValue := FDefaultComponent.DataPipeline.UserName
        else
          aValue := '';

    end;


end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetDefaultPropValueList}

function TppDesignSelectionController.GetDefaultPropValueList(aList: TStrings): Boolean;
begin

  aList.Clear;

  Result := (FDefaultComponent <> nil) and (FDefaultComponent.DefaultPropEditType in [etValueList, etFieldList, etDataPipelineList]);

  if Result then

    case FDefaultComponent.DefaultPropEditType of

      etValueList:
        FDefaultComponent.GetDefaultPropEnumNames(aList);

      etFieldList:
        GetDataFieldList(aList);

      etDataPipelineList:
        GetDataPipelineList(aList);

    end;


end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetFillColor}

function TppDesignSelectionController.GetFillColor(var aColor: TColor; var aIsClear: Boolean): Boolean;
begin

  Result := (FColorComponent <> nil) and (FColorComponent.HasColor);

  if Result then
    FColorComponent.GetBackgroundColor(aColor, aIsClear);
    
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetFontColor}

function TppDesignSelectionController.GetFontColor(var aColor: TColor): Boolean;
begin

  Result := (FFontComponent <> nil);

  if Result then
    aColor := FFontComponent.Font.Color;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetFontComponent}

function TppDesignSelectionController.GetFontComponent: TppComponent;
var
  liIndex: Integer;
begin

  liIndex := 0;
  Result := nil;

  while (Result = nil) and (liIndex < Selection.Count) do
    if Selection[liIndex].HasFont then
      Result := Selection[liIndex]
    else
      Inc(liIndex);

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetFontList}

function TppDesignSelectionController.GetFontList(var aList: TppFontList): Boolean;
var
  lPrinter: TppPrinter;
  lbValidPrinter: Boolean;
  lDC: HDC;
begin

  Result := False;
  
  if (Report <> nil) then
    lPrinter := Report.Printer
  else
    lPrinter := nil;

  lbValidPrinter := (Report <> nil) and (lPrinter.DC <> 0);

  if (lbValidPrinter) then
    begin
      if (FPrinterName = lPrinter.PrinterDescription) then Exit;
      FPrinterName := lPrinter.PrinterDescription;
      lDC := lPrinter.DC
    end
  else
    begin
      if (FFontList <> nil) and (FFontList.Count > 0) then Exit;
      lDC := 0;
    end;

  {free the old font list}
  if (FFontList <> nil) then
    FFontList.Free;

  {create new font list}
  FFontList := TppFontList.CreateList(lDC);

  aList := FFontList;

  Result := FFontList.Count > 0;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetFontName}

function TppDesignSelectionController.GetFontName(var aFont: TFont): Boolean;
begin

  Result := (FFontComponent <> nil);

  if Result then
    begin
      aFont.Name := FFontComponent.Font.Name;
      aFont.Charset := FFontComponent.Font.Charset;
    end;
    
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetFontSize}

function TppDesignSelectionController.GetFontSize(var aFontSize: Integer): Boolean;
begin

  Result := (FFontComponent <> nil);

  if Result then
    aFontSize := FFontComponent.Font.Size;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetFontStyle}

function TppDesignSelectionController.GetFontStyle(var aFontStyle: TFontStyles): Boolean;
begin

  Result := (FFontComponent <> nil);

  if Result then
    aFontStyle := FFontComponent.Font.Style;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetHighlightColor}

function TppDesignSelectionController.GetHighlightColor(var aColor: TColor; var aIsClear: Boolean): Boolean;
begin

  Result := (FFontComponent <> nil);

  if Result then
    FFontComponent.GetBackgroundColor(aColor, aIsClear);
    
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetLineColor}

function TppDesignSelectionController.GetLineColor(var aColor: TColor; var aIsClear: Boolean): Boolean;
begin

  Result := (FColorComponent <> nil) or (FLineComponent <> nil) or (FBorder <> nil);

  if (FColorComponent <> nil) then
    FColorComponent.GetForegroundColor(aColor, aIsClear)

  else if (FLineComponent <> nil) then
    aColor := FLineComponent.Pen.Color

  else if (FBorder <> nil) then
    aColor := FBorder.Color;
    
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetLineStyle}

function TppDesignSelectionController.GetLineStyle(var aLineStyle: TPenStyle): Boolean;
begin

  Result := (FGraphicComponent <> nil) or (FBorder <> nil);

  if (FGraphicComponent <> nil) then
    aLineStyle := FGraphicComponent.Pen.Style

  else if (FBorder <> nil) then
    aLineStyle := FBorder.Style;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetLineThickness}

function TppDesignSelectionController.GetLineThickness(var aLineThickness: Single; var aLineStyle: TppLineStyleType; var aAllowDoubleLines: Boolean): Boolean;
begin

  Result := (FLineComponent <> nil) or (FBorder <> nil);

  if (FLineComponent <> nil) then
    begin
      aLineThickness := FLineComponent.Weight;
      aLineStyle := FLineComponent.Style;
      aAllowDoubleLines := True;
    end
  else if (FBorder <> nil) then
    begin
      aLineThickness := FBorder.Weight;
      aLineStyle := lsSingle;
      aAllowDoubleLines := False;
    end

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetCurrentReport}

function TppDesignSelectionController.GetCurrentReport(var aReport: TppCustomReport): Boolean;
begin

  Result := (Report <> nil);

  aReport := Report;

end;


{------------------------------------------------------------------------------}
{ TppDesignSelectionController.GetTextAlignment}

function TppDesignSelectionController.GetTextAlignment(var aTextAlignment: TppTextAlignment): Boolean;
begin

  Result := (FFontComponent <> nil);

  if Result then
    aTextAlignment := FFontComponent.TextAlignment;
    
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.ModifyFontStyle}

procedure TppDesignSelectionController.ModifyFontStyle(aFontStyle: TFontStyle; aAdd: Boolean);
var
  liIndex : Integer;
  lComponent: TppComponent;
  lFontStyle: TFontStyles;
begin

  BeginTask;

  try

    for liIndex := 0 to Selection.Count-1 do
      begin
        lComponent := Selection[liIndex];

        if lComponent.HasFont then
          begin
            lComponent.BeforePropertyChange('Font.Style');

            if (aAdd) then
              lFontStyle := lComponent.Font.Style + [aFontStyle]
            else
              lFontStyle := lComponent.Font.Style - [aFontStyle];

            lComponent.Font.Style := lFontStyle;
            lComponent.AfterPropertyChange;   

          end;
      end;

  finally
    EndTask;

  end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SelectionChanged}

procedure TppDesignSelectionController.SelectionChanged;
var
  liIndex: Integer;
  lComponent: TppComponent;
begin

  FAnchorComponent := nil;
  FBorderComponent := nil;
  FColorComponent := nil;
  FFontComponent := nil;
  FGraphicComponent := nil;
  FLineComponent := nil;
  FJustificationComponent := nil;
  FBorder := nil;

  if (Selection.Count > 0) then
    FDefaultComponent := Selection[0]
  else
    FDefaultComponent := nil;

  for liIndex := 0 to Selection.Count-1 do
    begin
      lComponent := Selection[liIndex];

      if (FAnchorComponent = nil) then
        FAnchorComponent := lComponent;

      if (FBorderComponent = nil) and (TraRTTI.IsValidPropName(lComponent, 'Border')) then
        begin
          FBorderComponent := lComponent;
          TraRTTI.GetPropValue(FBorderComponent, 'Border', FBorder);
        end;

      if (FColorComponent = nil) and (lComponent.HasColor) then
        FColorComponent := lComponent;

      if (FFontComponent = nil) and lComponent.HasFont then
        begin
          FFontComponent := lComponent;
          WorkspaceView.DefaultFont := FFontComponent.Font;
          WorkspaceView.DefaultTextAlignment := FFontComponent.TextAlignment;
        end;

      if (FJustificationComponent = nil) and lComponent.AllowsJustification then
        FJustificationComponent := lComponent;

      if (FGraphicComponent = nil) and (lComponent is TppCustomGraphic) then
        FGraphicComponent := TppCustomGraphic(lComponent);

      if (FLineComponent = nil) and (lComponent is TppLine) then
        FLineComponent := TppLine(lComponent);

      if (FAnchorComponent <> nil) and (FBorderComponent <> nil) and
         (FColorComponent <> nil) and (FFontComponent <> nil) and
         (FGraphicComponent <> nil) and (FLineComponent <> nil) and
         (FJustificationComponent <> nil) then
         
        break;

    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.Nudge}

procedure TppDesignSelectionController.Nudge(aDirection: TppDirectionType);
var
  liIndex: Integer;
  lComponent: TppComponent;
begin

  UndoManager.BeginTask;

  for liIndex := 0 to Selection.Count-1 do
    begin

      lComponent := Selection[liIndex];

      if (lComponent.Region = nil) or not(Selection.Contains(lComponent.Region)) then

        {move object by one}
        case aDirection of
          dtUp:    lComponent.spTop := lComponent.spTop - 1;
          dtDown:  lComponent.spTop := lComponent.spTop + 1;
          dtLeft:  lComponent.spLeft := lComponent.spLeft - 1;
          dtRight: lComponent.spLeft := lComponent.spLeft + 1;
        end;

    end; {for, liIndex}

  UndoManager.EndTask;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.RemoveFontStyle}

procedure TppDesignSelectionController.RemoveFontStyle(aFontStyle: TFontStyle);
begin

  ModifyFontStyle(aFontStyle, False {Add});

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SendToBack}

procedure TppDesignSelectionController.SendToBack;
var
  liIndex : Integer;
begin

  UndoManager.BeginTask;

  try

    for liIndex := 0 to Selection.Count-1 do
      Selection[liIndex].SendToBack;

  finally
    UndoManager.EndTask;

  end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetAnchors}

procedure TppDesignSelectionController.SetAnchors(const Value: TppAnchors);
var
  liIndex : Integer;
begin

  UndoManager.BeginTask;

  try

    for liIndex := 0 to Selection.Count-1 do
      Selection[liIndex].Anchors := Value;

  finally
    UndoManager.EndTask;

  end;


end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetBorderPositions}

procedure TppDesignSelectionController.SetBorderPositions(const aBorderPositions: TppBorderPositions);
var
  liIndex : Integer;
  lBorder: TppBorder;
begin

  BeginTask;

  try

    for liIndex := 0 to Selection.Count-1 do
      if (TraRTTI.GetPropValue(Selection[liIndex], 'Border', lBorder)) then
        lBorder.BorderPositions := aBorderPositions;

  finally
    EndTask;

  end;

end;


{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetDefaultPropValue}

procedure TppDesignSelectionController.SetDefaultPropValue(var aValue: String; aValueList: TStrings);
var
  liIndex : Integer;
begin

  if (FDefaultComponent = nil) then Exit;

  for liIndex := 0 to Selection.Count-1 do
    SetDefaultPropValue(Selection[liIndex], aValue,  aValueList);

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetDefaultPropValue}

procedure TppDesignSelectionController.SetDefaultPropValue(var aValue: String);
begin

  SetDefaultPropValue(aValue, nil);

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetDefaultPropValue}

procedure TppDesignSelectionController.SetDefaultPropValue(aComponent: TppComponent; var aValue: String; aValueList: TStrings);
var
  lsPropName: String;
  lEditType: TppPropEditType;
  liItemIndex: Integer;
  lDataPipeline: TppDataPipeline;
  lsFieldAlias: String;
  lsFieldName: String;
begin

  if (FDefaultComponent = nil) then Exit;

  if not TraRTTI.IsValidPropName(aComponent, FDefaultComponent.DefaultPropName) then Exit;

  lsPropName := FDefaultComponent.DefaultPropName;
  lEditType  := FDefaultComponent.DefaultPropEditType;

  if (aValueList <> nil) then
    liItemIndex := aValueList.IndexOf(aValue)
  else
    liItemIndex := -1;

  case lEditType of

    etAutoEdit, etEdit:
      begin
        TraRTTI.SetPropValueFromString(aComponent, lsPropName, aValue);
        aValue := TraRTTI.GetPropValueAsString(aComponent, lsPropName);
        Selection.SizingHandles.Show(Selection.GetBoundsRect(aComponent));
      end;

    etValueList:
      if (liItemIndex >= 0) then
        ppSetOrdPropValue(aComponent, lsPropName, liItemIndex);

    etDataPipelineList:
      if (FDataPipelineList <> nil)and (liItemIndex >= 0) then
        begin
          BeginTask;
          aComponent.DataPipeline := FDataPipelineList.GetPipeline(liItemIndex);
          EndTask;
        end;

    etFieldList:
      begin
        if not(aComponent.IsDataAware) then Exit;

        lsFieldAlias := aValue;

        if (FFieldAliases = nil) or (FFieldAliases.Count = 0) then
          begin
            if (aComponent.DataPipeline <> nil) then
              lsFieldName := aComponent.DataPipeline.FieldNameForFieldAlias(lsFieldAlias)
            else
              lsFieldName := '';

            UndoManager.BeginTask;
            aComponent.DataField := lsFieldName;
            DoOnAssignField(aComponent);
            UndoManager.EndTask;

          end
        else
          begin
            aComponent.DataField := '';

            DoOnGetFieldForAlias(aComponent, lsFieldAlias, lDataPipeline, lsFieldName);

            UndoManager.BeginTask;
            aComponent.DataPipeline := TppDataPipeline(lDataPipeline);
            aComponent.DataField := lsFieldName;
            UndoManager.EndTask;

            DoOnAssignField(aComponent);
          end;


      end;

  end;


end;


{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetFieldAliases}

procedure TppDesignSelectionController.SetFieldAliases(aFieldAliases: TStrings);
begin

  if (aFieldAliases.Count > 0) then
    begin
      // create upon demand
      if (FFieldAliases = nil) then
        FFieldAliases := TStringList.Create;

      FFieldAliases.Assign(aFieldAliases);
    end
  else
    begin
      FFieldAliases.Free;
      FFieldAliases := nil;
    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetFillColor}

procedure TppDesignSelectionController.SetFillColor(aColor: TColor; aIsClear: Boolean);
var
  liIndex : Integer;
begin

  BeginTask;

  try
    for liIndex := 0 to Selection.Count-1 do
      if not(Selection[liIndex].HasFont) then
        Selection[liIndex].SetBackgroundColor(aColor, aIsClear);

  finally
    EndTask;

  end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetFontColor}

procedure TppDesignSelectionController.SetFontColor(aColor: TColor);
var
  liIndex : Integer;
begin

  BeginTask;

  try

    WorkspaceView.DefaultFont.Color := aColor;

    for liIndex := 0 to Selection.Count-1 do
      if (Selection[liIndex].HasFont) then
        Selection[liIndex].SetForegroundColor(aColor, False);

  finally
    EndTask;

  end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetFontName}

procedure TppDesignSelectionController.SetFontName(const aFont: TFont);
var
  liIndex : Integer;
  lComponent: TppComponent;
  lFont: TFont;
begin

  BeginTask;

  lFont := TFont.Create;

  try

    WorkspaceView.DefaultFont.Name := aFont.Name;
    WorkspaceView.DefaultFont.Charset := aFont.Charset;

    for liIndex := 0 to Selection.Count-1 do
      begin
        lComponent := Selection[liIndex];

        if lComponent.HasFont then
          begin
            lFont.Assign(lComponent.Font);

            lFont.Name := aFont.Name;
            lFont.Charset := aFont.Charset;

            lComponent.Font := lFont;

          end;
      end;


  finally
    EndTask;

    lFont.Free;

  end;
  
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetFontSize}

procedure TppDesignSelectionController.SetFontSize(const aSize: Integer);
var
  liIndex : Integer;
  lComponent: TppComponent;
begin

  BeginTask;

  try
    WorkspaceView.DefaultFont.Size := aSize;

    for liIndex := 0 to Selection.Count-1 do
      begin
        lComponent := Selection[liIndex];

        if lComponent.HasFont then
          begin
            lComponent.BeforePropertyChange('Font.Size');
            lComponent.Font.Size := aSize;
            lComponent.AfterPropertyChange;
          end;
      end;

  finally
    EndTask;

  end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetHighlightColor}

procedure TppDesignSelectionController.SetHighlightColor(Color: TColor; aIsClear: Boolean);
var
  liIndex : Integer;
begin

  BeginTask;

  try
    for liIndex := 0 to Selection.Count-1 do
      if (Selection[liIndex].HasFont) then
        Selection[liIndex].SetBackgroundColor(Color, aIsClear);

  finally
    EndTask;

  end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetLineColor}

procedure TppDesignSelectionController.SetLineColor(aColor: TColor; aIsClear: Boolean);
var
  liIndex : Integer;
  lBorder: TppBorder;
  lComponent: TppComponent;
begin

  BeginTask;

  try
    for liIndex := 0 to Selection.Count-1 do
      begin
        lComponent := Selection[liIndex];

        if not(lComponent.HasFont) then
          Selection[liIndex].SetForegroundColor(aColor, aIsClear)

        else if TraRTTI.GetPropValue(lComponent, 'Border', lBorder) then
          lBorder.Color := aColor;
      end;

  finally
    EndTask;
    
  end;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetLineStyle}

procedure TppDesignSelectionController.SetLineStyle(aPenStyle: TPenStyle);
var
  liIndex : Integer;
  lComponent: TppComponent;
  lBorder: TppBorder;
begin

  BeginTask;

  try

    for liIndex := 0 to Selection.Count-1 do
      begin
        lComponent := Selection[liIndex];

        if lComponent is TppCustomGraphic then
          begin
            lComponent.BeforePropertyChange('Pen.Style');
            TppCustomGraphic(lComponent).Pen.Style := aPenStyle;
//            lComponent.AfterPropertyChange;  // this call not needed
          end

        else if TraRTTI.GetPropValue(lComponent, 'Border', lBorder) then
          lBorder.Style := aPenStyle;

      end;

  finally
    EndTask;

  end;



end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetLineThickness}

procedure TppDesignSelectionController.SetLineThickness(const aLineThickness: Single; const aLineStyle: TppLineStyleType);
var
  liSelection : Integer;
  lLine: TppLine;
  lComponent: TppComponent;
  lBorder: TppBorder;
begin

  BeginTask;

  for liSelection := 0 to (Selection.Count - 1) do
    begin
      lComponent := Selection[liSelection];

      if lComponent is TppLine then
        begin
          lLine :=  TppLine(Selection[liSelection]);

          lLine.Weight := aLineThickness;
          lLine.Style  := aLineStyle;
        end
        
      else if TraRTTI.GetPropValue(lComponent, 'Border', lBorder) then
        lBorder.Weight := aLineThickness;

    end;

  EndTask;

end;



{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SetTextAlignment}

procedure TppDesignSelectionController.SetTextAlignment(const aTextAlignment: TppTextAlignment);
var
  liIndex : Integer;
  lComponent: TppComponent;
begin

  UndoManager.BeginTask;

  try

    WorkspaceView.DefaultTextAlignment := aTextAlignment;

    for liIndex := 0 to Selection.Count-1 do
      begin
        lComponent := Selection[liIndex];

        if lComponent.HasFont then
          lComponent.TextAlignment := aTextAlignment;

      end;

  finally
    UndoManager.EndTask;

  end;


end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.Size}

procedure TppDesignSelectionController.Size(aSize: TppSizeType);
begin
  FSizeSelectionController.Execute(aSize);

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.Space}

procedure TppDesignSelectionController.Space(aAlign: TppAlignType);
begin
  FAlignSelectionController.Execute(aAlign);

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.ToClipBoard}

procedure TppDesignSelectionController.CopyToClipboard;
begin
  FStreamSelectionController.CopyToClipboard;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.CutToClipboard}

procedure TppDesignSelectionController.CutToClipboard;
begin
  FStreamSelectionController.CutToClipboard;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.ehSelection_AfterChange }

procedure TppDesignSelectionController.ehSelection_AfterChange(Sender, aEventParams: TObject);
begin
  SelectionChanged();
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.ehWorkspace_KeyDown }

procedure TppDesignSelectionController.ehWorkspace_KeyDown(Sender, aParameters: TObject);
var
  lEventParams: TppKeyboardEventParams;
begin

  lEventParams := TppKeyboardEventParams(aParameters);

  
  if lEventParams.Key = VK_Delete then
    Delete()

  else if (ssCtrl in lEventParams.Shift) then

    case lEventParams.Key of

      VK_UP:    Nudge(dtUp);

      VK_DOWN:  Nudge(dtDown);

      VK_LEFT:  Nudge(dtLeft);

      VK_RIGHT: Nudge(dtRight);

    end

  else if ssShift in lEventParams.Shift then

    case lEventParams.Key of

      VK_UP: NudgeSize(dtUp);

      VK_DOWN: NudgeSize(dtDown);

      VK_LEFT: NudgeSize(dtLeft);

      VK_RIGHT: NudgeSize(dtRight);

    end

end;

procedure TppDesignSelectionController.GetAggregatePropList(aPropList: TraPropList);
var
  liProp: Integer;
  liComponent: Integer;
  lComponent: TComponent;
  lClassTypes: TClassList;
begin

{$IFDEF CodeSite}
  CodeSite.EnterMethod('GetAggregatePropList');
{$ENDIF}

  lComponent := Selection.GetSelectedComponent;

  if (lComponent = nil) then Exit;

  // get prop list
  TraRTTI.GetFilteredPropList(lComponent.ClassType, aPropList, tkProperties);

  // remove properties that are not common to all components
  if Selection.Count > 1 then
    begin
      // for a multi-selection, remove the UserName property
      aPropList.RemoveProp('UserName');

      // build a list of class types we checked
      lClassTypes := TClassList.Create;
      lClassTypes.Add(lComponent.ClassType);

      for liComponent := 1 to Selection.Count-1 do
        begin
          lComponent := Selection[liComponent];

          if lClassTypes.IndexOf(lComponent.ClassType) = -1 then
            begin
              lClassTypes.Add(lComponent.ClassType);

              liProp := aPropList.Count-1;

              while (liProp >= 0) do
                begin

                  if (TypInfo.GetPropInfo(PTypeInfo(lComponent.ClassInfo), aPropList[liProp]) = nil) then
                    aPropList.Delete(liProp);

                    Dec(liProp);
                end;

            end;
        end;

      lClassTypes.Free;

    end;
{$IFDEF CodeSite}
  CodeSite.ExitMethod('GetAggregatePropList');
{$ENDIF}
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.NudgeSize}

procedure TppDesignSelectionController.NudgeSize(aDirection: TppDirectionType);
var
  liIndex: Integer;
  lComponent: TppComponent;
begin

  UndoManager.BeginTask;

  for liIndex := 0 to Selection.Count-1 do
    begin

      lComponent := Selection[liIndex];

      {move object by one}
      case aDirection of
        dtUp:    lComponent.spHeight := lComponent.spHeight - 1;
        dtDown:  lComponent.spHeight := lComponent.spHeight + 1;
        dtLeft:  lComponent.spWidth := lComponent.spWidth - 1;
        dtRight: lComponent.spWidth := lComponent.spWidth + 1;
      end;

    end; {for, liIndex}

  UndoManager.EndTask;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.Redo}

procedure TppDesignSelectionController.Redo;
begin
  Selection.Show(False);
  UndoManager.PerformRedo(Report);
  Selection.Show(True);
end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.SelectAll}

procedure TppDesignSelectionController.SelectAll;
var
  liBand: Integer;
  liObject: Integer;
  lBand: TppBand;
begin

  if (Report = nil) then Exit;

  if (Screen.ActiveControl is TEdit) then
    TEdit(Screen.ActiveControl).SelectAll

  else
    begin
      Selection.BeginUpdate();
      Selection.Clear();

      for liBand := 0 to (Report.BandCount-1) do
        begin

          lBand := TppBand(Report.Bands[liBand]);

          for liObject := 0 to (lBand.ObjectCount - 1) do
            Selection.Add(lBand.Objects[liObject]);
            
        end;

      Selection.EndUpdate();

    end;
    
end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetEventHub}

procedure TppDesignSelectionController.SetEventHub(aEventHub: TppDesignEventHub);
begin

  if (EventHub <> nil) and not(csDestroying in EventHub.ComponentState)  then
    begin
      EventHub.SelectionEvents.mcAfterChange.RemoveNotify(ehSelection_AfterChange);
      EventHub.WorkspaceEvents.mcKeyDown.RemoveNotify(ehWorkspace_KeyDown);
    end;

  inherited;

  FAlignSelectionController.EventHub := aEventHub;
  FSizeSelectionController.EventHub  := aEventHub;
  FStreamSelectionController.EventHub := aEventHub;

  if (aEventHub <> nil) then
    begin
      EventHub.SelectionEvents.mcAfterChange.AddNotify(ehSelection_AfterChange);
      EventHub.WorkspaceEvents.mcKeyDown.AddNotify(ehWorkspace_KeyDown);
    end;

end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetPropValue}

procedure TppDesignSelectionController.SetPropValue(aPropInfo: PPropInfo; aValue: Longint);
var
  liIndex : Integer;
begin

  UndoManager.BeginTask;

  try

    // first component in selection or the band or report
    SetComponentPropValue(Selection.GetSelectedComponent, aPropInfo, aValue);

    // remainder of selection
    for liIndex := 1 to Selection.Count-1 do
      SetComponentPropValue(Selection[liIndex], aPropInfo, aValue);

  finally
    UndoManager.EndTask;

  end;
  
end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetPropValue}

procedure TppDesignSelectionController.SetPropValue(aPropInfo: PPropInfo; aValue: Extended);
var
  liIndex : Integer;
begin

  UndoManager.BeginTask;

  try

    // first component in selection or the band or report
    SetComponentPropValue(Selection.GetSelectedComponent, aPropInfo, aValue);

    // remainder of selection
    for liIndex := 1 to Selection.Count-1 do
      SetComponentPropValue(Selection[liIndex], aPropInfo, aValue);

  finally
    UndoManager.EndTask;

  end;

end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetPropValue}

procedure TppDesignSelectionController.SetPropValue(aPropInfo: PPropInfo; aValue: String);
var
  liIndex : Integer;
begin

  UndoManager.BeginTask;

  try

    // first component in selection or the band or report
    SetComponentPropValue(Selection.GetSelectedComponent, aPropInfo, aValue);

    // remainder of selection
    for liIndex := 1 to Selection.Count-1 do
      SetComponentPropValue(Selection[liIndex], aPropInfo, aValue);


  finally
    UndoManager.EndTask;

  end;

end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetPropValue}

procedure TppDesignSelectionController.SetPropValue(aPropInfo: PPropInfo; aValue: Int64);
var
  liIndex : Integer;
begin

  UndoManager.BeginTask;

  try
    // first component in selection or the band or report
    SetComponentPropValue(Selection.GetSelectedComponent, aPropInfo, aValue);

    // remainder of selection
    for liIndex := 1 to Selection.Count-1 do
      SetComponentPropValue(Selection[liIndex], aPropInfo, aValue);

  finally
    UndoManager.EndTask;

  end;

end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetComponentPropValue}

procedure TppDesignSelectionController.SetComponentPropValue(aComponent: TComponent; aPropInfo: PPropInfo; aValue: Int64);
begin

  if TraRTTI.IsValidPropName(aComponent, aPropInfo.Name) then
    TypInfo.SetInt64Prop(aComponent, aPropInfo, aValue);

end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetComponentPropValue}

procedure TppDesignSelectionController.SetComponentPropValue(aComponent: TComponent; aPropInfo: PPropInfo; aValue: LongInt);
begin

  if TraRTTI.IsValidPropName(aComponent, aPropInfo.Name) then
    SetOrdProp(aComponent, aPropInfo, aValue);

end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetComponentPropValue}

procedure TppDesignSelectionController.SetComponentPropValue(aComponent: TComponent; aPropInfo: PPropInfo; aValue: String);
begin

  if TraRTTI.IsValidPropName(aComponent, aPropInfo.Name) then
    SetStrProp(aComponent, aPropInfo, aValue);

end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetComponentPropValue}

procedure TppDesignSelectionController.SetComponentPropValue(aComponent: TComponent; aPropInfo: PPropInfo; aValue: Extended);
begin

  if TraRTTI.IsValidPropName(aComponent, aPropInfo.Name) then
    SetFloatProp(aComponent, aPropInfo, aValue);

end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetPropValue

   Called by the popup menus}

procedure TppDesignSelectionController.SetPropValue(aPropName: String; var aValue);
var
  liIndex: Integer;
  lComponent: TppComponent;
  lRTTIClass: TraRTTIClass;
begin

  UndoManager.BeginTask;

  try

    for liIndex := 0 to Selection.Count - 1 do
      begin
        lComponent := Selection[liIndex];
        lRTTIClass := TraRTTIClassRegistry.GetRTTIClass(lComponent.ClassType);

        if lRTTIClass.IsValidPropName(lComponent, aPropName) then
          lRTTIClass.SetPropValue(lComponent, aPropName, aValue);

      end;

  finally
    UndoManager.EndTask;
  end;


end;

{------------------------------------------------------------------------------}
{TppDesignControllerBase.SetWorkspaceView}

procedure TppDesignSelectionController.SetWorkspaceView(const Value: TppDesignWorkspaceView);
begin
  inherited;

  FAlignSelectionController.WorkspaceView := Value;
  FSizeSelectionController.WorkspaceView := Value;
  FStreamSelectionController.WorkspaceView := Value;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.UnDelete}

procedure TppDesignSelectionController.UnDelete;
begin
  FStreamSelectionController.UnDelete;

end;

{------------------------------------------------------------------------------}
{ TppDesignSelectionController.Undo}

procedure TppDesignSelectionController.Undo;
begin
//  Selection.Clear;
  Selection.Show(False);
  UndoManager.PerformUndo(Report);
  Selection.Show(True);
end;

{------------------------------------------------------------------------------}
{ TppAlignSelectionController.AlignSelection}

procedure TppAlignSelectionController.AlignSelection(aAction: TppAlignType);
var
  liAdjustment: Integer;
  liStart: Integer;
  lNewBand: TppBand;
  liIndex: Integer;
  lComponent: TppComponent;
begin

  if (Selection.Count = 0) then  Exit;

  liAdjustment := CalcRequiredAlignment(aAction);
  lNewBand := nil;

  {determine how many objects in list should be re-positioned}
  if (aAction = asCenterHorizontally) or (aAction = asCenterVertically) then
    liStart := 0
  else
    liStart := 1;

  {when moving objects vertically, may need to assign a new band}
  if (aAction in [asAlignTopEdges, asAlignBottomEdges, asAlignHorizontalCenters]) then
    begin
      lNewBand := GetBandForPos(liAdjustment); // get the band
      liAdjustment := liAdjustment - lNewBand.spTop; //normalize the adjustment relative to the band top
    end;

  UndoManager.BeginTask;

  try

    {process each object in the selection}
    for liIndex := liStart to Selection.Count - 1 do
      begin
        lComponent := Selection[liIndex];

        {when moving objects vertically, may need to assign a new band}
        if (aAction in [asAlignTopEdges, asAlignBottomEdges, asAlignHorizontalCenters]) then
          if (lNewBand <> nil) and (lNewBand <> lComponent.Band)  then
            lComponent.Band := lNewBand;

        case aAction of
          asAlignLeftEdges: lComponent.spLeft := liAdjustment;
          asAlignHorizontalCenters: lComponent.spTop := (liAdjustment - lComponent.spHeight div 2);
          asCenterHorizontally: lComponent.spLeft := lComponent.spLeft + liAdjustment;
          asAlignRightEdges:  lComponent.spLeft := liAdjustment - lComponent.spWidth;
          asAlignTopEdges: lComponent.spTop := liAdjustment;
          asAlignVerticalCenters: lComponent.spLeft := liAdjustment - (lComponent.spWidth div 2);
          asCenterVertically: lComponent.spTop := lComponent.spTop + liAdjustment;
          asAlignBottomEdges: lComponent.spTop := liAdjustment - lComponent.spHeight;
        end; {case, Action}

      end; {for each object in selection}

  finally
    UndoManager.EndTask;

  end;


end;

{------------------------------------------------------------------------------}
{ TppAlignSelectionController.CalcRequiredAlignment}

function TppAlignSelectionController.CalcRequiredAlignment(aAction: TppAlignType): Integer;
var
  lSelectionObject: TppSelectionObject;
  lDesignControl: TppDesignControl;
  lComponent: TppComponent;
  lBand: TppBand;
  lSelectionBounds: TppBoundsRect;
  liNewLeft: Integer;
  liNewTop: Integer;

begin

  // get first object in selection
  lSelectionObject := Selection.SelectionObjects[0];

  lDesignControl := TppDesignControl(lSelectionObject.DesignControl);
  lComponent := lDesignControl.Component;
  lBand := lComponent.Band;
  lSelectionBounds := Selection.SelectionBounds;

  case aAction of

    asAlignLeftEdges:
      Result := lDesignControl.Left;

    asAlignHorizontalCenters :
      Result := lDesignControl.Top + (lDesignControl.Height div 2);

    asCenterHorizontally:
      begin
        liNewLeft := ((lBand.spWidth - lSelectionBounds.Width) div 2);
        Result := liNewLeft - lSelectionBounds.Left;
      end;

    asAlignRightEdges:
      Result := lDesignControl.Left + lDesignControl.Width;

    asAlignTopEdges:
      Result := lDesignControl.Top;

    asAlignVerticalCenters:
      Result := lDesignControl.Left + (lDesignControl.Width div 2);

    asCenterVertically:
      begin
        liNewTop := ((lBand.spHeight - lSelectionBounds.Height) div 2);
        Result := liNewTop - (lSelectionBounds.Top - lBand.spTop);
      end;

    asAlignBottomEdges:
      Result := lDesignControl.Top + lDesignControl.Height;

    else
      Result := 0;

  end;


end;

procedure TppAlignSelectionController.CalcRequiredSpacing(aAction:
    TppAlignType; var aSortedSelection: TStringList; var aStartPos, aIncrement:
    Integer);
var
  liEndPos: Integer;
  lsKey: String;
  liCount: Integer;
  liIndex: Integer;
  lSelectionObject: TppSelectionObject;
begin

  if (aSortedSelection = nil) then
    aSortedSelection := TStringList.Create
  else
    aSortedSelection.Clear;

  liCount := Selection.Count;

  for liIndex := 0 to liCount-1 do
    begin
      lSelectionObject := Selection.SelectionObjects[liIndex];

      // sort by either left or top
      if (aAction = asSpaceHorizontally) then
        lsKey := Format('%8d', [lSelectionObject.DesignControl.Left])
      else
        lsKey := Format('%8d', [lSelectionObject.DesignControl.Top]);

      aSortedSelection.AddObject(lsKey, lSelectionObject.Component);

    end;

  aSortedSelection.Sort;

  aStartPos := StrToInt( aSortedSelection.Strings[0]);
  liEndPos  := StrToInt( aSortedSelection.Strings[liCount-1]);

  aIncrement := (liEndPos - aStartPos) div (liCount-1);


end;

procedure TppAlignSelectionController.Execute(aAlign: TppAlignType);
begin

  if (aAlign in [asSpaceHorizontally, asSpaceVertically]) then
    SpaceSelection(aAlign)
  else
    AlignSelection(aAlign);

end;

procedure TppAlignSelectionController.SpaceSelection(aAction: TppAlignType);
var
  liAdjustment: Integer;
  liIncrement: Integer;
  liIndex: Integer;
  lComponent: TppComponent;
  lBand: TppBand;
  lSortedSelection : TStringList;
begin

  if (Selection.Count <= 2) then  Exit;

  lSortedSelection := nil;
  
  CalcRequiredSpacing(aAction, lSortedSelection, liAdjustment, liIncrement);

  UndoManager.BeginTask;

  try

    for liIndex := 1 to lSortedSelection.Count-2 do
      begin
      lComponent := TppComponent(lSortedSelection.Objects[liIndex]);

      if aAction = asSpaceHorizontally then
        begin
          liAdjustment := liAdjustment + liIncrement;
          lComponent.spLeft :=  liAdjustment;
        end

      else if aAction = asSpaceVertically then
        begin
          liAdjustment := liAdjustment + liIncrement;

          // might need to assign a new band
          lBand := GetBandForPos(liAdjustment);

          if (lBand <> lComponent.Band) then
            lComponent.Band := lBand;

          // top is relative to top of band
          lComponent.spTop := liAdjustment - lBand.spTop;
        end;


      end;

  finally
    lSortedSelection.Free;

    UndoManager.EndTask;
  end;

end;


{******************************************************************************
 *
 **  SizeSelectionController
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSizeSelectionController.CalcRequiredSize }

function TppSizeSelectionController.CalcRequiredSize(aSize: TppSizeType):
    Integer;
var
  liMin,
  liMax,
  liIndex: Integer;
  lComponent: TppComponent;
begin

  liMin := 1000000;
  liMax := 0;

  // calc min or max
  for liIndex := 0 to (Selection.Count - 1) do
    begin
      lComponent := Selection[liIndex];

      case aSize of

        asGrowWidth    : if lComponent.spWidth  > liMax  then liMax := lComponent.spWidth;
        asGrowHeight   : if lComponent.spHeight > liMax then liMax := lComponent.spHeight;
        asShrinkWidth  : if lComponent.spWidth  < liMin  then liMin  := lComponent.spWidth;
        asShrinkHeight : if lComponent.spHeight < liMin then liMin := lComponent.spHeight;

      end;

    end;

  // return required size
  if (aSize in [asGrowWidth, asGrowHeight]) then
    Result := liMax
  else
    Result := liMin;



end;


{------------------------------------------------------------------------------}
{ TppSizeSelectionController.Execute }

procedure TppSizeSelectionController.Execute(aSize: TppSizeType);
var
  liIndex: Integer;
  liSize: Integer;
  lComponent: TppComponent;
begin

  if (Selection.Count < 2) then Exit;

  liSize := CalcRequiredSize(aSize);

  UndoManager.BeginTask;

  try

    {process each object in the selection}
    for liIndex := 0 to (Selection.Count-1) do
      begin
        lComponent :=  Selection[liIndex];

        // adjust width or height
        if (aSize in [asGrowWidth, asShrinkWidth]) then
          lComponent.spWidth := liSize
        else
          lComponent.spHeight := liSize;

     end;

  finally
    UndoManager.EndTask;

  end;


end;

{******************************************************************************
 *
 **  Stream Selection Controller
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.Create }

constructor TppStreamSelectionController.Create(aOwner: TComponent);
begin

  inherited;

  FClipboardStream := TMemoryStream.Create;
  FUnDeleteStream := TMemoryStream.Create;

end;

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.Destroy }

destructor TppStreamSelectionController.Destroy;
begin

  FClipboardStream.Free;
  FClipboardStream := nil;

  FUnDeleteStream.Free;
  FUnDeleteStream := nil;

  inherited;

end;

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.ReadFromStream }

procedure TppStreamSelectionController.ReadFromStream(aStream: TStream);
var
  lReader: TReader;
begin


  if (Report = nil) then Exit;

  Selection.BeginUpdate;

  Selection.Clear;
  aStream.Position := 0;

  FPipelineList := TppDataPipelineList.Create(Report);

  lReader := TReader.Create(aStream, 1024);

  try
    lReader.OnSetName    := ehReader_OnSetName;
    lReader.OnFindMethod := ehReader_OnFindMethod;

    lReader.ReadComponents(Report.Owner, nil, cbReader_ComponentReadCallback);
    
  finally
    lReader.Free;
    FPipelineList.Free;
  end;

  Selection.EndUpdate;

  Report.Modified := True;

end;


{------------------------------------------------------------------------------}
{ TppStreamSelectionController.ehReader_OnSetName}

procedure TppStreamSelectionController.ehReader_OnSetName(Reader: TReader; Component: TComponent; var Name: string);
begin

  if (Reader.Root = Report.Owner) and (Report.Owner.FindComponent(Name) <> nil) then
    begin
       if (Component is TppCommunicator) then
         TppCommunicator(Component).DSInclude([pppcPasting]);

       Name := Report.GetValidName(Component);
    end;

end;

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.ehReader_OnFindMethod }

procedure TppStreamSelectionController.ehReader_OnFindMethod(Reader: TReader; const MethodName: string; var Address: Pointer; var Error: Boolean);
begin
  {if method not found, don't raise an exception}
  Error := False;

end;

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.cbReader_ComponentReadCallback - callback procedure for TReader.ReadComponents }

procedure TppStreamSelectionController.cbReader_ComponentReadCallback(Component: TComponent);
var
  lComponent : TppComponent;
  liNewLeft,
  liNewTop : Integer;
  lDesignControl: TppDesignControl;
begin


  if (Report = nil) then Exit;

  lComponent := TppComponent(Component);

 {set caption to user name if std naming prefix is part of caption}
  if Pos(ppGetUserNamePrefix(lComponent), lComponent.Caption) > 0 then
    lComponent.Caption := lComponent.UserName;

  lComponent.Band := TppBand(Report.GetBand(lComponent.BandType, lComponent.GroupNo));

  if (lComponent.Band = nil) and (Report.BandCount > 0) then
    lComponent.Band := Report.Bands[0];

  if lComponent.IsDataAware then
    lComponent.ResolvePipelineReferences(FPipelineList);

  {set paste offset based on coords of first component in selection}
  if Selection.Count = 0 then
    begin

      if FClipboardMode and (lComponent.Band = FCopyBand) and (FCopyPoint.X = lComponent.spLeft) and (FCopyPoint.Y = lComponent.spTop) then
        begin
          FOffset.X := (FPastePoint.X - FCopyPoint.X) + 8;
          FOffset.Y := (FPastePoint.Y - FCopyPoint.Y) + 8;
        end
      else
        begin
          FOffset.X := 0;
          FOffset.Y := 0;
        end;

    end; {if, FirstComponent in selection}


  {compute new Left, adjust if going off page}
  liNewLeft := lComponent.spLeft + FOffset.X;

  if (liNewLeft + lComponent.spWidth) > Selection.WorkSpace.Width then
    liNewLeft :=  Selection.WorkSpace.Width - lComponent.spWidth;

  {compute new Top, adjust going below band}
  liNewTop := lComponent.spTop + FOffset.Y;

  if (liNewTop + lComponent.spHeight) > lComponent.Band.spHeight then
    liNewTop :=  lComponent.Band.spHeight - lComponent.spHeight;

  lComponent.spLeft := liNewLeft;
  lComponent.spTop  := liNewTop;

  lDesignControl := Selection.DesignControlManager.DesignControls[lComponent];

  lComponent.Region := GetRegionForPos(Point(lDesignControl.Left, lDesignControl.Top));

  Selection.Add(lComponent);

  {adjust paste point}
  FPastePoint.X := FPastePoint.X + 8;
  FPastePoint.Y := FPastePoint.Y + 8;

end;

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.CopyToClipboard }

procedure TppStreamSelectionController.CopyToClipboard;
begin

  FClipboardMode := True;

  WriteToStream(FClipboardStream);
  WriteToClipboard(FClipboardStream);

  FClipboardStream.Size := 0;

end;

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.CutToClipboard }

procedure TppStreamSelectionController.CutToClipboard;
var
  liIndex: Integer;
begin

  CopyToClipboard;

  // setup the undo
  UndoManager.BeginTask;
  
  try
  
    for liIndex := 0 to Selection.Count-1 do
      UndoManager.AddOperation('CutComponent', Selection[liIndex]);

  finally
    UndoManager.EndTask;
  end;

  UndoManager.Active := False;
  Delete;
  UndoManager.Active := True;

end;

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.Delete }

procedure TppStreamSelectionController.Delete;
var
  liIndex: Integer;
  lComponent: TppComponent;
begin

//  if not CheckComponentDelete then Exit;


  if (Report = nil) then Exit;

  FClipboardMode := False;

  WriteToStream(FUnDeleteStream);

  // remove components that are in a region that is part of the selection,
  // because they will be deleted when the region is deleted
  for liIndex := Selection.Count-1 downto 0 do
    begin
      lComponent := Selection[liIndex];

      if (lComponent.Region <> nil) and Selection.Contains(lComponent.Region) then
        Selection.Remove(lComponent);

    end;

  // create the undoables
  UndoManager.BeginTask;

  try
    for liIndex := 0 to (Selection.Count-1) do
      UndoManager.AddOperation('DestroyComponent', Selection[liIndex]);

  finally
    UndoManager.EndTask;

  end;


  // free the objects
  UndoManager.Active := False;

  try

    Selection.BeginUpdate;

    for liIndex := (Selection.Count-1) downto 0 do
      begin
        lComponent := Selection[liIndex];
        Selection.Remove(lComponent);
        lComponent.Free;
      end;

    Selection.EndUpdate;

  finally
    UndoManager.Active := True;
  end;

  Report.Modified := True;

end;

{------------------------------------------------------------------------------}
{@TppStreamSelectionController.Notify }

procedure TppStreamSelectionController.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin
  inherited;

  if (aCommunicator = FCopyBand) and (aOperation = ppOpRemove) then
    FCopyBand := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.PasteFromClipboard }

procedure TppStreamSelectionController.PasteFromClipboard;
var
  lbUndo: Boolean;
  liIndex: Integer;
begin

  if not ClipBoard.HasFormat(CF_PPDATA) then Exit;

  UndoManager.Active := False;
  FClipboardMode := True;

  try

    ReadFromClipboard(FClipboardStream);
    ReadFromStream(FClipboardStream);
    lbUndo := True;
  finally
    FClipboardStream.Size := 0;
    UndoManager.Active := True;

  end;

  // setup the undo
  if (lbUndo) then
    begin
      UndoManager.BeginTask;

      try
        for liIndex := 0 to Selection.Count-1 do
          UndoManager.AddOperation('PasteComponent', Selection[liIndex]);

      finally
        UndoManager.EndTask;
      end;

    end;

end;

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.ReadFromClipboard }

procedure TppStreamSelectionController.ReadFromClipboard(aStream: TStream);
var
  lhData       : THandle;
  lpDataPtr    : Pointer;
  llSize       : LongInt;
begin

  aStream.Size := 0;

  Clipboard.Open;

  {copy data from clipboard into memory stream}
  lhData  := Clipboard.GetAsHandle(CF_PPDATA);

  try
    if lhData = 0 then
      Exit;

    lpDataPtr := GlobalLock(lhData);

    // get the size
    llSize    := StrToInt(ClipBoard.AsText);

    try
      {copy global data variable to memory stream}
      aStream.Write(lpDataPtr^,llSize);

    finally
      {unlock this global memory block}
      GlobalUnlock(lhData);
      Clipboard.Close;

    end;

  except
      {free only if exception, this memory is managed by the clipboard}
    GlobalFree(lhData);
    raise;

  end;

end;

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.UnDelete }

procedure TppStreamSelectionController.UnDelete;
begin

  FClipboardMode := False;

  ReadFromStream(FUnDeleteStream);

  FUnDeleteStream.Size := 0;

end;

{------------------------------------------------------------------------------}
{ TppStreamSelectionController.WriteToClipboard }

procedure TppStreamSelectionController.WriteToClipboard(aStream: TStream);
var
  lhData: THandle;
  lpDataPtr: Pointer;
begin

  {allocate memory from global heap}
  lhData := GlobalAlloc(GMEM_MOVEABLE, aStream.Size);

  try
    lpDataPtr := GlobalLock(lhData); {get a pointer to the lock memory area}

    try
      {copy memory stream to global data variable}
//      Move(aStream.Memory^, lpDataPtr^, aStream.Size );

      // read stream to buffer
      aStream.Position := 0;
      aStream.Read(lpDataPtr^, aStream.Size);

      {put data in clipboard}
      ClipBoard.Open;
      ClipBoard.SetAsHandle(CF_PPDATA, lhData);
      ClipBoard.AsText := IntToStr(aStream.Size);
      ClipBoard.Close;

    finally
       {unlock this global memory block}
       GlobalUnlock(lhData);

    end;

  except
    {free only if exception, this memory is managed by the clipboard}
    GlobalFree(lhData);
    raise;

  end;


end;


{------------------------------------------------------------------------------}
{ TppStreamSelectionController.WriteToStream }

procedure TppStreamSelectionController.WriteToStream(aStream: TStream);
var
  liIndex: Integer;
  lComponent: TppComponent;
  lWriter: TWriter;
begin

  if (Selection.Count = 0) then Exit;

  aStream.Size := 0;

  lWriter := TWriter.Create(aStream, 1024);

  try
    lWriter.Root := Selection[0].Owner;

    {copy each object in selection to aMemoryStream}

    for liIndex := 0 to (Selection.Count - 1) do
      begin
        lComponent  := Selection[liIndex];

        if (lComponent.Region = nil) or not Selection.Contains(lComponent.Region) then
          begin

            lComponent.DSInclude([pppcCopying]);

           {save copy coords and set paste coords of first component in selection}
           if (liIndex = 0) then
              begin
                if FClipboardMode then
                  begin
                    FCopyPoint.X  := lComponent.spLeft;
                    FCopyPoint.Y  := lComponent.spTop;

                    if (FCopyBand <> nil) then
                      RemoveNotify(FCopyBand);
                    
                    FCopyBand := lComponent.Band;

                    AddNotify(lComponent.Band);

                  end;

                FPastePoint.X := FCopyPoint.X;
                FPastePoint.Y := FCopyPoint.Y;

              end;

            lWriter.WriteSignature;
            lWriter.WriteComponent(lComponent);

            lComponent.DSExclude([pppcCopying]);

          end;

    end; {for, each component in selection}


    lWriter.WriteListEnd;
  finally
    lWriter.Free;
  end;
  
end;


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  CF_PPDATA := RegisterClipboardFormat('CF_PPDATA');

finalization


end.

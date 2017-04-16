{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit ppChrt;

interface

{$I ppIfDef.pas}

uses
  Windows,
  Classes,
  Graphics,
  ExtCtrls,
  SysUtils,
  Controls,
  SyncObjs,

  Chart,
  TeEngine,
  
  ppClass,
  ppCtrls,
  ppTypes,
  ppUtils,
  ppDevice,
  ppDrwCmd,
  ppClasUt,
  ppRTTI,
  ppEnum;

type

  TppTeeChartPrintMethodType =(pmBitmap, pmMetafile);
                                                                                            
  {@TppCustomTeeChart

    Ancestor from which all TeeChart components descend. The standard TeeChart
    components provided with ReportBuilder are:

            - TppTeeChart
            - TppDBTeeChart
            - TppDPTeeChart}

  {@TppCustomTeeChart.Chart

    Provides access to the TeeChart component contained within the
    CustomTeeChart 'wrapper'.}

  {@TppCustomTeeChart.Painting

    Indicates when the TeeChart component is painting the design control.}

  {@TppCustomTeeChart.PrintMethod

    Defaults to pmMetafile.  This property indicates the type graphic which
    will be used when rendered the chart to the printer.}

  {@TppCustomTeeChart.CreateChart

    This method is called by the Report Designer after a TeeChart wrapper
    component is created.  It instantiates a standard TeeChart component for use
    by the wrapper in implementing TeeChart functionality.}


  TppCustomTeeChartClass = class of TppCustomTeeChart;

  TppCustomTeeChart = class(TppCustomComponent)
    private
      FChart: TCustomChart;
      FPainting: Boolean;
      FPrintMethod: TppTeeChartPrintMethodType;
      FTimer: TTimer;
      FImageID: Integer;

      procedure ConvertOwner(Sender: TObject);
      procedure SetPrintMethod(aPrintMethod: TppTeeChartPrintMethodType);

      function GetChart: TCustomChart;

    protected
      function GetChildOwner: TComponent; override;
      procedure CreateChart(var aChart: TCustomChart); virtual; abstract;
      procedure UpdatePropertiesFromChart(aChart: TCustomChart); virtual;

      procedure GetChildren(Proc: TGetChildProc;Root: TComponent); override;

      procedure DblClickEvent(Sender: TObject); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Convert(aVersionNo: Integer); override;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;

      procedure AfterDesignerCreate; override;
      procedure Edit; virtual;
      procedure Export; virtual;
      function  HasFont: Boolean; override;
      procedure Init; override;
      procedure SetChartProperty(aChart: TCustomChart);

      property Chart: TCustomChart read GetChart;
      property Painting: Boolean read FPainting write FPainting;
      property PrintMethod: TppTeeChartPrintMethodType read FPrintMethod write SetPrintMethod default pmMetafile;

  end; {class, TppCustomTeeChart}

  {@TppTeeChart

    This component is a wrapper for a non-data-aware TeeChart component.  You
    can access the TeeChart component via the Chart property or by
    double-clicking on the component in the Report Designer. For a full
    explanation of the TeeChart capabilities, see the TeeChart help.

    Note: In order to install the TeeChart components in Delphi 1.0 and 2.0,
    first install TeeChart.  Then install the ppChReg.pas file located in the
    RBuilder\TeeChart\ directory. This file contains the component registration
    necessary for the TppTeeChart and TppDBTeeChart components. In order to see
    that these components have installed correctly, create a new form, drop a
    TppReport object on it and double-click. Icons for both components should
    appear in the Report Designer component palettes.}


  TppTeeChart = class(TppCustomTeeChart)
    protected
      procedure CreateChart(var aChart: TCustomChart); override;

    published
      property Anchors;
      property Border;
      property Chart;
      property PrintMethod;
      property Visible;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;
  end; {class, TppTeeChart}

  {@TppTeeChartControl }
  TppTeeChartControl = class(TCustomChart)
    private
      FStreamingParent: TComponent;

      procedure SetStreamingParent(aParent: TComponent);

    protected
      procedure CreateParams(var Params: TCreateParams); override;
      function GetChildOwner: TComponent; override;

      procedure SetParentComponent(Value: TComponent); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  HasParent: Boolean; override;
      function  GetParentComponent: TComponent; override;

      property StreamingParent: TComponent read FStreamingParent write SetStreamingParent;

    published
      { TCustomChart Properties }
      property BackImage;
      property BackImageInside;
      property BackImageMode;
      property BackWall;
      property BottomWall;
      property Foot;
      property Gradient;
      property LeftWall;
      property MarginBottom;
      property MarginLeft;
      property MarginRight;
      property MarginTop;
      property Title;
{$IFDEF Tee50}
      property RightWall;
{$ENDIF}

      { TCustomAxisPanel properties }
      property AxisVisible;
      property BackColor;
      property BottomAxis;
      property Chart3DPercent;
      property ClipPoints;
      property Frame;
      property LeftAxis;
      property Legend;
      property MaxPointsPerPage;
      property Page;
      property RightAxis;
      property ScaleLastPage;
      property SeriesList;
      property TopAxis;
      property View3D;
      property View3DWalls;

      { TPanel properties }
      property BevelInner;
      property BevelWidth;
      property BevelOuter;
      property BorderWidth;
      property BorderStyle;
      property Color;

  end; {class, TppTeeChartControl}


{******************************************************************************
 *
 ** C H A R T  U I
 *
{******************************************************************************}

  TppCustomTeeChartUIClass = class of TppCustomTeeChartUI;

  {TppCustomTeeChartUI }
  TppCustomTeeChartUI = class
    public
      class function ChartClass: TppCustomTeeChartClass; virtual; abstract;

      class procedure Edit(aCustomTeeChart: TppCustomTeeChart); virtual; abstract;
      class procedure Export(aCustomTeeChart: TppCustomTeeChart);  virtual; abstract;

  end; {class, TppCustomTeeChartUI}


  {TppTeeChartUIPlugIn }
  TppTeeChartUIPlugIn = class
    public
      class function GetChartUIClass(aCustomTeeChart: TppCustomTeeChart): TppCustomTeeChartUIClass;

      class procedure Register(aChartUIClass: TppCustomTeeChartUIClass);
      class procedure UnRegister(aChartUIClass:TppCustomTeeChartUIClass);

      class procedure Edit(aCustomTeeChart: TppCustomTeeChart);
      class procedure Export(aCustomTeeChart: TppCustomTeeChart);

  end; {class, TppTeeChartUIPlugIn}


{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  {@TraTppCustomTeeChartRTTI }
  TraTppCustomTeeChartRTTI = class(TraTppComponentRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomTeeChartRTTI}

implementation

uses
  TeeConst,
  Series;

var
  uChartUIPlugInLock: TCriticalSection;
  uChartUIClassList: TList;

{******************************************************************************
 *
 ** T E E   C H A R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Create }

constructor TppCustomTeeChart.Create(aOwner: TComponent);
var
  llHeight: Longint;
  llWidth: Longint;
begin

  inherited Create(aOwner);

  DrawCommandClass := TppDrawImage;

  FChart := nil;
  FPainting := False;
  FPrintMethod := pmMetafile;
  FImageID := 0;

  {default width and height}
  llWidth  := ppToMMThousandths(3.6458, utInches, pprtHorizontal, nil);
  llHeight := ppToMMThousandths(2.083, utInches, pprtVertical, nil);

  spWidth  := Round(ppToScreenPixels(llWidth, utMMThousandths, pprtHorizontal, nil));
  spHeight := Round(ppToScreenPixels(llHeight, utMMThousandths, pprtVertical, nil));


  {note: this is critical, when the Owner sends free notification
         the chart control must be destroyed to avoid a Delphi design-time AV}
  if (Owner <> nil) then
    Owner.FreeNotification(Self);

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Destroy }

destructor TppCustomTeeChart.Destroy;
begin

  FChart.Free;
  FChart := nil;

  inherited Destroy;
   
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.GetChildOwner }

function TppCustomTeeChart.GetChildOwner: TComponent;
begin
  Result := Self;
end; {function, GetChildOwner}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Notification }

procedure TppCustomTeeChart.Notification(aComponent: TComponent; Operation: TOperation);
begin

  inherited Notification(aComponent, Operation);

  if (Operation = opRemove) and (aComponent = Owner) and (FChart <> nil) then
    begin
      if not (csDestroying in FChart.ComponentState) then
        FChart.Free;
      FChart := nil;
    end;

end; {procedure, Notification}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Convert }

procedure TppCustomTeeChart.Convert(aVersionNo: Integer);
begin
  inherited Convert(aVersionNo);

  if (FTimer = nil) and (aVersionNo < 6030) and (csDesigning in ComponentState) then
    begin
      FTimer := TTimer.Create(nil);
      FTimer.Interval := 50; {5 hundreths of a second}
      FTimer.OnTimer  := ConvertOwner;
      FTimer.Enabled  := True;
    end;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.ConvertOwner }

procedure TppCustomTeeChart.ConvertOwner(Sender: TObject);
var
  liIndex: Integer;
  lSeries: TChartSeries;
begin

  FTimer.Free;
  FTimer := nil;

  {this will remove any .pas file declarations that may be present}
  RemoveComponent(Chart);
  Owner.InsertComponent(Chart);
  Owner.RemoveComponent(Chart);
  InsertComponent(Chart);

  for liIndex := 0 to FChart.SeriesCount-1 do
    begin
      lSeries := FChart.Series[liIndex];

      Chart.RemoveComponent(lSeries);
      Owner.InsertComponent(lSeries);
      Owner.RemoveComponent(lSeries);
      Chart.InsertComponent(lSeries);
    end;

  GetReport.Modified := True;

end; {procedure, ConvertTo6000}


{------------------------------------------------------------------------------}
{ TppCustomTeeChart.GetChart }

function TppCustomTeeChart.GetChart: TCustomChart;
begin
  if (FChart = nil) then
    CreateChart(FChart);

  Result := FChart;

end; {procedure, GetChart}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Init }

procedure TppCustomTeeChart.Init;
begin

  inherited Init;

  //FImageID := 0;

end; {procedure, Init}


{------------------------------------------------------------------------------}
{ TppCustomTeeChart.SetChartProperty }

procedure TppCustomTeeChart.SetChartProperty(aChart: TCustomChart);
begin
  FChart := aChart;

end; {procedure, SetChartProperty}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.AfterDesignerCreate }

procedure TppCustomTeeChart.AfterDesignerCreate;
begin
  {create chart - if needed}
  GetChart;
end; {procedure, AfterDesignerCreate}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.SetPrintMethod }

procedure TppCustomTeeChart.SetPrintMethod(aPrintMethod: TppTeeChartPrintMethodType);
begin

  if (aPrintMethod = FPrintMethod) then Exit;

  FPrintMethod := aPrintMethod;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetPrintMethod}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.PropertiesToDrawCommand }

procedure TppCustomTeeChart.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lMetafile: TMetafile;
  lBitmap: TBitmap;
  lRect: TRect;
  lDrawCommand: TppDrawImage;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawImage) or (FChart = nil) then Exit;

  lDrawCommand := TppDrawImage(aDrawCommand);

  lDrawCommand.Left   := PrintPosRect.Left;
  lDrawCommand.Top    := PrintPosRect.Top;
  lDrawCommand.Height := PrintPosRect.Bottom - PrintPosRect.Top;
  lDrawCommand.Width  := PrintPosRect.Right - PrintPosRect.Left;

  {we need a name for the optimization scheme}
  if (Name = '') then
    Name := GetValidName(Self);

  lDrawCommand.ImageName := Name + IntToStr(FImageID);

  Inc(FImageID);

  {indicate that DrawImage should use StretchDraw}
  lDrawCommand.DirectDraw := True;

  lRect.Left   := 0;
  lRect.Top    := 0;
  lRect.Right  := spWidth;
  lRect.Bottom := spHeight;

  case FPrintMethod of

    pmMetafile:
      begin
        lMetafile := FChart.TeeCreateMetafile(True, lRect);

        lDrawCommand.Picture.Graphic := lMetafile;

        lMetaFile.Free;
      end;

    pmBitmap:
      begin
        lBitmap := TBitmap.Create;

        lBitmap.Height := spHeight;
        lBitmap.Width := spWidth;

        FChart.Draw(lBitmap.Canvas, lRect);

        lDrawCommand.Picture.Graphic := lBitmap;

        lBitmap.Free;
        
      end;

  end; {case, print method type}

end; {procedure, PropertiesToDrawCommand}



{@TppCustomTeeChart.UpdatePropertiesFromChart
 Used by CustomTeeChart descendents to keep properties in-sync with the values
 of the TeeChart component.  This called after the user has used the TeeChart
 dialog to modify the TeeChart component.}

procedure TppCustomTeeChart.UpdatePropertiesFromChart(aChart: TCustomChart);
begin
  Visible := aChart.Visible;
end; {procedure, UpdatePropertiesFromChart}


{------------------------------------------------------------------------------}
{ TppCustomTeeChart.HasFont }

function TppCustomTeeChart.HasFont: Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Edit }

procedure  TppCustomTeeChart.Edit;
begin

  if (FChart = nil) then Exit;

  TppTeeChartUIPlugIn.Edit(Self);

  {update props}
  UpdatePropertiesFromChart(FChart);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

  {repaint control}
  InvalidateDesignControl;

end; {procedure, Edit}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Export }

procedure TppCustomTeeChart.Export;
begin

  if (FChart = nil) then Exit;

  TppTeeChartUIPlugIn.Export(Self);

end; {procedure, Export}

{@TppCustomTeeChart.DblClickEvent
 This is an event handler for the DesignControl.  When the user double-clicks
 the chart in the Report Designer, this event handler is called and the TeeChart
 dialog is displayed.}

procedure TppCustomTeeChart.DblClickEvent(Sender: TObject);
begin

  Edit;

end; {procedure, DblClickEvent}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.GetChildren }

procedure TppCustomTeeChart.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin

  {write report}
  if (FChart <> nil) then
    Proc(FChart);

end;

{******************************************************************************
 *
 ** T E E   C H A R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTeeChart.CreateChart }

procedure TppTeeChart.CreateChart(var aChart: TCustomChart);
begin

  {create & configure tee chart control}

  {note: create with a nil owner and then insert into the Owner
         at the bottom of this procedure - this avoids D5 lockup}

  aChart := TppTeeChartControl.Create(nil);

  TppTeeChartControl(aChart).StreamingParent := Self;

  aChart.Name := GetValidName(aChart);

  aChart.Title.Text.Clear;
  aChart.Title.Text.Add('Chart');
  aChart.Foot.Font.Color := clRed;
  aChart.Foot.Font.Style :=[fsItalic];
  aChart.Color := clWhite;
  aChart.BevelOuter := bvNone;
  aChart.BufferedDisplay := False;

  InsertComponent(aChart);

  
end; {procedure, CreateChart}


{******************************************************************************
 *
 ** T E E   C H A R T   C O N T R O L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.Create }

constructor TppTeeChartControl.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FStreamingParent := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.Destroy }

destructor TppTeeChartControl.Destroy;
begin

  {remove from parent}
  SetStreamingParent(nil);

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.CreateParams }

procedure TppTeeChartControl.CreateParams(var Params: TCreateParams);
begin

  inherited CreateParams(Params);

  {remove ws-child so that no parent window is required}
  Params.Style := Params.Style and not(WS_CHILD);

end; {procedure, CreateParams}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.GetChildOwner }

function TppTeeChartControl.GetChildOwner: TComponent;
begin
  Result := Self;
end; {function, GetChildOwner}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.SetStreamingParent }

procedure TppTeeChartControl.SetStreamingParent(aParent: TComponent);
begin

  if (FStreamingParent <> nil) and (FStreamingParent is TppCustomTeeChart) then
    TppCustomTeeChart(FStreamingParent).SetChartProperty(nil);

  FStreamingParent := aParent;

  if (FStreamingParent <> nil) and (FStreamingParent is TppCustomTeeChart) then
    TppCustomTeeChart(FStreamingParent).SetChartProperty(Self);

end; {procedure, SetStreamingParent}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.HasParent }

function TppTeeChartControl.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.GetParentComponent - required method for Components with HasParent = True }

function TppTeeChartControl.GetParentComponent: TComponent;
begin
  Result := FStreamingParent;
end;

{------------------------------------------------------------------------------}
{ TppTeeChartControl.SetParentComponent - required method for Components with HasParent = True }

procedure TppTeeChartControl.SetParentComponent(Value: TComponent);
begin
  if (Value is TppCustomTeeChart) then
    SetStreamingParent(Value);

end;

{******************************************************************************
 *
 ** C H A R T   U I   P L U G I N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTeeChartUIPlugIn.Register }

class procedure TppTeeChartUIPlugIn.Register(aChartUIClass: TppCustomTeeChartUIClass);
begin
  uChartUIPlugInLock.Acquire;

  try
    uChartUIClassList.Add(aChartUIClass);

  finally
    uChartUIPlugInLock.Release;

  end;

end;

{------------------------------------------------------------------------------}
{ TppTeeChartUIPlugIn.UnRegister }

class procedure TppTeeChartUIPlugIn.UnRegister(aChartUIClass: TppCustomTeeChartUIClass);
begin
  uChartUIPlugInLock.Acquire;

  try
    uChartUIClassList.Remove(aChartUIClass);

  finally
    uChartUIPlugInLock.Release;

  end;

end;

{------------------------------------------------------------------------------}
{ TppTeeChartUIPlugIn.GetChartUIClass }

class function TppTeeChartUIPlugIn.GetChartUIClass(aCustomTeeChart: TppCustomTeeChart): TppCustomTeeChartUIClass;
var
  liIndex: Integer;
  lChartUIClass: TppCustomTeeChartUIClass;
begin
  uChartUIPlugInLock.Acquire;

  liIndex := 0;
  Result := nil;

  try
    while (Result = nil) and (liIndex < uChartUIClassList.Count) do
      begin
        lChartUIClass := TppCustomTeeChartUIClass(uChartUIClassList[liIndex]);

        if (lChartUIClass.ChartClass = aCustomTeeChart.ClassType) then
          Result := lChartUIClass
        else
          Inc(liIndex);
      end;

  finally
    uChartUIPlugInLock.Release;

  end;


end;

{------------------------------------------------------------------------------}
{ TppTeeChartUIPlugIn.Edit }

class procedure TppTeeChartUIPlugIn.Edit(aCustomTeeChart: TppCustomTeeChart);
var
  lChartUIClass: TppCustomTeeChartUIClass;
begin

  lChartUIClass := GetChartUIClass(aCustomTeeChart);

  if (lChartUIClass <> nil) then
    lChartUIClass.Edit(aCustomTeeChart);

end;

{------------------------------------------------------------------------------}
{ TppTeeChartUIPlugIn.Export }

class procedure TppTeeChartUIPlugIn.Export(aCustomTeeChart: TppCustomTeeChart);
var
  lChartUIClass: TppCustomTeeChartUIClass;
begin

  lChartUIClass := GetChartUIClass(aCustomTeeChart);

  if (lChartUIClass <> nil) then
    lChartUIClass.Export(aCustomTeeChart);

end;


{******************************************************************************
 *
 *
 *
 ** R T T I
 *
 *
 *
{******************************************************************************}

{******************************************************************************
 *
 ** C U S T O M   T E E   C H A R T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomTeeChartRTTI.RefClass }

class function TraTppCustomTeeChartRTTI.RefClass: TClass;
begin
  Result := TppCustomTeeChart;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomTeeChartRTTI.GetPropList }

class procedure TraTppCustomTeeChartRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomTeeChartRTTI.GetPropRec }

class function TraTppCustomTeeChartRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Chart') = 0) then
    ClassPropToRec(aPropName, TCustomChart, True, aPropRec)

  else if (CompareText(aPropName, 'Painting') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'PrintMethod') = 0) then
    EnumPropToRec(aPropName, 'TppTeeChartPrintMethodType', False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomTeeChartRTTI.GetPropValue }

class function TraTppCustomTeeChartRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Chart') = 0) then
    Integer(aValue) := Integer(TppCustomTeeChart(aObject).Chart)

  else if (CompareText(aPropName, 'Painting') = 0) then
    Boolean(aValue) := TppCustomTeeChart(aObject).Painting

  else if (CompareText(aPropName, 'PrintMethod') = 0) then
    Byte(aValue) := Ord(TppCustomTeeChart(aObject).PrintMethod)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomTeeChartRTTI.SetPropValue }

class function TraTppCustomTeeChartRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'PrintMethod') = 0) then
    TppCustomTeeChart(aObject).PrintMethod := TppTeeChartPrintMethodType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}


initialization

  uChartUIPlugInLock := TCriticalSection.Create;
  uChartUIClassList := TList.Create;

  RegisterClasses([TppTeeChart, TppTeeChartControl]);

  ppRegisterComponent(TppTeeChart, 'Standard Components', 8, 462, '', 0);

  raRegisterRTTI(TraTppCustomTeeChartRTTI);

  raRegisterEnum('TppTeeChartPrintMethodType', TypeInfo(TppTeeChartPrintMethodType));

{$IFDEF Tee52}
  Series.RegisterTeeStandardSeries;
{$ENDIF}

finalization

  uChartUIPlugInLock.Free;
  uChartUIPlugInLock := nil;
  uChartUIClassList.Free;
  uChartUIClassList := nil;

  UnRegisterClasses([TppTeeChart, TppTeeChartControl]);

  ppUnRegisterComponent(TppTeeChart);

  raUnRegisterRTTI(TraTppCustomTeeChartRTTI);

  raUnRegisterEnum('TppTeeChartPrintMethodType');

end.

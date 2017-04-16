{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                   BBBBB   }

unit ppDesignWorkspaceController;

interface

uses
  Windows,
  Classes,
  Controls,
  Types,
  Graphics,

  ppComm,
  ppBands,
  ppClass,
  ppRegion,
  ppReport,
  ppRuler,
  ppTypes,
  ppUtils,
  ppClasUt,

  ppDesignControls,
  ppDesignEventHub,
  ppDesignSelection,
  ppDesignerWorkspace,
  ppDesignWorkspaceView,
  ppDesignControllerBase;

type

  {TppDragInfo}
  TppDragInfoBase = class
  private
    FActive: Boolean;
    FOffset: TPoint;
    FBeginPoint: TPoint;
    FThresholdExceeded: Boolean;

  public
    procedure Initialize(aSender: TObject; aMousePos: TPoint); virtual;
    function IsThresholdExceeded(aWorkspacePoint: TPoint): Boolean;

    property Active: Boolean read FActive write FActive;
    property Offset: TPoint read FOffset write FOffset;
    property BeginPoint: TPoint read FBeginPoint write FBeginPoint;
    property ThresholdExceeded: Boolean read FThresholdExceeded write FThresholdExceeded;
    
  end;

  {TppDragInfo}
  TppDragInfo = class(TppDragInfoBase)
  private
    FDesignControl: TppDesignControl;
    
  public
    procedure Initialize(aSender: TObject; aMousePos: TPoint); override;
    property DesignControl: TppDesignControl read FDesignControl write FDesignControl;

  end;

  {TppDragBandInfo}
  TppDragBandInfo = class(TppDragInfoBase)
  private
    FBandControl: TppBandControl;
    
  public
    procedure Initialize(aSender: TObject; aMousePos: TPoint); override;
    property BandControl: TppBandControl read FBandControl write FBandControl;

  end;

  {TppSizingInfo}
  TppSizingInfo = class(TppDragInfo)
  private
    FSizingHandleType: TppSizingHandleType;

  public
    property SizingHandleType: TppSizingHandleType read FSizingHandleType write FSizingHandleType;

  end;

  TppDesignWorkspaceController = class;

  {TppRulerController}
  TppRulerController = class(TppCommunicator)
  private
    FWorkSpaceController: TppDesignWorkspaceController;

    function GetHorizontalRuler: TppRuler;
    function GetVerticalRulers: TppRulerCollection;
    function GetWorkspace: TppWorkspace;
    procedure SetWorkSpaceController(const Value: TppDesignWorkspaceController);

    procedure SetDualGuides(aValue: Boolean);

  protected
    property Workspace: TppWorkspace read GetWorkspace;
    property HorizontalRuler: TppRuler read GetHorizontalRuler;
    property VerticalRulers: TppRulerCollection read GetVerticalRulers;

  public
    procedure ClearGuides;
    procedure UpdateGuides(aLeft, aTop, aWidth, aHeight: Integer); overload;
    procedure UpdateGuides(aWorkspacePoint: TPoint); overload;

    property WorkSpaceController: TppDesignWorkspaceController read FWorkSpaceController write SetWorkSpaceController;

  end;

  
  {model - report layout}
  {view - workspace, design controls}
  {controller - mediate the two}

  TppDesignWorkspaceMode = (dmSelect, dmCreateComponent);

  {TppDesignWorkspaceController}
  TppDesignWorkspaceController = class(TppDesignControllerBase)
  private
    FBandBounds: TppBoundsRect;
    FDefaultComponentClass: TppComponentClass;
    FDragInfo: TppDragInfo;
    FDragBandInfo: TppDragBandInfo;
    FSizingInfo: TppSizingInfo;
    FRulerController: TppRulerController;
    FDesignMode: TppDesignWorkspaceMode;

    procedure ehBand_DesignControlMouseDown(Sender, aParameters: TObject);
    procedure ehBand_DesignControlMouseUp(Sender, aParameters: TObject);
    procedure ehComponent_DesignControlMouseDown(Sender, aParameters: TObject);
    procedure ehComponent_DesignControlMouseUp(Sender, aParameters: TObject);
    procedure ehReport_LayoutChange(Sender, aParameters: TObject);
    procedure ehSizingHandles_MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ehSizingHandles_MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ehSizingHandles_MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ehWorkspace_MouseDown(Sender, aParameters: TObject);
    procedure ehWorkspace_MouseMove(Sender, aParameters: TObject);
    procedure ehWorkspace_MouseUp(Sender, aParameters: TObject);
    procedure ehWorkspace_MouseLeave(Sender, aParameters: TObject);
    procedure SetDesignMode(const Value: TppDesignWorkspaceMode);

  protected
    function CalcSnapToGridPos(aWorkspacePoint: TPoint): TPoint;
    procedure DisplayBandPopupMenu(aCursorPos: TPoint);
    procedure DragBand(aWorkspacePoint: TPoint);
    procedure DragBandEnd;
    procedure DragSelection(aWorkspacePoint: TPoint);
    procedure DragSelectionEnd;
    procedure ehWorkspace_KeyDown(Sender, aParameters: TObject); virtual;
    procedure RectToSelection(aRect: TRect);
    procedure SetWorkspace(aWorkspace: TppWorkspace); override;
    procedure SetEventHub(aEventHub: TppDesignEventHub); override;
    procedure SizeSelection(aWorkspacePoint: TPoint);
    procedure SizeSelectionEnd;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Notification(aComponent: TComponent; aOperation: TOperation); override;

    procedure AddBand(aBandClass: TppBandClass);
    procedure AddComponent(aClass: TppComponentClass; aWorkspacePoint: TPoint);
    procedure RemoveBand(aBandClass: TppBandClass); overload;
    procedure RemoveBand(aBand: TppBand); overload;

    property DefaultComponentClass: TppComponentClass read FDefaultComponentClass write FDefaultComponentClass;
    property DesignMode: TppDesignWorkspaceMode read FDesignMode write SetDesignMode;

  end;

implementation

{------------------------------------------------------------------------------}
{ TppDragInfoBase.Initialize }

procedure TppDragInfoBase.Initialize(aSender: TObject; aMousePos: TPoint);
begin

  FActive := True;
  FThresholdExceeded := False;
  FOffset := aMousePos;

end;

{------------------------------------------------------------------------------}
{ TppDragInfoBase.IsThresholdExceeded }

function TppDragInfoBase.IsThresholdExceeded(aWorkspacePoint: TPoint): Boolean;
begin

  if not(FThresholdExceeded) then
    FThresholdExceeded := (Abs(aWorkspacePoint.X - FBeginPoint.X) >= Mouse.DragThreshold) or
                          (Abs(aWorkspacePoint.Y - FBeginPoint.Y) >= Mouse.DragThreshold);


  Result := FThresholdExceeded;

end;


{------------------------------------------------------------------------------}
{ TppDragInfo.Initialize }

procedure TppDragInfo.Initialize(aSender: TObject; aMousePos: TPoint);
begin

  inherited;

  if (aSender is TppDesignControl) then
    begin
      FDesignControl := TppDesignControl(aSender);
      BeginPoint := Point(FDesignControl.Left + Offset.X, FDesignControl.Top + Offset.Y);
    end;

end;

{------------------------------------------------------------------------------}
{ TppDragBandInfo.Initialize }

procedure TppDragBandInfo.Initialize(aSender: TObject; aMousePos: TPoint);
begin

  inherited;

  if (aSender is TppBandControl) then
   FBandControl := TppBandControl(aSender);

  if (FBandControl <> nil) then
    BeginPoint := Point(FBandControl.Left + Offset.X, FBandControl.Top + Offset.Y);
  
end;


{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.Create }

constructor TppDesignWorkspaceController.Create(aOwner: TComponent);
begin
  inherited;

  FRulerController := TppRulerController.Create(nil);
  FRulerController.WorkSpaceController := Self;

  FDragInfo := TppDragInfo.Create;
  FDragBandInfo := TppDragBandInfo.Create;
  FSizingInfo :=  TppSizingInfo.Create;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.Destroy }

destructor TppDesignWorkspaceController.Destroy;
begin

  FBandBounds.Free;
  FBandBounds := nil;

  FRulerController.Free;
  FRulerController := nil;

  FDragInfo.Free;
  FDragInfo := nil;

  FDragBandInfo.Free;
  FDragBandInfo := nil;

  FSizingInfo.Free;
  FSizingInfo := nil;

  inherited;

end;

{------------------------------------------------------------------------------}
{ TppDesignDialogController.AddBand}

procedure TppDesignWorkspaceController.AddBand(aBandClass: TppBandClass);
var
  lBasicBand: TppBasicBand;
begin

  if (Report = nil) then Exit;

  UndoManager.Active := False;

  lBasicBand := TppBasicBand(ppComponentCreate(Report, aBandClass));

  lBasicBand.Report := Report;

  UndoManager.Active := True;

  if (lBasicBand <> nil) then
    UndoManager.AddOperation('CreateBand', lBasicBand);

  Selection.SetSelection(lBasicBand);

end;


{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.AddComponent }

procedure TppDesignWorkspaceController.AddComponent(aClass: TppComponentClass; aWorkspacePoint: TPoint);
var
  lBand: TppBand;
  lComponent: TppComponent;
  lValidateComponentEventParams: TppValidateComponentEventParams;
begin
  if not CheckComponentAdd then Exit;

  if (Report = nil) then Exit;

  UndoManager.Active := False;

  lBand := GetBandForPos(aWorkspacePoint.Y);

  lComponent := TppComponent(ppComponentCreate(Report, aClass));

  lComponent.DSInclude([pppcCreating]);

  {assign component position props }
  lComponent.Band   := lBand;
  lComponent.spLeft := aWorkspacePoint.X;
  lComponent.spTop  := aWorkspacePoint.Y - lBand.spTop;

  {assign font props }
  if lComponent.HasFont then
    begin
      lComponent.Font := WorkspaceView.DefaultFont;
      lComponent.TextAlignment  := WorkspaceView.DefaultTextAlignment;
      lComponent.SetBackgroundColor(clWhite,True);
    end;

  {assign region}
  lComponent.Region := GetRegionForPos(aWorkspacePoint);

   if lComponent.IsDataAware then
    lComponent.DataPipeline := lBand.GetADataPipeline;

  {allow component to perform any design time intitializations}
  lComponent.AfterDesignerCreate;

  EventHub.EndUserEvents.mcCreateComponent.Notify(Self, lComponent);

  lValidateComponentEventParams := TppValidateComponentEventParams.Create;

  try

    lValidateComponentEventParams.Component := lComponent;
    lValidateComponentEventParams.IsValid := True;

    EventHub.EndUserEvents.mcValidateComponent.Notify(Self, lValidateComponentEventParams);

    if not(lValidateComponentEventParams.IsValid) then
      begin
        lComponent.DSExclude([pppcCreating]);
        lComponent.Free;
        lComponent := nil;
      end;

  finally
    lValidateComponentEventParams.Free;
  end;

  UndoManager.Active := True;

  if (lComponent <> nil) then
    begin
      UndoManager.AddOperation('CreateComponent', lComponent);

      Selection.SetSelection(lComponent);
    end;

end;

function TppDesignWorkspaceController.CalcSnapToGridPos(aWorkspacePoint: TPoint): TPoint;
var
  lBand: TppBand;
begin

  lBand := GetBandForPos(aWorkspacePoint.Y);

  // normalize y pos to band
  if (lBand <> nil) then
    aWorkspacePoint.Y := aWorkspacePoint.Y - lBand.spTop;

  aWorkspacePoint := Workspace.CalcSnapToGridPosition(aWorkspacePoint);

  // normalize y pos to workspace
  if (lBand <> nil) then
    aWorkspacePoint.Y := aWorkspacePoint.Y + lBand.spTop;

  Result := aWorkspacePoint;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.DisplayBandPopupMenu }

procedure TppDesignWorkspaceController.DisplayBandPopupMenu(aCursorPos: TPoint);
var
  lBand: TppBand;
  lBandControl: TppBandControl;
  lScreenPoint: TPoint;
begin

  {get band at mouse position}
  lBand := GetBandForPos(aCursorPos.Y);
  lBandControl := DesignControlManager.BandControls[lBand];

  if (lBandControl <> nil) then
    begin
      lBandControl.PopupMenu.PopupComponent := lBandControl;

      {display the band's popup menu}
      lScreenPoint := Workspace.ClientToScreen(aCursorPos);

      lBandControl.PopupMenu.Popup(lScreenPoint.X, lScreenPoint.Y);

    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.DragSelection }

procedure TppDesignWorkspaceController.DragSelection(aWorkspacePoint: TPoint);
var
  lSelectionBounds: TppBoundsRect;
  lBoundsRect: TppBoundsRect;
  liBottomOfSelection: Integer;
  liMoveLeft: Integer;
  liMoveTop: Integer;
  lOrigin: TPoint;
  lNewOrigin: TPoint;
  lDelta: TPoint;
  liIndex: Integer;
  liCurrent: Integer;
begin

  // check drag threshold
  if not FDragInfo.IsThresholdExceeded(aWorkspacePoint) then Exit;

  lSelectionBounds := Selection.SelectionBounds;
  liCurrent := Selection.IndexOf(FDragInfo.DesignControl.Component);
  lBoundsRect := Selection.SelectionObjects[liCurrent].BoundsRect;

  // validate the new position
  if (ppblLeft in lSelectionBounds.BoundsLocks) then
    liMoveLeft := 0
  else
    liMoveLeft := (aWorkspacePoint.X - FDragInfo.Offset.X) - lBoundsRect.Left;

  if ppblTop in lSelectionBounds.BoundsLocks then
    liMoveTop := 0
  else
    liMoveTop  := (aWorkspacePoint.Y - FDragInfo.Offset.Y) - lBoundsRect.Top;

  {do not allow selection to move left of workspace}
  if (lSelectionBounds.Left + liMoveLeft) < 0  then
    liMoveLeft := - (lSelectionBounds.Left);

  {do not allow selection to move below bottom of workspace}
  liBottomOfSelection := lSelectionBounds.Top + lSelectionBounds.Height;

  if ((liBottomOfSelection + liMoveTop) > Workspace.Bottom) then
    liMoveTop := Workspace.Bottom - liBottomOfSelection;


  {do not allow selection to move above top of workspace}
  if (lSelectionBounds.Top + liMoveTop) < 0  then
    liMoveTop := - (lSelectionBounds.Top);

  // erase the current display
  Workspace.BoundsRects.Erase;


  lOrigin := Point(lBoundsRect.Left, lBoundsRect.Top);

  lNewOrigin.X := lBoundsRect.Left + liMoveLeft;
  lNewOrigin.Y := lBoundsRect.Top + liMoveTop;

  // snap to grid
  if Workspace.GridOptions.SnapToGrid then
    lNewOrigin := CalcSnapToGridPos(lNewOrigin);

  lBoundsRect.SetBounds(lNewOrigin.X, lNewOrigin.Y, lBoundsRect.Width, lBoundsRect.Height);

  lDelta.X := lBoundsRect.Left - lOrigin.X;
  lDelta.Y := lBoundsRect.Top  - lOrigin.Y;

  { now move all other selections by liXDelta and liYDelta }
  for liIndex := 0 to (Selection.Count - 1) do
    if (liIndex <> liCurrent) then
      begin
        lBoundsRect := Selection.SelectionObjects[liIndex].BoundsRect;
        lBoundsRect.SetBounds(lBoundsRect.Left + lDelta.X,
                                   lBoundsRect.Top + lDelta.Y,
                                   lBoundsRect.Width,
                                   lBoundsRect.Height);
      end;

  Workspace.BoundsRects.Redraw;

  {move selection bounds}
  {set bounds in mm thousandths }
  lDelta.X := ppToMMThousandths( (lSelectionBounds.Left + lDelta.X), utScreenPixels, pprtHorizontal, nil);
  lDelta.Y  := ppToMMThousandths((lSelectionBounds.Top + lDelta.Y), utScreenPixels, pprtVertical, nil);
  lSelectionBounds.SetObjectBounds(lDelta.X , lDelta.Y, lSelectionBounds.ObjectWidth, lSelectionBounds.ObjectHeight );

  {show bounds rectangles}
  if not lBoundsRect.Visible then
    Selection.ShowBoundsRects(True);

  FRulerController.UpdateGuides(lSelectionBounds.Left,  lSelectionBounds.Top,
                   lSelectionBounds.Width, lSelectionBounds.Height);

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.DragBand }

procedure TppDesignWorkspaceController.DragBand(aWorkspacePoint: TPoint);
var
  liNewTop,
  liBottomOfControls: Integer;
  liBand: Integer;
  lBandControl: TppBandControl;
begin

  // check drag threshold
  if not FDragBandInfo.IsThresholdExceeded(aWorkspacePoint) then Exit;

  liNewTop := aWorkspacePoint.Y - FDragBandInfo.FOffset.Y;

  lBandControl := FDragBandInfo.BandControl;

  liBottomOfControls := lBandControl.BottomOfControls;
  liBand := Report.FindBand(lBandControl.Band);

  if liBottomOfControls >= 0 then
    {do not allow band to move above bottom of lowest control}
    begin
      if liNewTop < liBottomOfControls then
        liNewTop := liBottomOfControls
    end

  else if (liBand = 0) then
    {do not allow band to move above top of workspace}
    begin
      if (liNewTop < 0) then
        liNewTop := 0;

    end

  else if (liBand > 0) then
    {do not allow band to move above bottom of prior band}
    begin

      lBandControl := DesignControlManager.BandControls[Report.Bands[liBand-1]];

      if (lBandControl <> nil) and
         (liNewTop < (lBandControl.Top + lBandControl.Height)) then
         liNewTop := lBandControl.Top + lBandControl.Height;

    end;

  {move bounds rect}
  if FDragBandInfo.ThresholdExceeded then
    begin
      FBandBounds.Visible := True;
      FBandBounds.Erase;
      FBandBounds.Top := liNewTop;
      FBandBounds.Redraw;
    end;

  FRulerController.UpdateGuides(FBandBounds.Left,  FBandBounds.Top,
                    FBandBounds.Width, FBandBounds.Height);

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.DragBandEnd }

procedure TppDesignWorkspaceController.DragBandEnd;
var
  lBand: TppBand;
begin

  FDragBandInfo.Active := False;

  if not(FDragBandInfo.ThresholdExceeded) then Exit;
  
  FBandBounds.Visible := False;

  {set new band height}
  lBand := FDragBandInfo.BandControl.Band;
  lBand.spHeight := FBandBounds.Top - lBand.spTop;

  Workspace.Invalidate;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.DragSelectionEnd }

procedure TppDesignWorkspaceController.DragSelectionEnd;
var
  lOldParent: TComponent;
  lNewBand: TppBand;
  lNewRegion: TppCustomRegion;
  liSelection: Integer;
  lSelectionObject: TppSelectionObject;
  lComponent: TppComponent;
  lBoundsRect: TppBoundsRect;
begin

  FDragInfo.Active := False;

  if not(FDragInfo.ThresholdExceeded) then Exit;

  if FDragInfo.ThresholdExceeded then
    begin
      UndoManager.BeginTask;

      lBoundsRect := TppBoundsRect.Create(nil);

      for liSelection := 0 to (Selection.Count - 1) do
        begin

          lComponent := Selection[liSelection];
          lSelectionObject := Selection.SelectionObjects[liSelection];

          if (lComponent.Region = nil) or not(Selection.Contains(lComponent.Region)) then
            begin
              {save bounds rect}
              lBoundsRect.Assign(lSelectionObject.BoundsRect);

              lSelectionObject.Active := False;
              lOldParent := lComponent.Parent;

              {assign new band, if needed}
              lNewBand   := GetBandForRect(lSelectionObject.BoundsRect.BoundsRect);

              {showMessage('NewBand : ' + lNewBand.Name);}
              if lComponent.Band <> lNewBand then
                lComponent.Band := lNewBand;

              {assign new region, if needed}
              lNewRegion := GetRegionForPos(Point(lSelectionObject.BoundsRect.Left, lSelectionObject.BoundsRect.Top));

              if lComponent.Region <> lNewRegion then
                lComponent.Region := lNewRegion;

              lSelectionObject := Selection.GetSelectionObject(lComponent);
              lSelectionObject.BoundsRect.Assign(lBoundsRect);

              {set component bounds to new location specified by bounds rect}
              lSelectionObject.Active := True;

              if lComponent.Parent <> lOldParent then
                begin
                  if lComponent.ParentWidth then
                    lSelectionObject.BoundsRect.Left := lComponent.spLeft;

                  if lComponent.ParentHeight then
                    lSelectionObject.BoundsRect.Top := lComponent.spTop;
                end;

              lSelectionObject.BoundsRect.Width := lComponent.spWidth;
              lSelectionObject.BoundsRect.Height:= lComponent.spHeight;

              lSelectionObject.SetComponentBounds;

            end;

           lSelectionObject.ShowSelection(True);

        end;

      Workspace.Invalidate;

      lBoundsRect.Free;
      
      UndoManager.EndTask;

    end;
    
end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehComponent_DesignControlMouseDown }

procedure TppDesignWorkspaceController.ehComponent_DesignControlMouseDown(Sender, aParameters: TObject);
var
  lComponent: TppComponent;
  lMouseParams: TppMouseEventParams;
begin

  lComponent := TppDesignControl(Sender).Component;
  lMouseParams := TppMouseEventParams(aParameters);

  Workspace.SetFocus();

  if (lMouseParams.Button <> mbLeft) then Exit;

  if (ssCtrl in lMouseParams.Shift) then  // begin bounding
    Workspace.BoundingBegin

  else if (ssShift in lMouseParams.Shift) then  // augment the existing selection
    begin

      if Selection.Contains(lComponent) then
        Selection.Remove(lComponent)
      else
        Selection.Add(lComponent);

    end
  else if not(Selection.Contains(lComponent)) then // set the selection
    Selection.SetSelection(lComponent)
  else
    Workspace.SetFocus();

  // setup up drag info
  if (Selection.Count > 0) and Selection.Contains(lComponent) and not(Workspace.Bounding) then
    FDragInfo.Initialize(Sender, lMouseParams.CursorPos);

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehBand_DesignControlMouseDown }

procedure TppDesignWorkspaceController.ehBand_DesignControlMouseDown(Sender, aParameters: TObject);
var
  lMouseParams: TppMouseEventParams;
  lBandControl: TppBandControl;
begin

  lMouseParams := TppMouseEventParams(aParameters);

  // setup up drag info
  if (lMouseParams.Button = mbLeft) then
    begin
      FDragBandInfo.Initialize(Sender, lMouseParams.CursorPos);
      lBandControl := TppBandControl(Sender);
      FBandBounds.SetBounds(lBandControl.Left, lBandControl.Top, lBandControl.Width, lBandControl.Height);

      Selection.SetSelection(lBandControl.Band);

    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehSizingHandles_MouseDown}

procedure TppDesignWorkspaceController.ehSizingHandles_MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{$IFDEF CodeSite}
  gCodeSite.EnterMethod('TppDesignWorkspaceController.ehSizingHandles_MouseDown');
{$ENDIF}

  if (Button = mbLeft) then
    begin
      if (Sender is TppSizingHandle) then
        FSizingInfo.SizingHandleType := TppSizingHandleType(TppSizingHandle(Sender).Tag);

      FSizingInfo.Initialize(Selection.DesignControls[0], Point(X, Y));

      Selection.ShowBoundsRects(True);

    end;

{$IFDEF CodeSite}
  gCodeSite.ExitMethod('TppDesignWorkspaceController.ehSizingHandles_MouseDown');
{$ENDIF}


end; {procedure, shMouseDown}

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehSizingHandles_MouseMove}

procedure TppDesignWorkspaceController.ehSizingHandles_MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  lScreenPoint: TPoint;
  lWorkspacePoint: TPoint;
begin

  if FSizingInfo.Active then
    begin
      lScreenPoint := TControl(Sender).ClientToScreen(Point(X,Y));
      lWorkspacePoint := Workspace.ScreenToClient(lScreenPoint);
      SizeSelection(lWorkspacePoint);
    end;

end;


{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehComponent_DesignControlMouseUp }

procedure TppDesignWorkspaceController.ehComponent_DesignControlMouseUp(Sender, aParameters: TObject);
begin

  if FDragInfo.Active and FDragInfo.ThresholdExceeded then
    begin
      DragSelectionEnd;
      Workspace.BoundingEnd();
    end
  else
    begin
      FDragInfo.Active := False;
      ehWorkspace_MouseUp(Workspace, aParameters);
    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehBand_DesignControlMouseUp }

procedure TppDesignWorkspaceController.ehBand_DesignControlMouseUp(Sender, aParameters: TObject);
begin

  if FDragBandInfo.Active then
    DragBandEnd;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehReport_LayoutChange }

procedure TppDesignWorkspaceController.ehReport_LayoutChange(Sender, aParameters: TObject);
begin

  if (Report = nil) then Exit;
  
  if (Report.Columns = 1) and (TppBandedReport(Report).ColumnHeaderBand <> nil) then
    begin
      RemoveBand(TppColumnHeaderBand);
      RemoveBand(TppColumnFooterBand);
    end
  else if (Report.Columns > 1) and (TppBandedReport(Report).ColumnHeaderBand = nil) then
    begin
      AddBand(TppColumnHeaderBand);
      AddBand(TppColumnFooterBand);
    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehSizingHandles_MouseUp}

procedure TppDesignWorkspaceController.ehSizingHandles_MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{$IFDEF CodeSite}
  gCodeSite.EnterMethod('TppDesignWorkspaceController.ehSizingHandles_MouseUp');
{$ENDIF}

  SizeSelectionEnd();

{$IFDEF CodeSite}
  gCodeSite.ExitMethod('TppDesignWorkspaceController.ehSizingHandles_MouseUp');
{$ENDIF}

end; {procedure, ehSizingHandles_MouseUp}

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehWorkspace_KeyDown }

procedure TppDesignWorkspaceController.ehWorkspace_KeyDown(Sender, aParameters: TObject);
begin

  if (TppKeyboardEventParams(aParameters).Key = VK_F1) then
    ShowHelp(Selection.GetSelectedComponent);

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehWorkspace_MouseDown }

procedure TppDesignWorkspaceController.ehWorkspace_MouseDown(Sender, aParameters: TObject);
var
  lMouseParams: TppMouseEventParams;
begin

  lMouseParams := TppMouseEventParams(aParameters);

  if lMouseParams.Button = mbRight then
    DisplayBandPopupMenu(lMouseParams.CursorPos)

  else if lMouseParams.Button = mbLeft then
    begin
    
      Workspace.BoundingBegin;

    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehWorkspace_MouseMove }

procedure TppDesignWorkspaceController.ehWorkspace_MouseMove(Sender, aParameters: TObject);
var
  lWorkspacePoint: TPoint;
begin

  // translate mouse cursor pos to workspace (do not use parameters here)
  lWorkspacePoint := Workspace.ScreenToClient(Mouse.CursorPos);

  if FDragInfo.Active then
    DragSelection(lWorkspacePoint)

  else if FDragBandInfo.Active then
    DragBand(lWorkspacePoint)

  else if Workspace.Bounding then
    Workspace.BoundingUpdate(lWorkspacePoint)

  else
    FRulerController.UpdateGuides(lWorkspacePoint);

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehWorkspace_MouseUp }

procedure TppDesignWorkspaceController.ehWorkspace_MouseUp(Sender, aParameters: TObject);
var
  lMouseParams: TppMouseEventParams;
  lWorkspacePoint: TPoint;
begin

  lMouseParams := TppMouseEventParams(aParameters);

  // translate mouse cursor pos to workspace (do not use parameters here)
  lWorkspacePoint := Workspace.ScreenToClient(Mouse.CursorPos);

  if (FDesignMode = dmSelect) and (Sender is TppWorkspace) and Workspace.Bounding then
    begin
      Workspace.BoundingEnd();
      if not(ssShift in lMouseParams.Shift) then
        Selection.Clear();
      
      RectToSelection(Workspace.RubberBand);
    end
  else if (FDesignMode = dmCreateComponent) and (FDefaultComponentClass <> nil) then
    begin
      Workspace.BoundingEnd();
      AddComponent(FDefaultComponentClass, lWorkspacePoint);
      SetDesignMode(dmSelect);
    end

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.ehWorkspace_MouseLeave }

procedure TppDesignWorkspaceController.ehWorkspace_MouseLeave(Sender, aParameters: TObject);
begin
  FRulerController.ClearGuides;
end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.Notification }

procedure TppDesignWorkspaceController.Notification(aComponent: TComponent; aOperation: TOperation);
begin

{  if (aOperation = opRemove) then
    begin
      if (aComponent = Workspace) then
        SetWorkspace(nil)
      else if (aComponent = Report) then
        SetReport(nil);
    end;
}
  inherited;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.RectToSelection }

procedure TppDesignWorkspaceController.RectToSelection(aRect: TRect);
var
  liIndex: Integer;
  lComponent : TppComponent;
  lDesignControl: TppDesignControl;
  lBoundingRect: TRect;
  lControlRect: TRect;
  lbComponentIntersect: Boolean;
  lBand: TppBand;
begin

  lBoundingRect := aRect;

  // normalize the rectangle
  if aRect.Left > aRect.Right then
    begin
      lBoundingRect.Left  := aRect.Right;
      lBoundingRect.Right := aRect.Left;
    end;

  if aRect.Top > aRect.Bottom then
    begin
      lBoundingRect.Top    := aRect.Bottom;
      lBoundingRect.Bottom := aRect.Top;
    end;

  // do not allow rectangle to have 0 width and height
  if (lBoundingRect.Left = lBoundingRect.Right) then
    lBoundingRect.Right := lBoundingRect.Right + 1;

  if (lBoundingRect.Top = lBoundingRect.Bottom) then
    lBoundingRect.Bottom := lBoundingRect.Bottom + 1;


  Selection.BeginUpdate;

  try


    lbComponentIntersect := False;

    // add/remove design control to the selection
    for liIndex := 0 to DesignControlManager.DesignControlCount-1 do
      begin
       lDesignControl := DesignControlManager.DesignControlsByIndex[liIndex];

       lControlRect := lDesignControl.BoundsRect;

       if IntersectRect(lControlRect, lControlRect, lBoundingRect) then
         begin

           lbComponentIntersect := True;

           lComponent := lDesignControl.Component;

           if Selection.Contains(lComponent) then
              Selection.Remove(lComponent)
            else
              Selection.Add(lComponent);

         end
      end;

    if not(lbComponentIntersect) and (Selection.Count = 0) then
      begin
        lBand := GetBandForRect(lBoundingRect);

        if (lBand <> nil) then
          Selection.SetSelectedComponent(lBand);

      end;

      
  finally
    Selection.EndUpdate;
  
  end;



end; {procedure, RectToSelection}

{------------------------------------------------------------------------------}
{ TppDesignDialogController.RemoveBand}

procedure TppDesignWorkspaceController.RemoveBand(aBandClass: TppBandClass);
var
  lBandedReport: TppBandedReport;
  lBand: TppBand;
begin

  lBandedReport := TppBandedReport(Report);

  {get appropriate band}
  if (aBandClass = TppHeaderBand) then
    lBand := lBandedReport.Header
  else if (aBandClass = TppFooterBand) then
    lBand := lBandedReport.Footer
  else if (aBandClass = TppTitleBand) then
    lBand := lBandedReport.Title
  else if (aBandClass = TppSummaryBand) then
    lBand := lBandedReport.Summary
  else if (aBandClass = TppPageStyle) then
    lBand := lBandedReport.PageStyle
  else
    lBand := nil;

  if (lBand <> nil) then
    RemoveBand(lBand);

end;

{------------------------------------------------------------------------------}
{ TppDesignDialogController.RemoveBand}

procedure TppDesignWorkspaceController.RemoveBand(aBand: TppBand);
begin

  {destroy band and re-arrange workspace}
  if (aBand <> nil) then
    begin
      UndoManager.AddOperation('DestroyBand', aBand);
      UndoManager.Active := False;
      aBand.Free;
      UndoManager.Active := True;
      Selection.Clear;
    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignDialogController.SetDesignMode}

procedure TppDesignWorkspaceController.SetDesignMode(const Value: TppDesignWorkspaceMode);
begin
  if FDesignMode <> Value then
  begin
    FDesignMode := Value;
    EventHub.WorkspaceEvents.mcDesignModeChanged.Notify(Self, nil);
  end;
end;


{------------------------------------------------------------------------------}
{ TppDesignWorkArea.SetEventHub }

procedure TppDesignWorkspaceController.SetEventHub(aEventHub: TppDesignEventHub);
begin

  if (EventHub = aEventHub) then Exit;

  if (EventHub <> nil) and not(csDestroying in EventHub.ComponentState)  then
    begin
      // component events
      EventHub.ComponentEvents.mcDesignControlMouseDown.RemoveNotify(ehComponent_DesignControlMouseDown);
      EventHub.ComponentEvents.mcDesignControlMouseMove.RemoveNotify(ehWorkspace_MouseMove);
      EventHub.ComponentEvents.mcDesignControlMouseUp.RemoveNotify(ehComponent_DesignControlMouseUp);

      // band events
      EventHub.BandEvents.mcDesignControlMouseDown.RemoveNotify(ehBand_DesignControlMouseDown);
      EventHub.BandEvents.mcDesignControlMouseMove.RemoveNotify(ehWorkspace_MouseMove);
      EventHub.BandEvents.mcDesignControlMouseUp.RemoveNotify(ehBand_DesignControlMouseUp);

      // report events
      EventHub.ReportEvents.mcLayoutChange.RemoveNotify(ehReport_LayoutChange);

      // workspace events
      EventHub.WorkspaceEvents.mcMouseDown.RemoveNotify(ehWorkspace_MouseDown);
      EventHub.WorkspaceEvents.mcMouseMove.RemoveNotify(ehWorkspace_MouseMove);
      EventHub.WorkspaceEvents.mcMouseUp.RemoveNotify(ehWorkspace_MouseUp);
      EventHub.WorkspaceEvents.mcMouseLeave.RemoveNotify(ehWorkspace_MouseLeave);
      EventHub.WorkspaceEvents.mcKeyDown.RemoveNotify(ehWorkspace_KeyDown);
    end;

  inherited;

  if (aEventHub <> nil) then
    begin
      // component events
      aEventHub.ComponentEvents.mcDesignControlMouseDown.AddNotify(ehComponent_DesignControlMouseDown);
      aEventHub.ComponentEvents.mcDesignControlMouseMove.AddNotify(ehWorkspace_MouseMove);
      aEventHub.ComponentEvents.mcDesignControlMouseUp.AddNotify(ehComponent_DesignControlMouseUp);

      // band events
      aEventHub.BandEvents.mcDesignControlMouseDown.AddNotify(ehBand_DesignControlMouseDown);
      aEventHub.BandEvents.mcDesignControlMouseMove.AddNotify(ehWorkspace_MouseMove);
      aEventHub.BandEvents.mcDesignControlMouseUp.AddNotify(ehBand_DesignControlMouseUp);

      // report events
      EventHub.ReportEvents.mcLayoutChange.PrependNotify(ehReport_LayoutChange);

      // workspace events
      aEventHub.WorkspaceEvents.mcMouseDown.AddNotify(ehWorkspace_MouseDown);
      aEventHub.WorkspaceEvents.mcMouseMove.AddNotify(ehWorkspace_MouseMove);
      aEventHub.WorkspaceEvents.mcMouseUp.AddNotify(ehWorkspace_MouseUp);
      aEventHub.WorkspaceEvents.mcMouseLeave.AddNotify(ehWorkspace_MouseLeave);
      EventHub.WorkspaceEvents.mcKeyDown.AddNotify(ehWorkspace_KeyDown);
    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.SetWorkSpace }

procedure TppDesignWorkspaceController.SetWorkSpace(aWorkspace: TppWorkspace);
begin


  if (WorkSpace <> aWorkspace) then
    begin
       FBandBounds.Free;
       FBandBounds := nil;

      if (aWorkspace <> nil) then
        begin
          FBandBounds := TppBoundsRect.Create(Self);
          FBandBounds.Parent := aWorkspace;
        end;

      if (Selection.SizingHandles <> nil) then
        begin
          Selection.SizingHandles.OnMouseDown := ehSizingHandles_MouseDown;
          Selection.SizingHandles.OnMouseMove := ehSizingHandles_MouseMove;
          Selection.SizingHandles.OnMouseUp := ehSizingHandles_MouseUp;
        end;
    end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.SizeSelection }

procedure TppDesignWorkspaceController.SizeSelection(aWorkspacePoint: TPoint);
var
  liLeft: Integer;
  liTop: Integer;
  liWidth: Integer;
  liHeight: Integer;
  lSelectionObject: TppSelectionObject;
  lBoundsRect: TppBoundsRect;
  lDesignControl: TppDesignControl;
begin

{$IFDEF CodeSite}
  gCodeSite.EnterMethod('TppDesignWorkspaceController.SizeSelection');
{$ENDIF}

  // check drag threshold
  if not FSizingInfo.IsThresholdExceeded(aWorkspacePoint) then Exit;

  lSelectionObject := Selection.SelectionObjects[0];
  lBoundsRect := lSelectionObject.BoundsRect;
  lDesignControl := TppDesignControl(lSelectionObject.DesignControl);

  liLeft  := lDesignControl.Left;
  liTop   := lDesignControl.Top;
  liWidth := lDesignControl.Width;
  liHeight:= lDesignControl.Height;

  // snap to grid
  if Workspace.GridOptions.SnapToGrid then
    aWorkspacePoint := CalcSnapToGridPos(aWorkspacePoint);


  {calc new vertical position}
  case FSizingInfo.SizingHandleType of

    shTopLeft, shTopMiddle, shTopRight:
      if aWorkspacePoint.Y <= (liTop + liHeight) then
        begin
          liHeight := liHeight + (liTop - aWorkspacePoint.Y);
          liTop    := aWorkspacePoint.Y;
         end
      else
        begin
          liTop    := liTop + liHeight - 1;
          liHeight := aWorkspacePoint.Y - liTop + 1;
        end;

    shBottomLeft, shBottomMiddle, shBottomRight:
      if aWorkspacePoint.Y >= liTop then
        begin
          liHeight  := aWorkspacePoint.Y - liTop + 1;
        end
      else
        begin
          liHeight := liTop - aWorkspacePoint.Y + 1;
          liTop    := aWorkspacePoint.Y;
         end;

  end;

  {calc new horizontal position}
  case FSizingInfo.SizingHandleType of

    shTopLeft, shLeftMiddle, shBottomLeft:
      if aWorkspacePoint.X <= (liLeft +  liWidth) then
        begin
          liLeft   := aWorkspacePoint.X;

          liWidth  := liWidth + (lDesignControl.Left - aWorkspacePoint.X) ;
        end
      else
        begin
          liLeft   := liLeft +  liWidth - 1;
          liWidth  := aWorkspacePoint.X - liLeft;
        end;


    shTopRight, shRightMiddle, shBottomRight:
      if aWorkspacePoint.X >= liLeft then
        begin
          liWidth  := aWorkspacePoint.X - liLeft + 1;
        end
      else
        begin
          liLeft   := aWorkspacePoint.X;
          liWidth  := lDesignControl.Left - aWorkspacePoint.X + 1;
        end;

  end;

  {check bounds locks }
  if ppblWidth in FSizingInfo.DesignControl.BoundsLocks then
    begin
      liLeft  := lBoundsRect.Left;
      liWidth := lBoundsRect.Width;
    end;

  if ppblHeight in FSizingInfo.DesignControl.BoundsLocks then
    begin
      liTop    := lBoundsRect.Top;
      liHeight := lBoundsRect.Height;
    end;


  if (liWidth <= 0) then
    liWidth := 1;

  if (liHeight <= 0) then
    liHeight := 1;

  lBoundsRect.Erase;
  lBoundsRect.SetBounds(liLeft, liTop, liWidth, liHeight);
  lBoundsRect.Redraw;

  FRulerController.UpdateGuides(lBoundsRect.Left, lBoundsRect.Top,
                    lBoundsRect.Width, lBoundsRect.Height);

{$IFDEF CodeSite}
  gCodeSite.ExitMethod('TppDesignWorkspaceController.SizeSelection');
{$ENDIF}


end;

{------------------------------------------------------------------------------}
{ TppDesignWorkspaceController.SizeSelectionEnd }

procedure TppDesignWorkspaceController.SizeSelectionEnd;
var
  lSelectionObject: TppSelectionObject;
  lBoundsRect: TppBoundsRect;
  lComponent: TppComponent;
begin

  FSizingInfo.Active := False;

  if not(FSizingInfo.ThresholdExceeded) then Exit;


{$IFDEF CodeSite}
  gCodeSite.EnterMethod('TppDesignWorkspaceController.SizeSelectionEnd');
{$ENDIF}

//  SetRulerDualGuides(False);

  lSelectionObject := Selection.SelectionObjects[0];
  lBoundsRect := lSelectionObject.BoundsRect;
  lComponent := lSelectionObject.Component;

  lSelectionObject.Component.spSetBounds(lBoundsRect.Left,
                              (lBoundsRect.Top - lComponent.Band.spTop),
                               lBoundsRect.Width, lBoundsRect.Height);

  // need to re-initialize the selection so that selection bounds is correct
  Selection.SetSelection(lComponent);

  {hide bounds rect}
  Selection.ShowBoundsRects(False);

  Workspace.Invalidate;

{$IFDEF CodeSite}
  gCodeSite.ExitMethod('TppDesignWorkspaceController.SizeSelectionEnd');
{$ENDIF}

end;

{------------------------------------------------------------------------------}
{ TppRulerController.RulerClearGuides }

procedure TppRulerController.ClearGuides;
begin

  HorizontalRuler.ClearGuides;
  VerticalRulers.ClearGuides;

end;

{------------------------------------------------------------------------------}
{ TppRulerController.GetHorizontalRuler }

function TppRulerController.GetHorizontalRuler: TppRuler;
begin
  Result := FWorkspaceController.WorkspaceView.HorizontalRuler;
end;

{------------------------------------------------------------------------------}
{ TppRulerController.GetVerticalRulers }

function TppRulerController.GetVerticalRulers: TppRulerCollection;
begin
  Result := FWorkspaceController.WorkspaceView.VerticalRulers;
end;

{------------------------------------------------------------------------------}
{ TppRulerController.GetWorkspace }

function TppRulerController.GetWorkspace: TppWorkspace;
begin
  Result := FWorkspaceController.Workspace;
end;

{------------------------------------------------------------------------------}
{ TppRulerController.RulerSetDualGuides }

procedure TppRulerController.SetDualGuides(aValue: Boolean);
begin
  HorizontalRuler.DualGuides := aValue;;
  VerticalRulers.SetDualGuides(aValue);
end;

{------------------------------------------------------------------------------}
{ TppRulerController.RulerUpdateGuides }

procedure TppRulerController.UpdateGuides(aLeft, aTop, aWidth, aHeight: Integer);
var
  lPoint1: TPoint;
  lPoint2: TPoint;
  lRuler1: TppRuler;
  lRuler2: TppRuler;
begin

  {convert to workspace ruler coordinates }
  lPoint1.X := aLeft;
  lPoint1.Y := 0;
  lPoint1   := HorizontalRuler.ScreenToClient(WorkSpace.ClientToScreen(lPoint1));

  lPoint2.X := aLeft + aWidth;
  lPoint2.Y := 0;
  lPoint2   := HorizontalRuler.ScreenToClient(WorkSpace.ClientToScreen(lPoint2));

  {show workspace ruler guides at selection bounds Left and Right}
  HorizontalRuler.DualGuides := True;
  HorizontalRuler.SetGuides(lPoint1.X, lPoint2.X);


  VerticalRulers.ClearGuides();

  {set X coordinates to 0 (not used)}
  lPoint1.X := 0;
  lPoint2.X := 0;

  {get band for top and bottom of selection}
  lRuler1 := FWorkSpaceController.GetVerticalRulerForPos(aTop);
  lRuler2 := FWorkSpaceController.GetVerticalRulerForPos(aTop + aHeight);

  {convert to ruler coordinates}
  if (lRuler1 <> nil) then
    begin
      lPoint1.Y := aTop;
      lPoint1  := lRuler1.ScreenToClient(WorkSpace.ClientToScreen(lPoint1));
    end;

  if (lRuler2 <> nil) then
    begin
      lPoint2.Y := aTop  + aHeight;
      lPoint2   := lRuler2.ScreenToClient(WorkSpace.ClientToScreen(lPoint2));
    end;

  {set ruler guides}
  if  (lRuler1 <> nil) and (lRuler2 <> nil) then

    if (lRuler1 = lRuler2) then
      {set dual guides for the band ruler}
      begin
        lRuler1.DualGuides := True;
        lRuler1.SetGuides(lPoint1.Y,lPoint2.Y);
      end
    else
      {set single guides for each band ruler}
      begin
        lRuler1.DualGuides := False;
        lRuler2.DualGuides := False;
        lRuler1.SetGuides(lPoint1.Y,0);
        lRuler2.SetGuides(lPoint2.Y,0);
      end;

end;

{------------------------------------------------------------------------------}
{ TppRulerController.RulerUpdateGuides }

procedure TppRulerController.UpdateGuides(aWorkspacePoint: TPoint);
var
  lRulerPoint: TPoint;
  lScreenPoint: TPoint;
  lRuler: TppRuler;
begin

  lScreenPoint := WorkSpace.ClientToScreen(aWorkspacePoint);

  SetDualGuides(False);

  {set workspace ruler guides}
  if (HorizontalRuler <> nil) then
    begin
      lRulerPoint := HorizontalRuler.ScreenToClient(lScreenPoint);
      HorizontalRuler.SetGuides(lRulerPoint.X, 0);
    end;

  if (VerticalRulers <> nil) then
    VerticalRulers.ClearGuides;

  {get band at Y coord}
  lRuler := FWorkspaceController.GetVerticalRulerForPos(aWorkspacePoint.Y);

  {set band ruler guides}
  if (lRuler <> nil) then
    begin
      lRulerPoint := lRuler.ScreenToClient(lScreenPoint);
      lRuler.SetGuides(lRulerPoint.Y, 0);
    end;

end;

{------------------------------------------------------------------------------}
{ TppRulerController.SetDesignControlManager }

procedure TppRulerController.SetWorkSpaceController(const Value: TppDesignWorkspaceController);
begin

  if FWorkSpaceController <> Value then
    FWorkSpaceController := Value;

end;



end.

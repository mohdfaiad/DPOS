{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                    BBBBB   }

unit ppPreview;

interface

{$I ppIfDef.pas}

uses
  {$IFDEF Delphi6} Types, {$ENDIF}
  Windows, Classes, Controls, ComCtrls, SysUtils, ExtCtrls, StdCtrls, Buttons,
  Graphics,
  ppComm,

  ppProd,
  ppViewr,
  ppTypes,
  ppUtils,
  ppRTTI,

  ppOutlineViewer,
  ppOutlineReportSettings,
  ppTextSearchCustomPreview,

  ppTB2Dock,
  ppTBX,
  ppTBXExtItems,
  ppTBXDkPanels,
  ppToolbarTBX,

  ppToolResources;

type

  TppCustomPreview = class;
  TppPreviewClass = class of TppCustomPreview;

  {@TppPreviewPlugIn

    The currently registered PreviewPlugIn class is used by the report designer
    and the preview dialog to provide a consistent preview UI. To override the
    default preview UI, create a CustomPreview descendant class and register it
    in the initialization section of the unit.}

  TppPreviewPlugIn = class
    private
    public
      class procedure Register(aPreviewClass: TppPreviewClass);
      class procedure UnRegister(aPreviewClass: TppPreviewClass);

      class procedure RegisterSearchClass(aSearchClass: TppCustomSearchPreviewClass);
      class procedure UnRegisterSearchClass(aSearchClass: TppCustomSearchPreviewClass);

      class function CreateSearchPlugin(aComponent: TComponent): TppCustomSearchPreview;
      class function CreatePreviewPlugin(aParent: TWinControl): TppCustomPreview;

      class function GetPreviewClass: TppPreviewClass;
      class function UsingDefaultPreviewClass: Boolean;

    end; {class, TppPreviewPlugIn}


  {@TppCustomPreview

    Abstract ancestor class for preview plug-ins. Creates a Viewer and provides
    virtual methods for processing PreviewActions such as Print, AutoSearch, Cancel,
    etc.}

  {@TppCustomPreview.OutlineVisible

    Used to control whether or not the outline viewer is visible on the preview
    form.  Descendents of TppPreview should not need to use this property.}

  {@TppCustomPreview.SearchPreview

    The embedded object which is created if the TextSearchSettings on the
    producer is enabled. Descendents can override the CreateSearchPreview method
    to use this object to get at the search preview controls which are created
    by the plug-in class descendent which is currently registered.}

  {@TppCustomPreview.StatusBar

    TStatusBar object assigned by the Designer or Print Preview Form. Used to
    provide status information.}

  TppCustomPreview = class(TppCommunicator)
    private
      FAfterPrint: TNotifyEvent;
      FBeforePrint: TNotifyEvent;
      FParent: TWinControl;
      FStatusBar: TStatusBar;
      FViewer: TppViewer;
      FReport: TppProducer;
      FOnClose: TNotifyEvent;
      FOnPageChange: TNotifyEvent;
      FSearchPreview: TppCustomSearchPreview;

      procedure SetStatusBar(aStatusbar: TStatusBar);

    protected
      function CreateSearchPreview: TppCustomSearchPreview; virtual;
      procedure ConfigureAccessoryPanelVisibility; virtual;
      function GetOutlineVisible: Boolean; virtual;
      procedure GotoPage(aPageNo: Integer);
      procedure PageChangeEvent(Sender: TObject); virtual;
      procedure PrintStateChangeEvent(Sender: TObject); virtual;
      procedure SetOutlineVisible(aOutlineVisible: Boolean); virtual;
      procedure SearchPreviewActionPerformed; virtual;
      procedure StatusChangeEvent(Sender: TObject); virtual;
      procedure ViewerResetEvent(Sender: TObject); virtual;
      procedure ViewerMouseDownEvent(Sender: TObject); virtual;
      procedure ZoomToPercentage(aZoomPercentage: Integer);
      procedure ToggleSearch; virtual;

      property SearchPreview: TppCustomSearchPreview read FSearchPreview;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); override;

      procedure AfterPreview; virtual;
      procedure BeforePreview; virtual;
      procedure BeforeDesignerTabChange; virtual;
      procedure Cancel; virtual;
      procedure LanguageChanged; virtual;
      procedure PerformPreviewAction(aPreviewAction: TppPreviewActionType); virtual;
      procedure Print; virtual;
      procedure Zoom(aZoomSetting: TppZoomSettingType); virtual;
      procedure KeyDown(var Key: Word; Shift: TShiftState); virtual;
      procedure SendEmail; virtual;

      property OutlineVisible: Boolean read GetOutlineVisible write SetOutlineVisible;
      property Parent: TWinControl read FParent;
      property StatusBar: TStatusBar read FStatusBar write SetStatusBar;
      property Report: TppProducer read FReport;
      property Viewer: TppViewer read FViewer;

      property OnClose: TNotifyEvent read FOnClose write FOnClose;
      property OnPageChange: TNotifyEvent read FOnPageChange  write FOnPageChange;
      property AfterPrint: TNotifyEvent read FAfterPrint write FAfterPrint;
      property BeforePrint: TNotifyEvent read FBeforePrint write FBeforePrint;

    end; {class, TppCustomPreview}


  TppEdit = class(TEdit)
    public
      property OnMouseWheel;
    end;




  {@TppPreview

    Default preview plug-in class. Use this class as an example for creating
    additional preview plug-ins. Adds a toolbar that contains UI controls for
    all preview actions enumerated by TppPreviewActionType.

    This is the layout of the panels in which this class creates and the
    associated location of any viewers in those panels.

    <IMAGE TppPreviewLayout>}

  {@TppPreview.AccessoryToolbar

    This is the panel in which the outline viewer is placed on the left side of
    the viewer component in the previewer. The default location of the
    text search toolbar is on top of the outline viewer in the accessory toolbar.}

  {@TppPreview.StandardToolbar

    Contains the preview controls for the page setting and the page navigation
    controls. The autosearch and text seach buttons are also located in this
    toolbar. Use this toolbar if you want to add controls in a TppPreview plugin
    descendent.}

  {@TppPreview.TextSearchToolbar

    This toolbar contains the text search controls.
    The text search toolbar is located on the top of the outline viewer of
    the preview form in the accessory toolbar.}

  {@TppPreview.Toolbar

    This toolbar is the parent of the standard toolbar and is located at the top
    of the preview form. Use the standard toolbar in order to
    add custom controls.}


  TppPreview = class(TppCustomPreview)
    private
      FAccessoryToolbarWidthSet: Boolean;
      FShowOutlineWhenPreview: Boolean;
      FBeforePreview: Boolean;
      FAccessoryToolbar: TPanel;
//      FOutlinePanel: TppTBXAlignmentPanel;
      FAutoSearchButton: TppTBXItem;
      FOutlineViewer: TppOutlineViewer;
      FToolbar: TppToolbar;
      FTextSearchToolbar: TPanel;
      FCancelButton: TppTBXItem;
      FEmailButton: TppTBXItem;
      FFirstButton: TppTBXItem;
      FKeyCatcher: TppEdit;
      FLastButton: TppTBXItem;
      FNextButton: TppTBXItem;
      FPageNoEdit: TppTBXEditItem;
      FPageWidthButton: TppTBXItem;
      FPercent100Button: TppTBXItem;
      FPnlViewer: TPanel;
      FPrintButton: TppTBXItem;
      FPriorButton: TppTBXItem;
      FSplitter: TSplitter;
      FTextSearchButton: TppTBXItem;
      FTopDock: TppDock;
      FWholePageButton: TppTBXItem;
      FZoomPercentageEdit: TppTBXEditItem;

      procedure ConfigureSearchButtons;
      procedure Rezoom;


    protected
      procedure ConfigureAccessoryPanelVisibility; override;
      function GetOutlineVisible: Boolean; override;
      procedure PageChangeEvent(Sender: TObject); override;
      procedure PrintStateChangeEvent(Sender: TObject); override;
      procedure SetOutlineVisible(aOutlineVisible: Boolean); override;
      procedure SearchPreviewActionPerformed; override;
      procedure ViewerResetEvent(Sender: TObject); override;
      procedure ViewerMouseDownEvent(Sender: TObject); override;
      procedure ToggleSearch; override;
      procedure SetCancelledButtonState; virtual;

      procedure KeyDownEvent(Sender: TObject; var Key: Word; Shift: TShiftState); virtual;
      procedure KeyPressEvent(Sender: TObject; var Key: Char);  virtual;
      procedure MouseWheelEvent(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean); virtual;
      procedure ToolButtonClickEvent(Sender: TObject);  virtual;

      procedure ConfigureTextSearchToolbar; virtual;
      function CreateOutlineViewer: TppOutlineViewer; virtual;
      procedure CreateToolbar; virtual;
      procedure CreateToolbarItems; virtual;
      procedure ehPageNoEdit_AcceptText(Sender: TObject; var aNewText: String; var Accept: Boolean); virtual;
      procedure ehZoomEdit_AcceptText(Sender: TObject; var aNewText: String; var Accept: Boolean); virtual;
      procedure ehToolbutton_Click(Sender: TObject); virtual;

      procedure FocusToKeyCatcher;

    public
      constructor Create(aOwner: TComponent); override;

      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); override;

      procedure BeforePreview; override;
      procedure Cancel; override;
      procedure LanguageChanged; override;
      procedure Zoom(aZoomSetting: TppZoomSettingType); override;

      property AccessoryToolbar: TPanel read FAccessoryToolbar;
      property AutoSearchButton: TppTBXItem read FAutoSearchButton;
      property CancelButton: TppTBXItem read FCancelButton;
      property EmailButton: TppTBXItem read FEmailButton;
      property FirstButton: TppTBXItem read FFirstButton;
      property LastButton: TppTBXItem read FLastButton;
      property NextButton: TppTBXItem read FNextButton;
      property OutlineViewer: TppOutlineViewer read FOutlineViewer;
      property PageNoEdit: TppTBXEditItem read FPageNoEdit;
      property PageWidthButton: TppTBXItem read FPageWidthButton;
      property Percent100Button: TppTBXItem read FPercent100Button;
      property PrintButton: TppTBXItem read FPrintButton;
      property PriorButton: TppTBXItem read FPriorButton;
      property Splitter: TSplitter read FSplitter;
      property TextSearchButton: TppTBXItem read FTextSearchButton;
      property TextSearchToolbar: TPanel read FTextSearchToolbar;
      property Toolbar: TppToolbar read FToolbar;
      property TopDock: TppDock read FTopDock;
      property WholePageButton: TppTBXItem read FWholePageButton;
      property ZoomPercentageEdit: TppTBXEditItem read FZoomPercentageEdit;
    end; {class, TppPreview}


implementation

{$R ppPrvBmp.res}

uses
  Forms,
  ppDevice,
  ppDrwCmd,
  ppTextSearchError,
  ppOutlineDrawCommand;

var
  uSearchClass: TppCustomSearchPreviewClass;
  uPreviewClass: TppPreviewClass;
  uCancelled: Boolean;

{******************************************************************************
 *
 ** P R E V I E W E R    P L U G - I N
 *
{******************************************************************************}

{@TppPreviewPlugIn.Register

  Registers a CustomPreview class to be used by the Designer and the Print
  Preview Form.}

class procedure TppPreviewPlugIn.Register(aPreviewClass: TppPreviewClass);
begin
  uPreviewClass := aPreviewClass;
end;

{@TppPreviewPlugIn.UnRegister

  Un-registers a custom preview plug-in class.

  If you are swapping out different plug-ins in the context of a running
  application, make sure you re-register the plug-in class you replaced.
  Otherwise an exception will be raised the next time you call Report.Print.}

class procedure TppPreviewPlugIn.UnRegister(aPreviewClass: TppPreviewClass);
begin
  uPreviewClass := nil;
end;

{@TppPreviewPlugIn.CreatePreviewPlugin

  Factory used to create an instance of the currently registered preview plug-in.}

class function TppPreviewPlugIn.CreatePreviewPlugin(aParent: TWinControl): TppCustomPreview;
begin

  if (uPreviewClass = nil) then
    uPreviewClass := TppPreview;

  Result :=  uPreviewClass.Create(aParent);

end;

{@TppPreviewPlugIn.CreateSearchPlugin }

class function TppPreviewPlugIn.CreateSearchPlugin(aComponent: TComponent): TppCustomSearchPreview;
begin

  {Does not force a search library to be linked in.}
  if (uSearchClass <> nil) then
    Result := uSearchClass.Create(aComponent)
  else
    Result := nil;
end;

{@TppPreviewPlugIn.RegisterSearchClass }

class procedure TppPreviewPlugIn.RegisterSearchClass(aSearchClass: TppCustomSearchPreviewClass);
begin
  uSearchClass := aSearchClass;
end;

{@TppPreviewPlugIn.UnRegisterSearchClass }

class procedure TppPreviewPlugIn.UnRegisterSearchClass(aSearchClass: TppCustomSearchPreviewClass);
begin
  uSearchClass := nil;
end;

{@TppPreviewPlugIn.GetPreviewClass }

class function TppPreviewPlugIn.GetPreviewClass: TppPreviewClass;
begin
  if (uPreviewClass = nil) then
    uPreviewClass := TppPreview;

  Result := uPreviewClass;
end;

{@TppPreviewPlugIn.UsingDefaultPreviewClass }

class function TppPreviewPlugIn.UsingDefaultPreviewClass: Boolean;
begin
  Result := (GetPreviewClass.InheritsFrom(TppPreview));
end;

{******************************************************************************
 *
 ** C U S T O M   P R E V I E W E R
 *
{******************************************************************************}

{@TppCustomPreview.Create

  The constructor is passed a parent win control that represents either the
  report designer's tab sheet, or the preview form. Descendants can use the
  parent when creating UI elements such as toolbar buttons and edit boxes.}

constructor TppCustomPreview.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FParent    := TWinControl(aOwner);
  FStatusBar := nil;
  FSearchPreview := nil;

  {create the viewer}
  FViewer := TppViewer.Create(FParent);
  FViewer.Parent := FParent;
  FViewer.Align := alClient;

  {assign viewer event handlers}
  EventNotifies := EventNotifies + [ciViewerPageChange, ciViewerPrintStateChange, ciViewerStatusChange, ciViewerReset, ciViewerMouseDown, ciSearchToolbarChanged, ciSearchPreviewActionPerformed];
  FViewer.WalkieTalkie.AddEventNotify(Self);

  FOnClose := nil;

  FSearchPreview := nil;

end;

{@TppCustomPreview.Destroy }

destructor TppCustomPreview.Destroy;
begin

  FSearchPreview.Free;

  inherited Destroy;

end;

{@TppCustomPreview.EventNotify }

procedure TppCustomPreview.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
begin

  inherited EventNotify(aCommunicator, aEventID, aParams);

  if (aCommunicator = FViewer.WalkieTalkie) then
    begin

      if (aEventID = ciViewerMouseDown) then
        ViewerMouseDownEvent(aCommunicator)

      else if (aEventID = ciViewerPageChange) then
        PageChangeEvent(aCommunicator)

      else if (aEventID = ciViewerPrintStateChange) then
        PrintStateChangeEvent(aCommunicator)

      else if (aEventID = ciViewerStatusChange) then
        StatusChangeEvent(aCommunicator)

      else if (aEventID = ciViewerReset) then
        ViewerResetEvent(aCommunicator);

    end
  else if (aCommunicator = FSearchPreview) then
    begin
      if (aEventID = ciSearchToolbarChanged) then
        ConfigureAccessoryPanelVisibility

      else if (aEventID = ciSearchPreviewActionPerformed) then
        SearchPreviewActionPerformed;

    end;

end;

{@TppCustomPreview.Notify }

procedure TppCustomPreview.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if not(csDestroying in ComponentState) and (aOperation = ppopRemove) then
    begin

      if (aCommunicator = FSearchPreview) then
        raise ESearchError.Create('TppCustomPreview.Notify: Do not attempt to free the embedded search preview object.');

    end;

end;

{@TppCustomPreview.BeforePreview }

procedure TppCustomPreview.BeforePreview;
begin
  uCancelled := False;

  {connect preview to report}
  FReport := FViewer.Report;

  {initialize the viewer}
  FViewer.ScreenDevice.Active := True;
  FViewer.Initialize;

  if (FReport.TextSearchSettings.Enabled) then
    FSearchPreview := CreateSearchPreview;

  if (FSearchPreview <> nil) then
    begin
      FSearchPreview.Viewer := FViewer;
      FSearchPreview.StatusBar := FStatusBar;
      FSearchPreview.TextSearchSettings := FReport.TextSearchSettings;
    end;

//  if (FSearchPreview <> nil) then
//    FSearchPreview.BeforePreview;


end;
  
{@TppCustomPreview.AfterPreview }

procedure TppCustomPreview.AfterPreview;
begin
  FViewer.ScreenDevice.Active := False;

  {exit the current search if any and free any highlight draw commands on the page}
  if (FSearchPreview <> nil) then
    FSearchPreview.AfterPreview;

  {disconnect preview from report}
  FReport := nil;

end;

{@TppCustomPreview.BeforeDesignerTabChange

  When the designer switches tabs, the prevew may still be performing a operation.
  In this case, the designer calls this method on the preview plugin. The preview
  plugin can then respond before the tab changes by overriding this method and
  shutting any processes down before the designer continues with the tab change.}

procedure TppCustomPreview.BeforeDesignerTabChange;
begin

  if (FSearchPreview <> nil) then
    begin
      if (FSearchPreview.ActiveSearch) then
        FSearchPreview.Cancel
      else
        FSearchPreview.Initialize;
    end;

end;

{@TppCustomPreview.CreateSearchPreview

  The search preview plugin architecture allows descendents to include
  the capability to search for text occurrences in the print preview. The search
  preview creates the visual controls in the preview in order to provide this
  functionality. The default search plugin is the TppTextSearchPreview class located
  in ppTextSearchPreview.pas of your installation.}

function TppCustomPreview.CreateSearchPreview: TppCustomSearchPreview;
begin

  if (FSearchPreview = nil) then
    begin
      FSearchPreview := TppPreviewPlugIn.CreateSearchPlugin(Self);

      if (FSearchPreview <> nil) then
        FSearchPreview.AddEventNotify(Self);
    end;

  Result := FSearchPreview;

end;

procedure TppCustomPreview.ConfigureAccessoryPanelVisibility;
begin

end;

{@TppCustomPreview.Cancel }

procedure TppCustomPreview.Cancel;
begin
  if (FReport <> nil) and FReport.Printing then
    begin
      FViewer.Cancel;
      uCancelled := True;
    end;

end;

{@TppCustomPreview.LanguageChanged

  Descendants can add international language support here.}

procedure TppCustomPreview.LanguageChanged;
begin
  if (FSearchPreview <> nil) then
    FSearchPreview.LanguageChanged;
end; 

{@TppCustomPreview.KeyDown }

procedure TppCustomPreview.KeyDown(var Key: Word; Shift: TShiftState);
begin

  if (ssCtrl in Shift) then
    case Key of
     VK_PRIOR: FViewer.PriorPage;
     VK_NEXT:  FViewer.NextPage;
     VK_HOME:  FViewer.FirstPage;
     VK_END:   FViewer.LastPage;
    end
  else
    case Key of
     VK_PRIOR, VK_UP:  FViewer.Scroll(dtUp);
     VK_NEXT, VK_DOWN: FViewer.Scroll(dtDown);
     VK_LEFT:          FViewer.Scroll(dtLeft);
     VK_RIGHT:         FViewer.Scroll(dtRight);
     VK_ESCAPE: PerformPreviewAction(paClose);
    end;

end;

{@TppCustomPreview.Print }

procedure TppCustomPreview.Print;
begin

  if FReport = nil then Exit;

  if (Assigned(BeforePrint)) then BeforePrint(Self);

  try
    FViewer.Print;
  finally
    if (Assigned(AfterPrint)) then AfterPrint(Self);
  end;


end; {procedure, Print}

{@TppCustomPreview.PerformPreviewAction

 Descendant classes can call this method to process preview actions enumerated
 by TppPreviewActionType.}

procedure TppCustomPreview.PerformPreviewAction(aPreviewAction: TppPreviewActionType);
begin

  if (FSearchPreview <> nil) then
    FSearchPreview.BeforePreviewActionPerformed(aPreviewAction);

  case aPreviewAction of
    paPrint:          Print;
    paEmail:          SendEmail;
    paAutoSearch:     FViewer.DisplayAutoSearchDialog;
    paTextSearch:     ToggleSearch;
    paWholePage:      Zoom(zsWholePage);
    paPageWidth:      Zoom(zsPageWidth);
    pa100Percent:     Zoom(zs100Percent);
    paFirst:          FViewer.FirstPage;
    paPrior:          FViewer.PriorPage;
    paNext:           FViewer.NextPage;
    paLast:           FViewer.LastPage;
    paCancel:         Cancel;
    paClose:          if Assigned(FOnClose) then FOnClose(Self);
  end;

  if (FSearchPreview <> nil) then
    FSearchPreview.AfterPreviewActionPerformed(aPreviewAction);

end;

{@TppCustomPreview.ToggleSearch }

procedure TppCustomPreview.ToggleSearch;
begin

  if (FSearchPreview <> nil) then
    FSearchPreview.ToggleSearch;

end;

{@TppCustomPreview.Zoom }

procedure TppCustomPreview.Zoom(aZoomSetting: TppZoomSettingType);
begin
  FViewer.ZoomSetting := aZoomSetting;
end;

{@TppCustomPreview.PageChangeEvent }

procedure TppCustomPreview.PageChangeEvent(Sender: TObject);
begin
  if Assigned(FOnPageChange) then FOnPageChange(Self);
end;

{@TppCustomPreview.PrintStateChangeEvent }

procedure TppCustomPreview.PrintStateChangeEvent(Sender: TObject);
begin

end;

{@TppCustomPreview.StatusChangeEvent }

procedure TppCustomPreview.StatusChangeEvent(Sender: TObject);
begin

  {update status bar}
  if FViewer.Busy and (FStatusBar <> nil) then
    FStatusBar.Panels[0].Text := FViewer.Status;

  if (FSearchPreview <> nil) then
    FSearchPreview.StatusChange

  else if (FStatusBar <> nil) and not(FStatusBar.SimplePanel) then
    begin
      {add a panel for the search status if using the standard print preview
       form which only creates one. }
      if (FStatusBar.Panels.Count = 1) then
        FStatusBar.Panels.Add;

      FStatusBar.Panels[0].Width := 275;
      FStatusBar.Panels[0].Alignment := taLeftJustify;

      {force any other panels that the designer may create to be out of view
       until returning to any other workspace in the designer.}
      if FViewer.DesignViewer then
        begin
          FStatusBar.Panels[1].Width := FViewer.Parent.Width;

          FStatusBar.Panels[1].Text := '';
        end;

    end;

end; {procedure, StatusChangeEvent}


{@TppCustomPreview.ViewerMouseDownEvent }

procedure TppCustomPreview.ViewerMouseDownEvent(Sender: TObject);
begin

end;

{@TppCustomPreview.ViewerResetEvent }

procedure TppCustomPreview.ViewerResetEvent(Sender: TObject);
begin


end;

{@TppCustomPreview.GetOutlineVisible }

function TppCustomPreview.GetOutlineVisible: Boolean;
begin

  Result := False;

end;

{@TppCustomPreview.SetOutlineVisible }

procedure TppCustomPreview.SetOutlineVisible(aOutlineVisible: Boolean);
begin

end; 

{@TppCustomPreview.SearchPreviewActionPerformed }

procedure TppCustomPreview.SearchPreviewActionPerformed;
begin

end;

{@TppCustomPreview.SetStatusBar }

procedure TppCustomPreview.SetStatusBar(aStatusbar: TStatusBar);
begin
  FStatusBar := aStatusbar;

  if (FSearchPreview <> nil) then
    FSearchPreview.StatusBar := FStatusBar;
end;

{@TppCustomPreview.GotoPage }

procedure TppCustomPreview.GotoPage(aPageNo: Integer);
begin
  if (FSearchPreview <> nil) then
    FSearchPreview.BeforePageJump(aPageNo);

  FViewer.GotoPage(aPageNo);
end;

procedure TppCustomPreview.SendEmail;
begin
  if FReport <> nil then
    FReport.SendMail;
    
end;

{@TppCustomPreview.ZoomToPercentage }

procedure TppCustomPreview.ZoomToPercentage(aZoomPercentage: Integer);
begin
  FViewer.ZoomPercentage := aZoomPercentage;

  PageChangeEvent(Self);
end;


{******************************************************************************
 *
 ** P R E V I E W E R
 *
{******************************************************************************}

{@TppPreview.Create }

constructor TppPreview.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  EventNotifies := EventNotifies + [ciOutlineViewerVisibilityChanged];

  FBeforePreview := False;
  FAccessoryToolbarWidthSet := False;
  FShowOutlineWhenPreview := True;

  CreateToolbar;

  FOutlineViewer := CreateOutlineViewer;

  {splitter to support outline viewer}
  FSplitter := TSplitter.Create(Parent);
  FSplitter.Parent := Parent;
  FSplitter.Left := FOutlineViewer.Width;
  FSplitter.Align := alLeft;
  FSplitter.AutoSnap := False;
  FSplitter.MinSize := FOutlineViewer.Width;
  FSplitter.Beveled := False;
  FSplitter.Width := 2;

  Viewer.Initialize;
  Viewer.ScreenDevice.Active := False;
  Viewer.Align   := alClient;

  FPnlViewer := TPanel.Create(Parent);
  FPnlViewer.Parent := Parent;
  FPnlViewer.BevelOuter := bvNone;
  Viewer.Parent := FPnlViewer;
  FPnlViewer.Align   := alClient;

  Viewer.Align   := alNone;
  Viewer.Top := 2;
  Viewer.Left := 2;
  Viewer.Height := Viewer.Parent.Height-4;
  Viewer.Width := Viewer.Parent.Width-4;
  Viewer.Anchors := [akLeft, akTop, akRight, akBottom];



  FKeyCatcher := TppEdit.Create(Parent);
  FKeyCatcher.Parent := Parent;
  FKeyCatcher.Width := 0;
  FKeyCatcher.Height := 0;
  FKeyCatcher.OnKeyDown := KeyDownEvent;
  FKeyCatcher.OnKeyPress := KeyPressEvent;
  FKeyCatcher.OnMouseWheel := MouseWheelEvent;


end;

{@TppPreview.CreateToolbar }

procedure TppPreview.CreateToolbar;
begin


  FTopDock := TppDock.Create(Parent);
  FTopDock.Parent := Parent;
  FTopDock.Align := alTop;
  FTopDock.ShowHint := True;

  FTopDock.BeginUpdate();

  FToolbar := TppToolbar.Create(Parent);
  FToolbar.Images := ToolImageList;
  FToolbar.DockMode := dmCannotFloatOrChangeDocks;

  CreateToolbarItems();

  FToolbar.CurrentDock := FTopDock;

  FTopDock.EndUpdate();

  {this is used to wait until the search strings have been translated if text search is enabled}
  FAccessoryToolbarWidthSet := False;

  FAccessoryToolbar := TPanel.Create(Parent);
  FAccessoryToolbar.Parent := Parent;
  FAccessoryToolbar.Align := alLeft;
  FAccessoryToolbar.Width := 125;
  FAccessoryToolbar.BevelOuter := bvNone;
  FAccessoryToolbar.ShowHint := True;
  FAccessoryToolbar.Color := clBtnFace;
{$IFDEF Delphi7}
  FAccessoryToolbar.ParentBackground := False;
{$ENDIF}

  FTextSearchToolbar := TPanel.Create(Parent);
  FTextSearchToolbar.Parent := nil;
  FTextSearchToolbar.BevelInner := bvNone;
  FTextSearchToolbar.BevelOuter := bvNone;
  FTextSearchToolbar.Color := clBtnFace;
{$IFDEF Delphi7}
  FTextSearchToolbar.ParentBackground := False;
{$ENDIF}

end; {procedure, CreateToolbar}

{@TppPreview.CreateOutlineViewer

  This method is called to create a TppOutlineViewer object.
  Descendents of TppPreview can override this method
  in order to customize the outline viewer.

  Any TppPreview descendent can customize the look and feel of the outline.
  One such modification is to change the background color of the outline to
  clWhite instead of the default color of clBtnFace.
  To accomplish this, simply call inherited CreateOutlineViewer and set
  the color to clWhite.

  <Pre>
  function TmyOutlinePreview.CreateOutlineViewer: TppOutlineViewer;
    begin
      Result := inherited CreateOutlineViewer;

      Result.Color := clWhite;
    end;
  </Pre>
}

function TppPreview.CreateOutlineViewer: TppOutlineViewer;
begin
//  FOutlinePanel := TppTBXAlignmentPanel.Create(FAccessoryToolbar);
//  FOutlinePanel.Parent := FAccessoryToolbar;
//  FOutlinePanel.Align := alClient;

  Result := TppOutlineViewer.Create(FAccessoryToolbar);
  Result.Parent := FAccessoryToolbar;
  Result.Preview := Self;
  Result.Viewer := FViewer;
  Result.OutlineVisible := False;
  Result.BevelOuter := bvNone;

  Result.Left := 2;
  Result.Top := 2;
//  Result.Width := Result.Parent.Width-2;
//  Result.Height := Result.Parent.Height-4;
//  Result.Anchors := [akLeft, akTop, akRight, akBottom];
  Result.Align := alClient;


  {listen for changes to the popup menu of the outline viewer so that the panel
  can be closed if needed}
  Result.WalkieTalkie.AddEventNotify(Self);

end;

{@TppPreview.EventNotify }

procedure TppPreview.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
begin

  inherited EventNotify(aCommunicator, aEventID, aParams);

  if (aCommunicator = FOutlineViewer.WalkieTalkie) then
    begin

      if (aEventID = ciOutlineViewerVisibilityChanged) then
        begin
          FOutlineViewer.UpdateOutline(Viewer.CurrentPage);

          ConfigureAccessoryPanelVisibility;
        end;

    end;

end; 

{@TppPreview.ToolButtonClickEvent }

procedure TppPreview.ToolButtonClickEvent(Sender: TObject);
var
  liPreviewAction: Integer;
  lPreviewAction: TppPreviewActionType;
begin

  liPreviewAction := TComponent(Sender).Tag;

  lPreviewAction := TppPreviewActionType(liPreviewAction);

  if (lPreviewAction = paCancel) and not(Viewer.Busy) then
    begin

      if (FSearchPreview = nil) or ((FSearchPreview <> nil) and not(FSearchPreview.SearchingPage)) then
        lPreviewAction := paClose;

    end;

  PerformPreviewAction(lPreviewAction);

  FocusToKeyCatcher;

end;

{@TppPreview.BeforePreview }

procedure TppPreview.BeforePreview;
var
  lbShouldCreateSearchControls: Boolean;
  lPropRec: TraPropRec;
  lOutlineSettings: TppOutlineReportSettings;
  lbSuppressOutline: Boolean;
  lbOutlineExists: Boolean;
begin

  FToolbar.BeginUpdate;

  FBeforePreview := True;

  if (SearchPreview = nil) then
    lbShouldCreateSearchControls := True
  else
    lbShouldCreateSearchControls := False;

  inherited BeforePreview;

  if (SearchPreview <> nil) then
    begin
      if lbShouldCreateSearchControls then
        SearchPreview.CreateControls(FTextSearchToolbar);

      {override to customize location of search control panel}  
      ConfigureTextSearchToolbar;

      try
        SearchPreview.BeforePreview;

      except
        on E: ESearchError do
          Application.HandleException(Self);
      end;
    end;

  FFirstButton.Enabled := False;
  FPriorButton.Enabled := False;
  FNextButton.Enabled := False;
  FLastButton.Enabled := False;

  FWholePageButton.Enabled  := True;
  FPageWidthButton.Enabled  := True;
  FPercent100Button.Enabled := True;

  FWholePageButton.Checked  := (Viewer.ZoomSetting = zsWholePage);
  FPageWidthButton.Checked  := (Viewer.ZoomSetting = zsPageWidth);
  FPercent100Button.Checked := (Viewer.ZoomSetting = zs100Percent);

  FPrintButton.Enabled := True;

  FEMailButton.Visible := FReport.EmailSettings.Enabled;

  ConfigureSearchButtons;

  FOutlineViewer.Reset;

  FOutlineViewer.Reset;

  {check for TppReport - check existence of OutlineSettings property}
  if TraRTTI.GetPropRec(FReport.ClassType, 'OutlineSettings', lPropRec) then
    begin

      TraRTTI.GetPropValue(FReport, 'OutlineSettings', lOutlineSettings);

      FShowOutlineWhenPreview := lOutlineSettings.Enabled and lOutlineSettings.Visible;
      FOutlineViewer.OutlineVisible := FShowOutlineWhenPreview;

      if (FShowOutlineWhenPreview) then
        FOutlineViewer.EnablePopupMenu;

    end
  {check for ArchiveReader - check existence of OutlineExists property}
  else if TraRTTI.GetPropRec(FReport.ClassType, 'OutlineExists', lPropRec) then
    begin
      TraRTTI.GetPropValue(FReport, 'OutlineExists', lbOutlineExists);

      if TraRTTI.GetPropRec(FReport.ClassType, 'SuppressOutline', lPropRec) then
        TraRTTI.GetPropValue(FReport, 'SuppressOutline', lbSuppressOutline)
      else
        lbSuppressOutline := False;

      FShowOutlineWhenPreview := (lbOutlineExists and not(lbSuppressOutline));
      FOutlineViewer.OutlineVisible := FShowOutlineWhenPreview;

      if (FShowOutlineWhenPreview) then
        FOutlineViewer.EnablePopupMenu;

    end
  else {default outline viewer to not visible}
    FOutlineViewer.OutlineVisible := False;

  LanguageChanged();

  StatusChangeEvent(Self);

  FToolbar.EndUpdate;

  FBeforePreview := False;

end;

{@TppPreview.ConfigureTextSearchToolbar }

procedure TppPreview.ConfigureTextSearchToolbar;
begin
  if (FSearchPreview <> nil) then
    begin
      FTextSearchToolbar.Parent := FAccessoryToolbar;
      FTextSearchToolbar.Align := alTop;
      FTextSearchToolbar.Anchors := [akLeft, akTop];
      FTextSearchToolbar.Height := 80;

      FSearchPreview.ArrangeControlsVertically;

      {125 is the default which means it has not been set yet for the language change}
      if not(FAccessoryToolbarWidthSet) then
        begin
          FAccessoryToolbarWidthSet := True;

          FAccessoryToolbar.Width := FSearchPreview.TranslatedMinWidth;
        end;

      Splitter.MinSize := FSearchPreview.TranslatedMinWidth;
    end;
end;

{@TppPreview.Zoom }

procedure TppPreview.Zoom(aZoomSetting: TppZoomSettingType);
begin
  inherited Zoom(aZoomSetting);

  FZoomPercentageEdit.Text := IntToStr(Viewer.CalculatedZoom) + '%';

  if (StatusBar <> nil) and (Parent.HandleAllocated) and (Parent.Visible) then
    StatusBar.SetFocus;

end;

{@TppPreview.PageChangeEvent }

procedure TppPreview.PageChangeEvent(Sender: TObject);
var
  lCurrentPage: TppPage;
begin

  if not(uCancelled) then
    begin
      FToolbar.BeginUpdate;

      FPageNoEdit.Text := IntToStr(Viewer.AbsolutePageNo);
      FZoomPercentageEdit.Text := IntToStr(Viewer.CalculatedZoom) + '%';

      FPrintButton.Enabled := True;
      FWholePageButton.Enabled := True;
      FPageWidthButton.Enabled := True;
      FPercent100Button.Enabled := True;

      FWholePageButton.Checked  := (Viewer.ZoomSetting = zsWholePage);
      FPageWidthButton.Checked  := (Viewer.ZoomSetting = zsPageWidth);
      FPercent100Button.Checked := (Viewer.ZoomSetting = zs100Percent);

      lCurrentPage := Viewer.CurrentPage;

      FFirstButton.Enabled := not(lCurrentPage.FirstPage);
      FPriorButton.Enabled := not(lCurrentPage.FirstPage);
      FNextButton.Enabled := not(lCurrentPage.LastPage);
      FLastButton.Enabled := not(lCurrentPage.LastPage);

      {don't want this set all the time}
      if not(FOutlineViewer.OutlineVisible) and (FShowOutlineWhenPreview) and lCurrentPage.FirstPage and not(Viewer.IsResizing) then
        FOutlineViewer.OutlineVisible := (lCurrentPage.GetOutlineDrawCommand <> nil);

      if (FOutlineViewer.OutlineVisible) then
        begin
          FOutlineViewer.UpdateOutline(lCurrentPage);
          FOutlineViewer.ScrollToPage(lCurrentPage.AbsolutePageNo);
        end;

      ConfigureSearchButtons;

      ConfigureTextSearchToolbar;

      FToolbar.EndUpdate;

      inherited PageChangeEvent(Sender);


    end;

end; 

{@TppPreview.PrintStateChangeEvent }

procedure TppPreview.PrintStateChangeEvent(Sender: TObject);
var
  lPosition: TPoint;
begin

  FToolbar.BeginUpdate;

  if Viewer.Busy then
    begin
      Viewer.Cursor := crHourGlass;

      FZoomPercentageEdit.Enabled := False;
      FPageNoEdit.Enabled := False;

      FToolbar.Cursor := crHourGlass;

      if (StatusBar <> nil) then
        StatusBar.Cursor := crHourGlass;

      FCancelButton.Enabled := True;

      if Viewer.DesignViewer then
        begin
//nomas          FCancelButton.Cursor := crHourGlass;
        end
      else
        begin
//nomas          FCancelButton.Cursor := crArrow;
          FCancelButton.Caption := ppLoadStr(ppMsgCancel);
        end;

    end
  else
    begin
      Viewer.Cursor := crDefault;

      FZoomPercentageEdit.Enabled := True;
      FPageNoEdit.Enabled := True;

      FToolbar.Cursor := crDefault;

      if (StatusBar <> nil) then
        StatusBar.Cursor := crDefault;

      if Viewer.DesignViewer then
        begin
//nomas         FCancelButton.Cursor := crDefault;
          FCancelButton.Enabled := False;
        end
      else
        begin
//nomas          FCancelButton.Cursor  := crDefault;
          FCancelButton.Enabled := True;
          FCancelButton.Caption := ppLoadStr(ppMsgClose);
        end;

      // disable buttons
      if FViewer.ScreenDevice.Cancelled then
        SetCancelledButtonState;

    end;

  FToolbar.EndUpdate;

  {this code will force the cursor to update}
  GetCursorPos(lPosition);
  SetCursorPos(lPosition.X, lPosition.Y);

end;


{@TppPreview.MouseWheelEvent}

procedure TppPreview.MouseWheelEvent(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin

  Viewer.ScrollBox.VertScrollBar.Position := Viewer.ScrollBox.VertScrollBar.Position - (WheelDelta div 5);

end;

{@TppPreview.KeyDownEvent}

procedure TppPreview.KeyDownEvent(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  lPoint: TPoint;
begin

  KeyDown(Key, Shift);

  {forces cursor to be shown even though focus is on KeyCatcher}
  GetCursorPos(lPoint);
  SetCursorPos(lPoint.X, lPoint.Y);
end;

{@TppPreview.KeyPressEvent }

procedure TppPreview.KeyPressEvent(Sender: TObject; var Key: Char);
begin

  if (Sender = FKeyCatcher) then
    begin

      {stop the default windows beep}
      if (Key = chEnterKey) then
        Key := #0;
        
    end;

end;

{@TppPreview.FocusToKeyCatcher }

procedure TppPreview.FocusToKeyCatcher;
begin

  try
    FKeyCatcher.SetFocus;

  except
    on E: EInvalidOperation do
  end;

end;

{@TppPreview.LanguageChanged}

procedure TppPreview.LanguageChanged;
begin

  inherited LanguageChanged;

  FToolbar.BeginUpdate;

  {used to set the min width of the splitter based on the text search panel if it is enabled}
  FAccessoryToolbarWidthSet := False;

  if (FOutlineViewer <> nil) then
    FOutlineViewer.LanguageChanged(TppOutlineDrawCommand(Viewer.CurrentPage.GetOutlineDrawCommand));

  FPrintButton.Hint      := ppLoadStr(22);
  FWholePageButton.Hint  := ppLoadStr(30);
  FPageWidthButton.Hint  := ppLoadStr(31);
  FPercent100Button.Hint := ppLoadStr(1);
  FFirstButton.Hint      := ppLoadStr(13);
  FPriorButton.Hint      := ppLoadStr(29);
  FNextButton.Hint       := ppLoadStr(15);
  FLastButton.Hint       := ppLoadStr(14);
  FAutoSearchButton.Hint := ppLoadStr(1021);

  if FTextSearchButton.Checked then
    FTextSearchButton.Hint := ppLoadStr(1055) {'Disable the Text Search Toolbar'}
  else
    FTextSearchButton.Hint := ppLoadStr(1054); {'Enable the Text Search Toolbar';}

  if Viewer.DesignViewer then
    FCancelButton.Caption := ppLoadStr(ppMsgCancel)
  else
    FCancelButton.Caption := ppLoadStr(ppMsgClose);

  FToolbar.EndUpdate;

end;

{@TppPreview.ConfigureSearchButtons }

procedure TppPreview.ConfigureSearchButtons;
begin

  if (FReport <> nil) then
    FAutoSearchButton.Visible := FReport.ShowAutoSearchDialog;

  if (FReport <> nil) then
   begin
     FTextSearchButton.Enabled := FReport.TextSearchSettings.Enabled;
     FTextSearchButton.Visible := FReport.TextSearchSettings.Enabled;
   end;

end;

{@TppPreview.GetOutlineVisible }

function TppPreview.GetOutlineVisible: Boolean;
begin

  Result := FOutlineViewer.OutlineVisible;

end;

{@TppPreview.SetOutlineVisible }

procedure TppPreview.SetOutlineVisible(aOutlineVisible: Boolean);
begin

  FOutlineViewer.OutlineVisible := aOutlineVisible;

  ConfigureAccessoryPanelVisibility;

end;

{@TppPreview.ConfigureAccessoryPanelVisibility}

procedure TppPreview.ConfigureAccessoryPanelVisibility;
var
  lbPrevious: Boolean;
begin

  lbPrevious := FAccessoryToolbar.Visible;

  if (FTextSearchToolbar.Parent = FOutlineViewer.Parent) then
    FAccessoryToolbar.Visible := FOutlineViewer.OutlineVisible or FTextSearchToolbar.Visible
  else
    FAccessoryToolbar.Visible := FOutlineViewer.Visible;

  if (lbPrevious <> FAccessoryToolbar.Visible) then
    Rezoom;
      
end;
   
{@TppPreview.SearchPreviewActionPerformed

  Set the focus to the key catcher if other preview form control took focus.}

procedure TppPreview.SearchPreviewActionPerformed;
begin

  inherited SearchPreviewActionPerformed;

  FocusToKeyCatcher;

end;

{@TppPreview.ToggleSearch }

procedure TppPreview.ToggleSearch;
begin

  inherited ToggleSearch;

  if FTextSearchButton.Checked then
    FTextSearchButton.Hint := ppLoadStr(1055) {'Disable the Text Search Toolbar'}
  else
    FTextSearchButton.Hint := ppLoadStr(1054); {'Enable the Text Search Toolbar';}

end;

{@TppPreview.ViewerMouseDownEvent }

procedure TppPreview.ViewerMouseDownEvent(Sender: TObject);
begin
  FocusToKeyCatcher;

end;

{@TppPreview.ViewerResetEvent }

procedure TppPreview.ViewerResetEvent(Sender: TObject);
begin
  FOutlineViewer.Reset;
end;

{@TppPreview.Rezoom         

  Fires when the accessory panel changes visibility.  The purpose is
  to rezoom the page so that it properly reflects the zoom setting the user
  has chosen.}

procedure TppPreview.Rezoom;
begin
  if not(FBeforePreview) then
    begin
      Viewer.IncrementalPainting := False;
      Zoom(Viewer.ZoomSetting);
    end;
end;
  
{@TppPreview.Cancel

  Disable the nav controls because the report can't generate any more pages
  anyway.}

procedure TppPreview.Cancel;
begin

  inherited Cancel;

  SetCancelledButtonState;

end;

{------------------------------------------------------------------------------}
{ TppPreviewToolbar.CreateItems}

procedure TppPreview.CreateToolbarItems;
begin

  FToolbar.BeginUpdate;

  FPrintButton := FToolbar.AddButton();
  FPrintButton.ImageIndex := ToolImageList.AddTool('PPPRINT');
  FPrintButton.Tag := Ord(paPrint);
  FPrintButton.OnClick := ehToolbutton_Click;

  FEmailButton := FToolbar.AddButton();
  FEmailButton.ImageIndex := ToolImageList.AddTool('PPEMAIL');
  FEmailButton.OnClick := ehToolbutton_Click;
  FEmailButton.Tag := Ord(paEmail);
  FEmailButton.Hint := 'Email'; {Add to resource file};

  FToolbar.AddSpacer();
//  AddSeparator();
  FToolbar.AddSpacer();

  FAutoSearchButton := FToolbar.AddButton();
  FAutoSearchButton.ImageIndex := ToolImageList.AddTool('PPAUTOSEARCH'); // (TppAutoSearchIcon);
  FAutoSearchButton.OnClick := ehToolbutton_Click;
  FAutoSearchButton.Tag := Ord(paAutoSearch);

  FTextSearchButton := FToolbar.AddButton();
  FTextSearchButton.ImageIndex := ToolImageList.AddTool('PPTEXTSEARCH');
  FTextSearchButton.OnClick := ehToolbutton_Click;
  FTextSearchButton.Tag := Ord(paTextSearch);
  FTextSearchButton.GroupIndex := 2;
  FTextSearchButton.AutoCheck := True;
  FTextSearchButton.Hint := ppLoadStr(1054); {'Enable the Text Search Toolbar';}

  FToolbar.AddSpacer();
//  AddSeparator();
  FToolbar.AddSpacer();

  FWholePageButton := FToolbar.AddButton();
  FWholePageButton.ImageIndex := ToolImageList.AddTool('PPZOOMWHOLEPAGE');
  FWholePageButton.OnClick := ehToolbutton_Click;
  FWholePageButton.Tag := Ord(paWholePage);
  FWholePageButton.GroupIndex := 1;
  FWholePageButton.AutoCheck := True;
  FWholePageButton.Checked := True;

  FPageWidthButton := FToolbar.AddButton();
  FPageWidthButton.ImageIndex := ToolImageList.AddTool('PPZOOMPAGEWIDTH');
  FPageWidthButton.OnClick := ehToolbutton_Click;
  FPageWidthButton.Tag := Ord(paPageWidth);
  FPageWidthButton.GroupIndex := 1;
  FPageWidthButton.AutoCheck := True;

  FPercent100Button := FToolbar.AddButton();
  FPercent100Button.ImageIndex := ToolImageList.AddTool('PPZOOM100PERCENT');
  FPercent100Button.OnClick := ehToolbutton_Click;
  FPercent100Button.Tag := Ord(pa100Percent);
  FPercent100Button.GroupIndex := 1;
  FPercent100Button.AutoCheck := True;

  FZoomPercentageEdit := FToolbar.AddEdit();
  FZoomPercentageEdit.EditWidth := 37;
  FZoomPercentageEdit.ExtendedAccept := True;
  FZoomPercentageEdit.OnAcceptText := ehZoomEdit_AcceptText;

  FToolbar.AddSpacer();
//  AddSeparator();
  FToolbar.AddSpacer();

  FFirstButton := FToolbar.AddButton();
  FFirstButton.ImageIndex := ToolImageList.AddTool('PPFIRSTPAGE');
  FFirstButton.OnClick := ehToolbutton_Click;
  FFirstButton.Tag := Ord(paFirst);

  FPriorButton := FToolbar.AddButton();
  FPriorButton.ImageIndex := ToolImageList.AddTool('PPPRIORPAGE');
  FPriorButton.OnClick := ehToolbutton_Click;
  FPriorButton.Tag := Ord(paPrior);

  FPageNoEdit := FToolbar.AddEdit();
  FPageNoEdit.EditWidth := 37;
  FPageNoEdit.ExtendedAccept := True;
  FPageNoEdit.OnAcceptText := ehPageNoEdit_AcceptText;

  FNextButton := FToolbar.AddButton();
  FNextButton.ImageIndex := ToolImageList.AddTool('PPNEXTPAGE');
  FNextButton.OnClick := ehToolbutton_Click;
  FNextButton.Tag := Ord(paNext);

  FLastButton := FToolbar.AddButton();
  FLastButton.ImageIndex := ToolImageList.AddTool('PPLASTPAGE');
  FLastButton.OnClick := ehToolbutton_Click;
  FLastButton.Tag := Ord(paLast);

  FToolbar.AddSpacer();
  FToolbar.AddSpacer();

  FCancelButton := FToolbar.AddButton();
  FCancelButton.Caption := ppLoadStr(ppMsgCancel);
  FCancelButton.OnClick := ehToolbutton_Click;
  FCancelButton.Tag := Ord(paCancel);
  FCancelButton.Enabled := False;

  FToolbar.EndUpdate;


end;

{------------------------------------------------------------------------------}
{ TppPreviewToolbar.ehPageNoEdit_AcceptText}

procedure TppPreview.ehPageNoEdit_AcceptText(Sender: TObject; var aNewText: String; var Accept: Boolean);
var
  liNewPageNo: Integer;
begin

  liNewPageNo := StrToIntDef(aNewText, 0);

  if (liNewPageNo < 0) then
    GotoPage(1)
  else if (liNewPageNo > 0) then
    GotoPage(liNewPageNo);

  // update to reflect the page no being displayed
  aNewText := IntToStr(Viewer.AbsolutePageNo);

  FocusToKeyCatcher;

end;

{------------------------------------------------------------------------------}
{ TppPreviewToolbar.ehPageNoEdit_AcceptText}

procedure TppPreview.ehZoomEdit_AcceptText(Sender: TObject; var aNewText: String; var Accept: Boolean);
var
  liNewZoom: Integer;
begin

  StringReplace(aNewText, '%', '', []);

  liNewZoom := StrToIntDef(aNewText, 0);

  if (liNewZoom > 0) then
    ZoomToPercentage(liNewZoom);

  FocusToKeyCatcher;

  // update to reflect the page no being displayed
  aNewText := IntToStr(Viewer.CalculatedZoom) + '%';

end;

{------------------------------------------------------------------------------}
{ TppPreviewToolbar.ehToolbutton_Click}

procedure TppPreview.ehToolbutton_Click(Sender: TObject);
var
  liPreviewAction: Integer;
  lPreviewAction: TppPreviewActionType;
begin

  liPreviewAction := TComponent(Sender).Tag;

  lPreviewAction := TppPreviewActionType(liPreviewAction);

  if (lPreviewAction = paCancel) and not(Viewer.Busy) then
    begin

      if (FSearchPreview = nil) or ((FSearchPreview <> nil) and not(FSearchPreview.SearchingPage)) then
        lPreviewAction := paClose;

    end;

  PerformPreviewAction(lPreviewAction);

end;

{@TppPreview.SetCancelledButtonState}

procedure TppPreview.SetCancelledButtonState;
begin

  FPrintButton.Enabled := False;

  FWholePageButton.Enabled  := False;
  FPageWidthButton.Enabled  := False;
  FPercent100Button.Enabled := False;

  FFirstButton.Enabled := False;
  FPriorButton.Enabled := False;
  FNextButton.Enabled := False;
  FLastButton.Enabled := False;

  FPageNoEdit.Enabled := False;

  if (FTextSearchButton.Checked) then
    begin
      ToggleSearch;
      FTextSearchButton.Checked := False;
    end;

  FTextSearchButton.Enabled := False;

end;


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization
  TppPreviewPlugIn.Register(TppPreview);

finalization
  TppPreviewPlugIn.UnRegister(TppPreview);


end.

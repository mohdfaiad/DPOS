unit ppTBXPanel;

{.$I mxs.inc}

interface

uses
  SysUtils, Classes, Controls, Windows, Messages, Graphics, ExtCtrls,

  ppTBX,
  ppTBXUtils,
  ppTBXThemes,
  ppTBXDkPanels;

type

  TppAlignmentPanel = class(TppTBXAlignmentPanel)
  private
    FThemed: Boolean;
    procedure SetThemed(const Value: Boolean);
  protected
    function GetThemeColor: TColor; virtual;
    procedure TBMThemeChange(var Message: TMessage); message TBM_THEMECHANGE;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    property Themed: Boolean read FThemed write SetThemed;
  end;


  TppTBXPanel = class(TPanel)
  private
   FThemed: boolean;
   FButtonStyle: boolean;

   procedure SetButtonStyle(Value: boolean);
   procedure SetThemed(Value: boolean);
   procedure SetThemeBack(t: boolean);
   procedure EraseTBXBackground(DC: HDC; ARect: TRect);
  protected
   FThemeBack: boolean;

   procedure Paint; override;
   procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
   procedure TBMThemeChange(var Message: TMessage); message TBM_THEMECHANGE;
   procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
  public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  published
   property ThemeBackground: boolean read FThemeBack write SetThemeBack default false;
   property Themed: boolean read FThemed write SetThemed default true;
   property ButtonStyle: boolean read FButtonStyle write SetButtonStyle default false;
   property Align;
   property Alignment;
   property Anchors;
   property AutoSize;
   property BiDiMode;
   property Caption;
   property Color;
   property Constraints;
   property UseDockManager default True;
   property DockSite;
   property DragCursor;
   property DragKind;
   property DragMode;
   property Enabled;
   property FullRepaint;
   property Font;
   property Locked;
   property ParentBiDiMode;
   property ParentColor;
   {$IFDEF DELPHI_7_UP}
   property ParentBackground;
   {$ENDIF}
   property ParentFont;
   property ParentShowHint;
   property PopupMenu;
   property ShowHint;
   property TabOrder;
   property TabStop;
   property Visible;

   property OnCanResize;
   property OnClick;
   property OnConstrainedResize;
   property OnContextPopup;
   property OnDockDrop;
   property OnDockOver;
   property OnDblClick;
   property OnDragDrop;
   property OnDragOver;
   property OnEndDock;
   property OnEndDrag;
   property OnEnter;
   property OnExit;
   property OnGetSiteInfo;
   property OnMouseDown;
   property OnMouseMove;
   property OnMouseUp;
   property OnResize;
   property OnStartDock;
   property OnStartDrag;
   property OnUnDock;
  end;

implementation

var
 bb: TBitmap;
 tn: string;

constructor TppTBXPanel.Create(AOwner: TComponent);
begin
 inherited;
 AddThemeNotification(Self);
 DoubleBuffered := true;
 FThemeBack := True;
 FThemed := true;
 FButtonStyle := False;
end;

destructor TppTBXPanel.Destroy;
begin
 FreeAndNil(bb);
 RemoveThemeNotification(Self);
 inherited;
end;

procedure TppTBXPanel.TBMThemeChange(var Message: TMessage);
begin
if Message.WParam = TSC_VIEWCHANGE then
 Invalidate;
end;

procedure SetItemInfo(var IInfo: TppTBXItemInfo; bs: boolean = false);
begin
 FillChar(IInfo, SizeOf(TppTBXItemInfo), 0);
 IInfo.ViewType := TVT_NORMALTOOLBAR;
 IInfo.ItemOptions := IO_APPACTIVE or IO_TOOLBARSTYLE;
 IInfo.Enabled := True;
 IInfo.Pushed := false;
 IInfo.Selected := bs;
 IInfo.HoverKind := hkNone;
end;

procedure PaintPanel(R: TRect; Canvas: TCanvas; cl: TppTBXPanel);
var
 ii: TppTBXItemInfo;
 rgn: hrgn;
begin

 if (bb = nil) or (bb.Width <> cl.Width) or (bb.Height <> cl.Height) or not SameText(tn, CurrentTheme.Name) then
  begin
   tn := CurrentTheme.Name;
   if bb = nil then
    begin
     bb := TBitmap.Create;
     bb.PixelFormat := pf32bit;
    end;
   bb.Height := cl.Height;
   bb.Width := cl.Width;
   bb.Canvas.CopyRect(bb.Canvas.ClipRect, canvas, canvas.ClipRect);
  end
 else
  begin
   Canvas.Draw(0, 0, bb);
   Exit;
  end;

 if not cl.ThemeBackground then
  ExcludeClipRect(bb.Canvas.Handle, 1, 1, R.Right - 1, R.Bottom - 1);
 // set info
 SetItemInfo(ii, cl.ButtonStyle);
 ii.Enabled := cl.Enabled;
 // paint the border
 if not cl.ButtonStyle then
  begin
   CurrentTheme.PaintFrame(bb.canvas, R, ii);
   CurrentTheme.PaintBackgnd(bb.canvas, R, R, R, CurrentTheme.GetViewColor(TVT_NORMALTOOLBAR), false, TVT_NORMALTOOLBAR);
   CurrentTheme.PaintDock(bb.canvas, R, R, DP_TOP);
   if CurrentTheme.PaintDockBackground then
    CurrentTheme.PaintBackgnd(bb.canvas, R, R, R, clBtnShadow{CurrentTheme.GetViewColor(TVT_NORMALTOOLBAR)}, false, TVT_NORMALTOOLBAR)
   else
    CurrentTheme.PaintDock(bb.canvas, R, R, DP_TOP);
  end;
 CurrentTheme.PaintButton(bb.canvas, R, ii);
 if cl.ThemeBackground then
  begin
   if not cl.ButtonStyle then
    InflateRect(R, -1, -1);
   rgn := CreateRectRgnIndirect(R);
   SelectObject(bb.Canvas.handle, rgn);
   InflateRect(R, 10, 10);
   if not cl.ButtonStyle then
    begin
     CurrentTheme.PaintBackgnd(bb.canvas, R, R, R, CurrentTheme.GetViewColor(TVT_NORMALTOOLBAR), false, TVT_NORMALTOOLBAR);
     CurrentTheme.PaintDock(bb.canvas, R, R, DP_TOP);
     if CurrentTheme.PaintDockBackground then
      CurrentTheme.PaintBackgnd(bb.canvas, R, R, R, {Color}CurrentTheme.GetViewColor(TVT_NORMALTOOLBAR), false, TVT_NORMALTOOLBAR)
     else
      CurrentTheme.PaintDock(bb.canvas, R, R, DP_TOP);
    end;
   InflateRect(R, -10, -10);
   DeleteObject(rgn);
   CurrentTheme.PaintButton(bb.canvas, R, ii);
  end;
 Canvas.Draw(0, 0, bb);
end;

procedure TppTBXPanel.Paint;
const
 al: array [0..2] of integer = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
 R: TRect;
begin
 if not ParentColor then
  begin
   Canvas.Brush.Color := Color;
   Canvas.FillRect(ClientRect);
  end;
 inherited;
 if not FThemed then Exit;
 PaintPanel(ClientRect, Canvas, self);
 if Caption <> '' then
  begin
   R := ClientRect;
   R.Left := R.Left + 4;
   Canvas.Brush.Style := bsClear;
   Canvas.Font := Font;
   DrawText(Canvas.Handle, PChar(Caption), Length(Caption), R, DT_VCENTER or al[Integer(Alignment)] or DT_SINGLELINE);
  end;
end;

procedure TppTBXPanel.CMEnabledChanged(var Message: TMessage);
begin
 inherited;
 Invalidate;
end;

procedure TppTBXPanel.SetThemeBack(t: boolean);
begin
 FThemeBack := t;
 Invalidate;
end;

procedure TppTBXPanel.SetThemed(Value: boolean);
begin
 FThemed := Value;
 Invalidate;
end;

procedure TppTBXPanel.SetButtonStyle(Value: boolean);
begin
 FButtonStyle := Value;
 Invalidate;
end;

procedure TppTBXPanel.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
 if not FThemeBack then
  begin
   inherited;
   Exit;
  end;

 Message.Result := 1;
 EraseTBXBackground(Message.DC, ClientRect);
end;

procedure TppTBXPanel.EraseTBXBackground(DC: HDC; ARect: TRect);
var
  ACanvas: TCanvas;
  B: TBitmap;
  R: TRect;
begin
  if (csDestroying in ComponentState) then Exit;

  R := Rect(0, 0, ARect.Right - ARect.Left, ARect.Bottom - ARect.Top);
  B := TBitmap.Create;
  ACanvas := TCanvas.Create;
  try
    ACanvas.Handle := DC;
    B.PixelFormat := pf32bit;
    B.Width := R.Right;
    B.Height := R.Bottom;

    PaintPanel(R, B.Canvas, Self);

    ACanvas.Draw(ARect.Left, ARect.Top, B);
  finally
    B.Free;
    ACanvas.Handle := 0;
    ACanvas.Free;
  end;
end;

{------------------------------------------------------------------------------}
{ TppAlignmentPanel.Create }

constructor TppAlignmentPanel.Create(aOwner: TComponent);
begin

  inherited;

  SetThemed(True);
  
  AddThemeNotification(Self);

end;

{------------------------------------------------------------------------------}
{ TppAlignmentPanel.Destroy }

destructor TppAlignmentPanel.Destroy;
begin

  RemoveThemeNotification(Self);

  inherited;
  
end;

{------------------------------------------------------------------------------}
{ TppAlignmentPanel.GetThemeColor }

function TppAlignmentPanel.GetThemeColor: TColor;
begin
  Result := CurrentTheme.GetViewColor(VT_TOOLBAR);
//  Result := CurrentTheme.GetViewColor(TVT_MENUBAR);
 // Result := clWindow;
end;

{------------------------------------------------------------------------------}
{ TppAlignmentPanel.SetThemed }

procedure TppAlignmentPanel.SetThemed(const Value: Boolean);
begin

  FThemed := Value;

  if (FThemed) then
    Color := GetThemeColor;

end;

{------------------------------------------------------------------------------}
{ TppAlignmentPanel.TBMThemeChange }

procedure TppAlignmentPanel.TBMThemeChange(var Message: TMessage);
begin

  if (Message.WParam = TSC_VIEWCHANGE) and FThemed then
    begin
      Color := GetThemeColor;
      Invalidate;
    end;


end;

end.

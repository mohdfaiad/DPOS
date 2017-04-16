{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                    BBBBB   }
                                                 
unit ppDesignControlsEx;

interface

{$I ppIfDef.pas}


uses
  Graphics,
  Classes,
  Types,

  ppClass,
  ppDesignControls,
  ppTypes,
  ppPrnDev,
  ppPrintr,
  ppUtils;

type

  {@RBuilder.Vcl.DesignControlsEx.TppPrintableControl}
  TppPrintableControl = class(TppDesignControl)
    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppCustomComponentControl}
  TppCustomComponentControl = class(TppPrintableControl)
    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;

  end;


  {@RBuilder.Vcl.DesignControlsEx.TppCustomImageControl}
  TppCustomImageControl = class(TppCustomComponentControl)
    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppShapeControl}
  TppShapeControl = class(TppCustomComponentControl)
    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppLineControl}
  TppLineControl = class(TppCustomComponentControl)
    protected
      function CanOptimizeDesignPainting: Boolean; override;
      procedure PaintDesignControl(aCanvas: TCanvas); override;
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppImageControl}
  TppImageControl = class(TppCustomImageControl)
    public
      constructor Create(AOwner: TComponent); override;
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppDBImageControl}
  TppDBImageControl = class(TppCustomImageControl)
    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppCustomMemoControl}
  TppCustomMemoControl = class(TppPrintableControl)
    private
      function FitLinesToHeight(aLines: TStrings; aLineHeight: Integer; aHeight: Integer): Integer;
      function RetrieveMMRectangle: TppRect;

    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;

  end;

  {@RBuilder.Vcl.DesignControlsEx.TppCustomTextControl}
  TppCustomTextControl = class(TppCustomComponentControl)
    private
      procedure DrawRotatedText(aCanvas: TCanvas);

    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;

      function CanOptimizeDesignPainting: Boolean; override;
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppLabelControl}
  TppLabelControl = class(TppCustomTextControl)
  end;


  {TppDBTextControl}
  TppDBTextControl = class(TppCustomTextControl)
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppVariableControl}
  TppVariableControl = class(TppCustomTextControl)
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppSystemVariableControl}
  TppSystemVariableControl = class(TppCustomTextControl)
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppDBCalcControl}
  TppDBCalcControl = class(TppCustomTextControl)
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppMemoControl}
  TppMemoControl = class(TppCustomMemoControl)
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppDBMemoControl}
  TppDBMemoControl = class(TppCustomMemoControl)
  end;

  {@RBuilder.Vcl.DesignControlsEx.TppPageBreakControl}
  TppPageBreakControl = class(TppDesignControl)
    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;
      procedure SetComponent(aComponent: TppComponent); override;

    public
      constructor Create(AOwner: TComponent); override;

    end;


  {@RBuilder.Vcl.DesignControlsEx.TppCustomRegionControl}
  TppCustomRegionControl = class(TppPrintableControl)
    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;

  end;


  {@RBuilder.Vcl.DesignControlsEx.TppRegionControl}
  TppRegionControl = class(TppCustomRegionControl)
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppCustomRichTextControl}
  TppCustomRichTextControl = class(TppPrintableControl)
    private
      FMetaFile: TMetaFile;
      FSaveWidth: Integer;
      FSaveHeight: Integer;

      procedure DrawToMetaFile;
      procedure SetMetaFileSize(aWidth, aHeight: Integer; aPrinter: TppPrinter);
      
    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppRichTextControl}
  TppRichTextControl = class(TppCustomRichTextControl)
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppDBRichTextControl}
  TppDBRichTextControl = class(TppCustomRichTextControl)
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppSubreportControl}
  TppSubreportControl = class(TppCustomComponentControl)
  end;

  {TppCustomBarCodeControl}
  TppCustomBarCodeControl = class(TppCustomComponentControl)
    private
      procedure DrawBarCode(aCanvas: TCanvas);

    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;
  end;


  {@RBuilder.Vcl.DesignControlsEx.TppBarCodeControl}
  TppBarCodeControl = class(TppCustomBarCodeControl)
    protected
      function CanOptimizeDesignPainting: Boolean; override;

  end;


  {@RBuilder.Vcl.DesignControlsEx.TppDBBarCodeControl}
  TppDBBarCodeControl = class(TppCustomBarCodeControl)
  end;


implementation

uses
  Windows,
  Forms,
  ComCtrls,
  ExtCtrls,
  RichEdit,
  SysUtils,

  ppBarCod,
  ppBarCodDrwCmd,
  ppCtrls,
  ppRTTI,
  ppMemo,
  ppPlainText,
  ppPrnabl,
  ppRegion,
  ppSubRpt,
  ppDrwCmd,
  ppRichTx,
  ppRichTxDrwCmd,
  ppRotatedText,
  ppVar,
  ppViewr;


{******************************************************************************
 *
 ** P R I N T A B L E  D E S I G N  C O N T R O L
 *
{******************************************************************************}

{@RBuilder.Vcl.DesignControlsEx.TppPrintableControl.PaintDesignControl

 Called each time the DesignControl for the component needs to be painted.  This
 method is overriden by the descendant so that the appropriate visual
 representation of the component can be made in the Report Designer.}

procedure TppPrintableControl.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  lbTransparent: Boolean;
  lsCaption : String;
  lFont: TFont;
  lAlignment: TAlignment;
  lTextAlignment: TppTextAlignment;
  lBorder: TppBorder;
begin

  lBorder := nil; //Initialize component reference.

  GetPropValue('Alignment', lAlignment);
  GetPropValue('Transparent', lbTransparent);
  GetPropValue('Caption', lsCaption);
  GetPropValue('Font', lFont);
  GetPropValue('Border', lBorder);

  lClientRect := ClientRect;

  {draw the background}
  if not(lbTransparent) then
    PaintBackground(aCanvas, lClientRect, lBorder, GetColor);

  aCanvas.Font := lFont;

  lTextAlignment := AlignmentToTextAlignment(lAlignment);

  if (lBorder <> nil) and (lBorder.Visible) then
      lClientRect := AdjustObject(lBorder, lClientRect, lTextAlignment);

  {draw the caption}
  aCanvas.TextRect(lClientRect, lClientRect.Left, lClientRect.Top, lsCaption);

  {draw a framerect}
  PaintFrame(aCanvas);

end;


{******************************************************************************
 *
 ** C U S T O M  C O M P O N E N T  D E S I G N  C O N T R O L
 *
{******************************************************************************}

procedure TppCustomComponentControl.PaintDesignControl(aCanvas: TCanvas);
  const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
  WordWraps:  array[Boolean] of Word = (0, DT_WORDBREAK);

 var
  lClientRect : TRect;
  lFlags: Word;
  lCanvas: TCanvas;
  lbTransparent: Boolean;
  lAlignment: TAlignment;
  lTextAlignment: TppTextAlignment;
  lBorder: TppBorder;
  lbWordWrap: Boolean;
  lsCaption: String;
  lFont: TFont;
begin

  if not (pppcDesigning in Component.DesignState) or (Component.Printing) then Exit;

  if IsValidPropName('Transparent') then
    GetPropValue('Transparent', lbTransparent)
  else
    lbTransparent := False;

  lBorder := nil; // initialize object reference

  GetPropValue('Alignment', lAlignment);
  GetPropValue('WordWrap', lbWordWrap);
  GetPropValue('Caption', lsCaption);
  GetPropValue('Font', lFont);
  GetPropValue('Border', lBorder);

  lCanvas := aCanvas;
  lClientRect := ClientRect;

  {draw background}
  if not lbTransparent then
    PaintBackground(lCanvas, lClientRect, lBorder, GetColor);

  lCanvas.Brush.Style := bsClear;
  lCanvas.Font := lFont;

  lTextAlignment := AlignmentToTextAlignment(lAlignment);

  if (lBorder <> nil) and (lBorder.Visible) then
    lClientRect := AdjustObject(lBorder, lClientRect, lTextAlignment);

  {draw text}
  lFlags := DT_EXPANDTABS or Alignments[lAlignment] or WordWraps[lbWordWrap] or DT_NOPREFIX or DT_TOP or DT_EXTERNALLEADING;

  if (lsCaption <> '') then
    DrawText(lCanvas.Handle, PChar(lsCaption), Length(lsCaption), lClientRect, lFlags);

  {draw a framerect}
  PaintFrame(aCanvas);

end;


{******************************************************************************
 *
 ** C U S T O M  I M A G E  D E S I G N  C O N T R O L
 *
{******************************************************************************}

procedure TppCustomImageControl.PaintDesignControl(aCanvas: TCanvas);
var
  lRect: TRect;
  lPicture: TPicture;
  lsCaption: String;
  lbCenter: Boolean;
  lbTransparent: Boolean;
  lbStretch: Boolean;
  lbMaintainAspectRatio: Boolean;
  lBorder: TppBorder;
  liX: Integer;
  liY: Integer;
  liHeight: Integer;
  liWidth: Integer;
  lWorkspace: Graphics.TBitMap;
  lCopyMode: TCopyMode;
  lClientRect: TRect;
  lfScale: Single;
  liScaledWidth: Integer;
  liScaledHeight: Integer;
begin

  lBorder := nil; //Initialize component reference.

  GetPropValue('Picture', lPicture);
  GetPropValue('Caption', lsCaption);
  GetPropValue('Center', lbCenter);
  GetPropValue('Transparent', lbTransparent);
  GetPropValue('Stretch', lbStretch);
  GetPropValue('MaintainAspectRatio', lbMaintainAspectRatio);
  GetPropValue('Border', lBorder);

  lClientRect := ClientRect;

  if (lPicture.Graphic = nil) or (lPicture.Graphic.Empty) then
    begin

      {draw the background}
      if not lbTransparent then
        PaintBackground(aCanvas, lClientRect, lBorder, GetColor);

      {draw frame rect}
      if FrameStyle = fsDashed then
        aCanvas.Pen.Style := psDash
      else
        aCanvas.Pen.Style := psDot;

      aCanvas.Pen.Color   := clDkGray;
      aCanvas.Brush.Style := bsClear;
      aCanvas.Rectangle(0, 0, Width, Height);

      {center caption within frame}
      aCanvas.Font := Component.Font;
      lsCaption := '(' + lsCaption + ')';
      liWidth  := aCanvas.TextWidth(lsCaption);
      liHeight := aCanvas.TextHeight(lsCaption);
      liX      := (ClientRect.Right - liWidth) div 2;
      liY      := (ClientRect.Bottom - liHeight) div 2;
      aCanvas.TextRect(ClientRect, liX, liY, lsCaption);

    end
  else

    begin

      {create workspace}
      lWorkSpace := Graphics.TBitMap.Create;
      lWorkSpace.Width  := Width;
      lWorkSpace.Height := Height;

      {draw image}

      if lbStretch and lbMaintainAspectRatio then
        begin
          lRect := ClientRect;

          lfScale := ppCalcAspectRatio(lPicture.Width, lPicture.Height, Width, Height);

          { Calc scaled width and scaled height }
          liScaledWidth  := Trunc(lPicture.Width  * lfScale);
          liScaledHeight := Trunc(lPicture.Height * lfScale);

          if lbCenter then
            begin
              lRect.Left := lRect.Left + ((Width  - liScaledWidth)  div 2);
              lRect.Top  := lRect.Top  + ((Height - liScaledHeight) div 2);
            end;

          lRect.Right   := lRect.Left   + liScaledWidth;
          lRect.Bottom  := lRect.Top    + liScaledHeight;

        end
      else if lbStretch then
        lRect := ClientRect
      else if lbCenter then
        lRect := Bounds((Width - lPicture.Width) div 2, (Height - lPicture.Height) div 2,
                lPicture.Width, lPicture.Height)
      else
        lRect := Rect(0, 0, lPicture.Width, lPicture.Height);


      if lbTransparent then
        lCopyMode := cmSrcAnd

      else
        begin
          {repaint background}
          lWorkSpace.Canvas.Brush.Color := TPanel(Parent).Color;
          lWorkSpace.Canvas.FillRect(ClientRect);

          lCopyMode := cmSrcCopy;

        end;

      {draw the graphic}
      lWorkSpace.Canvas.StretchDraw(lRect, lPicture.Graphic);

      aCanvas.CopyMode := lCopyMode;

      aCanvas.CopyRect(ClientRect, lWorkSpace.Canvas, ClientRect);

      lWorkSpace.Free;
  end;

  if (lBorder <> nil) and (lBorder.Visible) then
    PaintBorder(aCanvas, lBorder);

end;


{******************************************************************************
 *
 ** S H A P E  D E S I G N  C O N T R O L
 *
{******************************************************************************}

procedure TppShapeControl.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  llXCornerRound: Longint;
  llYCornerRound: Longint;
  llLeft: Longint;
  llTop: Longint;
  llRight: Longint;
  llBottom: Longint;
  lBrush: TBrush;
  lPen: TPen;
  lShapeType: TShapeType;
begin

  GetPropValue('Pen', lPen);
  GetPropValue('Brush', lBrush);
  GetPropValue('Shape', lShapeType);

  lClientRect := ClientRect;

  {assign pen and brush}
  aCanvas.Pen   := lPen;
  aCanvas.Brush := lBrush;

  TppShape(Component).CalcDimensions(llLeft, llTop, llRight, llBottom, llXCornerRound, llYCornerRound); 

  {draw shape}
  case lShapeType of

    stRectangle, stSquare:
      aCanvas.Rectangle(llLeft, llTop, llRight, llBottom);

    stCircle, stEllipse:
      aCanvas.Ellipse(llLeft, llTop, llRight, llBottom);

    stRoundRect, stRoundSquare:
      aCanvas.RoundRect(llLeft, llTop, llRight, llBottom, llXCornerRound, llYCornerRound);

  end; {case, ShapeType}

end;


{******************************************************************************
 *
 ** L I N E  D E S I G N  C O N T R O L
 *
{******************************************************************************}

function TppLineControl.CanOptimizeDesignPainting: Boolean;
var
  lPen: TPen;
begin

  GetPropValue('Pen', lPen);

  {when pen color is white, cannot optimize design control painting}
  Result := (lPen.Color <> clWhite);

end;

procedure TppLineControl.PaintDesignControl(aCanvas: TCanvas);
var
  liLine: Integer;
  liLines: Integer;
  liOffset: Integer;
  liSize: Integer;
  liPosition: Integer;
  liPenWidth: Integer;
  liWidth: Integer;
  liHeight: Integer;
  lWeight: Single;
  lPosition: TppLinePositionType;
  lStyle: TppLineStyleType;
  lPen: TPen;
begin

  GetPropValue('Weight', lWeight);
  GetPropValue('Position', lPosition);
  GetPropValue('Style', lStyle);
  GetPropValue('Pen', lPen);

  liPenWidth := Round(lWeight * Screen.PixelsPerInch / 72);

  {get pen width}
  if (liPenWidth = 0) then
    liSize := 1
  else
    liSize := liPenWidth;

  liHeight := Height;
  liWidth  := Width;

  {when draiwing bottom line, decrease the height by one pixel, otherwise
   the line is drawn outside the bounds of the control}
  if lPosition = TppLinePositionType(lpBottom) then
    Dec(liHeight);

  {when draiwing right line, decrease the width by one pixel, otherwise
  the line is drawn outside the bounds of the control}
  if lPosition = TppLinePositionType(lpRight) then
    Dec(liWidth);

  {how many lines to draw?}
  if lStyle = lsSingle then
    liLines := 1
  else
    liLines := 2;

  {setting brush to cross causes LineTo to honor the penstyle}
  aCanvas.Brush.Style := bsCross;

  {set pen width to 1 for drawing - need to honor the penstyle}
  aCanvas.Pen := lPen;
  aCanvas.Pen.Width := 1;

  for liLine := 1 to liLines do

    begin

      if (liLine = 1) then
        liOffset := 0
      else
        liOffset := liSize * 2;

      for liPosition := 0 to liSize - 1 do

      {set print object moveto/lineto positions}
      case lPosition of
        lpTop:
          begin
            aCanvas.MoveTo(0, 0 + liOffset + liPosition);
            aCanvas.LineTo(liWidth, 0 + liOffset + liPosition);
          end;

        lpBottom:
          begin
            aCanvas.MoveTo(0, liHeight - liOffset - liPosition);
            aCanvas.LineTo(liWidth, liHeight - liOffset - liPosition);
          end;

        TppLinePositionType(lpLeft):
          begin
            aCanvas.MoveTo(0 + liOffset + liPosition, 0);
            aCanvas.LineTo(0 + liOffset + liPosition, liHeight);
          end;

        TppLinePositionType(lpRight):
          begin
            aCanvas.MoveTo(liWidth - liOffset - liPosition, 0);
            aCanvas.LineTo(liWidth - liOffset - liPosition, liHeight);
          end;

      end; {case, line style}

   end; {for, each line}

end;


{******************************************************************************
 *
 ** D B I M A G E  D E S I G N  C O N T R O L
 *
{******************************************************************************}

procedure TppDBImageControl.PaintDesignControl(aCanvas: TCanvas);
begin
  TraRTTI.CallMethod(Component, 'LoadPicture', nil, True);

  inherited;

end;


{******************************************************************************
 *
 ** C U S T O M  M E M O  D E S I G N  C O N T R O L
 *
{******************************************************************************}

procedure TppCustomMemoControl.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  lRect: TRect;
  lsLine: String;
  liLine: Integer;
  liLines: Integer;
  liLineSpaceUsed: Integer;
  liLineHeight: Integer;
  liLeading: Integer;
  lTextMetric: TTextMetric;
  liTabStopCount : Integer;
  lTabStopArray : TppTabStopPos;
  liLeft: Integer;
  liTop: Integer;
  lDrawLines: TStrings;
  lBorder: TppBorder;
  liMmWidth: Integer;
  lmmRect: TppRect;
  liTextWidth: Integer;
  liRowOffset: Integer;
  liCharPos: Integer;
  lbFullJustification: Boolean;
  lbTransparent: Boolean;
  lFont: TFont;
  lMemoStream: TMemoryStream;
  lsCaption: String;
  lLines: TStrings;
  lTextAlignment: TppTextAlignment;
  lbCharWrap: Boolean;
  lLeading: Integer;
  lTabStopPositions: TStrings;
  lbForceJustifyLastLine: Boolean;
begin

  lBorder := nil; //Initialize component reference.

  GetPropValue('Transparent', lbTransparent);
  GetPropValue('Font', lFont);
  GetPropValue('MemoStream', lMemoStream);
  GetPropValue('Caption', lsCaption);
  GetPropValue('Lines', lLines);
  GetPropValue('TextAlignment', lTextAlignment);
  GetPropValue('CharWrap', lbCharWrap);
  GetPropValue('mmLeading', lLeading);
  GetPropValue('TabStopPositions', lTabStopPositions);
  GetPropValue('mmWidth', liMmWidth);
  GetPropValue('ForceJustifyLastLine', lbForceJustifyLastLine);
  GetPropValue('Border', lBorder);

  lClientRect := ClientRect;
  
  lDrawLines := TStringList.Create;

  {fill rectangle with background color, do this after calcrect has been calculated}
  if not(lbTransparent) then
    PaintBackground(aCanvas, lClientRect, lBorder, GetColor);

  aCanvas.Brush.Style := bsClear;
  aCanvas.Font := lFont;

  {get text metrics}
  GetTextMetrics(aCanvas.Handle, lTextMetric);

  {Adjust client rectangle for borders}
  if (lBorder <> nil) and (lBorder.Visible) then
    lClientRect := AdjustObject(lBorder, lClientRect, lTextAlignment);


  {draw text}
  if (lMemoStream.Size = 0) then
    aCanvas.TextRect(lClientRect, lClientRect.Left, lClientRect.Top, lsCaption)

  else
    begin
      lmmRect := RetrieveMMRectangle;

      liCharPos := 0;

      TppPlainText.WordWrap(lLines.Text, lmmRect, lTextAlignment, False, lFont, lbCharWrap, lLeading, lTabStopPositions, Component.Report.Printer, liCharPos, lDrawLines);

      liTabStopCount := lTabStopPositions.Count;

      {convert memo tab stop positions to screen units, if needed }
      if (lTabStopPositions.Count > 0) then
        TppPlainText.ConvertTabStopPos(utScreenPixels, lTabStopPositions, lTabStopArray, liTabStopCount, nil);

      {use default leading for this font}
      liLeading := Trunc(ppToMMThousandths(lLeading, utScreenPixels, pprtVertical, nil));

      liLineHeight := lTextMetric.tmHeight + liLeading;

      liRowOffset := FitLinesToHeight(lDrawLines, liLineHeight, Height);

      liLineSpaceUsed := 0;
      liLines := lDrawLines.Count - 1;
      lbFullJustification := False;

      for liLine := 0 to liLines do
        begin
          lsLine := lDrawLines[liLine];

          {reset rectangle to original value}
          lRect := lClientRect;

          lRect.Top := lRect.Top + liLineSpaceUsed;

          {justify text}
          if (lTextAlignment = taFullJustified) then
            begin
              liLeft := lRect.Left;

              if lbForceJustifyLastLine or (Pos(TppTextMarkups.EOP, lsLine) = 0) then
                begin
                  if (Pos(TppTextMarkups.EOP, lsLine) <> 0) and (Pos(TppTextMarkups.Space, Trim(lsLine)) = 0) then
                    begin
                      lbFullJustification := False;
                      SetTextJustification(aCanvas.Handle, 0, 0);
                      lsLine := TppPlainText.StringStrip(lsLine, TppTextMarkups.EOP);
                    end
                  else
                    begin
                      lbFullJustification := True;
                      TppPlainText.SetCanvasToJustify(aCanvas, lRect, lsLine, liTabStopCount, lTabStopArray);
                      lsLine := TppPlainText.StringStrip(lsLine, TppTextMarkups.EOP);
                    end;
                end

              else
                begin
                  lbFullJustification := False;
                  SetTextJustification(aCanvas.Handle, 0, 0);
                  lsLine := TppPlainText.StringStrip(lsLine, TppTextMarkups.EOP);
                end;
            end

         else
           begin
              liTextWidth := TppPlainText.GetTabbedTextWidth(aCanvas, lsLine, liTabStopCount, lTabStopArray);

              if lTextAlignment = taLeftJustified then
                liLeft := lRect.Left

              else if lTextAlignment = taRightJustified then
                liLeft := lRect.Right - liTextWidth

              else if lTextAlignment = taCentered then
                liLeft := lRect.Left + Round((Width - liTextWidth) / 2)

              else
                liLeft := 0;
           end;

          liTop := lRect.Top;

          liTextWidth := TppPlainText.GetTabbedTextWidth(aCanvas, lsLine, liTabStopCount, lTabStopArray);

          if (liTextWidth <= liMmWidth) then
            TabbedTextOut(aCanvas.Handle, liLeft, liTop, PChar(lsLine), Length(lsLine), liTabStopCount, lTabStopArray, liLeft)
          else
            aCanvas.TextRect(lRect, liLeft, liTop, lsLine);

          {goto next line}
          Inc(liLineSpaceUsed, liLineHeight - liRowOffset);

        end; {for, each line of text}

      {must clear full justification mode or GetTabbedTextWidth will fail next time.}
      if (lbFullJustification) then
        SetTextJustification(aCanvas.Handle, 0, 0);
    end;

  lDrawLines.Free;


  {draw a framerect}
  PaintFrame(aCanvas);

end;

function TppCustomMemoControl.RetrieveMMRectangle: TppRect;
var
  liMmWidth: Integer;
  liMmHeight: Integer;
begin

  GetPropValue('mmWidth', liMmWidth);
  GetPropValue('mmHeight', liMmHeight);

  Result := ppRect(0, 0, liMmWidth, liMmHeight);

end;

function TppCustomMemoControl.FitLinesToHeight(aLines: TStrings; aLineHeight: Integer; aHeight: Integer): Integer;
var
  liMaxLines: Integer;
begin

  liMaxLines := Trunc(aHeight/aLineHeight);

  if (aLines.Count > liMaxLines) then
    Result := Round(((aLines.Count * aLineHeight) - aHeight) / aLines.Count)
  else
    Result := 0;

end; {procedure, FitLinesToHeight}


{******************************************************************************
 *
 ** C U S T O M  R E G I O N  D E S I G N  C O N T R O L
 *
{******************************************************************************}

procedure TppCustomRegionControl.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  liCount: Integer;
  lPen: TPen;
  lBrush: TBrush;
  lsCaption: String;
begin

  GetPropValue('Pen', lPen);
  GetPropValue('Brush', lBrush);
  GetPropValue('Caption', lsCaption);

  lClientRect := ClientRect;

  {assign pen and brush}
  aCanvas.Pen   := lPen;
  aCanvas.Brush := lBrush;

  aCanvas.Rectangle(lClientRect.Left, lClientRect.Top, lClientRect.Right, lClientRect.Bottom);

  aCanvas.Pen.Style := psSolid;

  for liCount := 0 to 1 do
    begin
      InflateRect(lClientRect, -1, -1);

      aCanvas.Pen.Color := clGray;
      aCanvas.MoveTo(lClientRect.Left, lClientRect.Bottom-2);
      aCanvas.LineTo(lClientRect.Left, lClientRect.Top);
      aCanvas.LineTo(lClientRect.Right-1, lClientRect.Top);

      aCanvas.Pen.Color := clSilver;
      aCanvas.LineTo(lClientRect.Right-1, lClientRect.Bottom-1);
      aCanvas.LineTo(lClientRect.Left-1, lClientRect.Bottom-1);

    end;

  {draw the caption}
  InflateRect(lClientRect, -1, -1);
  aCanvas.TextRect(lClientRect, lClientRect.Left, lClientRect.Top, lsCaption);

end;


{******************************************************************************
 *
 ** C U S T O M  R I C H T E X T  D E S I G N  C O N T R O L
 *
{******************************************************************************}

constructor TppCustomRichTextControl.Create(aOwner: TComponent);
begin
  inherited;

  FMetaFile := TMetaFile.Create;

end;

destructor TppCustomRichTextControl.Destroy;
begin
  FMetaFile.Free;

  inherited;
end;

procedure TppCustomRichTextControl.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  lbTransparent: Boolean;
  lsRichText: String;
  lsCaption: String;
  lBorder: TppBorder;
begin

  inherited;

  lBorder := nil; //Initialize component reference.

  GetPropValue('Transparent', lbTransparent);
  GetPropValue('RichText', lsRichText);
  GetPropValue('Caption', lsCaption);
  GetPropValue('Border', lBorder);

  lClientRect := ClientRect;

  if lbTransparent then
    aCanvas.CopyMode := cmSrcAnd
  else
    aCanvas.CopyMode := cmSrcCopy;

  if lsRichText <> '' then
    begin
      DrawToMetafile;

      {draw the metafile to the screen canvas}
      aCanvas.StretchDraw(Rect(lClientRect.Left, lClientRect.Top, lClientRect.Right, lClientRect.Bottom), FMetaFile);
    end
  else
    begin
      if not lbTransparent then
        PaintBackground(aCanvas, lClientRect, lBorder, GetColor);

      if (lBorder <> nil) and (lBorder.Visible) then
        lClientRect := AdjustObject(lBorder, lClientRect, taLeftJustified);

      {draw caption}
      aCanvas.Brush.Style := bsClear;
      aCanvas.TextRect(lClientRect, lClientRect.Left, lClientRect.Top, lsCaption);
    end;

  {draw a framerect}
  PaintFrame(aCanvas);

end;

procedure TppCustomRichTextControl.DrawToMetaFile;
var
  lCharRange: TCharRange;
  lMetaFileCanvas: TMetaFileCanvas;
  liControlWidth, liControlHeight: Integer;
  lCanvasRect: TRect;
  lPrinter: TppPrinter;
  lDC: HDC;
  liMmWidth: Integer;
  liMmHeight: Integer;
  lbTransparent: Boolean;
  lRichEdit: TCustomRichEdit;
  lRichTextStream: TMemoryStream;
  lBorder: TppBorder;
  liXBorderOffset: Integer;
  liYBorderOffset: Integer;
begin

  if not (pppcDesigning in Component.DesignState) or (Component.Printing) then Exit;

  if (csReading in Component.ComponentState) or (csLoading in Component.ComponentState) then Exit;

  lBorder := nil; //Initialize component reference.

  GetPropValue('mmWidth', liMmWidth);
  GetPropValue('mmHeight', liMmHeight);
  GetPropValue('Transparent', lbTransparent);
  GetPropValue('RichTextStream', lRichTextStream);
  GetPropValue('Border', lBorder);

  lRichEdit := ppCreateRichEdit(nil);
  ppGetRichEditLines(lRichEdit).LoadFromStream(lRichTextStream);

  lCharRange.cpMin := 0;
  lCharRange.cpMax := -1;

  lPrinter := Component.Report.Printer;

  liControlWidth  := Trunc(ppFromMMThousandths(liMmWidth,  utPrinterPixels, pprtHorizontal, lPrinter));
  liControlHeight := Trunc(ppFromMMThousandths(liMmHeight, utPrinterPixels, pprtVertical, lPrinter));

  lCanvasRect := Rect(0, 0, liControlWidth, liControlHeight);

  if (lPrinter <> nil) and (lPrinter.DC <> 0) then
    lDC := lPrinter.DC
  else
    lDC := GetDC(0);

  SetMetaFileSize(liMmWidth, liMmHeight, lPrinter);

  lMetaFileCanvas := TMetaFileCanvas.Create(FMetaFile, lDC);

  if not lbTransparent then
    begin
      {draw background color}
      lMetaFileCanvas.Brush.Style := bsSolid;
      lMetaFileCanvas.Brush.Color := Color;
      lMetaFileCanvas.FillRect(lCanvasRect);
    end;

    if (lBorder <> nil) and (lBorder.Visible) then
      begin
        liXBorderOffset := Round(lBorder.Weight * lPrinter.PixelsPerInch.X / 72);
        liYBorderOffset := Round(lBorder.Weight * lPrinter.PixelsPerInch.Y / 72);

        if (bpTop in lBorder.BorderPositions) then
          lCanvasRect.Top := lCanvasRect.Top + liYBorderOffset;

        if (bpLeft in lBorder.BorderPositions) then
          lCanvasRect.Left := lCanvasRect.Left + liXBorderOffset;

        if (bpRight in lBorder.BorderPositions) then
          lCanvasRect.Right := lCanvasRect.Right - liXBorderOffset;

        if (bpBottom in lBorder.BorderPositions) then
          lCanvasRect.Bottom := lCanvasRect.Bottom - liYBorderOffset;
      end;

  {draw the RichText to the metafile}
  TppRTFEngine.DrawRichText(lRichEdit, lMetaFileCanvas.Handle, lDC, lCanvasRect, lCharRange);

  lMetaFileCanvas.Free;
  lRichEdit.Free;

  if (lPrinter = nil) or (lPrinter.DC = 0) then
    ReleaseDC(0,lDC);

end;

procedure TppCustomRichTextControl.SetMetaFileSize(aWidth, aHeight: Integer; aPrinter: TppPrinter);
begin
  if (FMetaFile <> nil) and (FSaveHeight <> aHeight) or (FSaveWidth <> aWidth) then
    begin
      FSaveWidth  := aWidth;
      FSaveHeight := aHeight;

      FMetaFile.Width  := Trunc(ppFromMMThousandths(aWidth,  utPrinterPixels, pprtHorizontal, aPrinter));
      FMetaFile.Height := Trunc(ppFromMMThousandths(aHeight, utPrinterPixels, pprtVertical, aPrinter));

    end;

end;


{******************************************************************************
 *
 ** C U S T O M  B A R C O D E  D E S I G N  C O N T R O L
 *
{******************************************************************************}

procedure TppCustomBarCodeControl.DrawBarCode(aCanvas: TCanvas);
var
  lPixelsPerInch: TPoint;
  lClientRect: TRect;
  lPrinter: TppPrinter;
  liWidth: Integer;
  liHeight: Integer;
  lOrientation: TppBarCodeOrientation;
  lBarCodeImage: Graphics.TBitmap;
  lDrawCommand: TppDrawBarCode;
  lBorder: TppBorder;
begin

  lBorder := nil; //Initialize component reference.

  GetPropValue('spWidth', liWidth);
  GetPropValue('spHeight', liHeight);
  GetPropValue('Orientation', lOrientation);
  GetPropValue('Border', lBorder);

  lClientRect.TopLeft := Point(0,0);

  lPrinter := Component.Report.Printer;

  lDrawCommand := TppDrawBarCode.Create(nil);
  lBarCodeImage := Graphics.TBitmap.Create;

  TppCustomBarCode(Component).CalcSize(TppPrinterDevice, lDrawCommand);

  try
    {adjust size}
    if lOrientation in [orLeftToRight, orRightToLeft] then
      begin
        lClientRect.Right := ppToScreenPixels(lDrawCommand.PortraitWidth, utPrinterPixels, pprtHorizontal, lPrinter);
        lClientRect.Bottom := liHeight;
      end
    else
      begin
        lClientRect.Right := liWidth;

        lClientRect.Bottom := ppToScreenPixels(lDrawCommand.PortraitWidth, utPrinterPixels, pprtVertical, lPrinter);
      end;

    if (lBorder <> nil) and (lBorder.Visible) then
      lClientRect := AdjustObject(lBorder, lClientRect, taLeftJustified);

    {calc size of a screen based barcode}
    TppCustomBarCode(Component).CalcSize(TppScreenDevice, lDrawCommand);


    {size the offscreen bitmap}
    if lOrientation in [orLeftToRight, orRightToLeft] then
      begin
        lBarCodeImage.Width  := lDrawCommand.PortraitWidth;
        lBarCodeImage.Height := lDrawCommand.PortraitHeight;
      end
    else
      begin
        lBarCodeImage.Width  := lDrawCommand.PortraitHeight;
        lBarCodeImage.Height := lDrawCommand.PortraitWidth;
      end;

    {stretchdraw the offscreen image to the design canvas}
    lPixelsPerInch := Point(Screen.PixelsPerInch, Screen.PixelsPerInch);

    PatBlt(lBarCodeImage.Canvas.Handle, 0, 0, lBarCodeImage.Width, lBarCodeImage.Height, WHITENESS);
    lDrawCommand.DrawBarcode(lBarCodeImage.Canvas, 0, 0, lPixelsPerInch, True);

    aCanvas.StretchDraw(lClientRect, lBarCodeImage);

  finally
    lDrawCommand.Free;
    lBarCodeImage.Free;
  end;

end;

procedure TppCustomBarCodeControl.PaintDesignControl(aCanvas: TCanvas);
var
  lHeight: Integer;
  lWidth: Integer;
  lBorder: TppBorder;
begin

  if TppCustomBarCode(Component).IsUpdating > 0 then Exit;

  lBorder := nil; //Initialize component reference.

  GetPropValue('spWidth', lWidth);
  GetPropValue('spHeight', lHeight);
  GetPropValue('Border', lBorder);

  DrawBarCode(aCanvas);

  if (pppcDesigning in Component.DesignState) and not TppCustomBarCode(Component).CodeOk  then
    begin
      aCanvas.Pen.Style   := psDash;
      aCanvas.Brush.Style := bsClear;
      aCanvas.Rectangle(0, 0, lWidth, lHeight);
    end;

  if (lBorder <> nil) and (lBorder.Visible) then
    PaintBorder(aCanvas, lBorder);

end;

{ TppBarCodeControl }

function TppBarCodeControl.CanOptimizeDesignPainting: Boolean;
var
  lbTransparent: Boolean;
  lFont: TFont;
begin

  GetPropValue('Transparent', lbTransparent);
  GetPropValue('Font', lFont);

  {when transparent and font color is white, cannot optimize design control painting}
  Result := not (lbTransparent and (lFont.Color = clWhite));

end;

{ TppCustomTextControl }

procedure TppCustomTextControl.PaintDesignControl(aCanvas: TCanvas);
var
  liAngle: Integer;
begin

  GetPropValue('Angle', liAngle);

  if liAngle = 0 then
    inherited
  else
    DrawRotatedText(aCanvas);

end;

function TppCustomTextControl.CanOptimizeDesignPainting: Boolean;
var
  lbTransparent: Boolean;
  lFont: TFont;
begin

  GetPropValue('Transparent', lbTransparent);
  GetPropValue('Font', lFont);

  {when transparent and font color is white, cannot optimize design control painting}
  Result := not(lbTransparent and (lFont.Color = clWhite));

end;

procedure TppCustomTextControl.DrawRotatedText(aCanvas: TCanvas);
var
  lClientRect: TRect;
  lbTransparent: Boolean;
  lFont: TFont;
  lOrigin: TPoint;
  lsText: String;
  liAngle: Integer;
  lBorder: TppBorder;
begin

  lBorder := nil;
  
  GetPropValue('Transparent', lbTransparent);
  GetPropValue('RotatedOriginLeft', lOrigin.X);
  GetPropValue('RotatedOriginTop', lOrigin.Y);
  GetPropValue('Font', lFont);
  GetPropValue('Text', lsText);
  GetPropValue('Angle', liAngle);
  GetPropValue('Border', lBorder);

  lOrigin.X := Trunc(ppFromMMThousandths(lOrigin.X, utScreenPixels, pprtHorizontal, nil));
  lOrigin.Y := Trunc(ppFromMMThousandths(lOrigin.Y, utScreenPixels, pprtHorizontal, nil));

  lClientRect := ClientRect;

  {draw background}
  if not lbTransparent then
    begin
      aCanvas.Brush.Color := GetColor;
      aCanvas.Brush.Style := bsSolid;
      aCanvas.FillRect(lClientRect);
    end;

  aCanvas.Brush.Style := bsClear;
  aCanvas.Font := lFont;

  if (lBorder <> nil) and lBorder.Visible then
    lOrigin := TppBorder.AdjustRotatedText(lBorder, liAngle, lOrigin.X, lOrigin.Y, nil);

  TppRotatedText.TextOutRotate(aCanvas, lFont, lClientRect, lOrigin.X, lOrigin.Y, liAngle, lsText);

  {draw a framerect}
  PaintFrame(aCanvas);

end;


{ TppImageControl }

constructor TppImageControl.Create(AOwner: TComponent);
begin

  inherited;

  FrameStyle := fsDashed;

end;


{ TppPageBreakControl }

constructor TppPageBreakControl.Create(AOwner: TComponent);
begin
  inherited Create(aOwner);

end;

procedure TppPageBreakControl.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  lSaveColor: TColor;
  lsCaption: String;
begin
  //inherited PaintDesignControl(aCanvas);

  GetPropValue('Caption', lsCaption);

  lClientRect := ClientRect;

  aCanvas.Brush.Color := clGray;
  aCanvas.Brush.Style := bsBDiagonal;
  SetBKColor(aCanvas.Handle, clWhite);
  aCanvas.FillRect(lClientRect);

  {draw a framerect}
  lSaveColor := aCanvas.Brush.Color;
  aCanvas.Brush.Style := bsSolid;
  aCanvas.Brush.Color := clBlack;
  aCanvas.FrameRect(lClientRect);
  aCanvas.Brush.Color := lSaveColor;

end;

procedure TppPageBreakControl.SetComponent(aComponent: TppComponent);
begin
  inherited SetComponent(aComponent);

  BoundsLocks := BoundsLocks + [ppblHeight];

end;

end.

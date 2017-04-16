{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2004                    BBBBB   }

unit ppRichTxDrwCmd;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Types,
  Classes,
  Forms,
  Graphics,
  Controls,
  ComCtrls,
  RichEdit,
  SyncObjs,

  ppTypes,
  ppClass,
  ppRTTI,
  ppUtils,
  ppDevice,
  ppPrnDev,
  ppPrintr,
  ppViewr;                                   

type


  TppCustomRichEditClass = class of TCustomRichEdit;

  {@TppDrawRichText

     Contains the information necessary to draw rich text to any device.}

  {@TppDrawRichText.Color

    The value of the Color property of the richtext component which created the
    draw command.}

  {@TppDrawRichText.EndCharPos

    The last character in the richtext stream which should be rendered.}

  {@TppDrawRichText.RichTextStream

    The value of the RichText property of the richtext component which created
    the draw command.}

  {@TppDrawRichText.StartCharPos

    The first character in the richtext stream which should be rendered.}

  {@TppDrawRichText.Transparent

    The value of the Transparent property of the richtext component which
    created the draw command.}

  TppDrawRichText = class(TppDrawCommand)
    private
      FColor: TColor;
      FEndCharPos: Integer;
      FRichTextStream: TMemoryStream;
      FStartCharPos: Integer;
      FTransparent: Boolean;

      function CompareStreams(aStream1, aStream2: TMemoryStream): Boolean;
      procedure ReadRTFStream(Stream: TStream);
      procedure WriteRTFStream(Stream: TStream);

    protected
      procedure DefineProperties(Filer: TFiler); override;

    public

      constructor Create(aOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Assign(Source: TPersistent); override;
      function Draw(aDevice: TppDevice): Boolean; override;
      function EqualTo(aDrawCommand: TppDrawCommand): Boolean; override;

    published
      property Color: TColor read FColor write FColor;
      property DataType default dtBlob;
      property EndCharPos: Integer read FEndCharPos write FEndCharPos;
      property RichTextStream: TMemoryStream read FRichTextStream write FRichTextStream stored False;
      property StartCharPos: Integer read FStartCharPos write FStartCharPos;
      property Transparent: Boolean read FTransparent write FTransparent default False;

  end; {class, TppDrawRichText}


  {@TppRTFEngine}
  TppRTFEngine = class
    private
      class function CriticalSection: TCriticalSection;

      class procedure Lock;
      class procedure UnLock;
      class function CalcSingleLineHeight(aRichEdit: TCustomRichEdit; aDC: HDC; aCharRange: TCharRange; aDestRect: TRect): Integer;

    public
      class function ChangeBackgroundColor(aRichEdit: TCustomRichEdit; aNewColor: TColor; var aUseResult: Boolean): TColor;  
      class function CalcRangeHeight(aRichEdit: TCustomRichEdit; aDC: HDC; aCharRange: TCharRange; aDestRect: TRect): Integer;  
      class function CheckRangeFit(aRichEdit: TCustomRichEdit; aDC: HDC; aCharRange: TCharRange; aDestRect: TRect;
                                    var aLastFittedChar: Longint; var aHeightUsed: Longint): Boolean;  
      class function FormatRange(aRichEdit: TCustomRichEdit; aDC: HDC; aFormatDC: HDC; const aRect: TRect; aCharRange: TCharRange; aRender: Boolean): Integer;  
      class procedure DrawRichText(aRichEdit: TCustomRichEdit; aDC: HDC; aFormatDC: HDC; const aRect: TRect; aCharRange: TCharRange); 

 end; {class, TppRTFEngine}


  {@TppRichEdit}
  TppRichEdit = class(TRichEdit)
    private

      class function CriticalSection: TCriticalSection;
      class procedure Lock;
      class procedure UnLock;
    protected
      procedure CreateParams(var Params: TCreateParams); override;
      procedure WndProc(var Message: TMessage); override;

    published

    end;  {class, TppRichEdit}


  {TppRichEditUtils
    provides work around for bug in protected text }
  TppRichEditUtils = class(TObject)
    published
      procedure ProtectChangeHandler(Sender: TObject; StartPos, EndPos: Integer; var AllowChange: Boolean);
  end;

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  {@ppControls.TraTppCustomTextRTTI }
  TraTppDrawRichTextRTTI = class(TraTppComponentRTTI)
    public
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDrawRichTextRTTI}


  {rich text routines }
  function ppCreateRichEdit(aOwner: TComponent): TCustomRichEdit;
  function ppCreateRichEditOffScreen(aOwner: TComponent): TCustomRichEdit;
  function ppGetRichEditClass: TppCustomRichEditClass;
  function ppGetRichEditLines(aRichEdit: TCustomRichEdit): TStrings;
  function ppGetRichEditUtils: TppRichEditUtils;

  procedure ppRegisterRichEditClass(aRichEditClass: TppCustomRichEditClass);
  procedure ppUnRegisterRichEditClass(aRichEditClass: TppCustomRichEditClass);


implementation

var
  uRichEditClass: TppCustomRichEditClass = nil;
  uRichEditLibrary: THandle;
  uRichEditUtils: TppRichEditUtils = nil;
  uCriticalSection: TCriticalSection;

{******************************************************************************
 *
 ** T p p  D r a w  R i c h T e x t
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawRichText.Create }

constructor TppDrawRichText.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FRichTextStream := TMemoryStream.Create;
  FStartCharPos := -1;
  FEndCharPos   := -1;
  FTransparent  := False;

  DataType := dtBlob;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDrawRichText.Destroy }

destructor TppDrawRichText.Destroy;
begin
  FRichTextStream.Free;

  inherited Destroy;
  
end; {destructor, Destroy}


{@TppDrawRichText.Assign
 Transfers the value of properties added as a descendant of TppDrawCommand.}

procedure TppDrawRichText.Assign(Source: TPersistent);
var
  lDrawCommand: TppDrawRichText;

begin

  inherited Assign(Source);

  if not(Source is TppDrawRichText) then Exit;

  lDrawCommand := TppDrawRichText(Source);

  FColor        := lDrawCommand.Color;
  FEndCharPos   := lDrawCommand.EndCharPos;
  FColor        := lDrawCommand.Color;
  FStartCharPos := lDrawCommand.StartCharPos;
  FTransparent  := lDrawCommand.Transparent;

  lDrawCommand.RichTextStream.SaveToStream(FRichTextStream);


end; {procedure, Assign}



{ TppDrawRichText.Draw }

function TppDrawRichText.Draw(aDevice: TppDevice): Boolean;
var
  lMetaFile: TMetaFile;
  lMetaFileCanvas: TMetaFileCanvas;
  lCanvasRect: TRect;
  liControlWidth, liControlHeight: Integer;
  lCharRange: TCharRange;
  lPrinterDevice: TppPrinterDevice;
  lScreenDevice: TppScreenDevice;
  lPrinter: TppPrinter;
  lDC: HDC;
  lBitmap: TBitmap;
  lRichEdit: TCustomRichEdit;
  lSaveFont: TFont;
  liSize: Integer;
  lRichEditLines: TStrings;
  liXBorderOffset: Integer;
  liYBorderOffset: Integer;
  lClientRect: TRect;
begin

  Result := True;

  lRichEdit := ppCreateRichEdit(nil);

  if (FRichTextStream.Size > 0) then
    begin
      liSize := FRichTextStream.Size;
      TraRTTI.SetPropValue(lRichEdit, 'MaxLength', liSize);
    end;

  {transfer the RTF data to the global ppRichEdit object }
  FRichTextStream.Position := 0;


  lRichEditLines := ppGetRichEditLines(lRichEdit);

  lRichEditLines.LoadFromStream(FRichTextStream);

  lCharRange.cpMin := FStartCharPos;
  lCharRange.cpMax := FEndCharPos;


  if (aDevice is TppPrinterDevice) then
    begin

      lPrinterDevice := TppPrinterDevice(aDevice);
      lPrinter := lPrinterDevice.Printer;

      liXBorderOffset := Round(Border.Weight * lPrinter.PixelsPerInch.X / 72);
      liYBorderOffset := Round(Border.Weight * lPrinter.PixelsPerInch.Y / 72);

      lSaveFont := TFont.Create;
      lSaveFont.Assign(lPrinter.Canvas.Font);

      lPrinterDevice.CalcDrawPosition(Self);

      lClientRect := DrawRect;

      if Transparent then
         lPrinter.Canvas.CopyMode := cmSrcAnd
      else

      {draw background color}
      if not Transparent then
        begin

          lPrinter.Canvas.CopyMode := cmSrcCopy;
          lPrinter.Canvas.Brush.Style := bsSolid;
          lPrinter.Canvas.Brush.Color := FColor;
          lPrinter.Canvas.FillRect(DrawRect);
        end;

      lPrinter.Canvas.Brush.Style := bsClear;

      if Border.Visible then
        begin
          if (bpTop in Border.BorderPositions) then
            lClientRect.Top := lClientRect.Top + liYBorderOffset;

          if (bpLeft in Border.BorderPositions) then
            lClientRect.Left := lClientRect.Left + liXBorderOffset;

          if (bpRight in Border.BorderPositions) then
            lClientRect.Right := lClientRect.Right - liXBorderOffset;

          if (bpBottom in Border.BorderPositions) then
            lClientRect.Bottom := lClientRect.Bottom - liYBorderOffset;
        end;

      TppRTFEngine.DrawRichText(lRichEdit, lPrinter.DC, lPrinter.DC, lClientRect, lCharRange);

      if Border.Visible then
        lPrinterDevice.DrawBorder(Self, Rect(DrawLeft, DrawTop, DrawRight, DrawBottom));

      lPrinter.Canvas.Font.Assign(lSaveFont);

      lSaveFont.Free;

    end

  else if (aDevice is TppScreenDevice) then
    begin

      lScreenDevice := TppScreenDevice(aDevice);

      lScreenDevice.ScaleVertices(Self);

      lPrinter := ppPrinter;

      liXBorderOffset := Round(Border.Weight * lPrinter.PixelsPerInch.X / 72);
      liYBorderOffset := Round(Border.Weight * lPrinter.PixelsPerInch.Y / 72);

      if lPrinter <> nil then
        lPrinter.PrinterSetup := Page.PrinterSetup;

      if (lPrinter <> nil) and (lPrinter.DC <> 0) then
        lDC := lPrinter.DC
      else
        lDC := GetDC(0);

      liControlWidth  := Trunc(ppFromMMThousandths(Width, utPrinterPixels, pprtHorizontal, lPrinter));
      liControlHeight := Trunc(ppFromMMThousandths(Height, utPrinterPixels, pprtVertical, lPrinter));

      {create a metafile}
      lMetaFile := TMetaFile.Create;
      lMetaFile.Width  := liControlWidth;
      lMetaFile.Height := liControlHeight;

      lCanvasRect := Rect(0, 0, liControlWidth, liControlHeight);

      {note following this line, lMetaFile.Width & lMetaFile.Height will return 0}
      lMetaFileCanvas := TMetaFileCanvas.Create(lMetaFile, lDC);

      if Transparent then
        lScreenDevice.Canvas.CopyMode := cmSrcAnd
      else
        begin
          lScreenDevice.Canvas.CopyMode := cmSrcCopy;

          {draw background color}
          lMetaFileCanvas.Brush.Style := bsSolid;
          lMetaFileCanvas.Brush.Color := FColor;
          lMetaFileCanvas.FillRect(lCanvasRect);

        end;

      if Border.Visible then
        begin
          if (bpTop in Border.BorderPositions) then
            lCanvasRect.Top := lCanvasRect.Top + liYBorderOffset;

          if (bpLeft in Border.BorderPositions) then
            lCanvasRect.Left := lCanvasRect.Left + liXBorderOffset;

          if (bpRight in Border.BorderPositions) then
            lCanvasRect.Right := lCanvasRect.Right - liXBorderOffset;

          if (bpBottom in Border.BorderPositions) then
            lCanvasRect.Bottom := lCanvasRect.Bottom - liYBorderOffset;
        end;

      {draw the RichText to the metafile}
       TppRTFEngine.DrawRichText(lRichEdit, lMetaFileCanvas.Handle, lDC, lCanvasRect, lCharRange);

      lMetaFileCanvas.Free;

      if (lPrinter = nil) or (lPrinter.DC = 0) then
        ReleaseDC(0,lDC);

      if Transparent then
        begin
          lBitmap := TBitmap.Create;
          lBitmap.Width  := liControlWidth;
          lBitmap.Height := liControlHeight;
          lBitmap.Canvas.StretchDraw(lCanvasRect, lMetaFile);

          {draw the metafile to the screen canvas}
          lScreenDevice.Canvas.StretchDraw(DrawRect, lBitmap);

          lBitmap.Free;
        end
      else
        {draw the metafile to the screen canvas}
        lScreenDevice.Canvas.StretchDraw(DrawRect, lMetaFile);

      if Border.Visible then
        lScreenDevice.DrawBorder(Self, Rect(DrawLeft, DrawTop, DrawRight, DrawBottom));

      lMetaFile.Free;


    end
  else
    Result := False;


  lRichEdit.Free;
  
end; {function, Draw}

{ TppDrawRichText.EqualTo }

function TppDrawRichText.EqualTo(aDrawCommand: TppDrawCommand): Boolean;
var
  lDrawRichText: TppDrawRichText;
begin

  Result := inherited EqualTo(aDrawCommand);

  if Result then
    begin

      lDrawRichText := TppDrawRichText(aDrawCommand);

      if (Color = lDrawRichText.Color) and (EndCharPos = lDrawRichText.EndCharPos) and
         (StartCharPos = lDrawRichText.StartCharPos) and (Transparent = lDrawRichText.Transparent) then
        begin
          Result := CompareStreams(RichTextStream, lDrawRichText.RichTextStream);
        end
      else
        Result := False;

    end;

end;

{ TppDrawRichText.CompareStreams }

function TppDrawRichText.CompareStreams(aStream1, aStream2: TMemoryStream): Boolean;
var
  liIndex: Integer;
  lTextLines1: TStringList;
  lTextLines2: TStringList;
begin

  if (aStream1.Size = aStream2.Size) then
    Result := True
  else
    Result := False;

  if Result then
    begin

      lTextLines1 := TStringList.Create;
      lTextLines2 := TStringList.Create;

      aStream1.Position := 0;
      lTextLines1.LoadFromStream(aStream1);

      aStream2.Position := 0;
      lTextLines2.LoadFromStream(aStream2);

      if (lTextLines1.Count = lTextLines2.Count) then
        begin

          liIndex := 0;

          while Result and (liIndex < lTextLines1.Count) do
            begin

              if (CompareStr(lTextLines1[liIndex], lTextLines2[liIndex]) <> 0) then
                Result := False;

              Inc(liIndex);

            end;

        end;

      lTextLines1.Free;
      lTextLines2.Free;

    end;

end;

{------------------------------------------------------------------------------}
{ TppDrawRichText.DefineProperties }

procedure TppDrawRichText.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);

  Filer.DefineBinaryProperty('RTFStream', ReadRTFStream, WriteRTFStream, True)

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppDrawRichText.ReadRTFStream }

procedure TppDrawRichText.ReadRTFStream(Stream: TStream);
var
  llSize: Longint;
begin

  Stream.Read(llSize, SizeOf(Longint));
  FRichTextStream.CopyFrom(Stream, llSize);

end; {procedure, ReadRTFStream}

{------------------------------------------------------------------------------}
{ TppDrawRichText.WriteRTFStream }

procedure TppDrawRichText.WriteRTFStream(Stream: TStream);
var
  llSize: Longint;
begin

  llSize := FRichTextStream.Size;

  Stream.Write(llSize, SizeOf(Longint));

  {note: specify 0 as second parameter to copy the entire stream}
  Stream.CopyFrom(FRichTextStream, 0);

end; {procedure, WriteRTFStream}


{******************************************************************************
 *
 ** R T F  E N G I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppRTFEngine.CriticalSection }

class function TppRTFEngine.CriticalSection: TCriticalSection;
begin
  if (uCriticalSection = nil) then
    uCriticalSection := TCriticalSection.Create;

  Result := uCriticalSection;

end;

{------------------------------------------------------------------------------}
{ TppRTFEngine.Lock }

class procedure TppRTFEngine.Lock;
begin
  TppRTFEngine.CriticalSection.Acquire;

end; {class function, Lock}

{------------------------------------------------------------------------------}
{ TppRTFEngine.UnLock }

class procedure TppRTFEngine.UnLock;
begin
  TppRTFEngine.CriticalSection.Release;

end; {class function, UnLock}

{------------------------------------------------------------------------------}
{ TppRTFEngine.DrawRichText}

class procedure TppRTFEngine.DrawRichText(aRichEdit: TCustomRichEdit; aDC: HDC; aFormatDC: HDC; const aRect: TRect; aCharRange: TCharRange);
begin

  FormatRange(aRichEdit, aDC, aFormatDC, aRect, aCharRange, True);

end; {procedure, DrawRichText}

{------------------------------------------------------------------------------}
{ TppRTFEngine.FormatRange}

class function TppRTFEngine.FormatRange(aRichEdit: TCustomRichEdit; aDC: HDC; aFormatDC: HDC; const aRect: TRect; aCharRange: TCharRange;
                                 aRender: Boolean): Integer;
var
  lFormatRange: TFormatRange;
  liSaveMapMode: Integer;
  liPixelsPerInchX: Integer;
  liPixelsPerInchY: Integer;
  liRender: Integer;

begin

  Lock;

  try

    lFormatRange.hdc       := aDC;
    lFormatRange.hdcTarget := aFormatDC;

    {convert destination rect to TWIPS}
    liPixelsPerInchX := GetDeviceCaps(aDC, LOGPIXELSX);
    liPixelsPerInchY := GetDeviceCaps(aDC, LOGPIXELSY);

    {add a 1/32 inch left margin (1440 / 32 = 45)}
    lFormatRange.rc.left   := (aRect.Left * 1440 div liPixelsPerInchX) + 45;

    lFormatRange.rc.right  := aRect.Right  * 1440 div liPixelsPerInchX;
    lFormatRange.rc.top    := aRect.Top    * 1440 div liPixelsPerInchY;
    lFormatRange.rc.bottom := aRect.Bottom * 1440 div liPixelsPerInchY;

    lFormatRange.rcPage := lFormatRange.rc;

    lFormatRange.chrg.cpMin := aCharRange.cpMin;
    lFormatRange.chrg.cpMax := aCharRange.cpMax;

    if aRender then
      liRender := 1
    else
      liRender := 0;

    liSaveMapMode := SetMapMode(lFormatRange.hdc, MM_TEXT);

    aRichEdit.Perform(EM_FORMATRANGE, 0, 0);   { flush buffer}

    try
      Result := aRichEdit.Perform(EM_FORMATRANGE, liRender, Longint(@lFormatRange));

    finally
      aRichEdit.Perform(EM_FORMATRANGE, 0, 0);

      SetMapMode(lFormatRange.hdc, liSaveMapMode);   { restore previous map mode}

    end;

  finally
    UnLock;

  end;

end; {procedure, FormatRange}

{------------------------------------------------------------------------------}
{ TppRTFEngine.CheckRangeFit}

class function TppRTFEngine.CheckRangeFit(aRichEdit: TCustomRichEdit; aDC: HDC; aCharRange: TCharRange; aDestRect: TRect;
                                    var aLastFittedChar: Longint; var aHeightUsed: Longint): Boolean;
begin

  Lock;

  try

    {calc whether the range fits into the destination rectangle }
    aLastFittedChar := FormatRange(aRichEdit, aDC, aDC, aDestRect, aCharRange, False);

    {range fits if the LastFitted char includes the last char in the range }
    Result := (aLastFittedChar >= aCharRange.cpMax);

    if Result then

        {range fits, so calc height used by the range}
        aHeightUsed := CalcRangeHeight(aRichEdit, aDC, aCharRange, aDestRect)
    else
      begin
        {format range returns the last char that fits plus one}
        Dec(aLastFittedChar);

        {range does not fit, so height used is the height of the rectangle}
        aHeightUsed := aDestRect.Bottom - aDestRect.Top;
      end;


    {if range does not fit, check whether the text is just a carriage return + line feed
        note: for some reason CheckRangeFit will always return a false result}
    if not Result then
      begin

        aRichEdit.SelStart  := aLastFittedChar;
        aRichEdit.SelLength := aCharRange.cpMax;

        if (aRichEdit.SelText =#13#10) or (aRichEdit.SelText = #10) or
           (aRichEdit.SelText = #13)  then
          Result := True;

      end;

  finally
    UnLock;

  end;


end; {function, CheckRangeFit}

{------------------------------------------------------------------------------}
{ TppRTFEngine.ChangeBackgroundColor

  Changes the currently selected text in the rich edit control to a new
  background color. The result is the previous background color that was
  changed.  This is used to support highlighting of text in a text search of a
  rich text draw command on the screen device's page.}


class function TppRTFEngine.ChangeBackgroundColor(aRichEdit: TCustomRichEdit; aNewColor: TColor; var aUseResult: Boolean): TColor;
var
  liSize: Integer;
  lGetFormat: TCharFormat2;
  lSetFormat: TCharFormat2;
  lColor: TColor;
begin

  aUseResult := True;

  Lock;

  liSize := SizeOf(TCharFormat2);

  FillChar(lGetFormat, liSize, 0);
  lGetFormat.cbSize := liSize;
  lGetFormat.dwMask := CFM_BackColor;
  aRichEdit.Perform(EM_GetCharFormat, SCF_Selection, lParam(@lGetFormat));
  Result := lGetFormat.crBackColor;

  {color comes back black when it may be black or white}
  if (Result = 0) then
    begin

      lColor := ColorToRGB(aRichEdit.SelAttributes.Color);

      {the background most likely is not white}
      if (lColor = clWhite) then
        Result := clBlack

      {the background most likely is not black}
      else if (lColor = clBlack) then
        Result := clWhite

      else
        begin
          Result := clWhite;

          aUseResult := False;
        end;

    end;

  FillChar(lSetFormat, liSize, 0);
  lSetFormat.cbSize := liSize;
  lSetFormat.dwMask := CFM_BackColor;

  try
    lSetFormat.crBackColor := ColorToRGB(aNewColor);
  except
    on E: ERangeError do
      begin
        lSetFormat.crBackColor := Result;
      end;
  end;

  aRichEdit.Perform(EM_SetCharFormat, SCF_Selection, LongInt(@lSetFormat));

  UnLock;

end; {procedure, ChangeBackgroundColor}

{------------------------------------------------------------------------------}
{ TppRTFEngine.CalcRangeHeight}

class function TppRTFEngine.CalcRangeHeight(aRichEdit: TCustomRichEdit; aDC: HDC; aCharRange: TCharRange; aDestRect: TRect): Integer;
var
  lPrintRect: TRect;
  liMinHeight: Integer;
  liMaxHeight: Integer;
  liRangeHeight: Integer;
  lbRangeFits: Boolean;
  lbCalcDone: Boolean;
  liPixelsPerInchY: Integer;
  liTolerance: Integer;
  lFont: TFont;
  lTextMetric: TTextMetric;
  liSaveSelStart: Integer;
  liSaveSelLength: Integer;
  lsSelText: String;
  liLastChar: Integer;
  
begin

  Lock;

  try

    {intitialize}
    lPrintRect.Left   := aDestRect.Left;
    lPrintRect.Top    := aDestRect.Top;
    lPrintRect.Right  := aDestRect.Right;

    liPixelsPerInchY := GetDeviceCaps(aDC, LOGPIXELSY);

    {save selected text}
    liSaveSelStart  := aRichEdit.SelStart;
    liSaveSelLength := aRichEdit.SelLength;

    {calculate the sizing tolerance based upon the font height of the last character in the range}

    {find the last non-null character in the range}
    aRichEdit.SelStart  := aCharRange.cpMin;
    aRichEdit.SelLength := aCharRange.cpMax - aCharRange.cpMin + 1;

    lsSelText  := aRichEdit.SelText;
    liLastChar := Length(lsSelText);

    if (lsSelText <> '') then
      while (liLastChar > 0) and (lsSelText[liLastChar] in [#13, #10, #0]) do
        Dec(liLastChar);

    {sel start is 0 based, liLastChar is 1 based}
    if liLastChar > 0 then
      liLastChar := aCharRange.cpMin + liLastChar -1;

    aRichEdit.SelStart    := liLastChar;
    aRichEdit.SelLength   := 1;

    if ppPrinter <> nil then
      begin
        lFont := TFont.Create;
        lFont.Assign(aRichEdit.SelAttributes);
        ppPrinter.Canvas.Font := lFont;
        GetTextMetrics(ppPrinter.Canvas.Handle, lTextMetric);
        lFont.Free;
     end
    else
      lTextMetric.tmDescent := 0;

    liTolerance := Round(Abs(aRichEdit.SelAttributes.Size) * liPixelsPerInchY / 72);

    {restore selected text}
    aRichEdit.SelStart := liSaveSelStart;
    aRichEdit.SelLength := liSaveSelLength;

    liMinHeight   := 0;
    liMaxHeight   := aDestRect.Bottom - aDestRect.Top;
    liRangeHeight := liMaxHeight;
    lbRangeFits   := True;
    lbCalcDone    := False;

    {liCount := 0;}

    while not lbCalcDone do
      begin

        {try the halfway point }
        liRangeHeight := liMinHeight + ((liMaxHeight - liMinHeight) div 2);

        lPrintRect.Bottom := lPrintRect.Top + liRangeHeight;

        lbRangeFits := (FormatRange(aRichEdit, aDC, aDC, lPrintRect, aCharRange, False) >= aCharRange.cpMax);

        {calc a new Max or Min based on whether the range fits}
        if ((liMaxHeight - liMinHeight) <= liTolerance) then

          lbCalcDone := True

        else if lbRangeFits then
          liMaxHeight := liRangeHeight
        else
          liMinHeight := liRangeHeight;

      {  inc(liCount);
        if liCount > 50 then
          ShowMessage('CalcRangeHeight: stuck in loop'); }
      end;

      {showMessage('FormatRange calls: ' + IntToStr(liCount));}
     if lbRangeFits then
       Result := liRangeHeight
     else
       Result := liMaxHeight;

     {make sure the text is at least one line high
       note: this is because of a bug in the rich edit control }
     if Result <= liTolerance then
       Result := CalcSingleLineHeight(aRichEdit, aDC, aCharRange, aDestRect)
     else
       Result := Result + lTextMetric.tmDescent;

  finally
    UnLock;

  end;

end; {function, CalcRangeHeight}


{------------------------------------------------------------------------------}
{ TppRTFEngine.CalcSingleLineHeight}

class function TppRTFEngine.CalcSingleLineHeight(aRichEdit: TCustomRichEdit; aDC: HDC; aCharRange: TCharRange; aDestRect: TRect): Integer;
var
  lFont: TFont;
  liIndex: Integer;
  liMaxFontSize: Integer;
  liPixelsPerInchY: Integer;
  liSaveSelStart: Integer;
  liSaveSelLength: Integer;
  lTextMetric: TTextMetric;
begin

  Lock;

  lFont := TFont.Create;

  liPixelsPerInchY := GetDeviceCaps(aDC, LOGPIXELSY);

  {save selected text}
  liSaveSelStart  := aRichEdit.SelStart;
  liSaveSelLength := aRichEdit.SelLength;

  liMaxFontSize := 0;

  try

    {calculate the sizing tolerance based upon the font height of the last
     character in the range}
    for liIndex := aCharRange.cpMin to aCharRange.cpMax do
      begin
        aRichEdit.SelStart  := liIndex;
        aRichEdit.SelLength := 1;

        if (aRichEdit.SelAttributes.Size > liMaxFontSize) then
          begin
            liMaxFontSize := aRichEdit.SelAttributes.Size;

            if (ppPrinter <> nil) then
              begin
                lFont.Assign(aRichEdit.SelAttributes);
                ppPrinter.Canvas.Font := lFont;
                GetTextMetrics(ppPrinter.Canvas.Handle, lTextMetric);
             end
            else
              lTextMetric.tmDescent := 0;

          end;

      end;

    Result := Round(Abs(liMaxFontSize) * liPixelsPerInchY / 72) + lTextMetric.tmDescent;

  finally
  
    {restore selected text}
    aRichEdit.SelStart := liSaveSelStart;
    aRichEdit.SelLength := liSaveSelLength;

    lFont.Free;

    UnLock;

  end;

end; {function, CalcSingleLineHeight}


{******************************************************************************
 *
 ** R I C H E D I T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppRichEdit.CriticalSection }

class function TppRichEdit.CriticalSection: TCriticalSection;
begin
  if (uCriticalSection = nil) then
    uCriticalSection := TCriticalSection.Create;

  Result := uCriticalSection;

end;

{------------------------------------------------------------------------------}
{ TppRTFEngine.Lock }

class procedure TppRichEdit.Lock;
begin
  TppRichEdit.CriticalSection.Acquire;

end; {class function, Lock}

{------------------------------------------------------------------------------}
{ TppRTFEngine.UnLock }

class procedure TppRichEdit.UnLock;
begin
  TppRichEdit.CriticalSection.Release;

end; {class function, UnLock}

{------------------------------------------------------------------------------}
{ TppRichEdit.CreateParams }

procedure TppRichEdit.CreateParams(var Params: TCreateParams);
const
  cHideScrollBars: array[Boolean] of DWORD = (ES_DISABLENOSCROLL, 0);
  cHideSelections: array[Boolean] of DWORD = (ES_NOHIDESEL, 0);
begin

  Lock;

  try

    {try to load the RichEdit 2 dll}
    if uRichEditLibrary = 0 then
      begin
        uRichEditLibrary := LoadLibrary('RICHED20.DLL');
        if uRichEditLibrary <= HINSTANCE_ERROR then
          uRichEditLibrary := 0;
      end;

    {call inherited - which will load the RichEdit version 1 libary (RichED32.DLL)}
    inherited CreateParams(Params);

    {create the appropriate windows subclass for the rich edit library}
    if uRichEditLibrary <> 0 then
      CreateSubClass(Params, 'RICHEDIT20A')
    else
      CreateSubClass(Params, 'RICHEDIT');

    Params.Style := Params.Style or cHideScrollBars[HideScrollBars] or cHideSelections[HideSelection];
    Params.Style := Params.Style and not(WS_CHILD);
    Params.WindowClass.Style := Params.WindowClass.Style and not (CS_HREDRAW or CS_VREDRAW);

  finally
    UnLock;

  end;

end; {procedure, CreateParams}


{------------------------------------------------------------------------------}
{ TppRichEdit.WndProc }

procedure TppRichEdit.WndProc(var Message: TMessage);
const FR_DOWN = $00000001;

begin
  {RichEdit 2.0 support additional search options not available in RichEdit 1.0,
   FR_DOWN indicates to search from current selection to bottom of document}
  if (Message.Msg = EM_FINDTEXT) then
     Message.wParam:= Message.wParam or FR_DOWN;

  inherited WndProc(Message);

end; {procedure, WndProc}


{******************************************************************************
 *
 ** R I C H E D I T  U T I L S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppRichEditUtils.ProtectChangeHandler }

procedure TppRichEditUtils.ProtectChangeHandler(Sender: TObject; StartPos, EndPos: Integer; var AllowChange: Boolean);
begin
  {workaround for bug in RichEdit protected text}
  AllowChange := True;
end;


{******************************************************************************
 *
 ** F U N C T I O N S
 *
{******************************************************************************}
{------------------------------------------------------------------------------}
{ ppRegisterRichEditClass }


procedure ppRegisterRichEditClass(aRichEditClass: TppCustomRichEditClass);
begin

  uRichEditClass := aRichEditClass;

end; {function, ppRegisterRichEditClass}


{------------------------------------------------------------------------------}
{ ppUnRegisterRichEditClass }

procedure ppUnRegisterRichEditClass(aRichEditClass: TppCustomRichEditClass);
begin
  if (uRichEditClass = aRichEditClass) then
    uRichEditClass := TRichEdit;

end; {function, ppRegisterRichEditClass}


{------------------------------------------------------------------------------}
{ ppRegisterRichEditClass }

function ppGetRichEditClass: TppCustomRichEditClass;
begin

  if uRichEditClass = nil then
    uRichEditClass := TppRichEdit;

  Result := uRichEditClass;

end; {function, ppRegisterRichEditClass}

{------------------------------------------------------------------------------}
{ ppCreateRichEdit }

function ppCreateRichEdit(aOwner: TComponent): TCustomRichEdit;
begin

  Result := ppGetRichEditClass.Create(aOwner);
  ppSetMethodPropValue(Result, 'OnProtectChange', ppFindMethod(ppGetRichEditUtils, 'ProtectChangeHandler'));

end; {function, ppCreateRichEdit}

{------------------------------------------------------------------------------}
{ ppCreateRichEditOffScreen }

function ppCreateRichEditOffScreen(aOwner: TComponent): TCustomRichEdit;
begin
  Result := ppCreateRichEdit(aOwner);
  Result.Visible := False;
  Result.Parent := nil;
  Result.Top := -1500;
  Result.Left := -1500;
end; {function, ppCreateRichEditOffScreen}

{------------------------------------------------------------------------------}
{ ppGetRichEditUtils }

function ppGetRichEditUtils: TppRichEditUtils;
begin

  if (uRichEditUtils = nil) then
    uRichEditUtils := TppRichEditUtils.Create;

  Result := uRichEditUtils;

end; {function, ppGetRichEditUtils}

{------------------------------------------------------------------------------}
{ ppGetRichEditLines }

function ppGetRichEditLines(aRichEdit: TCustomRichEdit): TStrings;
var
  lObject: TObject;
begin
  TraRTTI.GetPropValue(aRichEdit, 'Lines', lObject);
  Result := TStrings(lObject);

end; {function, ppGetRichEditLines}

{******************************************************************************
 *
 ** DrawRichText R T T I
 *
{******************************************************************************}

class function TraTppDrawRichTextRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin
  Result := True;

  if (CompareText(aPropName, 'Color') = 0) then
    EnumPropToRec(aPropName, 'TColor', False, aPropRec)
  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end;

class function TraTppDrawRichTextRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin
  Result := True;

  if (CompareText(aPropName, 'Color') = 0) then
    Integer(aValue) := Ord(TppDrawRichText(aObject).Color)
  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end;

class function TraTppDrawRichTextRTTI.RefClass: TClass;
begin
  Result := TppDrawRichText;

end;

class function TraTppDrawRichTextRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin
  Result := True;

  if (CompareText(aPropName, 'Color') = 0) then
    TppDrawRichText(aObject).Color := TColor(aValue)
  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end;


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization
  RegisterClasses([TppDrawRichText]);

  ppRegisterRichEditClass(TppRichEdit);

  raRegisterRTTI(TraTppDrawRichTextRTTI);

finalization

  if uRichEditLibrary <> 0 then
    FreeLibrary(uRichEditLibrary);

  uRichEditUtils.Free;
  uRichEditUtils := nil;

  uCriticalSection.Free;
  uCriticalSection := nil;

  UnRegisterClasses([TppDrawRichText]);

  raUnRegisterRTTI(TraTppDrawRichTextRTTI);


end.

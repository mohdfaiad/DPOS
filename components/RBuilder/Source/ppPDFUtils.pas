{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2003                    BBBBB   }

unit ppPDFUtils;

interface

uses
  Classes,
  Windows,
  Graphics,
  SysUtils,
  ppDevice,
  ppTypes,
  ppZLib;

type

  {@TppPDFUtils

    This class is not connected in any way to the PDF Device.  These class
    functions and procedures are available to any class in the PDF Device to
    act as helpers and utilities for PDF processing. }

  TppPDFUtils = class
    private
      class function ExtToStr(aValue: Extended): String;
      class function JoinedBorder(aBorderPositions: TppBorderPositions): Boolean;
      
    public
      class procedure CompressStream(aDataStream: TStream; aCompressionLevel: TppCompressionLevel);
      class procedure DrawBorder(aStream: TMemoryStream; aDrawCommand: TppDrawCommand; aPageHeight: Double; aDrawRect: TRect);
      class procedure WriteLine(aOutputStream: TStream; aLine: String);
      class procedure WriteMem(aOutputStream: TStream; aBuffer: String);

      class function ConvertRGB(aColor: TColor): String;
      class function DrawCommandToBitmap(aDrawCommand: TppDrawCommand; aScalePercentage: Integer; aBackgroundColor: TColor): TBitmap;
      class function InchPerMicron: Double;
      class function MicronsToPixels(aMicrons: Integer): Integer;
      class function MicronsToPoints(aMicrons: Integer): Double;
      class function PenStyle(aStyle: TPenStyle): String;
      class function PopulateTextMetric(aFont: TFont): TTextMetric;
      class function ProcessFontName(aFont: TFont; aIsTrueType: Boolean): String;
      class function ProcessText(aText: String): String;
      class function PixelsToPoints(aPixels, aPixelsPerInch: Integer): Double;
      class function TwipsPerInch: Integer;

  end;

implementation

uses
  Forms,
  Math,
  StrUtils,
  ExtCtrls,
  ppPrintr,
  ppDrwCmd,
  ppViewr,
  ppUtils,
  RichEdit;

{@TppPDFUtils.CompressStream

  Compresses a given stream at the chosen compression level.  This function
  uses the ZLib library to compress a memory stream before being written to the
  PDF file. }

class procedure TppPDFUtils.CompressStream(aDataStream: TStream; aCompressionLevel: TppCompressionLevel);
var
  lCompressionStream: TppCompressionStream;
  lInputStream: TStream;
begin

  {create a temporary input stream and copy the data stream}
  lInputStream := TStream(aDataStream.ClassType.Create);

  try
    lInputStream.CopyFrom(aDataStream, 0);

    {clear the data stream - it will be used to write the compressed output}
    aDataStream.Size := 0;

    {create a ZLib compression stream - it will write compressed data to aDataStream }
    lCompressionStream := TppCompressionStream.Create(aCompressionLevel, aDataStream);

    try
      lCompressionStream.CopyFrom(lInputStream, 0);
    finally
      lCompressionStream.Free;
    end;

  finally
    lInputStream.Free;

  end;

end;

{@TppPDFUtils.ConvertRGB

  Retrieves the Hexadecimal values for each tint (Red, Green, Blue) and
  converts it to the one place decimal form that PDF is able to decifer.  This
  function returns a string value representing a color in PDF RGB format. }

class function TppPDFUtils.ConvertRGB(aColor: TColor): String;
var
  liColor: Integer;
  lsRed: String;
  lsGreen: String;
  lsBlue: String;
begin

  liColor  := ColorToRGB(aColor);

  lsRed := ExtToStr(RoundTo(GetRValue(liColor) / 255, -3));
  lsGreen := ExtToStr(RoundTo(GetGValue(liColor) / 255, -3));
  lsBlue := ExtToStr(RoundTo(GetBValue(liColor) / 255, -3));

  Result := lsRed + ' ' + lsGreen + ' ' + lsBlue;

end;

{@TppPDFUtils.DrawBorder

  Adds a border to a given drawcommand }

class procedure TppPDFUtils.DrawBorder(aStream: TMemoryStream; aDrawCommand: TppDrawCommand; aPageHeight: Double; aDrawRect: TRect);

  procedure WriteLine(aLine: String);
    begin
      aLine := aLine + #13 + #10;
      aStream.Write(aLine[1], Length(aLine));

    end;
var
  lBorder: TppBorder;
  lsStrokeColor: string;
  lsPenStyle: string;
  ldBottom: Double;
  ldLeft: Double;
  ldTop: Double;
  ldRight: Double;
  ldWidth: Double;
  ldHeight: Double;
  ldOffset: Double;
  ldXOffset: Double;
begin

  lBorder := aDrawCommand.Border;

  {Dimentions}
  ldWidth := MicronsToPoints(aDrawRect.Right);
  ldHeight := MicronsToPoints(aDrawRect.Top);

  {Position}
  ldBottom := aPageHeight - MicronsToPoints(aDrawRect.Bottom);
  ldLeft := MicronsToPoints(aDrawRect.Left);
  ldTop := ldBottom + ldHeight;
  ldRight := ldLeft + ldWidth;

  {Weight Offset}
  ldOffset := lBorder.Weight / 2;

  {Color}
  lsStrokeColor := ConvertRGB(lBorder.Color);

  {Store current graphics state}
  WriteLine('q');

  {Define the Graphics State Dictionary}
  WriteLine('/GS1 gs');

  {Line Width}
  WriteLine(ExtToStr(lBorder.Weight) + ' w');

  {Pen Style}
  lsPenStyle := TppPDFUtils.PenStyle(lBorder.Style);
  WriteLine(lsPenStyle);

  {Set Line Color}
  WriteLine(lsStrokeColor + ' RG');

  {Draw Border}
  if JoinedBorder(lBorder.BorderPositions) then
    begin
      ldXOffset := ldOffset;
      WriteLine('2 J');
    end
  else
    ldXOffset := 0;

  if (bpLeft in lBorder.BorderPositions) then
    begin
      Writeline(ExtToStr(ldLeft + ldOffset) + ' ' + ExtToStr(ldBottom + ldXOffset) + ' m');
      WriteLine(ExtToStr(ldLeft + ldOffset) + ' ' + ExtToStr(ldTop - ldXOffset) + ' l');
    end;

  if (bpTop in lBorder.BorderPositions) then
    begin
      Writeline(ExtToStr(ldLeft + ldXOffset) + ' ' + ExtToStr(ldTop - ldOffset) + ' m');
      WriteLine(ExtToStr(ldRight - ldXOffset) + ' ' + ExtToStr(ldTop - ldOffset) + ' l');
    end;

  if (bpRight in lBorder.BorderPositions) then
    begin
      Writeline(ExtToStr(ldRight - ldOffset) + ' ' + ExtToStr(ldTop - ldXOffset) + ' m');
      Writeline(ExtToStr(ldRight - ldOffset) + ' ' + ExtToStr(ldBottom + ldXOffset) + ' l');
    end;

  if (bpBottom in lBorder.BorderPositions) then
    begin
      Writeline(ExtToStr(ldRight - ldXOffset) + ' ' + ExtToStr(ldBottom + ldOffset) + ' m');
      Writeline(ExtToStr(ldLeft + ldXOffset) + ' ' + ExtToStr(ldBottom + ldOffset) + ' l');
    end;

  WriteLine('S');

  {Restore graphics state}
  WriteLine('Q');

end;

class function TppPDFUtils.JoinedBorder(aBorderPositions: TppBorderPositions): Boolean;
begin
  Result := (aBorderPositions <> []) and (aBorderPositions <> [bpLeft]) and (aBorderPositions <> [bpTop]) and (aBorderPositions <> [bpRight]) and
            (aBorderPositions <> [bpBottom]) and (aBorderPositions <> [bpLeft, bpRight]) and (aBorderPositions <> [bpTop, bpBottom]);
end;

{@TppPDFUtils.DrawCommandToBitmap

  Converts a given drawcommand to an bitmap image.  This routine will copy the
  contents of any DrawCommand and draw them to the canvas of the returned
  bitmap.  Note that once this is done, much of the quality of the original
  component is lost. }

class function TppPDFUtils.DrawCommandToBitmap(aDrawCommand: TppDrawCommand; aScalePercentage: Integer; aBackgroundColor: TColor): TBitmap;
var
  lBackgroundShape: TppDrawShape;
  liQuarterInch: Integer;
  lPage: TppPage;
  lScreenDevice: TppScreenDevice;
  lViewer: TppViewer;
begin

  {This is just padding to ensure the draw command has room to draw.}
  liQuarterInch := ppToMMThousandths(0.25, utInches, pprtHorizontal, nil);

  lBackgroundShape := TppDrawShape.Create(nil);
  lBackgroundShape.ShapeType := stRectangle;
  lBackgroundShape.Brush.Color := aBackgroundColor;
  lBackgroundShape.Left := 0;
  lBackgroundShape.Top := 0;
  lBackgroundShape.Width := aDrawCommand.Left + aDrawCommand.Width + liQuarterInch;
  lBackgroundShape.Height := aDrawCommand.Top + aDrawCommand.Height + liQuarterInch;

  lPage := TppPage.Create(nil);

  try

    lPage.PageDef.mmWidth := aDrawCommand.Left + aDrawCommand.Width + liQuarterInch;
    lPage.PageDef.mmHeight := aDrawCommand.Top + aDrawCommand.Height + liQuarterInch;
    lPage.AddDrawCommand(lBackgroundShape);
    lPage.AddDrawCommand(aDrawCommand);

    lViewer := TppViewer.Create(nil);
    lScreenDevice := TppScreenDevice.Create(lViewer);

    try

      lScreenDevice.Viewer.ZoomPercentage := aScalePercentage;
      lScreenDevice.PageRequest.PageSetting := psAll;
      lScreenDevice.ReceivePage(lPage);

      lScreenDevice.ScaleVertices(aDrawCommand);

      Result := TBitmap.Create;
      Result.Width := aDrawCommand.DrawRight - aDrawCommand.DrawLeft;
      Result.Height := aDrawCommand.DrawBottom - aDrawCommand.DrawTop;

      Result.Canvas.Draw(-aDrawCommand.DrawLeft, -aDrawCommand.DrawTop, lScreenDevice.PageImage);

    finally
      lScreenDevice.Free;
      lViewer.Free;
    end;

  finally

    lPage.RemoveDrawCommand(aDrawCommand);
    lPage.Free;

  end;

end;

{@TppPDFUtils.InchPerMicron

  Number of inches per one micron. }

class function TppPDFUtils.InchPerMicron: Double;
begin
  Result := 0.0000393701;
end;

{@TppPDFUtils.MicronsToPixels

  Converts an integer type micron value to the nearest screen pixel value. }

class function TppPDFUtils.MicronsToPixels(aMicrons: Integer): Integer;
begin
  Result := Round(aMicrons * InchPerMicron * Screen.PixelsPerInch);
end;

{@TppPDFUtils.MicronsToPoints

  Converts an integer type micron value to points, rounded to the nearest
  thousandth. }

class function TppPDFUtils.MicronsToPoints(aMicrons: Integer): Double;
begin
  Result := aMicrons * InchPerMicron * 72;

end;

{@TppPDFUtils.PenStyle

  Defines the 5 pen styles available in ReportBuilder.  The arrays define an
  "on/off" point value of a line. For instance [ 10 4 ] means 10 points on, 4
  points off, or a dashed line. }

class function TppPDFUtils.PenStyle(aStyle: TPenStyle): String;
begin
  case aStyle of
    psSolid: Result := '[] 0 d';
    psDash: Result := '[ 10 4 ] 0 d';
    psDashDot: Result := '[ 8 3 2 3 ] 0 d';
    psDashDotDot: Result := '[ 8 3 2 2 2 3 ] 0 d';
    psDot: Result := '[ 2 2 ] 0 d';
  end;
end;

{@TppPDFUtils.PopulateTextMetric

  Populates the TEXTMETRIC structure for a given font.  The TEXTMETRIC is a
  Windows API defined object containing detailed information about a font.  For
  more information on the TEXTMETRIC, please see this topic in the Windows API
  help. }

class function TppPDFUtils.PopulateTextMetric(aFont: TFont): TTextMetric;
var
  lCanvas: TCanvas;
begin

  lCanvas := ppPrinter.Canvas;

  lCanvas.Font := aFont;

  GetTextMetrics(lCanvas.Handle, Result);

end;

{@TppPDFUtils.ProcessFontName

  Every font name must be processed to ensure the proper format.  Bold fonts
  must be followed by ,Bold, Italic fonts: ,Italic and so on.}

class function TppPDFUtils.ProcessFontName(aFont: TFont; aIsTrueType: Boolean): String;
begin

  if aIsTrueType then
    begin
      Result := AnsiReplaceStr(aFont.Name, ' ', '');

      {Handle times and arial case}
      if Result = 'TIMESNEWROMAN' then
        Result := 'TimesNewRoman'
      else if Result = 'ARIAL' then
        Result := 'Arial';

      if (fsBold in aFont.Style) and (fsItalic in aFont.Style) then
        Result := Result + ',BoldItalic'
      else if (fsBold in aFont.Style) then
        Result := Result + ',Bold'
      else if (fsItalic in aFont.Style) then
        Result := Result + ',Italic';

    end
  else
    begin
      Result := 'Times-Roman';

      if (Pos('COURIER', UpperCase(aFont.Name)) <> 0) then
        begin
          if (fsBold in aFont.Style) and (fsItalic in aFont.Style) then
            Result := 'Courier-BoldOblique'
          else if (fsBold in aFont.Style) and (not(fsItalic in aFont.Style)) then
            Result := 'Courier-Bold'
          else if (fsItalic in aFont.Style) and (not(fsBold in aFont.Style)) then
            Result := 'Courier-Oblique'
          else
            Result := 'Courier';
        end;

      if (Pos('WINGDINGS', UpperCase(aFont.Name)) <> 0) then
        begin
          Result := 'ZapfDingbats';
        end;

      if (Pos('ARIAL', UpperCase(aFont.Name)) <> 0) then
        begin
          if (fsBold in aFont.Style) and (fsItalic in aFont.Style) then
            Result := 'Helvetica-BoldOblique'
          else if (fsBold in aFont.Style) and (not(fsItalic in aFont.Style)) then
            Result := 'Helvetica-Bold'
          else if (fsItalic in aFont.Style) and (not(fsBold in aFont.Style)) then
            Result := 'Helvetica-Oblique'
          else
            Result := 'Helvetica';
        end;

      if (Pos('TIMES', UpperCase(aFont.Name)) <> 0)  or (Result = 'Times-Roman') then
        begin
          if (fsBold in aFont.Style) and (fsItalic in aFont.Style) then
            Result := 'Times-BoldItalic'
          else if (fsBold in aFont.Style) and (not(fsItalic in aFont.Style)) then
            Result := 'Times-Bold'
          else if (fsItalic in aFont.Style) and (not(fsBold in aFont.Style)) then
            Result := 'Times-Italic'
          else
            Result := 'Times-Roman';
        end;

    end;

end;

{@TppPDFUtils.ProcessText

  Loops through each character of a String and adds a backslash (#92) before
  any PDF reserved characters (ie. left parenthesis (#40), right parenthesis
  (#41), and backslash (#92)).

  It is necessary to send every line of text through this function before
  outputing to PDF. }

class function TppPDFUtils.ProcessText(aText: String): String;
var
  liIndex: Integer;
  liTextLength: Integer;
begin

  Result := aText;

  liIndex := 1;
  liTextLength := Length(aText);

  while liIndex <= liTextLength do
    begin
      if (Result[liIndex] = #40) or (Result[liIndex] = #41) or (Result[liIndex] = #92) then
        begin
          Insert(#92, Result, liIndex);
          liIndex := liIndex + 2;
          liTextLength := liTextLength + 1;
        end
      else if (Result[liIndex] = 'ü') then
        begin
          Insert(#32#32, Result, liIndex+1);
          liIndex := liIndex + 3;
          liTextLength := liTextLength + 2;
        end
      else
        liIndex := liIndex + 1;

    end;

end;

{@TppPDFUtils.PixelsToPoints

  Given a number of pixels and screen or printer pixels per inch, this function
  will return a Double type value in points. }

class function TppPDFUtils.PixelsToPoints(aPixels, aPixelsPerInch: Integer): Double;
begin
  Result := aPixels / aPixelsPerInch * 72;

end;

{@TppPDFUtils.TwipsPerInch

  Number of Twips per inch  (there are 20 Twips per Point) }

class function TppPDFUtils.TwipsPerInch: Integer;
begin
  Result := 1440;
end;

{@TppPDFUtils.WriteLine }

class procedure TppPDFUtils.WriteLine(aOutputStream: TStream; aLine: String);
begin
    aLine := aLine + #13 + #10;
    aOutputStream.Write(aLine[1], Length(aLine));

end;

{@TppPDFUtils.WriteMem }

class procedure TppPDFUtils.WriteMem(aOutputStream: TStream; aBuffer: String);
begin
  aOutputStream.Write(aBuffer[1], Length(aBuffer));
end;

{@TppPDFUtils.ExtToStr }

class function TppPDFUtils.ExtToStr(aValue: Extended): String;
begin
  Result := FormatFloat('0.0####', aValue);
  Result := StringReplace(Result, DecimalSeparator, '.', []);
end;

end.

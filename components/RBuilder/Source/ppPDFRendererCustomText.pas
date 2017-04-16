{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2005                    BBBBB   }

unit ppPDFRendererCustomText;

interface

uses
  Classes,
  Windows,
  Graphics,
  ppPrintr,
  ppDevice,
  ppDrwCmd,
  ppPDFRenderer;

type

  {@TppPDFRendererCustomText

    Ancestor class to any text renderer class that outputs text to a PDF File.
    Provides the ability to generically begin and end a text, process reserved
    PDF characters, and produce the underline and strikeout text style effects.}

  {@TppPDFCustomText.Printer

    Handle to the current printer device used to generate the report.  Used to
    get accurate measurments with regards to text positioning.}

  {@TppPDFCustomText.TextMetric

    Handle to the TEXTMETRIC structure insided the Windows API.  This structure
    holds specific information about the font being used in the text element.
    For more information on the TEXTMETRIC, please see the Windows SDK help. }

  {@TppPDFCustomText.DrawTextCommand

    Reference to the TppDrawText Draw Command that defines this text element.
    Used to get all relevant information about the text object to successfully
    print it to the PDF file. }

  {@TppPDFCustomText.FontName

    Name of the font used for this text object.  Used to define where the font
    information can be found in the PDF file.  Font names should be
    pre-processed before being used in the PDF file. }

  {@TppPDFCustomText.MemoryStream

    Reference to the content MemoryStream.  All text is written to this stream
    and later compressed. }

  {@TppPDFCustomText.PageHeight

    Height of the page in Points. For internal use only. }

  TppPDFRendererCustomText = class(TppPDFRenderer)
    private
      FDrawText: TppDrawText;
      FFont: TFont;
      FFontName: String;
      FFontColor: String;
      FPrinter: TppPrinter;
      FTextMetric: TTextMetric;

      procedure ClipText;
      procedure CreateTextBox;
      procedure SetDrawTextCommand(const Value: TppDrawText);
      function  CalcAutoBox: TRect;
      procedure SetFontName(const Value: string);

    protected
      procedure EndText;
      procedure StartText;
      procedure StylizeText(aWidth, aHeight, aBottom, aLeft: Double);

      function CalcLineHeight: Double;
      procedure SetDrawCommand(const Value: TppDrawCommand); override;
      property DrawTextCommand: TppDrawText read FDrawText write SetDrawTextCommand;
      property FontName: string read FFontName write SetFontName;
      property Printer: TppPrinter read FPrinter;
      property TextMetric: TTextMetric read FTextMetric;

    public
      class function DrawCommandClass: TppDrawCommandClass; override;
      procedure RenderToPDF; override;
  end;

implementation

uses
  Forms,
  SysUtils,
  ppUtils,
  ppTypes,
  ppRotatedText,
  ppPDFObject,
  ppPDFUtils,
  ppPDFXRef,
  ppPDFFont,
  ppPDFFontDescriptor,
  ppPDFFontWidths,
  Math;

function TppPDFRendererCustomText.CalcAutoBox: TRect;
var
  lDrawMMRect: TRect;
  lDrawRect: TRect;
  liWidthChange: Integer;
  liHeightChange: Integer;
  liTextWidth: Integer;
begin

  lDrawRect := Rect(DrawTextCommand.Left, DrawTextCommand.Top, DrawTextCommand.Width, DrawTextCommand.Height);

  if DrawTextCommand.Angle <> 0 then
    begin
      lDrawMMRect := TppRotatedText.CalcRotatedTextBounds(Printer.Canvas, DrawTextCommand.Text, DrawTextCommand.Font, 0, 0, DrawTextCommand.Width, DrawTextCommand.Height, DrawTextCommand.Angle, DrawTextCommand.AutoSize, DrawTextCommand.Alignment, nil);

      liWidthChange := lDrawMMRect.Right - DrawTextCommand.Width;
      liHeightChange := lDrawMMRect.Bottom - DrawTextCommand.Height;

      if (liWidthChange <> 0) or (liHeightChange <> 0) then
        lDrawRect := TppRotatedText.AdjustAutoRect(DrawTextCommand, DrawTextCommand.Left, DrawTextCommand.Top, lDrawMMRect.Right, lDrawMMRect.Bottom, DrawTextCommand.Width, DrawTextCommand.Height);

      Result.Left := lDrawRect.Left;
      Result.Top := lDrawRect.Bottom - lDrawRect.Top;
      Result.Right := lDrawRect.Right - lDrawRect.Left;
      Result.Bottom := lDrawRect.Bottom;
    end
  else
    begin
      liTextWidth := ppToMMThousandths(ppPrinter.Canvas.TextWidth(DrawTextCommand.Text), utPrinterPixels, pprtHorizontal, ppPrinter);

      Result.Top := DrawTextCommand.Height;
      Result.Right := liTextWidth;
      Result.Bottom := DrawTextCommand.Top + DrawTextCommand.Height;

      case (DrawTextCommand.Alignment) of
        taLeftJustify: Result.Left := DrawTextCommand.Left;
        taCenter: Result.Left := (DrawTextCommand.Left + (Round(0.5 * DrawTextCommand.Width))) - (Round(0.5 * liTextWidth));
        taRightJustify: Result.Left := (DrawTextCommand.Left + DrawTextCommand.Width) - liTextWidth;
      end;

    end;

end;

{@TppPDFCustomText.CalcLineHeight

  Calcualte the single line height of the current draw command including leading
  in points.  Use this function to determine the next line position in a memo or
  wrapped text label.}

function TppPDFRendererCustomText.CalcLineHeight: Double;
var
  ldFontHeight: Double;
  ldLeading: Double;
begin

  if not(DrawTextCommand.IsMemo) then
    ldLeading := TppPDFUtils.PixelsToPoints(FTextMetric.tmExternalLeading, FPrinter.PixelsPerInch.Y)
  else
    ldLeading := TppPDFUtils.MicronsToPoints(DrawTextCommand.Leading);

  ldFontHeight := TppPDFUtils.PixelsToPoints(FTextMetric.tmHeight, FPrinter.PixelsPerInch.Y);

  Result := ldFontHeight + ldLeading;

end;

{TppPDFCustomText.ClipText }

procedure TppPDFRendererCustomText.ClipText;
var
  ldTop: Double;
  ldLeft: Double;
  ldBottom: Double;
  ldRight: Double;
  ldWidth: Double;
  ldHeight: Double;
begin

  ldWidth := TppPDFUtils.MicronsToPoints(DrawTextCommand.Width);
  ldHeight := TppPDFUtils.MicronsToPoints(DrawTextCommand.Height);

  ldBottom := PageHeight - TppPDFUtils.MicronsToPoints(DrawTextCommand.Top + DrawTextCommand.Height);
  ldLeft := TppPDFUtils.MicronsToPoints(DrawTextCommand.Left);
  ldTop := ldBottom + ldHeight;
  ldRight := ldLeft + ldWidth;

  Writeline(ExtToStr(ldLeft) + ' ' + ExtToStr(ldTop) + ' m');
  WriteLine(ExtToStr(ldRight - 0.5) + ' ' + ExtToStr(ldTop) + ' l');
  WriteLine(ExtToStr(ldRight - 0.5) + ' ' + ExtToStr(ldBottom) + ' l');
  WriteLine(ExtToStr(ldLeft) + ' ' + ExtToStr(ldBottom) + ' l');
  WriteLine(ExtToStr(ldLeft) + ' ' + ExtToStr(ldTop) + ' l');
  WriteLine('W');
  WriteLine('n');

end;

{TppPDFCustomText.CreateTextBox }

procedure TppPDFRendererCustomText.CreateTextBox;
var
  ldBottom: Double;
  ldLeft: Double;
  ldWidth: Double;
  ldHeight: Double;
  lsBottom: String;
  lsLeft: String;
  lsWidth: String;
  lsHeight: String;
  lsFillColor: String;
  lDrawRect: TRect;
begin

  if DrawTextCommand.AutoSize then
    lDrawRect := CalcAutoBox
  else
    lDrawRect := Rect(DrawTextCommand.Left, DrawTextCommand.Height, DrawTextCommand.Width, DrawTextCommand.Top + DrawTextCommand.Height);

  {Convert to Points}
  lDrawRect.Left := Round(TppPDFUtils.MicronsToPoints(lDrawRect.Left));
  lDrawRect.Top := Round(TppPDFUtils.MicronsToPoints(lDrawRect.Top));
  lDrawRect.Right := Round(TppPDFUtils.MicronsToPoints(lDrawRect.Right));
  lDrawRect.Bottom := Round(TppPDFUtils.MicronsToPoints(lDrawRect.Bottom));

  {Position}
  ldBottom := PageHeight - lDrawRect.Bottom;
  ldLeft := lDrawRect.Left;
  lsBottom := ExtToStr(ldBottom);
  lsLeft := ExtToStr(ldLeft);

  {Dimentions}
  ldWidth := lDrawRect.Right;
  ldHeight := lDrawRect.Top;
  lsWidth := ExtToStr(ldWidth);
  lsHeight := ExtToStr(ldHeight);

  {Color}
  lsFillColor := TppPDFUtils.ConvertRGB(DrawTextCommand.Color);

  {Set the Border Width}
  WriteLine('1 w');

  {Set the Fill Color}
  WriteLine(lsFillColor + ' rg');

  {Draw the Rectangle}
  WriteLine(lsLeft + ' ' + lsBottom + ' ' + lsWidth + ' ' + lsHeight + ' re');
  WriteLine('f');

end;

class function TppPDFRendererCustomText.DrawCommandClass: TppDrawCommandClass;
begin
  Result := TppDrawText;
  
end;

{@TppPDFCustomText.EndText

  Ends the text object (returns to original graphics state).  Call this
  procedure after writing text to the content stream to end the text object. }

procedure TppPDFRendererCustomText.EndText;
var
  lDrawRect: TRect;
begin

  WriteLine('Q');

  if DrawTextCommand.Border.Visible then
    begin
      if DrawTextCommand.AutoSize then
        lDrawRect := CalcAutoBox
      else
        lDrawRect := Rect(DrawTextCommand.Left, DrawTextCommand.Height, DrawTextCommand.Width, DrawTextCommand.Top + DrawTextCommand.Height);

      TppPDFUtils.DrawBorder(MemoryStream, DrawTextCommand, PageHeight, lDrawRect);

    end;

end;

procedure TppPDFRendererCustomText.SetDrawTextCommand(const Value: TppDrawText);
begin
  FDrawText := Value;
end;

procedure TppPDFRendererCustomText.SetFontName(const Value: string);
begin
  FFontName := Value;
end;

{@TppPDFCustomText.StartText

  Begins a text object in PDF.  Call this procedure before writing text to the
  content stream. }

procedure TppPDFRendererCustomText.StartText;
var
  liFontSize: Integer;
begin

  liFontSize := DrawTextCommand.Font.Size;

 {Negative font sizes force the text to appear up side down in PDF}
  if (liFontSize < 0) then
    liFontSize := Abs(liFontSize);

  WriteLine('q');

  {Background Color}
  if (not(DrawTextCommand.Transparent)) then
    CreateTextBox;

  {Truncate the text if the AutoSize property is turned off}
  if (not(DrawTextCommand.AutoSize)) and (not(DrawTextCommand.IsMemo)) then
    ClipText;

  {Font Color}
  FFontColor := TppPDFUtils.ConvertRGB(DrawTextCommand.Font.Color);
  WriteLine(FFontColor + ' rg');

  WriteLine('BT');
  WriteLine('/' + FontName + ' ' + IntToStr(liFontSize) + ' Tf');

end;

{@TppPDFCustomText.StylizeText

  Draw the Underline or Strikeout lines for the given text dimentions.  Adobe
  does not support underlined or strikeout text so this must be done manually.}

procedure TppPDFRendererCustomText.StylizeText(aWidth, aHeight, aBottom, aLeft: Double);
var
  ldVerticalPos: Double;
begin

  if fsUnderline in DrawTextCommand.Font.Style then
    begin
      ldVerticalPos := aBottom - 2;  {TODO: Needs to be FBottomOffset - Descent}

      WriteLine('1 w');

      WriteLine(FFontColor + ' RG');

      WriteLine(ExtToStr(aLeft) + ' ' + ExtToStr(ldVerticalPos) + ' m');
      WriteLine(ExtToStr(aLeft + aWidth) + ' ' + ExtToStr(ldVerticalPos) + ' l');

      WriteLine('S');

    end;

  if fsStrikeOut in DrawTextCommand.Font.Style then
    begin
      ldVerticalPos := aBottom + (aHeight/4);  {TODO: Perhaps CalcLineHeight/4?}

      WriteLine('1 w');

      WriteLine(FFontColor + ' RG');

      WriteLine(ExtToStr(aLeft) + ' ' + ExtToStr(ldVerticalPos) + ' m');
      WriteLine(ExtToStr(aLeft + aWidth) + ' ' + ExtToStr(ldVerticalPos) + ' l');

      WriteLine('S');

    end;

end;

{@TppPDFCustomText.Write }

procedure TppPDFRendererCustomText.RenderToPDF;
var
  lbTrueType: Boolean;
  lPDFFont: TppPDFFont;
  lPDFFontDescriptor: TppPDFFontDescriptor;
  lPDFFontWidths: TppPDFFontWidths;
begin

  inherited;

  FFont := DrawTextCommand.Font;
  FTextMetric := TppPDFUtils.PopulateTextMetric(FFont);
  FPrinter := ppPrinter;

  {Check if font is TrueType}
  lbTrueType := (FTextMetric.tmPitchAndFamily and TMPF_TRUETYPE) = TMPF_TRUETYPE;

  FFontName := TppPDFUtils.ProcessFontName(FFont, lbTrueType);

  StartText;

  if(not(PDFXRef.PDFFontManager.FontExists(FFontName))) then
    begin
      lPDFFont := TppPDFFont.Create;

      lPDFFont.IsTrueType := lbTrueType;

      {Create New Font Dictionary}
      lPDFFont.Font := FFont;
      lPDFFont.FontName := FFontName;
      lPDFFont.TextMetric := FTextMetric;
      PDFXRef.AddObject(TppPDFObject(lPDFFont));
      PDFXRef.PDFFontManager.AddFont(lPDFFont);

      if lbTrueType then
        begin
          {Create New Font Descriptor}
          lPDFFontDescriptor := TppPDFFontDescriptor.Create;
          lPDFFontDescriptor.Font := FFont;
          lPDFFontDescriptor.FontName := FFontName;
          lPDFFontDescriptor.TextMetric := FTextMetric;
          PDFXRef.AddObject(TppPDFObject(lPDFFontDescriptor));
          PDFXRef.PDFFontManager.AddFontDescriptor(lPDFFontDescriptor);

          {Create New Font Widths array}
          lPDFFontWidths := TppPDFFontWidths.Create;
          lPDFFontWidths.Font := FFont;
          lPDFFontWidths.TextMetric := FTextMetric;
          PDFXRef.AddObject(TppPDFObject(lPDFFontWidths));
          PDFXRef.PDFFontManager.AddFontWidths(lPDFFontWidths);
        end;

    end;

end;

procedure TppPDFRendererCustomText.SetDrawCommand(const Value: TppDrawCommand);
begin
  FDrawText := TppDrawText(Value);

end;


end.

{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2003                    BBBBB   }

unit ppPDFFont;

interface

uses
  Classes,
  Windows,
  Graphics,
  ppDevice,
  ppDrwCmd,
  ppPDFObject;

type

  {@TppPDFFont

    Extracts font information from a given font's TextMetric and creates the
    Font Object in PDF.  The font object also references two other objects which
    are handled differently as separate objects.  The two referenced objects
    are:

      - TppPDFFontDescriptor: Further description of the font in use.
      - TppPDFFontWidth: Individual character widths for the font in use.

    Once a font object is created, it is written to a temporary memory stream
    and added to a TList in the TppPDFFontManager class.  Then once all pages
    are generated, each font is written to the PDF file.  This is from the need
    to create and keep track of the fonts being used while generating the
    content stream. }

  {@TppPDFFont.IsTrueType

    True if the font is a Microsoft TrueType font.  These are the most
    promenently used fonts on a Windows platform.  For more information on
    TrueType fonts, see the Windows SDK help. }

  {@TppPDFFont.IsUsed

    True if the font has already been used in another page to prevent the
    creation of duplicate Font objects.  Used with the TppPDFPage Object. }

  {@TppPDFFont.Font

    Reference to the TFont object being used to create the PDF Font object.
    This is the Delphi representation of the font in use. }

  {@TppPDFFont.FontName

    Name of the Font in use, processed so Adobe PDF can read it.  NOTE:  All
    font names must be processed throught the ppPDFUtils.ProcessFontName
    routine.  There are four options for a given font name in PDF:

      - FontName
      - FontName,Bold
      - FontName,Italic
      - FontName,BoldItalic

    All font names must be in lower caps as well.  }

  {@TppPDFFont.TextMetric

    Reference to the TEXTMETRIC structure in the Windows API.  This structure
    contains basic information about a physical font.  For more information on
    the TextMetric structure, see the Windows SDK help. }

  TppPDFFont = class(TppPDFObject)
    private
      FFont: TFont;
      FFontName: String;
      FIsTrueType: Boolean;
      FIsUsed: Boolean;
      FTempFontStream: TMemoryStream;
      FTextMetric: TTextMetric;

      procedure CreateTrueTypeFont;
      procedure CreateType1Font;
      procedure SetFont(const Value: TFont);
      procedure SetFontName(const Value: String);
      procedure SetIsTrueType(const Value: Boolean);
      procedure SetIsUsed(const Value: Boolean);
      procedure SetTextMetric(const Value: TTextMetric);

    public
      constructor Create; override;
      destructor Destroy; override;

      procedure SaveFont(aPosition: Integer);
      procedure Write(aOutputStream: TStream; aReferenceNumber: Integer); override;

      property IsTrueType: Boolean read FIsTrueType write SetIsTrueType;
      property IsUsed: Boolean read FIsUsed write SetIsUsed;
      property Font: TFont read FFont write SetFont;
      property FontName: String read FFontName write SetFontName;
      property TextMetric: TTextMetric read FTextMetric write SetTextMetric;

  end;

implementation

uses
  SysUtils;

{@TppPDFFont.Create

  Creates a new Font object. }

constructor TppPDFFont.Create;
begin
  inherited;

  FFont := TFont.Create;
  FIsUsed := False;
  FIsTrueType := False;
  FTempFontStream := TMemoryStream.Create;

end;

{TppPDFFont.CreateTrueTypeFont

  Write all font information to the temporary stream. }

procedure TppPDFFont.CreateTrueTypeFont;
begin
  WriteMSLine(FTempFontStream, IntToStr(ReferenceNumber) + ' 0 obj');
  WriteMSLine(FTempFontStream, '<< /Type /Font');
  WriteMSLine(FTempFontStream, '/Subtype /TrueType');
  WriteMSLine(FTempFontStream, '/Name /' + FontName);
  WriteMSLine(FTempFontStream, '/BaseFont /' + FontName);
  WriteMSLine(FTempFontStream, '/FirstChar ' + IntToStr(Integer(FTextMetric.tmFirstChar)));
  WriteMSLine(FTempFontStream, '/LastChar ' + IntToStr(Integer(FTextMetric.tmLastChar)));
  WriteMSLine(FTempFontStream, '/FontDescriptor ' + IntToStr(ReferenceNumber + 1) + ' 0 R');
  WriteMSLine(FTempFontStream, '/Widths ' + IntToStr(ReferenceNumber + 2) + ' 0 R');
  WriteMSLine(FTempFontStream, '/Encoding /WinAnsiEncoding');
  WriteMSLine(FTempFontStream, '>>');
  WriteMSLine(FTempFontStream, 'endobj');

end;

{TppPDFFont.CreateType1Font }

procedure TppPDFFont.CreateType1Font;
begin
  WriteMSLine(FTempFontStream, IntToStr(ReferenceNumber) + ' 0 obj');
  WriteMSLine(FTempFontStream, '<< /Type /Font');
  WriteMSLine(FTempFontStream, '/Subtype /Type1');
  WriteMSLine(FTempFontStream, '/Name /' + FontName);
  WriteMSLine(FTempFontStream, '/BaseFont /' + FontName);
  WriteMSLine(FTempFontStream, '/Encoding /WinAnsiEncoding');
  WriteMSLine(FTempFontStream, '>>');
  WriteMSLine(FTempFontStream, 'endobj');

end;

{@TppPDFFont.Destroy

  Automatically called when a TppPDFFont object is freed.  Do not call this
  method directly.  Instead call the Free routine. }

destructor TppPDFFont.Destroy;
begin
  FFont.Free;
  FTempFontStream.Free;

  inherited;
end;

{@TppPDFFont.SaveFont

  Copies the TppPDFFont object from the internal temporary memory stream to the
  main device file stream.  Call once all pages have been generated. }

procedure TppPDFFont.SaveFont(aPosition: Integer);
begin
  ByteOffset := aPosition;

  FTempFontStream.Position := 0;
  OutputStream.CopyFrom(FTempFontStream, FTempFontStream.Size);
end;

procedure TppPDFFont.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TppPDFFont.SetFontName(const Value: String);
begin
  FFontName := Value;
end;

procedure TppPDFFont.SetIsTrueType(const Value: Boolean);
begin
  FIsTrueType := Value;
end;

procedure TppPDFFont.SetIsUsed(const Value: Boolean);
begin
  FIsUsed := Value;
end;

procedure TppPDFFont.SetTextMetric(const Value: TTextMetric);
begin
  FTextMetric := Value;
end;

{@TppPDFFont.Write

  Write instructions in PDF code to the PDF File Stream to create the Font
  Object. }

procedure TppPDFFont.Write(aOutputStream: TStream; aReferenceNumber: Integer);
begin
  inherited;

  if IsTrueType then
    CreateTrueTypeFont
  else
    CreateType1Font;

end;


end.

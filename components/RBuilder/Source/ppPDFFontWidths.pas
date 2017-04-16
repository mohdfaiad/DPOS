{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2003                    BBBBB   }

unit ppPDFFontWidths;

interface

uses
  Classes,
  Windows,
  Graphics,
  ppDevice,
  ppDrwCmd,
  ppPDFObject;

type

  {@TppPDFFontWidths

    Extracts individual font character widths to be placed in an array in the
    PDF file.

    Once a font widths object is created, it is written to a temporary
    memory stream and added to a TList in the TppPDFFontManager class.  Then
    once all pages are generated, each font is written to the PDF file.  This
    is from the need to create and keep track of the fonts being used while
    generating the content stream. }

  {@TppPDFFontWidths.Font

    Reference to the TFont object being used to create the PDF Font Widths
    Object.  This is the Delphi representation of the font in use. }

  {@TppPDFFontWidths.TextMetric

    Reference to the TEXTMETRIC structure in the Windows API.  This structure
    contains basic information about a physical font.  For more information on
    the TextMetric structure, see the Windows SDK help. }
    
  TppPDFFontWidths = class(TppPDFObject)
    private
      FFont: TFont;
      FTempFontWidthsStream: TMemoryStream;
      FTextMetric: TTextMetric;

      procedure CreateFontWidths;
      procedure SetFont(const Value: TFont);
      procedure SetTextMetric(const Value: TTextMetric);

    public
      constructor Create; override;
      destructor Destroy; override;
      
      procedure Write(aOutputStream: TStream; aReferenceNumber: Integer); override;
      procedure SaveFontWidths(aPosition: Integer);

      property Font: TFont read FFont write SetFont;
      property TextMetric: TTextMetric read FTextMetric write SetTextMetric;

  end;

implementation

uses
  SysUtils;

{@TppPDFFontWidths.Create

  Creates a new Font Widths Object.}

constructor TppPDFFontWidths.Create;
begin
  inherited;

  FFont := TFont.Create;
  FTempFontWidthsStream := TMemoryStream.Create;

end;

{TppPDFFontWidths.CreateFontWidths

  Writes each character width in text units to a temporary stream.}

procedure TppPDFFontWidths.CreateFontWidths;
var
  liIndex: Integer;
  lCharArray: array of Integer;
  lFirstChar: Cardinal;
  lLastChar: Cardinal;
  lsWidths: String;
  lBitmap: TBitmap;
begin

  lBitmap := TBitmap.Create;

  try
    lBitmap.Canvas.Font := Font;

    lBitmap.Canvas.Font.Height := -1000;

    lFirstChar := Ord(FTextMetric.tmFirstChar);
    lLastChar := Ord(FTextMetric.tmLastChar);

    SetLength(lCharArray, lLastChar - lFirstChar + 1);

    GetCharWidth(lBitmap.Canvas.Handle, lFirstChar, lLastChar, lCharArray[0]);

  finally
    lBitmap.Free;
  end;

  WriteMSLine(FTempFontWidthsStream, IntToStr(ReferenceNumber) + ' 0 obj');
  WriteMSLine(FTempFontWidthsStream, '[');

  lsWidths := '';

  for liIndex := 0 to Length(lCharArray) - 1 do
    begin
      lsWidths := lsWidths + ExtToStr(lCharArray[liIndex]) + ' ';

      if Length(lsWidths) > 90 then
        begin
          WriteMSLine(FTempFontWidthsStream, lsWidths);
          lsWidths := '';
        end;
    end;

  WriteMSLine(FTempFontWidthsStream, ']');
  WriteMSLine(FTempFontWidthsStream, 'endobj');

end;

{@TppPDFFontWidths.Destroy

  Automatically called when a TppPDFFontWidths object is freed.  Do not call
  this method directly.  Instead call the Free routine.}

destructor TppPDFFontWidths.Destroy;
begin
  FFont.Free;
  FTempFontWidthsStream.Free;

  inherited;
end;

{@TppPDFFontWidths.SaveFontWidths

  Copies the TppPDFFontWidths object from the internal temporary memory
  stream to the main device file stream.  Call once all pages have been
  generated.}

procedure TppPDFFontWidths.SaveFontWidths(aPosition: Integer);
begin
  ByteOffset := aPosition;

  FTempFontWidthsStream.Position := 0;
  OutputStream.CopyFrom(FTempFontWidthsStream, FTempFontWidthsStream.Size);
end;

procedure TppPDFFontWidths.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TppPDFFontWidths.SetTextMetric(const Value: TTextMetric);
begin
  FTextMetric := Value;
end;

{@TppPDFFontWidths.Write

  Write instructions in PDF code to the PDF File Stream to create the Font
  Widths Object. }

procedure TppPDFFontWidths.Write(aOutputStream: TStream; aReferenceNumber: Integer);
begin
  inherited;

  CreateFontWidths;

end;


end.

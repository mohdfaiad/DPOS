{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2005                    BBBBB   }

unit ppPDFRenderer;


interface

uses
  Classes,
  ppDevice,
  ppPDFXRef,
  ppPDFSettings;

type

  TppPDFRendererClass = class of TppPDFRenderer;

  {TppPDFRenderer

    This is an abstract base class.  When a draw command is received by the
    PDF device, the renderer object for the closest ancestor with an associated
    renderer in the class hierarchy is chosen for processing the draw command.

    Use the ExtToStr function when converting floating point numbers to strings
    to ensure the decimal separator is a period (necessary for PDF)

    The WriteLine and WriteMem procedures can be used to easily write instructions
    to the PDF content stream.}

  TppPDFRenderer = class
  private
    FDrawCommand: TppDrawCommand;
    FPDFSettings: TppPDFSettings;
    FPDFXRef: TppPDFXRef;
    FMemoryStream: TMemoryStream;
    FPageHeight: Double;

    procedure SetFPDFXRef(const Value: TppPDFXRef);
    procedure SetMemoryStream(const Value: TMemoryStream);
    procedure SetPageHeight(const Value: Double);
    procedure SetPDFSettings(const Value: TppPDFSettings);

  protected
    function  ExtToStr(aValue: Extended): String;

    procedure SetDrawCommand(const Value: TppDrawCommand); virtual;
    procedure WriteLine(aLine: String);
    procedure WriteMem(aBuffer: String);

  public
    constructor Create; virtual;
    class function DrawCommandClass: TppDrawCommandClass; virtual; abstract;
    procedure RenderToPDF; virtual; abstract;

    property DrawCommand: TppDrawCommand read FDrawCommand write SetDrawCommand;
    property PDFXRef: TppPDFXRef read FPDFXRef write SetFPDFXRef;
    property MemoryStream: TMemoryStream read FMemoryStream write SetMemoryStream;
    property PageHeight: Double read FPageHeight write SetPageHeight;
    property PDFSettings: TppPDFSettings read FPDFSettings write SetPDFSettings;

  end;

implementation

uses
  SysUtils;

constructor TppPDFRenderer.Create;
begin
  inherited;

  FDrawCommand := nil;
  FPDFSettings := nil;
  FPDFXRef := nil;
  FMemoryStream := nil;
  FPageHeight := 0;

end;

function TppPDFRenderer.ExtToStr(aValue: Extended): String;
begin
  Result := FormatFloat('0.0####', aValue);
  Result := StringReplace(Result, DecimalSeparator, '.', []);
end;

procedure TppPDFRenderer.SetDrawCommand(const Value: TppDrawCommand);
begin
  if FDrawCommand <> Value then
    FDrawCommand := Value;

end;

procedure TppPDFRenderer.SetFPDFXRef(const Value: TppPDFXRef);
begin
  if FPDFXRef <> Value then
    FPDFXRef := Value;
    
end;

procedure TppPDFRenderer.SetMemoryStream(const Value: TMemoryStream);
begin
  if FMemoryStream <> Value then
    FMemoryStream := Value;

end;

procedure TppPDFRenderer.SetPageHeight(const Value: Double);
begin
  if FPageHeight <> Value then
    FPageHeight := Value;

end;

procedure TppPDFRenderer.SetPDFSettings(const Value: TppPDFSettings);
begin
  if FPDFSettings <> Value then
    FPDFSettings := Value;

end;

{TppPDFRenderer.WriteLine

  Writes a line of text to the main Device Stream including the Carrage
  Return and Line Feed characters. }

procedure TppPDFRenderer.WriteLine(aLine: String);
begin
  aLine := aLine + #13 + #10;
  FMemoryStream.Write(aLine[1], Length(aLine));

end;

{TppPDFRenderer.WriteMem

  Writes a line of text ot the main Device Stream without the CRLF
  characters. }

procedure TppPDFRenderer.WriteMem(aBuffer: String);
begin
  FMemoryStream.Write(aBuffer[1], Length(aBuffer));

end;


end.

{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2005                    BBBBB   }

unit ppPDFRendererGeneric;

interface

uses
  Classes,
  ppDevice,
  ppPDFRenderer;

  {@TppPDFRendererGeneric

    This TppPDFRenderer descendant is designed to support any draw command
    that is not supported by any other registered renderer. This is achieved by
    creating a screen device in memory to render the draw command to a bitmap. }

type
  TppPDFRendererGeneric = class(TppPDFRenderer)
  private
    FGenericCommandList: TList;
    FGenericRendererList: TList;
  public
    constructor Create; override;
    destructor Destroy; override;
    class function DrawCommandClass: TppDrawCommandClass; override;
    procedure RenderToPDF; override;
  end;

implementation

uses
  Graphics,
  SysUtils,
  ppDrwCmd,
  ppPDFRendererImage,
  ppPDFRendererManager,
  ppPDFUtils;

constructor TppPDFRendererGeneric.Create;
begin
  inherited;

  FGenericCommandList := TList.Create;
  FGenericRendererList := TList.Create;

end;

destructor TppPDFRendererGeneric.Destroy;
var
  liIndex: Integer;
begin

  for liIndex := FGenericCommandList.Count - 1 downto 0 do
    TObject(FGenericCommandList[liIndex]).Free;

  for liIndex := FGenericRendererList.Count - 1 downto 0 do
    TObject(FGenericRendererList[liIndex]).Free;

  FGenericCommandList.Free;
  FGenericCommandList := nil;

  FGenericRendererList.Free;
  FGenericRendererList := nil;

  inherited;
end;

class function TppPDFRendererGeneric.DrawCommandClass: TppDrawCommandClass;
begin
  Result := TppDrawCommand;

end;

{@TppPDFCustomText.Write }

procedure TppPDFRendererGeneric.RenderToPDF;
var
  lBitmap: TBitmap;
  lDrawImage: TppDrawImage;
  lRenderer: TppPDFRendererImage;
begin

  lDrawImage := TppDrawImage.Create(nil);
  lRenderer := TppPDFRendererImage.Create;

  {Convert DrawCommand to bitmap}
  lBitmap := TppPDFUtils.DrawCommandToBitmap(DrawCommand, 100, clWhite);

  try
    lDrawImage.Picture.Bitmap := lBitmap;
    lDrawImage.ImageName := 'ppGeneric' + IntToStr(FGenericCommandList.Count);
    lDrawImage.Width := DrawCommand.Width;
    lDrawImage.Height := DrawCommand.Height;
    lDrawImage.Top := DrawCommand.Top;
    lDrawImage.Left := DrawCommand.Left;

    {Keep track of DrawImage Commands for garbage cleanup}
    FGenericCommandList.Add(TObject(lDrawImage));
    FGenericRendererList.Add(TObject(lRenderer));

    {Draw image to PDF}
    if (lRenderer <> nil) then
      begin
        lRenderer.DrawCommand := lDrawImage;
        lRenderer.MemoryStream := MemoryStream;
        lRenderer.PDFSettings := PDFSettings;
        lRenderer.PDFXRef := PDFXRef;
        lRenderer.PageHeight := PageHeight;
        lRenderer.RenderToPDF;
      end;

  finally
    lBitmap.Free;
  end;

end;

initialization

  TppPDFRendererManager.RegisterRenderer(TppPDFRendererGeneric);

finalization

  TppPDFRendererManager.UnregisterRenderer(TppPDFRendererGeneric);

end.

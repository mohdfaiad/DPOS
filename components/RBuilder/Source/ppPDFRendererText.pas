{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2005                    BBBBB   }

unit ppPDFRendererText;

interface

uses
  Classes,
  ppDevice,
  ppDrwCmd,
  ppPDFRenderer;

type

  {@TppPDFRendererText

    Renderer controler used to determine whether standard or wrapped text should
    be used. }

  TppPDFRendererText = class(TppPDFRenderer)
    private
      FDrawText: TppDrawText;
      FRendererList: TList;

    protected
      procedure SetDrawCommand(const Value: TppDrawCommand); override;
      
    public
      constructor Create; override;
      destructor Destroy; override;
      class function DrawCommandClass: TppDrawCommandClass; override;
      procedure RenderToPDF; override;

  end;

implementation

uses
  ppPDFRendererManager,
  ppPDFRendererStandardText,
  ppPDFRendererWrappedText;


constructor TppPDFRendererText.Create;
begin
  inherited;

  FRendererList := TList.Create;
end;

destructor TppPDFRendererText.Destroy;
var
  liIndex: Integer;
begin

  for liIndex := FRendererList.Count - 1 downto 0 do
    TObject(FRendererList[liIndex]).Free;

  FRendererList.Free;
  FRendererList := nil;

  inherited;
end;

class function TppPDFRendererText.DrawCommandClass: TppDrawCommandClass;
begin
  Result := TppDrawText;
  
end;

{@TppPDFText.RenderToPDF }
procedure TppPDFRendererText.RenderToPDF;
var
  lRenderer: TppPDFRenderer;
begin

  inherited;

  if (FDrawText.WordWrap) or (FDrawText.IsMemo) then
    lRenderer := TppPDFRendererWrappedText.Create
  else
    lRenderer := TppPDFRendererStandardText.Create;

  lRenderer.DrawCommand := FDrawText;
  lRenderer.MemoryStream := MemoryStream;
  lRenderer.PDFSettings := PDFSettings;
  lRenderer.PDFXRef := PDFXRef;
  lRenderer.PageHeight := PageHeight;
  lRenderer.RenderToPDF;

  FRendererList.Add(TObject(lRenderer));
  
end;

procedure TppPDFRendererText.SetDrawCommand(const Value: TppDrawCommand);
begin
  FDrawText := TppDrawText(Value);

end;

initialization

  TppPDFRendererManager.RegisterRenderer(TppPDFRendererText);

finalization

  TppPDFRendererManager.UnregisterRenderer(TppPDFRendererText);

end.

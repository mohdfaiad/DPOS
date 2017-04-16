{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                    BBBBB   }

unit ppBarCode2DDrawCmd;

interface

uses
  Classes,
  Graphics,
  StdCtrls,

  ppSt2DBarC,

  ppTypes,
  ppUtils,
  ppDevice;

type                
  
  {TppDraw2DBarCode}
  TppDraw2DBarCode = class(TppDrawCommand)
  private
    FAlignment: TAlignment;
    FAutoScale: Boolean;
    FAutoSize: Boolean;
    FBackgroundColor: TColor;
    FBarCodeType: Tpp2DBarcodeType;
    FBarHeight: Integer;
    FBarHeightToWidth: Integer;
    FBarWidth: Integer;
    FCaption: string;
    FCaptionLayout: TTextLayout;
    FCarrierCountryCode: Integer;
    FCarrierPostalCode: string;
    FCarrierServiceClass: Integer;
    FColor: TColor;
    FData: String;
    FECCLevel: TStPDF417ECCLevels;
    FExtendedSyntax: Boolean;
    FFont: TFont;
    FHorPixelsPerMM: Extended;
    FMode: TStMaxiCodeMode;
    FNumColumns: Integer;
    FNumRows: Integer;
    FQuietZone: Integer;
    FRelativeBarHeight: Boolean;
    FTransparent: Boolean;
    FTruncated: Boolean;
    FVerPixelsPerMM: Extended;

    function DrawToPrinter(aDevice: TppDevice): Boolean;
    function DrawToScreen(aDevice: TppDevice): Boolean;

  protected
    procedure PropertiesToStBarCode(aStBarCode: TppStCustom2DBarCode);

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    procedure CalcBarCodeSize;
    function  Draw(aDevice: TppDevice): Boolean; override;
    procedure DrawBarCode(aCanvas: TCanvas; aX, aY: Integer);

  published
    property Alignment: TAlignment read FAlignment write FAlignment;
    property AutoScale: Boolean read FAutoScale write FAutoScale;
    property AutoSize: Boolean read FAutoSize write FAutoSize;
    property BackgroundColor: TColor read FBackgroundColor write FBackgroundColor;
    property BarCodeType: Tpp2DBarcodeType read FBarCodeType write FBarCodeType;
    property BarHeight: Integer read FBarHeight write FBarHeight;
    property BarHeightToWidth: Integer read FBarHeightToWidth write FBarHeightToWidth;
    property BarWidth: Integer read FBarWidth write FBarWidth;
    property Caption: string read FCaption write FCaption;
    property CaptionLayout: TTextLayout read FCaptionLayout write FCaptionLayout;
    property CarrierCountryCode: Integer read FCarrierCountryCode write FCarrierCountryCode;
    property CarrierPostalCode: string read FCarrierPostalCode write FCarrierPostalCode;
    property CarrierServiceClass: Integer read FCarrierServiceClass write FCarrierServiceClass;
    property Color: TColor read FColor write FColor;
    property Data: String read FData write FData;
    property ECCLevel: TStPDF417ECCLevels read FECCLevel write FECCLevel;
    property ExtendedSyntax: Boolean read FExtendedSyntax write FExtendedSyntax;
    property Font: TFont read FFont write FFont;
    property HorPixelsPerMM: Extended read FHorPixelsPerMM write FHorPixelsPerMM;
    property Mode: TStMaxiCodeMode read FMode write FMode;
    property NumColumns: Integer read FNumColumns write FNumColumns;
    property NumRows: Integer read FNumRows write FNumRows;
    property QuietZone: Integer read FQuietZone write FQuietZone;
    property RelativeBarHeight: Boolean read FRelativeBarHeight write FRelativeBarHeight;
    property Transparent: Boolean read FTransparent write FTransparent default False;
    property Truncated: Boolean read FTruncated write FTruncated;
    property VerPixelsPerMM: Extended read FVerPixelsPerMM write FVerPixelsPerMM;
    
  end;


  {TppSysToolsBarCodeFactory}
  TppSysToolsBarCodeFactory = class
  public
    class function CreateInstance(aBarCodeType: Tpp2DBarCodeType):
        TppStCustom2DBarcode;
  end;


implementation

uses
  Forms,

  ppPrintr,
  ppPrnDev,
  ppViewr;

{******************************************************************************
 *
 ** S y s T o o l s   B a r C o d e   F a c t o r y
 *
{******************************************************************************}

class function TppSysToolsBarCodeFactory.CreateInstance(aBarCodeType:
    Tpp2DBarCodeType): TppStCustom2DBarcode;
begin

  case aBarCodeType of
    bcPDF417:
      Result := TppStPDF417Barcode.Create(nil);
    else // bcMaxiCode:
      Result := TppStMaxiCodeBarcode.Create(nil);

  end;

end;

{******************************************************************************
 *
 ** D r a w 2 D B a r C o d e
 *
{******************************************************************************}

constructor TppDraw2DBarCode.Create(aOwner: TComponent);
begin
  inherited;

  FFont := TFont.Create;


end;

destructor TppDraw2DBarCode.Destroy;
begin
  FFont.Free;

  inherited;

end;

{@TppDrawCommand.Assign}

procedure TppDraw2DBarCode.Assign(Source: TPersistent);
var
  lDrawBarCode: TppDraw2DBarCode;
begin

  inherited Assign(Source);

  if not(Source is TppDraw2DBarCode) then Exit;

  lDrawBarCode := TppDraw2DBarCode(Source);

  FBarCodeType := lDrawBarCode.BarCodeType;
  FData := lDrawBarCode.Data;
  FAlignment := lDrawBarCode.Alignment;
  FAutoScale := lDrawBarCode.AutoScale;
  FAutoSize := lDrawBarCode.AutoSize;
  FBackgroundColor := lDrawBarCode.BackgroundColor;
  FBarHeight := lDrawBarCode.BarHeight;
  FBarWidth := lDrawBarCode.BarWidth;
  FCaption := lDrawBarCode.Caption;
  FCaptionLayout := lDrawBarCode.CaptionLayout;
  FCarrierCountryCode := lDrawBarCode.CarrierCountryCode;
  FCarrierPostalCode := lDrawBarCode.CarrierPostalCode;
  FCarrierServiceClass := lDrawBarCode.CarrierServiceClass;
  FColor := lDrawBarCode.Color;
  FECCLevel := lDrawBarCode.ECCLevel;
  FExtendedSyntax := lDrawBarCode.ExtendedSyntax;
  FFont.Assign(lDrawBarCode.Font);
  FHorPixelsPerMM := lDrawBarCode.HorPixelsPerMM;
  FMode := lDrawBarCode.Mode;
  FNumColumns := lDrawBarCode.NumColumns;
  FNumRows := lDrawBarCode.NumRows;
  FQuietZone := lDrawBarCode.QuietZone;
  FRelativeBarHeight := lDrawBarCode.RelativeBarHeight;
  FTransparent := lDrawBarCode.Transparent;
  FTruncated := lDrawBarCode.Truncated;
  FVerPixelsPerMM := lDrawBarCode.VerPixelsPerMM;

end; {procedure, Assign}

procedure TppDraw2DBarCode.CalcBarCodeSize;
var
  lBarCode: TppStCustom2DBarcode;
  liTextHeight: Integer;
  lBitmap: TBitmap;
begin

  lBitmap := TBitmap.Create;

  lBarCode := TppSysToolsBarCodeFactory.CreateInstance(FBarCodeType);

  try

    PropertiesToStBarCode(lBarCode);

    lBitmap.Canvas.Font := lBarcode.Font;
    
    liTextHeight := lBitmap.Canvas.TextHeight(Caption);
    if liTextHeight = 0 then
      liTextHeight := QuietZone;

    if FBarCodeType = bcMaxicode then
      begin
        Width := Round(ppFromScreenPixels(lBarCode.Width, utMMThousandths, pprtHorizontal, nil));
        Height := Round(ppFromScreenPixels(lBarCode.Height, utMMThousandths, pprtVertical, nil));
      end
    else
      begin
        Width := Round(ppFromScreenPixels(lBarCode.BarCodeWidth + (QuietZone*2), utMMThousandths, pprtHorizontal, nil));
        Height := Round(ppFromScreenPixels(lBarCode.BarCodeHeight + liTextHeight + (QuietZone*2), utMMThousandths, pprtVertical, nil));
      end;

  finally

    lBarCode.Free;

    lBitmap.Free;

  end;


end;

{------------------------------------------------------------------------------}
{ TppDrawBarCode.Draw }

function TppDraw2DBarCode.Draw(aDevice: TppDevice): Boolean;
begin

  if (aDevice is TppPrinterDevice) then
    Result := DrawToPrinter(aDevice)

  else if (aDevice is TppScreenDevice) then
    Result := DrawToScreen(aDevice)

  else
    Result := False;


end; {function, Draw}


procedure TppDraw2DBarCode.DrawBarCode(aCanvas: TCanvas; aX, aY: Integer);
var
  lBarCode: TppStCustom2DBarcode;
begin

  lBarCode := TppSysToolsBarCodeFactory.CreateInstance(FBarCodeType);

  lBarCode.Width := Trunc(ppFromMMThousandths(Width, utScreenPixels, pprtHorizontal, nil));
  lBarCode.Height := Trunc(ppFromMMThousandths(Height, utScreenPixels, pprtHorizontal, nil));

  // apply properties from drawcommand to the barcode
  PropertiesToStBarCode(lBarCode);

  lBarCode.PaintToCanvas(aCanvas, Point(aX, aY));

  lBarCode.Free;

end;

function TppDraw2DBarCode.DrawToPrinter(aDevice: TppDevice): Boolean;
var
  lPrinterDevice: TppPrinterDevice;
  lPrinter: TppPrinter;
  liTop: Integer;
  liLeft: Integer;
  liXBorderOffset: Integer;
  liYBorderOffset: Integer;
begin

  Result := True;

  lPrinterDevice := TppPrinterDevice(aDevice);
  lPrinter := lPrinterDevice.Printer;

  lPrinterDevice.CalcDrawPosition(Self);

  liTop := DrawTop;
  liLeft := DrawLeft;

  liXBorderOffset := Round(Border.Weight * lPrinter.PixelsPerInch.X / 72);
  liYBorderOffset := Round(Border.Weight * lPrinter.PixelsPerInch.Y / 72);

  if Border.Visible then
    begin
     if (bpTop in Border.BorderPositions) then
       liTop := liTop + liYBorderOffset;

     if (bpLeft in Border.BorderPositions) then
       liLeft := liLeft + liXBorderOffset;
   end;

  DrawBarCode(lPrinterDevice.Canvas, liLeft, liTop);

  if Border.Visible then
    lPrinterDevice.DrawBorder(Self, Rect(DrawLeft, DrawTop, DrawRight, DrawBottom));

end;

function TppDraw2DBarCode.DrawToScreen(aDevice: TppDevice): Boolean;
var
  lScreenDevice: TppScreenDevice;
  lBitmap: TBitmap;
  liBorderOffset: Integer;
begin

  Result := True;

  lScreenDevice := TppScreenDevice(aDevice);

  lBitmap := TBitmap.Create;

  try
    liBorderOffset := Round((Border.Weight * Screen.PixelsPerInch / 72) * lScreenDevice.ScaleX);

    lBitmap.Width := Trunc(ppFromMMThousandths(Width, utScreenPixels, pprtHorizontal, nil));
    lBitmap.Height := Trunc(ppFromMMThousandths(Height, utScreenPixels, pprtVertical, nil));

    DrawBarcode(lBitmap.Canvas, 0, 0);

    if FTransparent then
      lScreenDevice.Canvas.CopyMode := cmSrcAnd
    else
      lScreenDevice.Canvas.CopyMode := cmSrcCopy;

    if Border.Visible then
      begin
        if (bpTop in Border.BorderPositions) then
          DrawTop := DrawTop + liBorderOffset;

        if (bpLeft in Border.BorderPositions) then
          DrawLeft := DrawLeft + liBorderOffset;
      end;

    lScreenDevice.ScaleVertices(Self);

    lScreenDevice.Canvas.StretchDraw(DrawRect, lBitmap);

    if Border.Visible then
      lScreenDevice.DrawBorder(Self, Rect(DrawLeft, DrawTop, DrawRight, DrawBottom));

  finally
    lBitmap.Free;

  end;

end;

procedure TppDraw2DBarCode.PropertiesToStBarCode(aStBarCode: TppStCustom2DBarCode);
begin

  aStBarCode.Alignment := FAlignment;
  aStBarCode.BackgroundColor := FBackgroundColor;
  aStBarCode.BarHeight := FBarHeight;
  aStBarCode.BarWidth := FBarWidth;
  aStBarCode.CaptionLayout := FCaptionLayout;
  aStBarCode.Code := FData;
  aStBarCode.ExtendedSyntax := FExtendedSyntax;
  aStBarCode.RelativeBarHeight := FRelativeBarHeight;
  aStBarCode.QuietZone := FQuietZone;
  aSTBarCode.Caption := FCaption;
  aStBarCode.Color := FColor;
  aStBarCode.Font.Assign(FFont);

  if aStBarCode is TppStPDF417Barcode then
    begin
      TppStPDF417Barcode(aStBarCode).ECCLevel := FECCLevel;
      TppStPDF417Barcode(aStBarCode).NumColumns := FNumColumns;
      TppStPDF417Barcode(aStBarCode).NumRows := FNumRows;
      TppStPDF417Barcode(aStBarCode).Truncated := FTruncated;
    end;

  if aStBarCode is TppStMaxiCodeBarcode then
    begin
      TppStMaxiCodeBarcode(aStBarcode).AutoScale := FAutoScale;
      TppStMaxiCodeBarcode(aStBarcode).CarrierCountryCode := FCarrierCountryCode;
      TppStMaxiCodeBarcode(aStBarcode).CarrierPostalCode := FCarrierPostalCode;
      TppStMaxiCodeBarcode(aStBarcode).CarrierServiceClass := FCarrierServiceClass;
      TppStMaxiCodeBarcode(aStBarcode).HorPixelsPerMM := FHorPixelsPerMM;
      TppStMaxiCodeBarcode(aStBarcode).Mode := FMode;
      TppStMaxiCodeBarcode(aStBarcode).VerPixelsPerMM := FVerPixelsPerMM;
    end;

end;


initialization

  RegisterClasses([TppDraw2DBarCode]);

finalization

  UnRegisterClasses([TppDraw2DBarCode]);


end.

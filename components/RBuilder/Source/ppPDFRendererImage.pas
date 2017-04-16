{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2005                    BBBBB   }

unit ppPDFRendererImage;

interface

uses
  Classes,
  Graphics,
  SysUtils,
  ExtCtrls,
  ppDevice,
  ppDrwCmd,
  ppPDFRenderer;

type

  {@TppPDFImage

    Processes image properties and writes PDF instructions to render an image
    on a page inside the page's content stream.

    Each unique image must have a unique name to define the image by as well
    as the page number that the image resides. }

  TppPDFRendererImage = class(TppPDFRenderer)
    private
      FDrawImage: TppDrawImage;
      FImageBottom: Double;
      FImageHeight: Double;
      FImageLeft: Double;
      FImageWidth: Double;
      procedure ClipImage;
      procedure CreateImage;
      procedure ProcessImage;
      function Truncated: Boolean;

    protected
      procedure SetDrawCommand(const Value: TppDrawCommand); override;

    public
      class function DrawCommandClass: TppDrawCommandClass; override;

      procedure RenderToPDF; override;

  end;

implementation

uses
  Forms,
  ppUtils,
  ppPDFImage,
  ppPDFUtils,
  ppPDFObject,
  ppPDFXObject,
  ppPDFRendererManager,
  Math,
  Types;

{TppPDFImage.ClipImage

  Define the area in which the PDF engine is allowed to draw in case of a
  truncated image. }

procedure TppPDFRendererImage.ClipImage;
var
  ldTop: Double;
  ldLeft: Double;
  ldBottom: Double;
  ldRight: Double;
  ldWidth: Double;
  ldHeight: Double;
begin

  ldWidth := TppPDFUtils.MicronsToPoints(FDrawImage.Width);
  ldHeight := TppPDFUtils.MicronsToPoints(FDrawImage.Height);

  ldBottom := PageHeight - TppPDFUtils.MicronsToPoints(FDrawImage.Top + FDrawImage.Height);
  ldLeft := TppPDFUtils.MicronsToPoints(FDrawImage.Left);
  ldTop := ldBottom + ldHeight;
  ldRight := ldLeft + ldWidth;

  WriteLine(ExtToStr(ldLeft) + ' ' + ExtToStr(ldTop) + ' m');
  WriteLine(ExtToStr(ldRight) + ' ' + ExtToStr(ldTop) + ' l');
  WriteLine(ExtToStr(ldRight) + ' ' + ExtToStr(ldBottom) + ' l');
  WriteLine(ExtToStr(ldLeft) + ' ' + ExtToStr(ldBottom) + ' l');
  WriteLine(ExtToStr(ldLeft) + ' ' + ExtToStr(ldTop) + ' l');
  WriteLine('W');
  WriteLine('n');

end;

{TppPDFImage.CreateImage

  Write image instructions to Content stream. }

procedure TppPDFRendererImage.CreateImage;
var
  lsBottom: String;
  lsLeft: String;
  lsWidth: String;
  lsHeight: String;
begin

  {Position and Dimentions}
  ProcessImage;

  lsBottom := ExtToStr(FImageBottom);
  lsLeft := ExtToStr(FImageLeft);

  lsWidth := ExtToStr(FImageWidth);
  lsHeight := ExtToStr(FImageHeight);

  {Draw the Image}
  WriteLine(lsWidth + ' 0 0 ' + lsHeight + ' ' + lsLeft + ' ' + lsBottom + ' cm');
  WriteLine('/' + FDrawImage.ImageName + ' Do');

end;

class function TppPDFRendererImage.DrawCommandClass: TppDrawCommandClass;
begin
  Result := TppDrawImage;
  
end;

{TppPDFImage.ProcessImage

  Process image position and boundaries based on the TppImage.Center,
  TppImage.Stretch, and TppImage.MaintainAspectRatio properties.  There are
  five cases which are defined below. }

procedure TppPDFRendererImage.ProcessImage;
var
  lbCenter: Boolean;
  lbStretch: Boolean;
  lbMaintainAspectRatio: Boolean;
  ldImageHeight: Double;
  ldImageWidth: Double;
  ldBoxHeight: Double;
  ldBoxWidth: Double;
  ldBoxLeft: Double;
  ldBoxBottom: Double;
  ldScaledWidth: Double;
  ldScaledHeight: Double;
  ldAspectRatio: Double;
begin

  lbCenter := FDrawImage.Center;
  lbStretch := FDrawImage.Stretch;
  lbMaintainAspectRatio := FDrawImage.MaintainAspectRatio;

  ldScaledWidth := 0;
  ldScaledHeight := 0;

  ldImageHeight := TppPDFUtils.PixelsToPoints(FDrawImage.Picture.Height, Screen.PixelsPerInch);
  ldImageWidth := TppPDFUtils.PixelsToPoints(FDrawImage.Picture.Width, Screen.PixelsPerInch);
  ldBoxHeight := TppPDFUtils.MicronsToPoints(FDrawImage.Height);
  ldBoxWidth := TppPDFUtils.MicronsToPoints(FDrawImage.Width);
  ldBoxLeft := TppPDFUtils.MicronsToPoints(FDrawImage.Left);
  ldBoxBottom := RoundTo(PageHeight - TppPDFUtils.MicronsToPoints(FDrawImage.Top + FDrawImage.Height), -2);

  if lbMaintainAspectRatio then
    begin
      ldAspectRatio := ppCalcAspectRatio(ldImageWidth, ldImageHeight, ldBoxWidth, ldBoxHeight);

      ldScaledWidth  := ldImageWidth  * ldAspectRatio;
      ldScaledHeight := ldImageHeight * ldAspectRatio;
    end;

  {Center ( ), Stretch ( ), Aspect ( )}
  if (not(lbCenter)) and (not(lbStretch)) then
    begin
      FImageBottom := RoundTo(PageHeight - (TppPDFUtils.MicronsToPoints(FDrawImage.Top) + ldImageHeight), -2);
      FImageLeft := TppPDFUtils.MicronsToPoints(FDrawImage.Left);
      FImageWidth := ldImageWidth;
      FImageHeight := ldImageHeight;
    end

  {Center (X), Stretch ( ), Aspect ( )}
  else if (lbCenter) and (not(lbStretch)) then
    begin
      FImageBottom := ldBoxBottom + ((1/2) * ldBoxHeight) - ((1/2) * TppPDFUtils.PixelsToPoints(FDrawImage.Picture.Height, Screen.PixelsPerInch));
      FImageLeft := ldBoxLeft + ((1/2) * ldBoxWidth) - ((1/2) * TppPDFUtils.PixelsToPoints(FDrawImage.Picture.Width, Screen.PixelsPerInch));
      FImageWidth := ldImageWidth;
      FImageHeight := ldImageHeight;
    end

  {Center ( ), Stretch (X), Aspect (X)}
  else if (not(lbCenter)) and (lbStretch) and (lbMaintainAspectRatio) then
    begin
      FImageBottom := (ldBoxBottom + ldBoxHeight) - ldScaledHeight;
      FImageLeft := ldBoxLeft;
      FImageWidth := ldScaledWidth;
      FImageHeight := ldScaledHeight;
    end

  {Center ( ), Stretch (X), Aspect ( )}
  else if (lbStretch) and (not(lbMaintainAspectRatio)) then
    begin
      FImageBottom := ldBoxBottom;
      FImageLeft := ldBoxLeft;
      FImageWidth := ldBoxWidth;
      FImageHeight := ldBoxHeight;
    end

  {Center (X), Stretch (X), Aspect (X)}
  else
    begin
      if (ldBoxWidth <= ldBoxHeight) then
        begin
          FImageBottom := (ldBoxBottom + ((1/2) * ldBoxHeight)) - ((1/2) * ldScaledHeight);
          FImageLeft := ldBoxLeft;
          FImageWidth := ldScaledWidth;
          FImageHeight := ldScaledHeight;
        end
      else
        begin
          FImageBottom := ldBoxBottom;
          FImageLeft := (ldBoxLeft + ((1/2) * ldBoxWidth)) - ((1/2) * ldScaledWidth);
          FImageWidth := ldScaledWidth;
          FImageHeight := ldScaledHeight;
        end;
    end;

end;

{TppPDFImage.Truncated

  True if the image has been truncated. }

function TppPDFRendererImage.Truncated: Boolean;
var
  liControlWidth: Integer;
  liControlHeight: Integer;
begin

  liControlWidth := TppPDFUtils.MicronsToPixels(FDrawImage.Width);
  liControlHeight := TppPDFUtils.MicronsToPixels(FDrawImage.Height);

  Result := (liControlWidth < FDrawImage.Picture.Width) or (liControlHeight < FDrawImage.Picture.Height);

end;

{@TppPDFImage.RenderToPDF

  Write instructions in PDF code to the Content Stream to render an image
  object to the PDF File.}

procedure TppPDFRendererImage.RenderToPDF;
var
  lDrawRect: TRect;
  lPDFImage: TppPDFImage;
  lPDFXObject: TppPDFXObject;
begin

  {Check for empty image}
  if (FDrawImage.Picture = nil) or (FDrawImage.Picture.Graphic = nil) or (FDrawImage.Picture.Graphic.Empty) then Exit;

  inherited;

  lPDFImage := TppPDFImage.Create;

  lPDFImage.ImagePage := PDFXRef.PageCount;

  if PDFSettings.OptimizeImageExport then
    begin
      lPDFImage.ImageName := FDrawImage.ImageName;
      {If this is a new image, reference a new XObject, else use the proper XObject reference}
      if(not(PDFXRef.PDFImageManager.ImageExists(FDrawImage.ImageName))) then
        begin
          lPDFImage.FirstImage := True;
          lPDFImage.ReferenceNumber := PDFXRef.PDFObjectCount + 1;
        end
      else
        lPDFImage.ReferenceNumber := PDFXRef.PDFImageManager.ImageReferenceForName(FDrawImage.ImageName)
    end
  else
    begin
      lPDFImage.FirstImage := True;
      lPDFImage.ReferenceNumber := PDFXRef.PDFObjectCount + 1;
      lPDFImage.ImageName := FDrawImage.ImageName + IntToStr(lPDFImage.ReferenceNumber);
    end;

  WriteLine('q');

  if (Truncated) and (not(FDrawImage.Stretch)) then
    ClipImage;    

  CreateImage;

  WriteLine('Q');

  if FDrawImage.Border.Visible then
    begin
      lDrawRect := Rect(FDrawImage.Left, FDrawImage.Height, FDrawImage.Width, FDrawImage.Top + FDrawImage.Height);
      TppPDFUtils.DrawBorder(MemoryStream, FDrawImage, PageHeight, lDrawRect);
    end;

  {Create XObject}
  if(lPDFImage.FirstImage) then
    begin
      lPDFXObject := TppPDFXObject.Create;

      lPDFXObject.DrawImageCommand := FDrawImage;
      lPDFXObject.CompressionLevel := PDFSettings.CompressionLevel;
      lPDFXObject.ScaleImages := PDFSettings.ScaleImages;
      PDFXRef.AddObject(TppPDFObject(lPDFXObject));

    end;

    PDFXRef.PDFImageManager.AddImage(lPDFImage);

end;

procedure TppPDFRendererImage.SetDrawCommand(const Value: TppDrawCommand);
begin
  FDrawImage := TppDrawImage(Value);

end;

initialization

  TppPDFRendererManager.RegisterRenderer(TppPDFRendererImage);

finalization

  TppPDFRendererManager.UnregisterRenderer(TppPDFRendererImage);

end.

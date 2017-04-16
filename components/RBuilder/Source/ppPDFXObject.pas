{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2003                    BBBBB   }

unit ppPDFXObject;

interface

uses
  Classes,
  Graphics,
  ppDevice,
  ppDrwCmd,
  ppPDFObject,
  ppZLib;

type

  {@TppPDFXObject

    This class takes an image object and streams it into a format that can be
    read by a PDF reader.  All XObject streams are compressed for optimization.
    This class will support any image type that descends from the TImage Class. }

  {@TppPDFXObject.CompressionLevel

    Compression level for the images.  The user has the option to compress the
    images in four levels... clNone, clFastest, clDefault, and clMax. }

  {@TppPDFXObject.DrawImageCommand

    Reference to the TppDrawImage class that holds all image information
    including a handle to the actual image file/stream. }

  {@TppPDFXObject.ScaleImages

    Option to scale images with a smaller control box than the actual size.
    This option reduces image quality when zoomed but preserves space when
    large images need to be resized.  This device will only scale images with
    the following specifications:

     1. Image Width is smaller than its original graphic size (and/or)
        image Height is smaller than its original graphic size.
     2. Stretching has been enabled. }
    
  TppPDFXObject = class(TppPDFObject)
    private
      FCompressionLevel: TppCompressionLevel;
      FDrawImage: TppDrawImage;
      FImageName: String;
      FScaleImages: Boolean;
      FTempImageStream: TMemoryStream;

      procedure CreateXObject;
      procedure ProcessImageStream(aBitmap: TBitmap);
      procedure SetCompressionLevel(const Value: TppCompressionLevel);
      procedure SetDrawImageCommand(const Value: TppDrawImage);
      procedure SetScaleImages(const Value: Boolean);

      function CreateScaledImage(aBitmap: TBitmap): TBitmap;
      function GetGraphicAsBitmap: TBitmap;
      function SmallerScale: Boolean;

    public
      destructor Destroy; override;

      procedure SaveXObject(aPosition: Integer);
      procedure Write(aOutputStream: TStream; aReferenceNumber: Integer); override;

      property CompressionLevel: TppCompressionLevel read FCompressionLevel write SetCompressionLevel;
      property DrawImageCommand: TppDrawImage read FDrawImage write SetDrawImageCommand;
      property ScaleImages: Boolean read FScaleImages write SetScaleImages;

  end;


implementation

uses
  SysUtils,
  Math,
  ppPDFUtils,
  Types;


destructor TppPDFXObject.Destroy;
begin
  FTempImageStream.Free;

  {DeleteFile(FImageName + '.tmp');}

  inherited;
end;

{TppPDFXObject.CreateXObject

  Creates the entire PDF XObject and writes it to a temporary memory stream to
  later be compressed and written to the main PDF file stream. }

procedure TppPDFXObject.CreateXObject;
var
  lBitmap: TBitmap;
  lScaledBitmap: TBitmap;
  liEndPosition: Integer;
  liLengthPosition: Integer;
  liStartPosition: Integer;
  liStreamSize: Integer;
  lbFreeBitmap: Boolean;
begin

  lbFreeBitmap := False;

  {Convert Image to bitmap}
  if (DrawImageCommand.Picture.Graphic is TBitmap) then
    lBitmap := DrawImageCommand.Picture.Bitmap
  else
    begin
      lBitmap := GetGraphicAsBitmap;
      lbFreeBitmap := True;
    end;

  lScaledBitmap := nil;

  try
    {Scale the image if needed}
    if((ScaleImages) and (SmallerScale) and (DrawImageCommand.Stretch)) then
      begin
        lScaledBitmap := CreateScaledImage(lBitmap);
        lBitmap.Assign(lScaledBitmap);
      end;

    TppPDFUtils.WriteLine(FTempImageStream, IntToStr(ReferenceNumber) + ' 0 obj');
    TppPDFUtils.WriteLine(FTempImageStream, '<< /Type /XObject');
    TppPDFUtils.WriteLine(FTempImageStream, '/Subtype /Image');
    TppPDFUtils.WriteLine(FTempImageStream, '/Width ' + IntToStr(lBitmap.Width));
    TppPDFUtils.WriteLine(FTempImageStream, '/Height ' + IntToStr(lBitmap.Height));
    TppPDFUtils.WriteLine(FTempImageStream, '/Filter /FlateDecode');

    if (lBitmap.PixelFormat = pf1bit) then
      begin
        TppPDFUtils.WriteLine(FTempImageStream, '/ColorSpace /DeviceGray');
        TppPDFUtils.WriteLine(FTempImageStream, '/BitsPerComponent 1');
      end
    else
      begin
        TppPDFUtils.WriteLine(FTempImageStream, '/ColorSpace /DeviceRGB');
        TppPDFUtils.WriteLine(FTempImageStream, '/BitsPerComponent 8');
      end;

    TppPDFUtils.WriteMem(FTempImageStream, '/Length ');
    liLengthPosition := FTempImageStream.Position;
    TppPDFUtils.WriteLine(FTempImageStream, '         ');
    TppPDFUtils.WriteLine(FTempImageStream, '>>');

    {Start Stream}
    TppPDFUtils.WriteLine(FTempImageStream, 'stream');

    liStartPosition := FTempImageStream.Position;

    {Write image byte stream to file}
    ProcessImageStream(lBitmap);

  finally
    lScaledBitmap.Free;

    if lbFreeBitmap then
      lBitmap.Free;
  end;

  TppPDFUtils.WriteMem(FTempImageStream, #13#10);

  liEndPosition := FTempImageStream.Position;

  TppPDFUtils.WriteLine(FTempImageStream, 'endstream');
  TppPDFUtils.WriteLine(FTempImageStream, 'endobj');

  {Calculate and insert stream length}
  liStreamSize := liEndPosition - liStartPosition;
  FTempImageStream.Seek(liLengthPosition, 0);
  TppPDFUtils.WriteMem(FTempImageStream, IntToStr(liStreamSize));

end;

{TppPDFXObject.ProcessImageStream }

procedure TppPDFXObject.ProcessImageStream(aBitmap: TBitmap);
var
  lBuffer: String;
  liBufferPos: Integer;
  liHeightPixels: Integer;
  liIndex: Integer;
  lRow: PByteArray;
  liRows: Integer;
  lTemp: Char;
  lTempMemoryStream: TMemoryStream;
  liWidthBytes: Integer;
  liWidthPixels: Integer;
begin

  liHeightPixels := aBitmap.Height;

  if (aBitmap.PixelFormat = pf1bit) then
    begin
      liWidthPixels := Ceil(aBitmap.Width / 8);
      liWidthBytes := liWidthPixels;

    end
  else
    begin
      aBitmap.PixelFormat := pf24bit;
      liWidthPixels := aBitmap.Width;
      liWidthBytes := liWidthPixels * 3;  {Byte Width: 'rgb' for each pixel}

    end;

  SetLength(lBuffer, liWidthBytes);

  {Create temp memory stream for compression}
  lTempMemoryStream := TMemoryStream.Create;

  try
    for liRows := 0 to liHeightPixels - 1 do
      begin
        lRow := PByteArray(aBitmap.ScanLine[liRows]);

        Move(lRow^, PChar(lBuffer)^, liWidthBytes);

        if (aBitmap.PixelFormat = pf1bit) then
          begin

          end
        else
          begin
            {Swap Red and Blue byte for each pixel}
            for liIndex := 0 to liWidthPixels - 1 do
              begin
                liBufferPos := liIndex * 3;
                lTemp := lBuffer[liBufferPos + 3];
                lBuffer[liBufferPos + 3] := lBuffer[liBufferPos + 1];
                lBuffer[liBufferPos + 1] := lTemp;

              end;

          end;

        lTempMemoryStream.Write(lBuffer[1], liWidthBytes);

      end;

    {Compress the image}
    TppPDFUtils.CompressStream(lTempMemoryStream, CompressionLevel);

    {Save Compressed Image to File Stream}
    lTempMemoryStream.SaveToStream(FTempImageStream);

  finally
    lTempMemoryStream.Free;

  end;

end;

{TppPDFXObject.SaveXObject }

procedure TppPDFXObject.SaveXObject(aPosition: Integer);
begin
  ByteOffset := aPosition;

  FTempImageStream.Position := 0;
  OutputStream.CopyFrom(FTempImageStream, FTempImageStream.Size);

end;

procedure TppPDFXObject.SetDrawImageCommand(const Value: TppDrawImage);
begin
  FDrawImage := Value;

end;

{TppPDFXObject.CreateScaledImage }

function TppPDFXObject.CreateScaledImage(aBitmap: TBitmap): TBitmap;
var
  liControlHeight: Integer;
  liControlWidth: Integer;
  lImageRect: TRect;
begin

  Result := TBitmap.Create;

  liControlHeight := TppPDFUtils.MicronsToPixels(DrawImageCommand.Height);
  liControlWidth := TppPDFUtils.MicronsToPixels(DrawImageCommand.Width);

  Result.Height := liControlHeight;
  Result.Width := liControlWidth;

  lImageRect := Rect(0, 0, liControlWidth, liControlHeight);

  Result.Canvas.StretchDraw(lImageRect, aBitmap);

end;

{TppPDFXObject.GetGraphicAsBitmap }

function TppPDFXObject.GetGraphicAsBitmap: TBitmap;
var
  lBitmap: TBitmap;
begin

  {create bmp}
  lBitmap := TBitmap.Create;

  try

    lBitmap.Width   := DrawImageCommand.Picture.Graphic.Width;
    lBitmap.Height  := DrawImageCommand.Picture.Graphic.Height;
    lBitmap.Palette := DrawImageCommand.Picture.Graphic.Palette;
    lBitmap.HandleType := bmDIB;

    {draw graphic to bmp}
    lBitmap.Canvas.Draw(0, 0, DrawImageCommand.Picture.Graphic);

  except
    try
      lBitmap.Width   := Trunc(DrawImageCommand.Picture.Graphic.Width  * 0.25);
      lBitmap.Height  := Trunc(DrawImageCommand.Picture.Graphic.Height * 0.25);
      lBitmap.Palette := DrawImageCommand.Picture.Graphic.Palette;
      lBitmap.HandleType := bmDIB;

      {draw graphic to bmp}
      lBitmap.Canvas.StretchDraw(Rect(0, 0,lBitmap.Width,lBitmap.Height), DrawImageCommand.Picture.Graphic);

    except

      lBitmap.Free;
      lBitmap := nil;
    end;

  end;

  Result := lBitmap;

end;

{TppPDFXObject.SmallerScale

  Returns True if the control box for the image is smaller than the acutal
  image. }

function TppPDFXObject.SmallerScale: Boolean;
var
  liControlHeight: Integer;
  liControlWidth: Integer;
  liImageHeight: Integer;
  liImageWidth: Integer;
begin

  liControlHeight := TppPDFUtils.MicronsToPixels(DrawImageCommand.Height);
  liControlWidth := TppPDFUtils.MicronsToPixels(DrawImageCommand.Width);
  liImageHeight := DrawImageCommand.Picture.Graphic.Height;
  liImageWidth := DrawImageCommand.Picture.Graphic.Width;

  Result := False;

  if (liControlHeight < liImageHeight) or (liControlWidth < liImageWidth)  then
    Result := True;

end;

{@TppPDFXObject.Write}

procedure TppPDFXObject.Write(aOutputStream: TStream; aReferenceNumber: Integer);
begin
  inherited;

  FImageName := FDrawImage.ImageName;

  FTempImageStream := TMemoryStream.Create;

  {Changed this to a memory stream so the Server edition would not have any
   write access issues when exporting to PDF.}
  {FTempImageStream := TFileStream.Create(FImageName + '.tmp', fmCreate or fmOpenReadWrite); }

  CreateXObject;

end;

procedure TppPDFXObject.SetCompressionLevel(const Value: TppCompressionLevel);
begin
  FCompressionLevel := Value;
end;

procedure TppPDFXObject.SetScaleImages(const Value: Boolean);
begin
  FScaleImages := Value;
end;


end.

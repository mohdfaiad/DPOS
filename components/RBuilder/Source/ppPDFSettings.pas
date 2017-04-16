{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                    BBBBB   }

unit ppPDFSettings;

interface

uses
  Classes,
  ppComm,
  ppTypes,
  ppZLib;

type
  {@TppPDFSettings

    Contains settings used to control the creation of PDF documents.

    Use the Author and Title properties to embed decriptive information in the
    PDF document. This can be viewed by selecting File | from Adobe Acrobat
    Reader.

    Use OpenPDFFile to control whether Adobe Acrobate Reader is automatically
    launched when the PDF file is created by the report.}

  {@TppPDFSettings.Author

    The name of the person who created the document. }

  {@TppPDFSettings.CompressionLevel

    Compression Level setting for the image and content streams of the PDF file.
    The user has the option of compressing images and content instructions at
    four differen levels

    <Table>
    Value	        Meaning
    ---------     -----
    clNone	      No compression; data is merely copied to the output stream.
    clFastest	    Specifies fastest compression, resulting in a larger archive.
    clDefault	    Compromise between speed and amount of compression.
    clMax	        Maximum compression, resulting in a longer generation time.
    </Table> }

  {@TppPDFSettings.Keywords

    Keywords associated with the document. }

  {@TppPDFSettings.OpenPDFFile

    Setting this property to True will automatically open and view the PDF
    file with the default PDF viewer defined by Windows (Usually Adobe Acrobat
    Reader). }

  {@TppPDFSettings.OptimizeImageExport

    Run-time only.

    In order to keep the PDF file size small, the PDF device by default uses the
    same image data for identical images.  In some cases (i.e. when drawing
    directly to the printer canvas) the image name is not unique.  Setting this
    property to false removes this optimization feature and prints each unique
    image separately in the PDF file. }

  {@TppPDFSettings.Subject

    The Subject of the document. }

  {@TppPDFSettings.ScaleImages

    Option to scale images with a smaller control box than the actual size.
    This option reduces image quality but preserves space when
    large images need to be resized.  This device will only scale images with
    the following specifications:

     1. Image Width is smaller than its original graphic size (and/or)
        image Height is smaller than its original graphic size.
     2. Stretching has been enabled. }

  {@TppPDFSettings.Title

    The document's title. }

  TppPDFSettings = class(TPersistent)
    private
      FAuthor: String;
      FCompressionLevel: TppCompressionLevel;
      FKeywords: String;
      FOpenPDFFile: Boolean;
      FOptimizeImageExport: Boolean;
      FScaleImages: Boolean;
      FSubject: String;
      FTitle: String;

      procedure SetAuthor(const Value: String);
      procedure SetCompressionLevel(const Value: TppCompressionLevel);
      procedure SetKeywords(const Value: String);
      procedure SetOpenPDFFile(const Value: Boolean);
      procedure SetSubject(const Value: String);
      procedure SetTitle(const Value: String);
      procedure SetScaleImages(const Value: Boolean);

    public
      constructor Create;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      property OptimizeImageExport: Boolean read FOptimizeImageExport write FOptimizeImageExport default True;

    published
      property Author: String read FAuthor write SetAuthor;
      property CompressionLevel: TppCompressionLevel read FCompressionLevel write SetCompressionLevel default clDefault;
      property Keywords: String read FKeywords write SetKeywords;
      property OpenPDFFile: Boolean read FOpenPDFFile write SetOpenPDFFile default False;
      property ScaleImages: Boolean read FScaleImages write SetScaleImages default True;
      property Subject: String read FSubject write SetSubject;
      property Title: String read FTitle write SetTitle;

  end;

implementation

uses
  SysUtils;

constructor TppPDFSettings.Create;
begin
  inherited Create;

  FScaleImages := True;
  FCompressionLevel := clDefault;
  FOpenPDFFile := False;
  FOptimizeImageExport := True;

end;

destructor TppPDFSettings.Destroy;
begin

  inherited Destroy;
end;

{@TppPDFSettings.Assign

  Assigns all published properties to a TppPDFSettings object. }

procedure TppPDFSettings.Assign(Source: TPersistent);
var
  lSettings: TppPDFSettings;
begin

  lSettings := TppPDFSettings(Source);

  FAuthor := lSettings.FAuthor;
  FCompressionLevel := lSettings.FCompressionLevel;
  FKeywords := lSettings.FKeywords;
  FOpenPDFFile := lSettings.FOpenPDFFile;
  FScaleImages := lSettings.FScaleImages;
  FSubject := lSettings.FSubject;
  FTitle := lSettings.FTitle;

end;

procedure TppPDFSettings.SetAuthor(const Value: String);
begin
  FAuthor := Value;
end;

procedure TppPDFSettings.SetCompressionLevel(const Value: TppCompressionLevel);
begin
  FCompressionLevel := Value;
end;

procedure TppPDFSettings.SetKeywords(const Value: String);
begin
  FKeywords := Value;
end;

procedure TppPDFSettings.SetSubject(const Value: String);
begin
  FSubject := Value;
end;

procedure TppPDFSettings.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

procedure TppPDFSettings.SetOpenPDFFile(const Value: Boolean);
begin
  FOpenPDFFile := Value;
end;

procedure TppPDFSettings.SetScaleImages(const Value: Boolean);
begin
  FScaleImages := Value;
end;

initialization
  RegisterClass(TppPDFSettings);

finalization
  UnregisterClass(TppPDFSettings);

end.

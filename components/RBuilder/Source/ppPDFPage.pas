{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2003                    BBBBB   }

unit ppPDFPage;

interface

uses
  Classes,
  SysUtils,
  ppPDFObject,
  ppPDFXref;

type

  {@TppPDFPage

    Creates a PDF page object.  Each page object must reference its parent (i.e.
    the Page Tree), the ProcSet and the Page Content Stream.  In addition to
    these required references, each page object must also reference all Fonts
    and XObjects used. }

  {@TppPDFPage.PageHeight

    Height of the current page in Points. }

  {@TppPDFPage.PageWidth

    Width of the current page in Points. }

  {@TppPDFPage.PageTreeReference

    PDF Object reference to the location of the Page Tree. }

  {@TppPDFPage.ProcSetReference

    PDF Object reference to the location of the ProcSet. }

  TppPDFPage = class(TppPDFObject)
    private
      FPageTreeReference: Integer;
      FProcSetReference: Integer;
      FGStateReference: Integer;
      FPageHeight: Double;
      FPageWidth: Integer;

      procedure SetPageTreeReference(const Value: Integer);
      procedure SetProcSetReference(const Value: Integer);
      procedure SetGStateReference(const Value: Integer);
      procedure SetPageHeight(const Value: Double);
      procedure SetPageWidth(const Value: Integer);

    public
      procedure CreatePage(aXref: TppPDFXref);
      procedure Write(aOutputStream: TStream; aReferenceNumber: Integer); override;

      property PageHeight: Double read FPageHeight write SetPageHeight;
      property PageWidth: Integer read FPageWidth write SetPageWidth;
      property PageTreeReference: Integer read FPageTreeReference write SetPageTreeReference;
      property ProcSetReference: Integer read FProcSetReference write SetProcSetReference;
      property GStateReference: Integer read FGStateReference write SetGStateReference;

      
  end;

implementation

uses
  ppPDFImage,
  ppPDFFont;

procedure TppPDFPage.SetPageHeight(const Value: Double);
begin
  FPageHeight := Value;
end;

procedure TppPDFPage.SetPageTreeReference(const Value: Integer);
begin
  FPageTreeReference := Value;
end;

procedure TppPDFPage.SetPageWidth(const Value: Integer);
begin
  FPageWidth := Value;
end;

procedure TppPDFPage.SetProcSetReference(const Value: Integer);
begin
  FProcSetReference := Value;
end;

procedure TppPDFPage.SetGStateReference(const Value: Integer);
begin
  FGStateReference := Value;
end;

{@TppPDFPage.CreatePage

  Write the current page to the main Device Stream.  This method requires
  the current TppPDFXref object to access the Font and Image Managers. }

procedure TppPDFPage.CreatePage(aXref: TppPDFXref);
var
  liFontsPerPage: Integer;
  liFontReference: Integer;
  lsFontName: String;
  lFont: TppPDFFont;
  lImage: TppPDFImage;
  liImageReference: Integer;
  lsImageName: String;
  liIndex: Integer;
  liImagesPerPage: Integer;
begin

  liImagesPerPage := 0;
  liFontsPerPage := 0;

  WriteLine(IntToStr(ReferenceNumber) + ' 0 obj');
  WriteLine('<< /Type /Page');
  WriteLine('/Parent ' + IntToStr(FPageTreeReference) + ' 0 R');
  WriteLine('/MediaBox [0 0 ' + IntToStr(FPageWidth) + ' ' + ExtToStr(FPageHeight) + ']');
  WriteLine('/Resources <<');

  WriteLine('/XObject <<');
  for liIndex := 0 to aXref.PDFImageManager.PDFImageCount - 1 do
    begin
      lImage := aXref.PDFImageManager.PDFImages[liIndex];
      lsImageName := lImage.ImageName;
      liImageReference := lImage.ReferenceNumber;

      if lImage.ImagePage = aXref.PageCount then
        begin
          WriteLine('/' + lsImageName + ' ' + IntToStr(liImageReference) + ' 0 R');

          if lImage.FirstImage then
            liImagesPerPage := liImagesPerPage + 1;

        end;

    end;
  WriteLine('>>');

  WriteLine('/Font <<');
  for liIndex := 0 to aXref.PDFFontManager.PDFFontCount - 1 do
    begin
      lFont := aXref.PDFFontManager.PDFFonts[liIndex];
      lsFontName := lFont.FontName;
      liFontReference := lFont.ReferenceNumber;

      WriteLine('/' + lsFontName + ' ' + IntToStr(liFontReference) + ' 0 R');

      if (not(lFont.IsUsed)) and (lFont.IsTrueType) then
        begin
          lFont.IsUsed := True;
          liFontsPerPage := liFontsPerPage + 3;  {add 3 to account for Descriptor and Widths}
        end
      else if (not(lFont.IsUsed)) and (not(lFont.IsTrueType)) then
        begin
          lFont.IsUsed := True;
          liFontsPerPage := liFontsPerPage + 1;
        end;

    end;

  WriteLine('>>');

  WriteLine('/ProcSet ' + IntToStr(FProcSetReference) + ' 0 R');
  WriteLine('/ExtGState << /GS1 ' + IntToStr(FGStateReference) + ' 0 R >>');

  WriteLine('>>');
  WriteLine('/Contents ' + IntToStr(ReferenceNumber - liImagesPerPage - liFontsPerPage - 1) + ' 0 R');
  WriteLine('>>');
  WriteLine('endobj');

end;

{@TppPDFPage.Write }

procedure TppPDFPage.Write(aOutputStream: TStream; aReferenceNumber: Integer);
begin
  inherited;

end;

end.

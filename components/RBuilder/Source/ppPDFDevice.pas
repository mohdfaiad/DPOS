{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                    BBBBB   }


unit ppPDFDevice;

interface

uses
  Classes,
  SysUtils,
  ExtCtrls,
  ppFilDev,
  ppDevice,
  ppDrwCmd,
  ppPDFProcSet,
  ppPDFInfo,
  ppPDFCatalog,
  ppPDFPageTree,
  ppPDFXRef,
  ppPDFContent,
  ppPDFPage,
  ppPDFGState,
  ppPDFSettings,
  ppPDFRendererManager,
  ppZLib,
  ShellAPI;

type

  {@TppPDFDevice

    Use PDFDevice to generate reports as PDF content that can be viewed and
    printed by a PDF viewer such as Adobe Acrobat Reader.

    To include PDF support in your applications, add ppPDFDevice to the "uses"
    clause and set TppReport.AllowPrintToFile to True. The user will then be
    able to select PDF from the list of file formats displayed by the print dialog.

    The Report.PDFSettings property provides options for controlling PDF generation.
    Use the Author, Keywords, Subject, and Title properties to define specific
    information about the PDF file being created.  The PDF Device supports other
    features such as compression, image scaling, and automatic open, which can
    be controled using the CompressionLevel, ScaleImages, and OpenPDFFile
    properties.

    The PDF file is opened when the Publisher calls the StartJob method. The PDF
    file is closed when the Publisher calls the EndJob method. If the Publisher
    calls the CancelJob method the file is closed and deleted.

    PDF Example:

    Below is an example of how you might use the PDF Device.  This code will
    automatically export the current report to the defined .pdf file and open
    it using the default PDF viewer (i.e. Acrobat).

    <CODE>

      uses
        ppPDFDevice;

      begin

        ppReport.AllowPrintToFile := True;
        ppReport.ShowPrintDialog := False;
        ppReport.DeviceType := 'PDF';
        ppReport.TextFileName := 'C:\\Temp\\myPDFFile.pdf';

        ppReport.PDFSettings.Author := 'RB Master';
        ppReport.PDFSettings.Title := 'Export to PDF!';
        ppReport.PDFSettings.OpenPDFFile := True;

        ppReport.Print;

      end;

    </CODE>}


  {@TppPDFDevice.PDFSettings

    Contains settings used to control the creation of PDF documents.

    Use the Author and Title properties to embed decriptive information in the
    PDF document. This can be viewed by selecting File | from Adobe Acrobat
    Reader.

    Use OpenPDFFile to control whether Adobe Acrobate Reader is automatically
    launched when the PDF file is created by the report.}


  TppPDFDevice = class(TppFileDevice)
    private
      FContentObject: TppPDFContent;
      FMemoryStream: TMemoryStream;
      FPageHeight: Double;
      FPageObject: TppPDFPage;
      FPDFCatalog: TppPDFCatalog;
      FPDFGState: TppPDFGState;
      FPDFInfo: TppPDFInfo;
      FPDFPageTree: TppPDFPageTree;
      FPDFProcSet: TppPDFProcSet;
      FPDFRendererManager: TppPDFRendererManager;
      FPDFSettings: TppPDFSettings;
      FPDFXRef: TppPDFXref;
      FXRefPos: Integer;
      FWaterMark: TppDrawCommand;

      procedure DrawToPage(aDrawCommand: TppDrawCommand);
      procedure SavePageToFile(aPage: TppPage);
      procedure SetPDFSettings(aPDFSettings: TppPDFSettings);

      function  GetWaterMark(aPage: TppPage): TppDrawCommand;
      function ShellExec(const aPathStr, aCmdStr, aDirStr: string; aShow: Word): Boolean;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function DefaultExt: String; override;
      class function DefaultExtFilter: String; override;
      class function DeviceDescription(aLanguageIndex: Longint): String; override;
      class function DeviceName: String; override;

      procedure CancelJob; override;
      procedure EndJob; override;
      procedure ReceivePage(aPage: TppPage); override;
      procedure StartJob; override;

      property WaterMark: TppDrawCommand read FWaterMark write FWaterMark;

    published
      property PDFSettings: TppPDFSettings read FPDFSettings write SetPDFSettings;

  end;

implementation

uses
  Windows,
  Graphics,
  ppPDFObject,
  ppPDFRenderer,
  ppPDFUtils,
  ppPDFRendererLine,
  ppPDFRendererShape,
  ppPDFRendererImage,
  ppPDFRendererText,
  ppPDFRendererGeneric,
  ppPDFFont,
  ppPDFFontDescriptor,
  ppPDFFontWidths,
  ppPDFXObject,
  ppPrintr,
  ppOutlineDrawCommand,
  ppTypes,
  ppUtils,
  StrUtils;

constructor TppPDFDevice.Create(aOwner: TComponent);
begin
  inherited;

  {Create PDFSettings}
  FPDFSettings := TppPDFSettings.Create;

  {Create Static Objects}
  FPDFProcSet := TppPDFProcSet.Create;
  FPDFGState := TppPDFGState.Create;
  FPDFInfo := TppPDFInfo.Create;
  FPDFCatalog := TppPDFCatalog.Create;
  FPDFPageTree := TppPDFPageTree.Create;

  {Create XRef List}
  FPDFXref := TppPDFXref.Create;

  {Create Renderer Manager}
  FPDFRendererManager := TppPDFRendererManager.Create;

end;

destructor TppPDFDevice.Destroy;
begin

  FPDFXref.Free;
  FPDFXref := nil;

  FPDFSettings.Free;
  FPDFSettings := nil;
  
  inherited;
end;

class function TppPDFDevice.DefaultExt: String;
begin
  Result := 'pdf';
end;

class function TppPDFDevice.DefaultExtFilter: String;
begin
  Result := 'PDF files|*.pdf';
end;

class function TppPDFDevice.DeviceDescription(aLanguageIndex: Integer): String;
begin
  Result := 'PDF File';
end;

class function TppPDFDevice.DeviceName: String;
begin
  Result := 'PDF';
end;

procedure TppPDFDevice.StartJob;
begin
  inherited StartJob;

  {Start PDF File}
  OutputStream.Position := 0;
  FPDFXRef.OutputStream := OutputStream;

  {Header}
  TppPDFUtils.WriteLine(OutputStream, '%PDF-1.3');

  {ProcSet}
  FPDFXref.AddObject(TppPDFObject(FPDFProcSet));

  {Graphics State}
  FPDFXref.AddObject(TppPDFObject(FPDFGState));

  {Info}
  FPDFInfo.Author := FPDFSettings.Author;
  FPDFInfo.Keywords := FPDFSettings.KeyWords;
  FPDFInfo.Subject := FPDFSettings.Subject;
  FPDFInfo.Title := FPDFSettings.Title;
  FPDFXref.AddObject(TppPDFObject(FPDFInfo));

  {Catalog}
  FPDFXref.AddObject(TppPDFObject(FPDFCatalog));

  {PageTree START}
  FPDFXref.AddObject(TppPDFObject(FPDFPageTree));
  FPDFPageTree.StartPageTree;

end;

procedure TppPDFDevice.EndJob;
var
  liIndex: Integer;
  lPDFFont: TppPDFFont;
  lPDFFontDescriptor: TppPDFFontDescriptor;
  lPDFFontWidths: TppPDFFontWidths;
  lPDFXObject: TppPDFXObject;
  lsSize: String;
  liTypeOnes: Integer;
begin

  if (OutputStream = nil) then Exit;

  {PageTree END}
  FPDFPageTree.EndPageTree;

  {XObjects}
  for liIndex := 0 to FPDFXRef.PDFXObjectCount - 1 do
    begin
      lPDFXObject := FPDFXRef.PDFXObjects[liIndex];
      lPDFXObject.SaveXObject(OutputStream.Position);
    end;

  {Fonts}
  liTypeOnes := 0;

  for liIndex := 0 to FPDFXRef.PDFFontManager.PDFFontCount - 1 do
    begin
      lPDFFont := FPDFXRef.PDFFontManager.PDFFonts[liIndex];
      lPDFFont.SaveFont(OutputStream.Position);

      if lPDFFont.IsTrueType then
        begin
          lPDFFontDescriptor := FPDFXRef.PDFFontManager.PDFFontDescriptors[liIndex - liTypeOnes];
          lPDFFontDescriptor.SaveFontDescriptor(OutputStream.Position);
          lPDFFontWidths := FPDFXRef.PDFFontManager.PDFFontWidths[liIndex - liTypeOnes];
          lPDFFontWidths.SaveFontWidths(OutputStream.Position);
        end
      else
        liTypeOnes := liTypeOnes + 1;
        
    end;

  {XRef}
  FXrefPos := OutputStream.Position;
  FPDFXRef.WriteXRef;

  {Trailer}
  lsSize := IntToStr(FPDFXRef.PDFObjectCount + 1);

  TppPDFUtils.WriteLine(OutputStream, 'trailer');
  TppPDFUtils.WriteLine(OutputStream, '<< /Size ' + lsSize);
  TppPDFUtils.WriteLine(OutputStream, '/Info ' + IntToStr(FPDFInfo.ReferenceNumber) + ' 0 R');
  TppPDFUtils.WriteLine(OutputStream, '/Root ' + IntToStr(FPDFCatalog.ReferenceNumber) + ' 0 R');
  TppPDFUtils.WriteLine(OutputStream, '>>');
  TppPDFUtils.WriteLine(OutputStream, 'startxref');
  TppPDFUtils.WriteLine(OutputStream, IntToStr(FXrefPos));
  TppPDFUtils.WriteLine(OutputStream, '%%EOF');

  inherited EndJob;

  if FPDFSettings.OpenPDFFile and FileExists(FileName) then
    ShellExec(FileName, '', ExtractFilePath(FileName), SW_SHOWNORMAL);

end;

procedure TppPDFDevice.CancelJob;
begin
  FreeOutputStream;

  SysUtils.DeleteFile(FileName);

end;

procedure TppPDFDevice.ReceivePage(aPage: TppPage);
var
  lWaterMark: TppDrawCommand;
begin

  inherited ReceivePage(aPage);

  if (IsRequestedPage) then
    begin
      DisplayMessage(aPage);

      if not(IsMessagePage) then
        begin
          lWaterMark := GetWaterMark(aPage);

          if lWaterMark <> nil then
            aPage.AddDrawCommand(lWaterMark);

          SavePageToFile(aPage);

        end;
    end;

end;

{TppPDFDevice.SavePageToFile

  Creates a new Content Stream object and Page object and adds all PDF rendering
  instructions to the content stream for the current page. }

procedure TppPDFDevice.SavePageToFile(aPage: TppPage);
var
  liCommand: Integer;
  liCommands: Integer;
  lDrawCommand: TppDrawCommand;
  lPageWidth: Integer;
begin

  if OutputStream = nil then Exit;

  FPDFXRef.IncPageNumber;

  FPageHeight := TppPDFUtils.MicronsToPoints(aPage.PageDef.mmHeight);
  lPageWidth := Round(TppPDFUtils.MicronsToPoints(aPage.PageDef.mmWidth));

  {Create New Content Object}
  FContentObject := TppPDFContent.Create;
  FMemoryStream := TMemoryStream.Create;

  try
    FContentObject.MemoryStream := FMemoryStream;
    FContentObject.CompressionLevel := FPDFSettings.CompressionLevel;
    FContentObject.Write(OutputStream, FPDFXRef.PDFObjectCount + 1);
    FPDFXRef.AddObject(TppPDFObject(FContentObject));
    FContentObject.StartContentStream;

    {loop through draw commands}
    liCommand  := 0;
    liCommands := aPage.DrawCommandCount;

    while (liCommand <= liCommands - 1) do
      begin
        lDrawCommand := aPage.DrawCommands[liCommand];

        DrawToPage(lDrawCommand);

        liCommand := liCommand + 1;
      end;

    FContentObject.EndContentStream;
  finally
    FMemoryStream.Free;
  end;

  {Create New Page Object}
  FPageObject := TppPDFPage.Create;

  FPageObject.PageTreeReference := FPDFPageTree.ReferenceNumber;
  FPageObject.ProcSetReference := FPDFProcSet.ReferenceNumber;
  FPageObject.GStateReference := FPDFGState.ReferenceNumber;
  FPageObject.PageHeight := FPageHeight;
  FPageObject.PageWidth := lPageWidth;
  FPDFXRef.AddObject(TppPDFObject(FPageObject));
  FPageObject.CreatePage(FPDFXref);

  FPDFPageTree.AddPageChild(FPDFXRef.PDFObjectCount);

end;

{TppPDFDevice.DrawToPage

  Calls the RenderToPDF routine according to the type of draw command sent.  For
  a future release, this method will be in charge of which components are
  generated and which are not.  This will be chosen by the user. }

procedure TppPDFDevice.DrawToPage(aDrawCommand: TppDrawCommand);
var
  lRenderer: TppPDFRenderer;
begin

  if not(aDrawCommand is TppOutlineDrawCommand) then
  begin
    lRenderer := FPDFRendererManager.GetRendererForDrawCommand(aDrawCommand);

    if (lRenderer <> nil) then
      begin
        lRenderer.DrawCommand := aDrawCommand;
        lRenderer.MemoryStream := FMemoryStream;
        lRenderer.PDFSettings := FPDFSettings;
        lRenderer.PDFXRef := FPDFXRef;
        lRenderer.PageHeight := FPageHeight;
        lRenderer.RenderToPDF;
      end;

  end;

end;

function TppPDFDevice.GetWaterMark(aPage: TppPage): TppDrawCommand;
var
  lWaterMark: TppDrawText;
  llPageHeight: Longint;
  llPageWidth: Longint;
  liTextWidth: Integer;
  liTextHeight: Integer;
begin

  if (not(ppValidDate)) then
    begin
      lWaterMark := TppDrawText.Create(aPage);
      lWaterMark.WrappedText.Add('ReportBuilder ' + ppEdition + #153 + ' - Demo Copy');
      lWaterMark.WrappedText.Add('Version ' + ppVersion);
      lWaterMark.WrappedText.Add('Digital Metaphors Corporation');
      lWaterMark.WrappedText.Add('Telephone: 214.239.9471');
      lWaterMark.WrappedText.Add('E-Mail: sales@digital-metaphors.com');
      lWaterMark.Transparent := True;
      lWaterMark.IsMemo      := False;
      lWaterMark.WordWrap    := True;
      lWaterMark.Font.Name   := 'Arial';
      lWaterMark.Font.Size   := 18;
      lWaterMark.Font.Color  := clBlack;
      lWaterMark.Autosize    := True;

      liTextWidth  := 375;
      liTextHeight := 150;

      llPageHeight      := ppPrinter.PrinterSetup.PageDef.mmPrintableHeight;
      llPageWidth       := ppPrinter.PrinterSetup.PageDef.mmPrintableWidth;
      lWaterMark.Height := ppToMMThousandths(liTextHeight, utScreenPixels, pprtHorizontal, nil);
      lWaterMark.Width  := ppToMMThousandths(liTextWidth,  utScreenPixels, pprtHorizontal, nil);

      lWaterMark.Top  := (llPageHeight - lWaterMark.Height)  div 2;
      lWaterMark.Left := (llPageWidth -  lWaterMark.Width )  div 2;

      FWaterMark := lWaterMark;
    end;

  Result := FWaterMark;

end; {function, GetWatermark}

function TppPDFDevice.ShellExec(const aPathStr, aCmdStr, aDirStr: string; aShow: Word): Boolean;
var
  lhInst: THandle;
  lpOperation: array[0..5] of Char;
begin

  StrPCopy(lpOperation, 'open');

  lhInst := ShellExecute(0, lpOperation, PChar(aPathStr), PChar(aCmdStr), PChar(aDirStr), aShow);

  { If 32 or less, an error occurred }
  Result := (lhInst > 32);

end;

procedure TppPDFDevice.SetPDFSettings(aPDFSettings: TppPDFSettings);
begin
  FPDFSettings.Assign(aPDFSettings);
end;


initialization

  ppRegisterDevice(TppPDFDevice);

finalization

  ppUnRegisterDevice(TppPDFDevice);

end.

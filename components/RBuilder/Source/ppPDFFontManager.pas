{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2003                    BBBBB   }

unit ppPDFFontManager;

interface
uses
  Classes,
  ppDevice,
  ppDrwCmd,
  ppPDFFont,
  ppPDFFontDescriptor,
  ppPDFFontWidths;

type

  {@TppPDFFontManager

    This class acts as a container for all complete Font Objects (including
    Font Descriptor, and Font Widths) until they are ready to be written to the
    PDF file toward the end.

    Contains list objects to hold and keep track of all font objects that get
    created in memory during the generation of the Content stream.  }

  {@TppPDFFontManager.PDFFonts

    Reference to a TList that holds every TppPDFFont object that has been added
    to the font manager. }

  {@TppPDFFontManager.PDFFontCount

    Current count of the amount of TppPDFFont objects in the font manager. }

  {@TppPDFFontManager.PDFFontDescriptors

    Reference to the TList that holds every TppPDFFontDescriptor object that has
    been added to the font manager. }

  {@TppPDFFontManager.PDFFontDescriptorCount

    Current count of the amount of the TppPDFFontDescriptor object in the font
    manager. }

  {@TppPDFFontManager.PDFFontWidths

    Reference to the TList that holds every TppPDFWidths object that has been
    added to the font manager. }

  {@TppPDFFontManager.PDFFontWidthsCount

    Current count of the amount of the TppPDFFontWidths object in the font
    manager.}

  TppPDFFontManager = class
    private
      FPDFFontList: TList;
      FPDFFontDescriptorList: TList;
      FPDFFontWidthsList: TList;
      
      function GetPDFFontCount: Integer;
      function GetPDFFontForIndex(aIndex: Integer): TppPDFFont;
      function GetPDFFontDescriptorCount: Integer;
      function GetPDFFontDescriptorForIndex(aIndex: Integer): TppPDFFontDescriptor;
      function GetPDFFontWidthsCount: Integer;
      function GetPDFFontWidthsForIndex(aIndex: Integer): TppPDFFontWidths;

    public
      constructor Create; virtual;
      destructor Destroy; override;

      procedure AddFont(aPDFFont: TppPDFFont);
      procedure AddFontDescriptor(aPDFFontDescriptor: TppPDFFontDescriptor);
      procedure AddFontWidths(aPDFFontWidths: TppPDFFontWidths);
      procedure Clear;

      function FontExists(aFontName: String): Boolean;

      property PDFFonts[aIndex: Integer]: TppPDFFont read GetPDFFontForIndex;
      property PDFFontCount: Integer read GetPDFFontCount;
      property PDFFontDescriptors[aIndex: Integer]: TppPDFFontDescriptor read GetPDFFontDescriptorForIndex;
      property PDFFontDescriptorCount: Integer read GetPDFFontDescriptorCount;
      property PDFFontWidths[aIndex: Integer]: TppPDFFontWidths read GetPDFFontWidthsForIndex;
      property PDFFontWidthsCount: Integer read GetPDFFontWidthsCount;

  end;

implementation

{@TppPDFFontManager.AddFont

  Add a TppPDFFont object to the PDFFonts TList. }

procedure TppPDFFontManager.AddFont(aPDFFont: TppPDFFont);
begin
  FPDFFontList.Add(TObject(aPDFFont));
end;

{@TppPDFFontManger.AddFontDescriptor

  Add a TppPDFFontDescriptor object to the PDFFontDescriptors TList. }

procedure TppPDFFontManager.AddFontDescriptor(aPDFFontDescriptor: TppPDFFontDescriptor);
begin
  FPDFFontDescriptorList.Add(TObject(aPDFFontDescriptor));
end;

{@TppPDFFontManager.AddFontWidths

  Add a TppPDFFontWidths object to the PDFFontWidths TList. }

procedure TppPDFFontManager.AddFontWidths(aPDFFontWidths: TppPDFFontWidths);
begin
  FPDFFontWidthsList.Add(TObject(aPDFFontWidths));
end;

{@TppPDFFontManager.Clear

  Clears all lists inside the font manager. }

procedure TppPDFFontManager.Clear;
begin
  FPDFFontList.Clear;
  FPDFFontDescriptorList.Clear;
  FPDFFontWidthsList.Clear;

end;

{@TppPDFFontManager.Create

  Create a new TppPDFFontManager object. }

constructor TppPDFFontManager.Create;
begin
  FPDFFontList := TList.Create;
  FPDFFontDescriptorList := TList.Create;
  FPDFFontWidthsList := TList.Create;
end;

{@TppPDFFontManager.Destroy

  Called when the FontManager object is destroyed.  Do not call this method
  directly.  Instead use the Free routine. }

destructor TppPDFFontManager.Destroy;
begin
  FPDFFontWidthsList.Free;
  FPDFFontDescriptorList.Free;
  FPDFFontList.Free;

  inherited;
end;

{@TppPDFFontManager.FontExists

  Loops through the Font List and returns True if an exact font already exists
  for a given font.}

function TppPDFFontManager.FontExists(aFontName: String): Boolean;
var
  liIndex: Integer;
  lsFontName: String;
begin

  Result := False;

  for liIndex := 0 to PDFFontCount - 1 do
    begin
      lsFontName := TppPDFFont(PDFFonts[liIndex]).FontName;

      if aFontName = lsFontName then
        Result := True;

    end;

end;

function TppPDFFontManager.GetPDFFontCount: Integer;
begin
  Result := FPDFFontList.Count;
end;

function TppPDFFontManager.GetPDFFontDescriptorCount: Integer;
begin
  Result := FPDFFontDescriptorList.Count;
end;

function TppPDFFontManager.GetPDFFontDescriptorForIndex(aIndex: Integer): TppPDFFontDescriptor;
begin
  Result := TppPDFFontDescriptor(FPDFFontDescriptorList[aIndex]);
end;

function TppPDFFontManager.GetPDFFontForIndex(aIndex: Integer): TppPDFFont;
begin
  Result := TppPDFFont(FPDFFontList[aIndex]);
end;

function TppPDFFontManager.GetPDFFontWidthsCount: Integer;
begin
  Result := FPDFFontWidthsList.Count;
end;

function TppPDFFontManager.GetPDFFontWidthsForIndex(aIndex: Integer): TppPDFFontWidths;
begin
  Result := TppPDFFontWidths(FPDFFontWidthsList[aIndex]);
end;

end.

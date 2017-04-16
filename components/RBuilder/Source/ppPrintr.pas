{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit ppPrintr;

interface

{$I ppIfDef.pas}

{x$Define CodeSite}

uses
  {$IFDEF CodeSite} rsCodeSite, {$ENDIF}
  Windows, WinSpool, Classes, Graphics, Forms, Printers, SysUtils, Dialogs,
  ExtCtrls, SyncObjs,
  ppTypes, ppUtils, ppRTTI;

const
  cCustom  = 'Custom';
  cDefault = 'Default';
  cCurrent = 'Current';
  cUnknown = 'Unknown';
  cScreen =  'Screen';

type
  TppPageDef = class;

  {@TppPrinterCapabilities }
  TppPrinterCapabilities = class(TObject)
    private
      FBins: TStrings;
      FBinNames: TStrings;
      FPaperHeights: TStrings;
      FPaperNames: TStrings;
      FPaperSizes: TStrings;
      FPaperWidths: TStrings;
      FPrinterName: String;
      FCopies: Boolean;

    public
      constructor Create(const aPrinterName: String); virtual;
      destructor Destroy; override;

      property Bins: TStrings read FBins;
      property BinNames: TStrings read FBinNames;
      property Copies: Boolean read FCopies write FCopies;

      property PaperHeights: TStrings read FPaperHeights;
      property PaperNames: TStrings read FPaperNames;
      property PaperSizes: TStrings read FPaperSizes;
      property PaperWidths: TStrings read FPaperWidths;
      property PrinterName: String read FPrinterName;

  end; {class, TppPrinterCapabilities }


  {@TppPrinterInfo }
  TppPrinterInfo = class(TObject)
    private
      FDriver: PChar;
      FDevice: PChar;
      FPort: PChar;
      FCapabilities: TppPrinterCapabilities;
      FName: String;
      FCapItems: TStrings;
      FIsValid: Boolean;
      FIsLocal: Boolean;
      FLock: TCriticalSection;

      function  GetDeviceCapability(aPrinterCap: TppPrinterCapType): TStrings;
      procedure ValidatePaperSizes;
      procedure ValidatePaperBins;

    protected
      function GetPrinterCapabilities: TppPrinterCapabilities; virtual;

    public
      constructor Create(aName: String; aDriver, aDevice, aPort: PChar; aIsLocal: Boolean); virtual;
      destructor Destroy; override;

      function IsEqual(aDriver, aDevice, aPort: PChar): Boolean;
      procedure GetDevNames(var aDevNames: THandle);
      function GetNameAndPort: String;

      property Capabilities: TppPrinterCapabilities read GetPrinterCapabilities;
      property Device: PChar read FDevice;
      property Driver: PChar read FDriver;
      property IsLocal: Boolean read FIsLocal;
      property IsValid: Boolean read FIsValid write FIsValid;
      property Name: String read FName;
      property Port: PChar read FPort;

    end; {class, TppPrinterInfo }


  {@TppScreenPrinterInfo }
  TppScreenPrinterInfo = class(TppPrinterInfo)
    protected
      function GetPrinterCapabilities: TppPrinterCapabilities; override;

    public
      constructor Create(aName: String; aDriver, aDevice, aPort: PChar; aIsLocal: Boolean); override;

  end;  {class, TppScreenPrinterInfo }


  {@TppPrinterList }
  TppPrinterList = class(TObject)
    private
      FPrinters: TStrings;
      FDefaultPrinterName: String;
      FLock: TCriticalSection;

      procedure BuildPrinterList;
      procedure FreePrinterList;
      function GetCount: Integer;
      function GetPrinterInfo(aPrinterName: String): TppPrinterInfo;
      function GetPrinterName(aIndex: Integer): String;
      procedure ParseBuffer(var aBuffer: PChar; aBufSize: Longint; aResultStrings: TStrings);
      function GetSystemDefaultPrinterNameViaGetProfileString: String;
//      function GetSystemDefaultPrinterNameWin2kAndLater: String;

    public
      constructor Create;
      destructor Destroy; override;

      function GetPrinterNameForDevice(aDevice: String): String;
      function GetSystemDefaultPrinterName: String;

      procedure Refresh;

      property Count: Integer read GetCount;
      property DefaultPrinterName: String read FDefaultPrinterName;
      property PrinterNames: TStrings read FPrinters;
      property PrinterName[Index: Integer]: String read GetPrinterName;
      property PrinterInfo[aPrinterName: String]: TppPrinterInfo read GetPrinterInfo;

    end; {class, TppPrinterList}


  {@TppCustomPrinter }
  TppCustomPrinter = class(TObject)
    private
      FAborted: Boolean;
      FCanGrayScale: Boolean;
      FCanvas: TCanvas;
      FDC: HDC;
      FCurrentInfo: TppPrinterInfo;
      FDefaultBin: Integer;
      FDocumentName: String;
      FFileName: String;
      FLock: TCriticalSection;
      FPageNumber: Longint;
      FPrinting: Boolean;
      FPrinterHandle: THandle;
      FPrinterName: String;
      FResetDC: Boolean;
      FStartPage: Boolean;
      FDevMode: THandle;
      FOnSetupChange: TNotifyEvent;
      FPDevMode: PDeviceMode;
      FPageGutters: TRect;
      FPixelsPerInch: TPoint;
      FPaperWidth: Longint;
      FPaperHeight: Longint;
      FPrintableHeight: Longint;
      FPrintableWidth: Longint;

      procedure FreeDC;
      procedure FreeDevMode;
      procedure FreePrinterHandle;
      procedure FreePrinterResources;

      function GetCanGrayScale: Boolean;
      function GetCanvas: TCanvas;
      function GetDC: HDC;
      function GetDocumentProperties: THandle;
      function GetPrinterHandle: THandle;
      function GetPrinterInfo: TppPrinterInfo;
      function GetPrinterCapabilities: TppPrinterCapabilities;
      function GetPDevMode: PDevMode;
      function GetPageGutters: TRect;
      function GetPaperWidth: Longint;
      function GetPaperHeight: Longint;
      function GetPixelsPerInch: TPoint;
      function GetPrintableHeight: LongInt;
      function GetPrintableWidth: LongInt;
      function GetPrinterDescription: String;

      procedure ResetDC;
      procedure SetPrinterName(aPrinterName: String);

      function CopyHandle(aHandle: THandle): THandle;


    protected
      procedure DeviceContextChanged;

      property PDevMode: PDevMode read GetPDevMode;
      property CurrentInfo: TppPrinterInfo read FCurrentInfo;
      property DefaultBin: Integer read FDefaultBin;

      property Lock: TCriticalSection read FLock;

    public
      constructor Create; virtual;
      destructor Destroy; override;

      procedure BeginDoc;
      procedure EndDoc;
      { procedure AbortDoc;}
      procedure EndPage;
      procedure StartPage;

      procedure GetDevMode(var aDevMode: THandle);
      procedure SetDevMode(aDevMode: THandle);

      function HasColor: Boolean;
      function ShowSetupDialog: Boolean;
      function ShowPropertiesDialog: Boolean;

      procedure Initialize;
      procedure UpdateForm(const aFormName: String; aDimensions: TPoint; aPrintArea: TRect);

      property PrinterHandle: THandle read GetPrinterHandle;

      property Aborted: Boolean read FAborted;
      property Canvas: TCanvas read GetCanvas;
      property DC: HDC read GetDC;
      property DocumentName: String read FDocumentName write FDocumentName;
      property FileName: String read FFileName write FFileName;
      property PageNumber: Longint read FPageNumber;
      property Printing: Boolean read FPrinting;
      property PrinterDescription: String read GetPrinterDescription;
      property PrinterName: String read FPrinterName write SetPrinterName;
      property PrinterInfo: TppPrinterInfo read GetPrinterInfo;
      property PrinterCapabilities: TppPrinterCapabilities read GetPrinterCapabilities;

      property CanGrayScale: Boolean read GetCanGrayScale;
      property PageGutters: TRect read GetPageGutters;
      property PixelsPerInch: TPoint read GetPixelsPerInch;
      property PrintableHeight: Longint read GetPrintableHeight;
      property PrintableWidth: Longint read GetPrintableWidth;
      property PaperWidth: Longint read GetPaperWidth;
      property PaperHeight: Longint read GetPaperHeight;

      property OnChange: TNotifyEvent read FOnSetupChange write FOnSetupChange;

    end; {class, TppCustomPrinter}


  TppPrinterSetup = class;


  {@TppPrinter }
  TppPrinter = class(TppCustomPrinter)
    private
      FPrinterSetup: TppPrinterSetup;

      function GetDefaultBinName: String;
      function GetPaperDimensions: TPoint;
      function GetPrinterSetup: TppPrinterSetup;

      procedure PrinterSetupChangeEvent(Sender: TObject);
      procedure PrinterSetupGetPrinterEvent(Sender: TObject; var aPrinter: TppPrinter);
      procedure PrinterSetupToDevMode;
      procedure SetPrinterSetup(aPrinterSetup: TppPrinterSetup);

    public
      constructor Create; override;
      destructor Destroy; override;

      property DefaultBinName: String read GetDefaultBinName;
      property PrinterSetup: TppPrinterSetup read GetPrinterSetup write SetPrinterSetup;

    end; {class, TppPrinter }


  {@TppPrinterSetupDialog }
  TppPrinterSetupDialog = class(TCommonDialog)
    private
      FPrinter: TppCustomPrinter;

    public
      constructor Create(aOwner: TComponent); override;

      function Execute: Boolean; override;

      property Printer: TppCustomPrinter read FPrinter write FPrinter;

    end;   {class, TppPrinterSetupDialog }


 {@TppPrinterFontDialog }
  TppPrinterFontDialog = class(TCommonDialog)
    private
      FPrinter: TppCustomPrinter;
      FFont: TFont;
      
      procedure SetFont(aFont: TFont);
    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function Execute: Boolean; override;

      property Printer: TppCustomPrinter read FPrinter write FPrinter;
      property Font: TFont read FFont write SetFont;

    end;   {class, TppPrinterFontDialog }



 {@TppPrinterCanvas }
  TppPrinterCanvas = class(TCanvas)
   private
     FPrinter: TppCustomPrinter;

   public
     constructor Create(aPrinter: TppCustomPrinter);

     procedure CreateHandle; override;
     procedure Changing; override;
     procedure UpdateDeviceContext;

   end; {class, TppPrinterCanvas }

  TppGetPrinterEvent = procedure(Sender: TObject; var aPrinter: TppPrinter) of object;

  
  {@TppPrinterSetup

    The PrinterSetup object contains the PrinterName, PaperName, and BinName
    that will be used to print the report.}

  {@TppPrinterSetup.BinName

    The name of the bin (paper tray) containing the paper on which the report
    will be printed. A common use of this property is to set it to Manual Feed
    on mailing label reports.  That way you can provide a means to load the
    special label paper without manually setting the printer.}

  {@TppPrinterSetup.BinNames

    Run-time and read-only.  Use the BinNames property to get a list of bin
    names (paper trays) supported by the printer specified by the value of the
    PrinterName property.}

  {@TppPrinterSetup.Collation

    This property indicates whether multiple copies will print in presorted
    order.}

  {@TppPrinterSetup.Copies

    This property indicates the number of copies to print.  If the
    Collation property is set to True, the copies will print in sorted
    order.}

  {@TppPrinterSetup.DocumentName

    When a report is printing, this is the name of the document as it should
    appear when listed in the Print Manager and on network header pages.  This
    value can also be displayed in reports using the DocumentName type of the
    SystemVariable component.}

  {@TppPrinterSetup.Duplex

    This property indicates what type of two-sided printing should occur.  Not
    all printers support duplex printing.

    <Table>
    Value               Meaning
    ------------        -------
    dpNone	            Duplex printing is disabled.
    dpHorizontal	      Duplex printing should be performed across the page,
                        from left to right, so the text will read as in a book
    dpVertical	        Duplex printing should be performed down the page, from
                        top to bottom, so the text will read as in tablet
    </Table>}

  {@TppPrinterSetup.MarginBottom

    This property indicates the vertical position on the page where printing
    should stop.

    All report component positions are relative to the margin.  In other words,
    if the left margin is set to 0.25 inches and you place a component in a band
    and set the Left property to 0, then that component will print 0.25 inches
    from the edge of page (or at the left margin).}

  {@TppPrinterSetup.MarginLeft

    This property indicates the horizontal position on the page where printing
    should begin.

    All report component positions are relative to the margin.  In other words,
    if the left margin is set to 0.25 inches and you place a component in a band
    and set the Left property to 0, then that component will print 0.25 inches
    from the edge of page (or at the left margin).}

  {@TppPrinterSetup.MarginRight

    This property indicates the horizontal position on the page where printing
    should stop.

    All report component positions are relative to the margin.  In other words,
    if the left margin is set to 0.25 inches and you place a component in a band
    and set the Left property to 0, then that component will print 0.25 inches
    from the edge of page (or at the left margin).}

  {@TppPrinterSetup.MarginTop

    This property indicates the vertical position on the page where printing
    should begin.

    All report component positions are relative to the margin.  In other words,
    if the left margin is set to 0.25 inches and you place a component in a band
    and set the Left property to 0, then that component will print 0.25 inches
    from the edge of page (or at the left margin).}

  {@TppPrinterSetup.Orientation

    The value of the Orientation property determines whether a report prints
    vertically or horizontally on a page. These are the possible values:

    <Table>
    Value               Meaning
    ------------        -------
    poPortrait	        The print job prints vertically on the page.
    poLandscape	        The print job prints horizontally on the page.
    </Table>

    TPrinterOrientation is declared in the Printers unit of Delphi.}

  {@TppPrinterSetup.PaperHeight

    The height of the paper on which the report will be printed.  Unless you are
    working with custom paper sizes, you will not need to set this property.
    When the PaperName property is set, both the PaperWidth and PaperHeight
    properties are set automatically. The values of the PaperWidth and
    PaperHeight properties are always expressed in the units specified by the
    Report's RulerUnits property.}

  {@TppPrinterSetup.PaperName

    The name of the paper on which the report will be printed. When you specify
    a value for the PaperName property, the PaperWidth and PaperHeight are
    automatically set to the proper values.  For example, if Legal is specified,
    the PaperWidth will be set to 8.5" and the PaperHeight will be set to 14"
    when Orientation is Portrait (if the orientation is Landscape, the values
    will be reversed).}

  {@TppPrinterSetup.PaperNames

    Run-time and read-only.  Use the PaperNames property to get a list of the
    stock paper names supported by the printer specified by the value of the
    PrinterName property.}

  {@TppPrinterSetup.PaperWidth

    Width of the paper stated in the RulerUnits of the report. Unless you are
    working with custom paper sizes, you will not need to set this property.
    When the PaperName property is set, both the PaperWidth and PaperHeight
    properties are set automatically. The values of the PaperWidth and
    PaperHeight properties are always expressed in the units specified by the
    Report's RulerUnits property.}

  {@TppPrinterSetup.PrinterName

    The name of the printer that will be used to print the report.}

  {@TppPrinterSetup.PrinterNames

    Run-time and read-only.  Use the PrinterNames property to get a list of all
    printers installed in Windows.}

 TppPrinterSetup = class(TPersistent)
  private
    FActive: Boolean;
    FBinName: String;
    FCollation: Boolean;
    FCopies: Integer;
    FDocumentName: String;
    FDuplex: TppDuplexType;
    FFileName: String;
    FNewPageDef: TppPageDef;
    FOnGetPrinter: TppGetPrinterEvent;
    FOnPageDefChangeQuery: TppPageDefChangeQueryEvent;
    FOnPageDefChange: TNotifyEvent;
    FOnPrintJobChange: TNotifyEvent;
    FOrientation: TPrinterOrientation;
    FPageDef: TppPageDef;
    FPaperName: String;
    FPrinterName: String;
    FPrinterInfo: TppPrinterInfo;
    FOwner: TComponent;
    FUnits: TppUnitType;
    FDelegateCopies: Boolean;
    FReadPaperSize: Word;
    FLock: TCriticalSection;

    {used for conversion to 3.0}
    FOldPaperHeight: Single;
    FOldPaperWidth: Single;

    function DoConfirmPageDefChange(aPageDef: TppPageDef): Boolean;
    procedure DoPageDefChange;
    procedure DoPrintJobChange;

    function GetActive: Boolean;
    function GetBin: Integer;
    function GetBinNames: TStrings;

    function GetMarginBottom: Single;
    function GetMarginLeft: Single;
    function GetMarginRight: Single;
    function GetMarginTop: Single;

    function GetPaperHeight: Single;
    function GetPaperName: String;
    function GetPaperNames: TStrings;
    function GetPaperWidth: Single;
    function GetPrinterDescription: String;
    function GetPrinterNames: TStrings;
    function GetPrintableHeight: Single;
    function GetPrintableWidth: Single;
    function GetPrinter: TppPrinter;
    function GetPaperSize: Word;

    procedure PaperNameToDimensions(const aPaperName: String; var aPaperWidth, aPaperHeight: Single);
    function PaperSizeToName(aPaperSize: Word; var lsPaperName: String): Boolean;
    procedure PaperDimensionsToName(aPaperWidth, aPaperHeight: Single; var aPaperName: String);

    procedure SetBinName(aBinName: String);
    procedure SetCollation(aValue: Boolean);
    procedure SetCopies(aCopies: Integer);
    procedure SetDocumentName(aDocumentName: String);
    procedure SetDuplex(aDuplex: TppDuplexType);
    procedure SetOrientation(aOrientation: TPrinterOrientation);
    procedure SetMarginBottom(aMargin: Single);
    procedure SetMarginLeft(aMargin: Single);
    procedure SetMarginRight(aMargin: Single);
    procedure SetMarginTop(aMargin: Single);
    procedure SetPrinterName(aPrinterName: String);
    procedure SetPaperHeight(aPaperHeight: Single);
    procedure SetPaperName(aPaperName: String);
    procedure SetPaperWidth(aPaperWidth: Single);
    procedure SetUnits(aUnits: TppUnitType);

    {read/write private 'fake' properties}
    procedure ReadMarginBottom(Reader: TReader);
    procedure ReadMarginLeft(Reader: TReader);
    procedure ReadMarginRight(Reader: TReader);
    procedure ReadMarginTop(Reader: TReader);
    procedure ReadPaperHeight(Reader: TReader);
    procedure ReadPaperWidth(Reader: TReader);
    procedure ReadPaperSize(Reader: TReader);

    procedure WriteMarginBottom(Writer: TWriter);
    procedure WriteMarginLeft(Writer: TWriter);
    procedure WriteMarginRight(Writer: TWriter);
    procedure WriteMarginTop(Writer: TWriter);
    procedure WritePaperHeight(Writer: TWriter);
    procedure WritePaperWidth(Writer: TWriter);
    procedure WritePaperSize(Writer: TWriter);

  protected
    procedure DefineProperties(Filer: TFiler); override;


  public
    constructor Create(aOwner: TComponent); virtual;
    destructor Destroy; override;

    procedure Loaded; virtual;

    procedure Assign(Source: TPersistent); override;
    procedure AssignJobDef(aPrinterSetup: TppPrinterSetup);
    procedure ConvertPrinterSetup;
    function  IsEqual(aPrinterSetup: TppPrinterSetup): Boolean;
    function IsPrinterDefEqual(aPrinterSetup: TppPrinterSetup): Boolean;
    procedure Transfer(Source: TPersistent); 

    property Active: Boolean read GetActive write FActive;
    property Bin: Integer read GetBin;
    property BinNames: TStrings read GetBinNames;
    property FileName: String read FFileName write FFileName;
    property PaperNames: TStrings read GetPaperNames;
    property PrinterDescription: String read GetPrinterDescription;
    property PrinterNames: TStrings read GetPrinterNames;
    property PrinterInfo: TppPrinterInfo read FPrinterInfo;

    property PageDef: TppPageDef read FPageDef;
    property PrintableHeight: Single read GetPrintableHeight;
    property PrintableWidth: Single read GetPrintableWidth;
    property Units: TppUnitType read FUnits write SetUnits;
    property DelegateCopies: Boolean read FDelegateCopies write FDelegateCopies;
    property PaperSize: Word read GetPaperSize;

    {runtime events }
    property OnPageDefChangeQuery: TppPageDefChangeQueryEvent read FOnPageDefChangeQuery write FOnPageDefChangeQuery;
    property OnPageDefChange: TNotifyEvent read FOnPageDefChange write FOnPageDefChange;
    property OnPrintJobChange: TNotifyEvent read FOnPrintJobChange write FOnPrintJobChange;
    property OnGetPrinter: TppGetPrinterEvent read FOnGetPrinter write FOnGetPrinter;

  published

    property BinName: String read FBinName write SetBinName;
    property Collation: Boolean read FCollation write SetCollation default True;
    property Copies: Integer read FCopies write SetCopies default 1;
    property DocumentName: String read FDocumentName write SetDocumentName;
    property Duplex: TppDuplexType read FDuplex write SetDuplex default dpNone;
    property MarginBottom: Single read GetMarginBottom write SetMarginBottom stored False;
    property MarginLeft: Single read GetMarginLeft write SetMarginLeft stored False;
    property MarginRight: Single read GetMarginRight write SetMarginRight stored False;
    property MarginTop: Single read GetMarginTop write SetMarginTop stored False;
    property Orientation: TPrinterOrientation read FOrientation write SetOrientation default poPortrait;
    property PaperHeight: Single read GetPaperHeight write SetPaperHeight stored False;
    property PaperName: String read GetPaperName write SetPaperName;
    property PaperWidth:  Single read GetPaperWidth write SetPaperWidth stored False;
    property PrinterName: String read FPrinterName write SetPrinterName;

  end; {class, TppPrinterSetup }


  {@TppPageDef }
  TppPageDef = class(TPersistent)
    private
      FHeight: Longint;
      FWidth: Longint;
      FMarginLeft: Longint;
      FMarginRight: Longint;
      FMarginTop: Longint;
      FMarginBottom: Longint;

      function GetPrintableHeight: Longint;
      function GetPrintableWidth: Longint;

      function GetScreenPixelPrintableHeight: Integer;
      function GetScreenPixelPrintableWidth: Integer;
      function GetScreenPixelHeight: Integer;
      function GetScreenPixelWidth: Integer;
      function GetScreenPixelMarginLeft: Integer;
      function GetScreenPixelMarginRight: Integer;
      function GetScreenPixelMarginTop: Integer;
      function GetScreenPixelMarginBottom: Integer;

    public
      procedure Assign(Source: TPersistent); override;

      function  PageRect: TppRect;
      function  IsEqual(aPageDef: TppPageDef): Boolean;

      property spPrintableHeight: Integer read GetScreenPixelPrintableHeight;
      property spPrintableWidth: Integer read GetScreenPixelPrintableWidth;
      property spHeight: Integer read GetScreenPixelHeight;
      property spWidth: Integer read GetScreenPixelWidth;
      property spMarginLeft: Integer read GetScreenPixelMarginLeft;
      property spMarginRight: Integer read GetScreenPixelMarginRight;
      property spMarginTop: Integer read GetScreenPixelMarginTop;
      property spMarginBottom: Integer read GetScreenPixelMarginBottom;

      property mmPrintableHeight: Longint read GetPrintableHeight;
      property mmPrintableWidth: Longint read GetPrintableWidth;

    published
      property mmHeight: Longint read FHeight write FHeight;
      property mmWidth: Longint read FWidth write FWidth;
      property mmMarginLeft: Longint read FMarginLeft write FMarginLeft;
      property mmMarginRight: Longint read FMarginRight write FMarginRight;
      property mmMarginTop: Longint read FMarginTop write FMarginTop;
      property mmMarginBottom: Longint read FMarginBottom write FMarginBottom;

  end; {class, TppPageDef}




{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  {@TraTppPrinterSetupRTTI }
  TraTppPrinterSetupRTTI = class(TraTObjectRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppPrinterSetupRTTI}

  function PaperSizeToDimensions(aPaperSize: Word): TPoint;
  function PaperSizeToName(aPaperSize: Word): String;
  function PaperDimensionsToName(aWidth, aHeight: Integer): String;

  function ppPrinters: TppPrinterList;
  function ppPrinter: TppPrinter;
  function ppNoPrinterInfo: TppPrinterInfo;


  function ppGetWin32MajorVersion: Integer;

  {remap win32 calls  for DeviceCapabilities  (was gdi32)   }
  function DeviceCapabilitiesA(pDevice, pPort: PAnsiChar; fwCapability: Word;
                               pOutput: PAnsiChar; DevMode: PDeviceModeA): Integer; stdcall;

  function DeviceCapabilitiesW(pDevice, pPort: PWideChar; fwCapability: Word;
                               pOutput: PWideChar; DevMode: PDeviceModeW): Integer; stdcall;

  function DeviceCapabilities(pDevice, pPort: PChar; fwCapability: Word;
                               pOutput: PChar; DevMode: PDeviceMode): Integer; stdcall;

  // note: removed this because Win98 does not support the GetDefaultPrinter
  //       api function - there is no way to conditionally compile or structure it
  //       to be resolved at runtime

//  function GetDefaultPrinterA(Buffer: PAnsiChar; var BufSize: DWord): Bool; stdcall;
//  function GetDefaultPrinterW(Buffer: PWideChar; var BufSize: DWord): Bool; stdcall;
//  function GetDefaultPrinter(Buffer: PChar; var BufSize: DWord): Bool; stdcall;

implementation

uses
  Consts, CommDlg, Messages, Controls;

var
  uPrinters: TppPrinterList = nil;
  uPrinter: TppPrinter = nil;
  uNoPrinterInfo: TppPrinterInfo = nil;
  uHookCtl3D: Boolean;
  uWin32MajorVersion: Integer;
  uCSPrinter: TRTLCriticalSection;

  {remap win32 calls  for DeviceCapabilities  (was gdi32) }
  function DeviceCapabilitiesA; external winspl name 'DeviceCapabilitiesA';
  function DeviceCapabilitiesW; external winspl name 'DeviceCapabilitiesW';
  function DeviceCapabilities;  external winspl name 'DeviceCapabilitiesA';

//  function GetDefaultPrinterA; external winspl name 'GetDefaultPrinterA';
//  function GetDefaultPrinterW; external winspl name 'GetDefaultPrinterW';
//  function GetDefaultPrinter; external winspl name 'GetDefaultPrinterA';

{------------------------------------------------------------------------------}
{ PaperSizeToDimensions }

function PaperSizeToDimensions(aPaperSize: Word): TPoint;
begin

  case aPaperSize of
    DMPAPER_LETTER, DMPAPER_LETTERSMALL:
      begin
        {Letter, 8 1/2- by 11-inches}
        Result.X :=  Trunc(ppToMMTenths(8.5, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(11, utInches,  pprtVertical, nil));
      end;
    DMPAPER_LEGAL:
      begin
        {Legal, 8 1/2- by 14-inches}
        Result.X :=  Trunc(ppToMMTenths(8.5, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(14, utInches,  pprtVertical, nil));
      end;
    DMPAPER_A4:
      begin
        {A4 Sheet, 210- by 297-millimeters}
        Result.X :=  2100;
        Result.Y :=  2970;
      end;
    DMPAPER_CSHEET:
      begin
        {C Sheet, 17- by 22-inches}
        Result.X :=  Trunc(ppToMMTenths(17, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(22, utInches,  pprtVertical, nil));
      end;
    DMPAPER_DSHEET:
      begin
        {D Sheet, 22- by 34-inches}
        Result.X :=  Trunc(ppToMMTenths(22, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(34, utInches,  pprtVertical, nil));
      end;
    DMPAPER_ESHEET:
      begin
        {E Sheet, 34- by 44-inches}
        Result.X :=  Trunc(ppToMMTenths(34, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(44, utInches,  pprtVertical, nil));
      end;
    DMPAPER_TABLOID:
      begin
        {Tabloid, 11- by 17-inches}
        Result.X :=  Trunc(ppToMMTenths(11, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(17, utInches,  pprtVertical, nil));
      end;
    DMPAPER_LEDGER:
      begin
        {Ledger, 17- by 11-inches}
        Result.X :=  Trunc(ppToMMTenths(17, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(11, utInches,  pprtVertical, nil));
      end;
    DMPAPER_STATEMENT:
      begin
        {Statement, 5 1/2- by 8 1/2-inches}
        Result.X :=  Trunc(ppToMMTenths(5.5, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(8.5, utInches,  pprtVertical, nil));
      end;
    DMPAPER_EXECUTIVE:
      begin
        {Executive, 7 1/4- by 10 1/2-inches}
        Result.X :=  Trunc(ppToMMTenths(7.25, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(10.5, utInches,  pprtVertical, nil));
      end;
    DMPAPER_A3:
      begin
        {A3 sheet, 297- by 420-millimeters}
        Result.X :=  2970;
        Result.Y :=  4200;
      end;
    DMPAPER_A4SMALL:
      begin
        {A4 small sheet, 210- by 297-millimeters}
        Result.X :=  2100;
        Result.Y :=  2970;
      end;
    DMPAPER_A5:
      begin
        {A5 sheet, 148- by 210-millimeters}
        Result.X :=  1480;
        Result.Y :=  2100;
      end;
    DMPAPER_B4:
      begin
       {B4 sheet, 250- by 354-millimeters}
        Result.X :=  2500;
        Result.Y :=  3540;
      end;
    DMPAPER_B5:
      begin
        {B5 sheet, 182- by 257-millimeter paper}
        Result.X :=  1820;
        Result.Y :=  2570;
      end;
    DMPAPER_FOLIO:
      begin
        {Folio, 8 1/2- by 13-inch paper}
        Result.X :=  Trunc(ppToMMTenths(8.5, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(13, utInches,  pprtVertical, nil));
      end;
    DMPAPER_QUARTO:
      begin
        {Quarto Sheet, 215- by 275-millimeters}
        Result.X :=  2150;
        Result.Y :=  2750;
      end;
    DMPAPER_10X14:
      begin
        {!0- by 14-inch sheet}
        Result.X :=  Trunc(ppToMMTenths(10, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(14, utInches,  pprtVertical, nil));
      end;
    DMPAPER_11X17:
      begin
        {11 by 17 inches}
        Result.X :=  Trunc(ppToMMTenths(11, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(17, utInches,  pprtVertical, nil));
      end;
    DMPAPER_NOTE:
      begin
        {Note, 8 1/2- by 11-inches}
        Result.X :=  Trunc(ppToMMTenths(8.5, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(11, utInches,  pprtVertical, nil));
      end;
    DMPAPER_ENV_9:
      begin
        {9 Envelope, 3 7/8- by 8 7/8-inches }
        Result.X :=  Trunc(ppToMMTenths(3.875, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(8.875, utInches,  pprtVertical, nil));
      end;
    DMPAPER_ENV_10:
      begin
        {#10 Envelope, 4 1/8 - by 9 1/2-inches}
        Result.X :=  Trunc(ppToMMTenths(4.125, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(9.5, utInches,  pprtVertical, nil));
      end;
    DMPAPER_ENV_11:
      begin
        {#11 Envelope, 4 1/2- by 10 3/8-inches}
        Result.X :=  Trunc(ppToMMTenths(4.5, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(10.375, utInches,  pprtVertical, nil));
      end;
    DMPAPER_ENV_12:
      begin
        {#12 Envelope, 4 3/4- by 11-inches}
        Result.X :=  Trunc(ppToMMTenths(4.75, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(11, utInches,  pprtVertical, nil));
      end;
    DMPAPER_ENV_14:
      begin
        {#14 Envelope, 5- by 11 1/2-inches}
        Result.X :=  Trunc(ppToMMTenths(5, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(11.5, utInches,  pprtVertical, nil));
      end;
    DMPAPER_ENV_DL:
      begin
        {DL Envelope, 110- by 220-millimeters }
        Result.X :=  1100;
        Result.Y :=  2200;
      end;
    DMPAPER_ENV_C5:
      begin
        {C5 Envelope, 162- by 229-millimeters }
        Result.X :=  1620;
        Result.Y :=  2290;
      end;
    DMPAPER_ENV_C3:
      begin
        {C3 Envelope,  324- by 458-millimeters }
        Result.X :=  3240;
        Result.Y :=  4580;
      end;
    DMPAPER_ENV_C4:
      begin
        {C4 Envelope,  229- by 324-millimeters }
        Result.X :=  2290;
        Result.Y :=  3240;
      end;
   DMPAPER_ENV_C6:
      begin
        {C6 Envelope,  114- by 162-millimeters }
        Result.X :=  1140;
        Result.Y :=  1620;
      end;
    DMPAPER_ENV_C65:
      begin
        {C65 Envelope, 114- by 229-millimeters }
        Result.X :=  1140;
        Result.Y :=  2290;
      end;
    DMPAPER_ENV_B4:
      begin
        {B4 Envelope,  250- by 353-millimeters}
        Result.X :=  2500;
        Result.Y :=  3530;
      end;
    DMPAPER_ENV_B5:
      begin
        {B5 Envelope,  176- by 250-millimeters}
        Result.X :=  1760;
        Result.Y :=  2500;
      end;
    DMPAPER_ENV_B6:
      begin
        {B6 Envelope,  176- by 125-millimeters}
        Result.X :=  1760;
        Result.Y :=  1250;
      end;
    DMPAPER_ENV_ITALY:
      begin
        {Italy Envelope, 110- by 230-millimeters}
        Result.X :=  1100;
        Result.Y :=  2300;
      end;
    DMPAPER_ENV_MONARCH:
     begin
        {Monarch Envelope, 3 7/8- by 7 1/2-inches}
        Result.X :=  Trunc(ppToMMTenths(3.875, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(7.5, utInches,  pprtVertical, nil));
      end;
    DMPAPER_ENV_PERSONAL:
      begin
        {6 3/4 Envelope, 3 5/8- by 6 1/2-inches}
        Result.X :=  Trunc(ppToMMTenths(3.625, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(6.5, utInches,  pprtVertical, nil));
      end;
    DMPAPER_FANFOLD_US:
      begin
        {US Std Fanfold, 14 7/8- by 11-inches}
        Result.X :=  Trunc(ppToMMTenths(14.875, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(11, utInches, pprtVertical, nil));
      end;
    DMPAPER_FANFOLD_STD_GERMAN:
      begin
        {German Std Fanfold, 8 1/2- by 12-inches}
        Result.X :=  Trunc(ppToMMTenths(8.5, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(12, utInches,  pprtVertical, nil));
      end;
    DMPAPER_FANFOLD_LGL_GERMAN:
      begin
        {German Legal Fanfold, 8 1/2- by 13-inches}
        Result.X :=  Trunc(ppToMMTenths(8.5, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(13, utInches,  pprtVertical, nil));
      end;
    DMPAPER_ISO_B4:
      begin
        {B4 (ISO) 250 x 353 mm  }
        Result.X :=  2500;
        Result.Y :=  3530;
      end;
    DMPAPER_JAPANESE_POSTCARD:
      begin
        {Japanese Postcard 100 x 148 mm  }
        Result.X :=  1000;
        Result.Y :=  1480;
      end;
    DMPAPER_9X11:
      begin
        { 9 x 11 in }
        Result.X :=  Trunc(ppToMMTenths(9,  utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(11, utInches, pprtVertical, nil));
      end;
    DMPAPER_10X11:
      begin
        { 10 x 11 in }
        Result.X :=  Trunc(ppToMMTenths(10, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(11, utInches, pprtVertical, nil));
      end;
    DMPAPER_15X11:
      begin
        { 15 x 11 in }
        Result.X :=  Trunc(ppToMMTenths(15, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(11, utInches, pprtVertical, nil));
      end;
    DMPAPER_ENV_INVITE:
      begin
        { Envelope Invite 220 x 220 mm  }
        Result.X :=  2200;
        Result.Y :=  2200;
      end;
    DMPAPER_LETTER_EXTRA:
      begin
        { Letter Extra 9 \ 275 x 12 in   }
        Result.X :=  Trunc(ppToMMTenths(9.275, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(12,    utInches, pprtVertical, nil));
      end;
    DMPAPER_LEGAL_EXTRA:
      begin
        { Legal Extra 9 \275 x 15 in  }
        Result.X :=  Trunc(ppToMMTenths(9.275, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(15, utInches, pprtVertical, nil));
      end;
    DMPAPER_TABLOID_EXTRA:
      begin
        { Tabloid Extra 11.69 x 18 in  }
        Result.X :=  Trunc(ppToMMTenths(11.69, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(18, utInches, pprtVertical, nil));
      end;
    DMPAPER_A4_EXTRA:
      begin
        { A4 Extra 9.27 x 12.69 in   }
        Result.X :=  Trunc(ppToMMTenths(9.27, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(12.69, utInches, pprtVertical, nil));
      end;
    DMPAPER_LETTER_TRANSVERSE:
      begin
        { Letter Transverse 8 \275 x 11 in   }
        Result.X :=  Trunc(ppToMMTenths(8.275, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(11, utInches, pprtVertical, nil));
      end;
    DMPAPER_A4_TRANSVERSE:
      begin
        { A4 Transverse 210 x 297 mm     }
        Result.X :=  2100;
        Result.Y :=  2970;
      end;
    DMPAPER_LETTER_EXTRA_TRANSVERSE:
      begin
        { Letter Extra Transverse 9\275 x 12 in }
        Result.X :=  Trunc(ppToMMTenths(9.275, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(12, utInches, pprtVertical, nil));
      end;
    DMPAPER_A_PLUS:
      begin
        { SuperASuperAA4 227 x 356 mm  }
        Result.X :=  2270;
        Result.Y :=  3560;
      end;
    DMPAPER_B_PLUS:
      begin
        { SuperBSuperBA3 305 x 487 mm   }
        Result.X :=  3050;
        Result.Y :=  4870;
      end;
    DMPAPER_LETTER_PLUS:
      begin
        { Letter Plus 8.5 x 12.69 in    }
        Result.X :=  Trunc(ppToMMTenths(8.5, utInches, pprtHorizontal, nil));
        Result.Y :=  Trunc(ppToMMTenths(12.69, utInches, pprtVertical, nil));
      end;
    DMPAPER_A4_PLUS:
      begin
        { A4 Plus 210 x 330 mm  }
        Result.X :=  2100;
        Result.Y :=  3300;
      end;
    DMPAPER_A5_TRANSVERSE:
      begin
        { A5 Transverse 148 x 210 mm }
        Result.X :=  1480;
        Result.Y :=  2100;
      end;
    DMPAPER_B5_TRANSVERSE:
      begin
        { B5 (JIS) Transverse 182 x 257 mm }
        Result.X :=  1820;
        Result.Y :=  2570;
      end;
    DMPAPER_A3_EXTRA:
      begin
        { A3 Extra 322 x 445 mm  }
        Result.X :=  3220;
        Result.Y :=  4450;
      end;
    DMPAPER_A5_EXTRA:
      begin
        { A5 Extra 174 x 235 mm     }
        Result.X :=  1740;
        Result.Y :=  2350;
      end;
    DMPAPER_B5_EXTRA:
      begin
        { B5 (ISO) Extra 201 x 276 mm   }
        Result.X :=  2010;
        Result.Y :=  2760;
      end;
    DMPAPER_A2:
      begin
        {  A2 420 x 594 mm      }
        Result.X :=  4200;
        Result.Y :=  5940;
      end;
    DMPAPER_A3_TRANSVERSE:
      begin
        { A3 Transverse 297 x 420 mm    }
        Result.X :=  2970;
        Result.Y :=  4200;
      end;
    DMPAPER_A3_EXTRA_TRANSVERSE:
      begin
        {  A3 Extra Transverse 322 x 445 mm    }
        Result.X :=  3220;
        Result.Y :=  4450;
      end;
  else
      begin
      { Custom ?  }
        Result.X :=  0;
        Result.Y :=  0;
      end;
  end;

end;

{------------------------------------------------------------------------------}
{ PaperSizeToName }

function PaperSizeToName(aPaperSize: Word): String;
begin

   {note: this routine should not be necessary unless the printer driver
          is old or poorly written. }

  case aPaperSize of

    DMPAPER_LETTER, DMPAPER_LETTERSMALL: Result := 'Letter 8 1/2 x 11 in';
    DMPAPER_TABLOID: Result :=  'Tabloid 11 x 17 in';
    DMPAPER_LEDGER: Result :=  'Ledger 17 x 11 in';
    DMPAPER_LEGAL: Result :=  'Legal 8 12 x 14 in';
    DMPAPER_STATEMENT: Result :=  'Statement 5 1/2 x 8 12 in';
    DMPAPER_EXECUTIVE: Result :=  'Executive 7 14 x 10 1/2 in';
    DMPAPER_A3: Result :=  'A3 297 x 420 mm';
    DMPAPER_A4: Result :=  'A4 210 x 297 mm';
    DMPAPER_A4SMALL: Result :=  'A4 Small 210 x 297 mm';
    DMPAPER_A5: Result :=  'A5 148 x 210 mm';
    DMPAPER_B4: Result :=  'B4 (JIS) 250 x 354';
    DMPAPER_B5: Result :=  'B5 (JIS) 182 x 257 mm';
    DMPAPER_FOLIO: Result :=  'Folio 8 1/2 x 13 in';
    DMPAPER_QUARTO: Result :=  'Quarto 215 x 275 mm';
    DMPAPER_10X14: Result :=   '10 x 14 in';
    DMPAPER_11X17: Result :=   '11 x 17 in';
    DMPAPER_NOTE: Result :=    'Note 8 1/2 x 11 in';
    DMPAPER_ENV_9: Result :=   'Envelope #9 3 7/8 x 8 7/8';
    DMPAPER_ENV_10: Result :=  'Envelope #10 4 18 x 9 1/2';
    DMPAPER_ENV_11: Result :=  'Envelope #11 4 12 x 10 3/8';
    DMPAPER_ENV_12: Result :=  'Envelope #12 4 276 x 11';
    DMPAPER_ENV_14: Result :=  'Envelope #14 5 x 11 1/2';
    DMPAPER_CSHEET: Result :=  'C size sheet';
    DMPAPER_DSHEET: Result :=  'D size sheet';
    DMPAPER_ESHEET: Result :=  'E size sheet';
    DMPAPER_ENV_DL: Result :=  'Envelope DL 110 x 220mm';
    DMPAPER_ENV_C5: Result :=  'Envelope C5 162 x 229 mm';
    DMPAPER_ENV_C3: Result :=  ' Envelope C3  324 x 458 mm';
    DMPAPER_ENV_C4: Result :=  'Envelope C4  229 x 324 mm';
    DMPAPER_ENV_C6: Result :=  'Envelope C6  114 x 162 mm';
    DMPAPER_ENV_C65: Result :=  'Envelope C65 114 x 229 mm';
    DMPAPER_ENV_B4: Result :=  'Envelope B4  250 x 353 mm';
    DMPAPER_ENV_B5: Result :=  'Envelope B5  176 x 250 mm';
    DMPAPER_ENV_B6: Result :=  'Envelope B6  176 x 125 mm';
    DMPAPER_ENV_ITALY: Result :=  'Envelope 110 x 230 mm';
    DMPAPER_ENV_MONARCH: Result :=  'Envelope Monarch 3.875 x 7.5 in';
    DMPAPER_ENV_PERSONAL: Result :=  '6 34 Envelope 3 5/8 x 6 1/2 in';
    DMPAPER_FANFOLD_US: Result :=  'US Std Fanfold 14 7/8 x 11 in';
    DMPAPER_FANFOLD_STD_GERMAN: Result :=  'German Std Fanfold 8 1/2 x 12 in';
    DMPAPER_FANFOLD_LGL_GERMAN: Result :=  'German Legal Fanfold 8 1/2 x 13 in';
    DMPAPER_ISO_B4: Result :=  'B4 (ISO) 250 x 353 mm';
    DMPAPER_JAPANESE_POSTCARD: Result :=  'Japanese Postcard 100 x 148 mm';
    DMPAPER_9X11: Result :=  '9 x 11 in';
    DMPAPER_10X11: Result :=  '10 x 11 in';
    DMPAPER_15X11: Result :=  '15 x 11 in';
    DMPAPER_ENV_INVITE: Result :=  'Envelope Invite 220 x 220 mm';
    DMPAPER_LETTER_EXTRA: Result :=  'Letter Extra 9 \275 x 12 in';
    DMPAPER_LEGAL_EXTRA: Result :=  'Legal Extra 9 \275 x 15 in';
    DMPAPER_TABLOID_EXTRA: Result :=  'Tabloid Extra 11.69 x 18 in';
    DMPAPER_A4_EXTRA: Result :=  'A4 Extra 9.27 x 12.69 in';
    DMPAPER_LETTER_TRANSVERSE: Result :=  'Letter Transverse 8 \275 x 11 in';
    DMPAPER_A4_TRANSVERSE: Result :=  'A4 Transverse 210 x 297 mm';
    DMPAPER_LETTER_EXTRA_TRANSVERSE: Result :=  'Letter Extra Transverse 9\275 x 12 in';
    DMPAPER_A_PLUS: Result :=  'SuperASuperAA4 227 x 356 mm';
    DMPAPER_B_PLUS: Result :=  'SuperBSuperBA3 305 x 487 mm';
    DMPAPER_LETTER_PLUS: Result :=  'Letter Plus 8.5 x 12.69 in';
    DMPAPER_A4_PLUS: Result :=  'A4 Plus 210 x 330 mm';
    DMPAPER_A5_TRANSVERSE: Result :=  'A5 Transverse 148 x 210 mm';
    DMPAPER_B5_TRANSVERSE: Result :=  'B5 (JIS) Transverse 182 x 257 mm';
    DMPAPER_A3_EXTRA: Result :=  'A3 Extra 322 x 445 mm';
    DMPAPER_A5_EXTRA: Result :=  'A5 Extra 174 x 235 mm';
    DMPAPER_B5_EXTRA: Result :=  'B5 (ISO) Extra 201 x 276 mm';
    DMPAPER_A2: Result :=  'A2 420 x 594 mm';
    DMPAPER_A3_TRANSVERSE: Result :=  'A3 Transverse 297 x 420 mm';
    DMPAPER_A3_EXTRA_TRANSVERSE: Result :=  'A3 Extra Transverse 322 x 445 mm';
    DMPAPER_LAST: Result :=  'DMPAPER_A3_EXTRA_TRANSVERSE';
    DMPAPER_USER: Result := cCustom;
  else
    Result := cUnknown;
  end; {case}

end; {function, PaperSizeToName}

{------------------------------------------------------------------------------}
{function PaperDimensionsToName}

function PaperDimensionsToName(aWidth, aHeight: Integer): String;
begin
  Result := IntToStr(aWidth div 10) + ' x ' + IntToStr(aHeight div 10) + ' mm';

end; {function, PaperDimensionsToName}


{------------------------------------------------------------------------------}
{function ppGetWin32MajorVersion}

function ppGetWin32MajorVersion: Integer;
begin
  Result := Win32MajorVersion;

end; {function, ppGetWin32MajorVersion}

{$IFDEF Delphi6}


{------------------------------------------------------------------------------}
{function ppCenterWindow }

procedure ppCenterWindow(Wnd: HWnd);
var
  lRect: TRect;
  lMonitor: TMonitor;
begin

  {Center the given window on the screen }
  GetWindowRect(Wnd, lRect);

  if Application.MainForm <> nil then
    begin
      if Assigned(Screen.ActiveForm) then
        lMonitor := Screen.ActiveForm.Monitor
      else
        lMonitor := Application.MainForm.Monitor;
    end
  else
    lMonitor := Screen.Monitors[0];

  SetWindowPos(Wnd, 0,
    lMonitor.Left + ((lMonitor.Width - lRect.Right + lRect.Left) div 2),
    lMonitor.Top + ((lMonitor.Height - lRect.Bottom + lRect.Top) div 3),
    0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
    
end; {procedure, ppCenterWindow }

{------------------------------------------------------------------------------}
{function ppDialogHook }

{ Generic dialog hook. Centers the dialog on the screen in response to the WM_INITDIALOG message }

function ppDialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT; stdcall;
begin

  Result := 0;

  if Msg = WM_INITDIALOG then
    ppCenterWindow(Wnd);

end; {function, ppDialogHook }


{$ELSE}

{------------------------------------------------------------------------------}
{function ppDialogHook }

{ Generic dialog hook. Centers the dialog on the screen in response to the WM_INITDIALOG message }

function ppDialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT; stdcall;
var
  lRect: TRect;

begin

  Result := 0;

  case Msg of

    WM_INITDIALOG:
      begin

        if uHookCtl3D then
          begin
            Subclass3DDlg(Wnd, CTL3D_ALL);
            SetAutoSubClass(True);
          end;

        {center the window}
        GetWindowRect(Wnd, lRect);
        SetWindowPos(Wnd, 0, (GetSystemMetrics(SM_CXSCREEN) - lRect.Right  + lRect.Left) div 2,
                             (GetSystemMetrics(SM_CYSCREEN) - lRect.Bottom + lRect.Top)  div 3,
                              0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);

       end;

    WM_DESTROY:

      if uHookCtl3D then
        SetAutoSubClass(False);

  end;

end; {function, ppDialogHook }

{$ENDIF}


{******************************************************************************
 *
 ** T p p P r i n t e r S e t u p  D i a l o g
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPrinterSetupDialog.Create }

constructor TppPrinterSetupDialog.Create(aOwner: TComponent);
begin
  inherited Create(Application);
  FPrinter := nil;
end; {constructor, Create }

{------------------------------------------------------------------------------}
{ TppPrinterSetupDialog.Execute }

function TppPrinterSetupDialog.Execute: Boolean;
var
  lPrintDlgRec: TPrintDlg;
  lPDevNames: PDevNames;
  lpDevice: PChar;
  lsPrinterName: String;

begin

  Result := False;

  if (FPrinter = nil) then Exit;

  {initialize printer setup dialog info }
  FillChar(lPrintDlgRec, SizeOf(lPrintDlgRec), 0);

  {size of dialog structure}
  lPrintDlgRec.lStructSize    := SizeOf(lPrintDlgRec);

  {owner of dialog}
  lPrintDlgRec.hWndOwner      := Application.Handle;

  {printer DevMode}
  FPrinter.GetDevMode(lPrintDlgRec.hDevMode);

  {device, driver, port stuff }
  if (FPrinter.PrinterInfo <> nil) then
    FPrinter.PrinterInfo.GetDevNames(lPrintDlgRec.hDevNames);
 

  {set flags for printer setup dialog and for dialog hook}
  lPrintDlgRec.Flags := PD_PRINTSETUP or PD_ENABLESETUPHOOK;

  {dialog hook - processes messages such as WM_INITDIALOG}
  lPrintDlgRec.lpfnSetupHook  := ppDialogHook;


  lPrintDlgRec.hInstance := SysInit.HInstance;

  uHookCtl3D := Ctl3D;

  {show printer setup dialog }
  Result := TaskModalDialog(@PrintDlg, lPrintDlgRec);

  if Result then
    begin

      lPDevNames := GlobalLock(lPrintDlgRec.hDevNames);

      try
        {get the name of the device returned}
        lpDevice := PChar(lPDevNames) + lPDevNames^.wDeviceOffset;

        {get the printer name for this device }
        lsPrinterName := ppPrinters.GetPrinterNameForDevice(StrPas(lpDevice));

        {set the new printer name
          note: PrinterName may be 'Default' so compare to PrinterDescription }
        if FPrinter.PrinterDescription <> lsPrinterName then
          FPrinter.PrinterName := lsPrinterName;

      finally
        GlobalUnLock(lPrintDlgRec.hDevNames);
        GlobalFree(lPrintDlgRec.hDevNames);

      end; {try, finally }



     if lPrintDlgRec.hDevMode <> 0 then
       begin
         {update the printer's devmode }
         FPrinter.SetDevMode(lPrintDlgRec.hDevMode);
         GlobalFree(lPrintDlgRec.hDevMode);
       end;

    end
  else
    begin
     if lPrintDlgRec.hDevMode <> 0 then
       GlobalFree(lPrintDlgRec.hDevMode);

      if lPrintDlgRec.hDevNames <> 0 then
        GlobalFree(lPrintDlgRec.hDevNames);
    end;


end;  {procedure, Execute}



{******************************************************************************
 *
 ** T p p P r i n t e r F o n t  D i a l o g
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPrinterFontDialog.Create }

constructor TppPrinterFontDialog.Create(aOwner: TComponent);
begin
  inherited Create(Application);
  FPrinter := nil;
  FFont := TFont.Create;
end; {constructor, Create }

{------------------------------------------------------------------------------}
{ TppPrinterFontDialog.Destroy }

destructor TppPrinterFontDialog.Destroy;
begin

  FFont.Free;

  inherited Destroy;

end; {destructor, Destroy }

{------------------------------------------------------------------------------}
{ TppPrinterFontDialog.SetFont }

procedure TppPrinterFontDialog.SetFont(aFont: TFont);
begin

  FFont.Assign(aFont);

end; {procedure, SetFont }


{------------------------------------------------------------------------------}
{ TppPrinterFontDialog.Execute }

function TppPrinterFontDialog.Execute: Boolean;
var
  lChooseFontRec: TChooseFont;
  lLogFont: TLogFont;
  lFontStyle: TFontStyles;
  lSaveColorRef: COLORREF;

begin

  Result := False;

  if (FPrinter = nil) then Exit;


  {initialize font dialog info }
  FillChar(lChooseFontRec, SizeOf(lChooseFontRec), 0);

  {get log font info}
  GetObject(FFont.Handle, SizeOf(lLogFont), @lLogFont);


  lChooseFontRec.lStructSize := SizeOf(TChooseFont);
  lChooseFontRec.hDC := FPrinter.DC;   { printer DC/IC or nil }
  lChooseFontRec.hWndOwner := Application.Handle; { caller's window handle }
   {  iPointSize: Integer;   }     { 10 * size in points of selected font }
  lChooseFontRec.lpLogFont := @lLogFont;     { pointer to a LOGFONT struct }

  lChooseFontRec.Flags := CF_BOTH or CF_INITTOLOGFONTSTRUCT or CF_ENABLEHOOK or CF_EFFECTS;  { dialog flags }
  lChooseFontRec.rgbColors := ColorToRGB(Font.Color);    { returned text color }
  lChooseFontRec.lCustData := 0;            { data passed to hook function }
  lChooseFontRec.lpfnHook := ppDialogHook;  { pointer to hook function }

  lChooseFontRec.hInstance := SysInit.HInstance;  { instance handle of EXE that contains
                                  custom dialog template }


  lSaveColorRef := lChooseFontRec.rgbColors;
  uHookCtl3D := Ctl3D;
  Result := TaskModalDialog(@ChooseFont, lChooseFontRec);


  if Result then
    begin
      if AnsiCompareText(FFont.Name, lLogFont.lfFaceName) <> 0 then
        begin
          FFont.Charset := TFontCharset(lLogFont.lfCharSet);
          FFont.Name   := lLogFont.lfFaceName;
        end;

      if (lSaveColorRef <> lChooseFontRec.rgbColors) then
        FFont.Color := lChooseFontRec.rgbColors;

      FFont.Height := lLogFont.lfHeight;

      lFontStyle := [];

      if lLogFont.lfWeight > FW_Regular then
        Include(lFontStyle, fsBold);

      if lLogFont.lfItalic <> 0 then
        Include(lFontStyle, fsItalic);

      if lLogFont.lfUnderline <> 0 then
        Include(lFontStyle, fsUnderline);

      if lLogFont.lfStrikeOut <> 0 then
        Include(lFontStyle, fsStrikeOut);

      FFont.Style := lFontStyle;

    end;

end;  {procedure, Execute}



{******************************************************************************
 *
 ** T p p P r i n t e r  C a n v a s
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPrinterCanvas.Create }

constructor TppPrinterCanvas.Create(aPrinter: TppCustomPrinter);
begin
  inherited Create;
  FPrinter := aPrinter;
end;  {constructor, Create}

{------------------------------------------------------------------------------}
{ TppPrinterCanvas.CreateHandle }

procedure TppPrinterCanvas.CreateHandle;
begin
  UpdateDeviceContext;

  Handle:= FPrinter.DC;


end; {procedure, CreateHandle}

{------------------------------------------------------------------------------}
{ TppPrinterCanvas.Changing }

procedure TppPrinterCanvas.Changing;
begin
  inherited Changing;

  UpdateDeviceContext;

end; {procedure, Changing}

{------------------------------------------------------------------------------}
{ TppPrinterCanvas.UpdateDeviceContext }

procedure TppPrinterCanvas.UpdateDeviceContext;
var
  lFontSize: Integer;

begin


  if (FPrinter = nil) then Exit;

  if (FPrinter.PixelsPerInch.Y <> Font.PixelsPerInch) then
    begin
      lFontSize := Font.Size;
      Font.PixelsPerInch := FPrinter.PixelsPerInch.Y;
      Font.Size := lFontSize;
    end;


  if not (FPrinter.CanGrayScale) then
    begin

      if (Font.Color <> clBlack) and (Font.Color <> clWhite) then
        Font.Color := clBlack;

    end;

end; {procedure, UpdateDeviceContext}





{******************************************************************************
 *
 ** P R I N T E R   C A P A B I L I T I E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPrinterCapabilities.Create }

constructor TppPrinterCapabilities.Create(const aPrinterName: String);
begin

  inherited Create;

  FBins         := TStringList.Create;
  FBinNames     := TStringList.Create;
  FCopies := False;

  FPaperNames   := TStringList.Create;
  FPaperSizes   := TStringList.Create;
  FPaperWidths  := TStringList.Create;
  FPaperHeights := TStringList.Create;

  FPrinterName := aPrinterName;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppPrinterCapabilities.Destroy }

destructor TppPrinterCapabilities.Destroy;
begin
  FPaperNames.Free;
  FPaperSizes.Free;
  FPaperWidths.Free;
  FPaperHeights.Free;
  FBinNames.Free;
  FBins.Free;

  inherited Destroy;

end; {destructor, Destroy }


{******************************************************************************
 *
 ** P R I N T E R I N F O
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppPrinterInfo.Create }

constructor TppPrinterInfo.Create(aName: String; aDriver, aDevice, aPort: PChar; aIsLocal: Boolean);
begin

  inherited Create;

  FLock := TCriticalSection.Create;

  FCapabilities := nil;
  FName  := aName;
  FIsLocal := aIsLocal;

  FDriver := StrNew(ADriver);
  FDevice := StrNew(ADevice);
  FPort   := StrNew(APort);

  {special logic for NT 3.5}
  if (Win32Platform = VER_PLATFORM_WIN32_NT) and (uWin32MajorVersion < 4) then
    begin
      if FDriver = nil then
        FDriver := StrAlloc(1);

      if FDevice = nil then
        FDevice := StrAlloc(1);

      if FPort = nil then
        FPort   := StrAlloc(1);

  end;

  FIsValid := True;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppPrinterInfo.Destroy }

destructor TppPrinterInfo.Destroy;
begin

  FLock.Acquire;

  try
    StrDispose(FDriver);
    StrDispose(FDevice);
    StrDispose(FPort);

    FCapabilities.Free;
  finally
    FLock.Release;

    FLock.Free;
  end;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppPrinterInfo.IsEqual }

function TppPrinterInfo.IsEqual(aDriver, aDevice, aPort: PChar): Boolean;
begin
  Result := (StrComp(Driver, aDriver) = 0) and (StrComp(Device, aDevice) = 0) and (StrComp(Port, aPort) = 0);
end; {function, IsEqual}

{------------------------------------------------------------------------------}
{ TppPrinterInfo.GetPrinterCapabilities }

function TppPrinterInfo.GetPrinterCapabilities: TppPrinterCapabilities;
begin

  FLock.Acquire;

  try

    if (FCapabilities = nil) then
      begin
        FCapabilities := TppPrinterCapabilities.Create(FName);
        FCapItems := TStringList.Create;

        try

          {get Paper Sizes for this printer}
          FCapabilities.PaperNames.Assign(GetDeviceCapability(pcPaperNames));

          FCapabilities.PaperSizes.Assign(GetDeviceCapability(pcPapers));
          FCapabilities.PaperWidths.Assign(GetDeviceCapability(pcPaperWidths));
          FCapabilities.PaperHeights.Assign(GetDeviceCapability(pcPaperHeights));

          {get bins for this printer }
          FCapabilities.BinNames.Assign(GetDeviceCapability(pcBinNames));
          FCapabilities.Bins.Assign(GetDeviceCapability(pcBins));

          FCapabilities.Copies := (DeviceCapabilities(FDevice, FPort, dc_Copies, nil, nil) > 2);


        finally

          FCapItems.Free;
          FCapItems := nil;

        end; {try, PrepDeviceCapabilities }

        FCapItems.Free;

        {due to differences in printer drivers, may need to do some extra work }
        ValidatePaperSizes;

        ValidatePaperBins;

      end;

    Result := FCapabilities;
    
  finally
    FLock.Release;
  end;

end; {function, GetPrinterCapabilities}

{------------------------------------------------------------------------------}
{ TppPrinterInfo.GetDeviceCapability }

type
  TCapStructure = (csString, csWord, csPoint, csInteger);

function TppPrinterInfo.GetDeviceCapability(aPrinterCap: TppPrinterCapType): TStrings;
var
  lResultBuf: PChar;
  lpCurrentItem: Pointer;
  liItem: Integer;
  llItems: LongInt;
  lwItemSize: Word;
  lItem: PChar;
  lpPoint: ^TPoint;
  lpWord: ^Word;
  lwCapability: Word;
  lCapStructure : TCapStructure;



  function GetCapabWinAPI: Boolean;
  begin

    Result := False;
    lResultBuf  := nil;

    try
      {call windows api to determine how many paper sizes are supported}
      llItems := DeviceCapabilities(FDevice, FPort, lwCapability, lResultBuf, nil);

    except

    end;


    if llItems > 0 then
      begin
        GetMem(lResultBuf, ((llItems * lwItemSize) + 1));

        try
          {call windows api to get list of paper names that are supported}
           DeviceCapabilities(FDevice, FPort, lwCapability, lResultBuf, nil);
        except
          FreeMem(lResultBuf, ((llItems * lwItemSize) + 1));
          raise;

        end;

        Result := True;

      end; {if, liItems > 0}

end;



begin

  Result := FCapItems;
  FCapItems.Clear;


  case aPrinterCap of

    pcPaperNames:   begin
                      lwItemSize    := 64;
                      lwCapability  := 16;
                      lCapStructure := csString;
                    end;

    pcPapers:       begin
                      lwItemSize    := SizeOf(Word);
                      lwCapability  := dc_Papers;
                      lCapStructure := csWord;
                    end;

    pcPaperWidths,
    pcPaperHeights: begin
                      lwItemSize    := SizeOf(TPoint);
                      lwCapability  := dc_PaperSize;
                      lCapStructure := csPoint;
                   end;

    pcBinNames:     begin
                      lwItemSize    := 24;
                      lwCapability  := 12;
                      lCapStructure := csString;
                    end;

    else

    {pcBins:}         begin
                      lwItemSize    := SizeOf(Word);
                      lwCapability  := dc_Bins;
                      lCapStructure := csWord;
                    end;


  end;

  if GetCapabWinAPI then
    begin

      GetMem(lItem, lwItemSize + 1);
      lpCurrentItem := lResultBuf;


      for liItem := 0 to llItems-1 do
        begin

          case lCapStructure of

            csString: begin  {paper names}
                        StrLCopy(lItem, lpCurrentItem, lwItemSize);
                        FCapItems.Add(StrPas(lItem));
                      end;

            csWord:   begin
                        lpWord := lpCurrentItem;
                        FCapItems.Add(IntToStr(lpWord^));
                      end;

            csPoint:  begin
                        lpPoint := lpCurrentItem;

                        if aPrinterCap = pcPaperWidths then

                          FCapItems.Add(IntToStr(lpPoint^.X))
                        else
                          FCapItems.Add(IntToStr(lpPoint^.Y));

                      end;

          end; {case of lCapStructure}

          if liItem < (llItems-1) then
            lpCurrentItem := PChar(lpCurrentItem) + lwItemSize;

        end; {for, each item}

      FreeMem(lItem, lwItemSize + 1);
      FreeMem(lResultBuf, ((llItems * lwItemSize) + 1));

    end; {if, GetCapabWinAPI }


  {for testing}
 {FReadOnly := True;}

end; {function, GetDeviceCapability }

{------------------------------------------------------------------------------}
{ TppPrinterInfo.ValidatePaperSizes }

procedure TppPrinterInfo.ValidatePaperSizes;
var
  liPaper: Integer;
  lPointPaperSize: TPoint;
  liPapers: Integer;
  liCustomIndex: Integer;
  lsPaperName: String;

begin

 
  {make sure same number of PaperSizes & PaperNames }
  if FCapabilities.PaperNames.Count > FCapabilities.PaperSizes.Count then
     for liPaper := FCapabilities.PaperNames.Count-1 downto FCapabilities.PaperSizes.Count do
      FCapabilities.PaperNames.Delete(liPaper)

  else if FCapabilities.PaperNames.Count < FCapabilities.PaperSizes.Count then
    begin
      {clear the paper name list}
      FCapabilities.PaperNames.Clear;

      for liPaper := 0 to FCapabilities.PaperSizes.Count-1 do
        begin

          {try to get the paper name from the paper size}
          lsPaperName := PaperSizeToName(StrToInt(FCapabilities.PaperSizes[liPaper]));

          {if unknown, then try to generate a paper name, based upon the dimensions}
          if (lsPaperName = cUnknown) then
            begin
             if (liPaper < FCapabilities.PaperHeights.Count) and
                (liPaper < FCapabilities.PaperWidths.Count) then

                lsPaperName := PaperDimensionsToName(StrToInt(FCapabilities.PaperWidths[liPaper]),
                                                     StrToInt(FCapabilities.PaperHeights[liPaper]))
             else
                {total failure, so use 'Unknown: PaperSize' }
                lsPaperName := cUnknown + ': ' + FCapabilities.PaperSizes[liPaper];

            end;

           FCapabilities.PaperNames.Add(lsPaperName);

         end;

    end;

  {check for the 'Custom' option}
  liCustomIndex := FCapabilities.PaperSizes.IndexOf('256');

  if liCustomIndex < 0 then
    begin
      liPaper := 0;

      while (liCustomIndex < 0) and (liPaper < FCapabilities.PaperNames.Count)  do
        begin

          lsPaperName := UpperCase(FCapabilities.PaperNames[liPaper]);

          {look for custom or user defined names}
          if (Pos('CUSTOM', lsPaperName) > 0) or (Pos('USER',lsPaperName) > 0) then
            liCustomIndex := liPaper
          else
            Inc(liPaper);

        end;
    end;


  {if 'Custom' option found make sure it says Custom and not 'Custom ' or some such}
  if (liCustomIndex >= 0) and (liCustomIndex < FCapabilities.PaperNames.Count) then
    begin
      FCapabilities.PaperNames[liCustomIndex] := cCustom;

      {make sure there is a corresponding entry for the paper size}
      if (liCustomIndex = FCapabilities.PaperSizes.Count) then
        FCapabilities.PaperSizes.Add('256');
        
    end

  else if liCustomIndex < 0 then
    {add custom option }
    begin
      liCustomIndex := FCapabilities.PaperNames.Add(cCustom);
      FCapabilities.PaperSizes.Add('256');
    end;

  {note: some print drivers do not return Width & Height of PaperSizes (just the "PaperSize: Word" value}

 {check the paper widths & heights
    note: skip 'Custom' since it has no specified PaperWidth, PaperHeight}

  liPapers := FCapabilities.PaperSizes.Count-1;


  {calc PaperWidth, PaperHeight from windows pre-defined paper sizes (if needed) }
  for liPaper := 0 to liPapers do
    begin
      {removed - 4.22}
      {if (FCapabilities.PaperSizes[liPaper] = '256') then
        Continue;  }

      if (liPaper > FCapabilities.PaperWidths.Count-1) or (liPaper > FCapabilities.PaperHeights.Count-1) then
        begin

          lPointPaperSize := PaperSizeToDimensions(StrToInt(FCapabilities.PaperSizes[liPaper]));

          if (liPaper > FCapabilities.PaperWidths.Count-1) then
             FCapabilities.PaperWidths.Add(IntToStr(lPointPaperSize.X))
          else
             FCapabilities.PaperWidths[liPaper] := IntToStr(lPointPaperSize.X);

          if (liPaper > FCapabilities.PaperHeights.Count-1) then
            FCapabilities.PaperHeights.Add(IntToStr(lPointPaperSize.Y))
          else
            FCapabilities.PaperHeights[liPaper] := IntToStr(lPointPaperSize.Y);

        end;

    end;


  {remove any unsupported paper sizes}
  for liPaper := liPapers  downto 0 do
    begin
      if (FCapabilities.PaperNames[liPaper] = cCustom) then
        Continue;

      if (FCapabilities.PaperWidths[liPaper]= '0') or (FCapabilities.PaperHeights[liPaper]= '0') then
        begin

          FCapabilities.PaperSizes.Delete(liPaper);
          FCapabilities.FPaperWidths.Delete(liPaper);
          FCapabilities.PaperHeights.Delete(liPaper);

          if liPaper < FCapabilities.PaperNames.Count then
            FCapabilities.PaperNames.Delete(liPaper);

        end;
    end;

  {make sure 'Custom' is last in the list }
  if (liCustomIndex >= 0) and (liCustomIndex < FCapabilities.PaperNames.Count-1) then
    begin
      FCapabilities.PaperNames.Move(liCustomIndex, FCapabilities.PaperNames.Count-1);
      FCapabilities.PaperSizes.Move(liCustomIndex, FCapabilities.PaperSizes.Count-1);
      FCapabilities.PaperWidths.Move(liCustomIndex, FCapabilities.PaperWidths.Count-1);
      FCapabilities.PaperHeights.Move(liCustomIndex, FCapabilities.PaperHeights.Count-1);
    end;

end; {procedure, ValidatePaperSizeList}



{------------------------------------------------------------------------------}
{ TppPrinterInfo.ValidatePaperBins }

procedure TppPrinterInfo.ValidatePaperBins;
var
  liBin: Integer;
  liDefaultIndex: Integer;

begin

  {make sure same number of Bins & BinNames }
  if FCapabilities.BinNames.Count > FCapabilities.Bins.Count then
    for liBin := FCapabilities.BinNames.Count-1 downto FCapabilities.Bins.Count do
      FCapabilities.BinNames.Delete(liBin)

  else if FCapabilities.BinNames.Count < FCapabilities.Bins.Count then

    for liBin := FCapabilities.Bins.Count-1 downto FCapabilities.BinNames.Count do
      FCapabilities.Bins.Delete(liBin);


  {check for the 'Default' option}
  liDefaultIndex := FCapabilities.BinNames.IndexOf(cDefault);

  if liDefaultIndex < 0 then
    begin
      {add default setting }
      FCapabilities.BinNames.Insert(0, cDefault);
      FCapabilities.Bins.Insert(0,'7');
    end;

end;  {procedure, ValidatePaperBins}


{------------------------------------------------------------------------------}
{ TppPrinterInfo.GetDevNames }

procedure TppPrinterInfo.GetDevNames(var aDevNames: THandle);
var
  lPDevNames: PDevNames;
  lpCurPos: PChar;
  liSizeOfDevNames: Integer;
  llBaseAddress: LongInt;
  lDevice, lDriver, lPort: array [0..79] of char;

begin

  FLock.Acquire;

  try

    if FDriver = nil then
      StrCopy(lDevice, #0)
    else
      StrCopy(lDriver, FDriver);

   if FDevice = nil then
      StrCopy(lDevice, #0)
    else
      StrCopy(lDevice, FDevice);

   if FPort = nil then
      StrCopy(lPort, #0)
    else
      StrCopy(lPort, FPort);


    {compute size of DevNames buffer needed}
    liSizeOfDevNames := SizeOf(TDevNames) + StrLen(lDriver) + StrLen(lDevice) + StrLen(lPort) + 3;

    aDevNames := GlobalAlloc(GHND, liSizeOfDevNames);

    lPDevNames := PDevNames(GlobalLock(aDevNames));

    try
      llBaseAddress := Longint(lPDevNames);

      {initialize CurPos to end of TDevNames rec}
      lpCurPos := PChar(lPDevNames) + SizeOf(TDevNames);

      {compute offset address for the driver name and then copy it to the buffer at the current position}
      lpDevNames^.wDriverOffset := Longint(lpCurPos) - llBaseAddress;
      lpCurPos := StrECopy(lpCurPos, lDriver) + 1;

      {copy device name}
      lpDevNames^.wDeviceOffset := Longint(lpCurPos) - llBaseAddress;
      lpCurPos := StrECopy(lpCurPos, lDevice) + 1;

      {copy port name}
      lpDevNames^.wOutputOffset := Longint(lpCurPos) - llBaseAddress;
      StrCopy(lpCurPos, lPort);

      lpDevNames^.wOutputOffset := 0;

    finally
      GlobalUnLock(aDevNames);

    end;

  finally
    FLock.Release;
  end;

end; {function, GetDevNames}


{------------------------------------------------------------------------------}
{ TppPrinterInfo.GetNameAndPort }

function TppPrinterInfo.GetNameAndPort: String;
begin

  FLock.Acquire;

  try

    if (Device <> nil) and (Port <> nil) then
      Result  := Format(SDeviceOnPort, [Device, Port])
    else
      Result := '';
  finally
    FLock.Release;
  end;

end; {function, GetNameAndPort}



{******************************************************************************
 *
 ** S C R E E N   P R I N T E R   I N F O
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppScreenPrinterInfo.Create }

constructor TppScreenPrinterInfo.Create(aName: String; aDriver, aDevice, aPort: PChar; aIsLocal: Boolean);
var
  lsPrinterName: String;
begin
  lsPrinterName := cScreen;

  inherited Create(lsPrinterName, nil, PChar(lsPrinterName), nil, True);

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppScreenPrinterInfo.GetPrinterCapabilities }

function TppScreenPrinterInfo.GetPrinterCapabilities: TppPrinterCapabilities;
const
  cCommonPaperSizes: array [0..12] of Integer =
                       (DMPAPER_USER, DMPAPER_LETTER, DMPAPER_LEGAL, DMPAPER_A3,
                        DMPAPER_A4, DMPAPER_11X17, DMPAPER_FANFOLD_US,
                        DMPAPER_FANFOLD_STD_GERMAN, DMPAPER_ENV_9, DMPAPER_ENV_10,
                        DMPAPER_ENV_11, DMPAPER_ENV_12, DMPAPER_ENV_14);
var
  liIndex: Integer;
  liPaperSize: Integer;
  lPointPaperSize: TPoint;
begin

  if (FCapabilities = nil) then
    begin
      FCapabilities := TppPrinterCapabilities.Create(FName);

      FCapabilities.Bins.Add('7');
      FCapabilities.BinNames.Add(cDefault);

      FCapabilities.Copies := False;

      {add common paper sizes }
      for liIndex := Low(cCommonPaperSizes) to High(cCommonPaperSizes) do
        begin
          liPaperSize := cCommonPaperSizes[liIndex];

          FCapabilities.PaperSizes.Add(IntToStr(liPaperSize));
          FCapabilities.PaperNames.Add(PaperSizeToName(liPaperSize));

          lPointPaperSize := PaperSizeToDimensions(liPaperSize);

          FCapabilities.PaperWidths.Add(IntToStr(lPointPaperSize.X));
          FCapabilities.PaperHeights.Add(IntToStr(lPointPaperSize.Y));

        end;

    end;

  Result := FCapabilities;

end;



{******************************************************************************
 *
 ** P R I N T E R L I S T
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppPrinterList.Create }

constructor TppPrinterList.Create;
begin

  inherited Create;

  FLock := TCriticalSection.Create;

  FPrinters := TStringList.Create;

  BuildPrinterList;

  {intitalize system default printer name}
  GetSystemDefaultPrinterName;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppPrinterList.Destroy }

destructor TppPrinterList.Destroy;
begin

  FLock.Acquire;

  try
    FreePrinterList;

    FPrinters.Free;

  finally
    FLock.Release;

    FLock.Free;
  end;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppPrinterList.FreePrinterList }

procedure TppPrinterList.FreePrinterList;
var
  liIndex: Integer;

begin

  for liIndex := 0 to FPrinters.Count-1 do
    FPrinters.Objects[liIndex].Free;

end; {procedure, FreePrinterList}

{------------------------------------------------------------------------------}
{ TppPrinterList.GetCount }

function TppPrinterList.GetCount: Integer;
begin

  FLock.Acquire;

  try
    Result := FPrinters.Count;
  finally
    FLock.Release;
  end;
  
end; {function, GetCount}

{------------------------------------------------------------------------------}
{ TppPrinterList.GetPrinterInfo }

function TppPrinterList.GetPrinterInfo(aPrinterName: String): TppPrinterInfo;
var
  liIndex: Integer;
  liPrinter: Integer;
  lsDeviceName: String;

begin

  FLock.Acquire;

  try

    {find the specified printer using the PrinterName}
    if (aPrinterName = cDefault) then
      liPrinter := FPrinters.IndexOf(FDefaultPrinterName)
    else
      liPrinter := FPrinters.IndexOf(aPrinterName);

    if (liPrinter >= 0) then
      begin
        Result := TppPrinterInfo(FPrinters.Objects[liPrinter]);
        Exit;
      end;

    {note: required to convert old reports, try to derive the device name,
           from the DeviceAndPort name}
    if Pos('on', aPrinterName) > 0 then
      begin
        lsDeviceName := Copy(aPrinterName, 1, Pos(' on', aPrinterName)-1);
        aPrinterName := GetPrinterNameForDevice(lsDeviceName);
        liPrinter    := FPrinters.IndexOf(aPrinterName);

        if (liPrinter >= 0) then
          begin
            Result := TppPrinterInfo(FPrinters.Objects[liPrinter]);
            Exit;
          end;

      end;


    {note: required to convert old reports need to look at NameAndPort}
    if (Win32Platform <> VER_PLATFORM_WIN32_NT) then
      begin
        liIndex := 0;

        while (liPrinter < 0) and (liIndex < FPrinters.Count-1) do
          if (FPrinters[liIndex] <> cDefault) and
             (TppPrinterInfo(FPrinters.Objects[liIndex]).GetNameAndPort = aPrinterName) then
            liPrinter := liIndex
          else
            Inc(liIndex);
      end;

    {if not found, revert to the default}
    if liPrinter < 0 then
      liPrinter := FPrinters.IndexOf(FDefaultPrinterName);

    if (liPrinter >= 0) then
      Result := TppPrinterInfo(FPrinters.Objects[liPrinter])
    else
      Result := nil;

  finally
    FLock.Release;
  end;

end; {function, GetPrinterInfo}

{------------------------------------------------------------------------------}
{ TppPrinterList.GetSystemDefaultPrinterName }

function TppPrinterList.GetSystemDefaultPrinterName: String;
begin

  // note: removed this because Win98 does not support the GetDefaultPrinter
  //       api function - there is no way to conditionally compile or structure it
  //       to be resolved at runtime

{  if (Win32Platform = VER_PLATFORM_WIN32_NT) and (uWin32MajorVersion >= 5) then
    Result := GetSystemDefaultPrinterNameWin2kAndLater
  else}
    Result := GetSystemDefaultPrinterNameViaGetProfileString;

end;

{------------------------------------------------------------------------------}
{ TppPrinterList.GetSystemDefaultPrinterNameWin2kAndLater }

{function TppPrinterList.GetSystemDefaultPrinterNameWin2kAndLater: String;
var
  ldBufferSize: DWord;
begin

  FLock.Acquire;

  Result := '';
  FDefaultPrinterName := '';

  ldBufferSize := 0;

  //get buffer size
  GetDefaultPrinter(nil, ldBufferSize);

  if (ldBufferSize > 0) then
    begin
      SetLength(FDefaultPrinterName, ldBufferSize-1);

      try
        GetDefaultPrinter(PChar(FDefaultPrinterName), ldBufferSize);

      finally
        FLock.Release;
      end;
    end;

  Result := FDefaultPrinterName;

end;} {function, GetSystemDefaultPrinterNameWin2kAndLater }


{------------------------------------------------------------------------------}
{ TppPrinterList.GetSystemDefaultPrinterNameViaGetProfileString }

function TppPrinterList.GetSystemDefaultPrinterNameViaGetProfileString: String;
var
  liBufferSize: Integer;
  lDeviceStrings: TStringList;
  lpBuffer: PChar;
  lsDefaultDevice: String;
  liInfoSize: Integer;

begin

  FLock.Acquire;

  Result := '';

  lDeviceStrings := TStringList.Create;
  lsDefaultDevice := '';

  liBufferSize := 1024;

  GetMem(lpBuffer, liBufferSize);

  try
    {get default device from win.ini}
    liInfoSize := GetProfileString('windows', 'device', '', lpBuffer, liBufferSize-1);

    ParseBuffer(lpBuffer, liInfoSize, lDeviceStrings);

    {device name is the first string}
    if lDeviceStrings.Count > 0 then
      lsDefaultDevice := lDeviceStrings.Strings[0];

    {if no default device found, then switch to screen printer device}
    if lsDefaultDevice = '' then
      lsDefaultDevice := cScreen;

    {get printer name for device }
    FDefaultPrinterName := GetPrinterNameForDevice(lsDefaultDevice);

    if (FDefaultPrinterName = '') then
      FDefaultPrinterName := GetPrinterNameForDevice(cScreen);

    //default printer is not installed on the machine, revert to the screen printer
    if (FDefaultPrinterName = '') then
      FDefaultPrinterName := cScreen;
      

  finally

    FreeMem(lpBuffer, liBufferSize);

    lDeviceStrings.Free;

    FLock.Release;
  end;

  Result := FDefaultPrinterName;

end; {function, GetSystemDefaultPrinterNameViaGetProfileString }


{$IFDEF Experimental}

function TppPrinterList.GetSystemDefaultPrinterNameWin9x: String;
var
  lPPrinterInfo5: PPrinterInfo5;
  ldBufferSize: DWord;
  ldPrinters: DWord;

begin

  Result := '';

  {get the buffer size required to retrieve the printer info}
  ldBufferSize := 0;
  ldPrinters := 0;
  EnumPrinters(PRINTER_ENUM_DEFAULT, nil, 5, nil, 0, ldBufferSize, ldPrinters);

  if (ldBufferSize > 0) then
    begin
      GetMem(lPPrinterInfo5, ldBufferSize);

      try

        {get the printer info}
         EnumPrinters(PRINTER_ENUM_DEFAULT, nil, 5, lPPrinterInfo5, ldBufferSize, ldBufferSize, ldPrinters);

         if ldPrinters > 0 then
           Result := lPPrinterInfo5.pPrinterName;

      finally
        FreeMem(lPPrinterInfo5, ldBufferSize);

      end; {try, finally}

    end;



end;

{$ENDIF}



{------------------------------------------------------------------------------}
{ TppPrinterList.GetPrinterName }

function TppPrinterList.GetPrinterName(aIndex: Integer): String;
begin

  FLock.Acquire;

  try
    Result := FPrinters[aIndex];
  finally
    FLock.Release;
  end;

end;

{------------------------------------------------------------------------------}
{ TppPrinterList.GetPrinterNameForDevice }

function TppPrinterList.GetPrinterNameForDevice(aDevice: String): String;
var
  liPrinter: Integer;
  lbFound: Boolean;
  lPrinterInfo: TppPrinterInfo;
  lsDevice: String;

begin

  FLock.Acquire;

  Result := '';

  liPrinter    := 0;
  lbFound      := False;
  lPrinterInfo := nil;
  lsDevice     := '';

  try

    {search for a printer with the same device name }
    while not lbFound and (liPrinter < FPrinters.Count) do
      begin

        lPrinterInfo :=  TppPrinterInfo(FPrinters.Objects[liPrinter]);

        if (lPrinterInfo.Device <> nil) then
          lsDevice := StrPas(lPrinterInfo.Device);

        if (AnsiCompareText(lsDevice, aDevice) = 0) then
          lbFound := True
        else
          Inc(liPrinter);

      end;

    if lbFound and (lPrinterInfo <> nil) then
      Result := lPrinterInfo.Name;

  finally
    FLock.Release;
  end;

end; {function, GetPrinterNameForDevice }

{------------------------------------------------------------------------------}
{function TppPrinterList.ParseBuffer}

procedure TppPrinterList.ParseBuffer(var aBuffer: PChar; aBufSize: Longint; aResultStrings: TStrings);
var
  lpStartStr, lpEndStr: PChar;
  lpEndBuffer: PChar;
  lbEndString: Boolean;

begin

  lpStartStr  := aBuffer;
  lpEndBuffer := lpStartStr + aBufSize-1;
  lbEndString := False;

  aResultStrings.Clear;

  while not lbEndString do
    begin

      {remove leading spaces}
      while (lpStartStr^ = ' ') and (lpStartStr <= lpEndBuffer) do
        Inc(lpStartStr);

      {search for end of string}
      lpEndStr := lpStartStr;

      while (lpEndStr^ <> #0) and (lpEndStr^ <> ',') and (lpStartStr <= lpEndBuffer) do
        Inc(lpEndStr);

      if (lpEndStr^ = #0) then
        lbEndString := True

      else if (lpEndStr^ = ',') then
        lpEndStr^ := #0;

      {add parsed string to result list}

      aResultStrings.Add(lpStartStr);


      {increment pointer to start of next string}
      lpStartStr := lpEndStr + 1;

      {check for ending condition}
      if lpStartStr >= lpEndBuffer then
        lbEndString := True;

    end;


end; {function, ppParseBuffer }

{------------------------------------------------------------------------------}
{ TppPrinterList.Refresh }

procedure TppPrinterList.Refresh;
begin
  FLock.Acquire;

  try
    BuildPrinterList;

    {update system default printer name}
    GetSystemDefaultPrinterName;

  finally
    FLock.Release;
  end;

end; {function, Refresh }

{------------------------------------------------------------------------------}
{ TppPrinterList.BuildPrinterList }

procedure TppPrinterList.BuildPrinterList;
var
  lpBuffer: PChar;
  lpPrinterInfo: PChar;
  liPrinter: Integer;
  liBufferSize: DWord;
  liPrinters: DWord;
  liFlags, liPort: Integer;
  lLevel: Byte;
  lppPrinterInfo: TppPrinterInfo;
  lPrinterInfo4: TPrinterInfo4;
  lPrinterInfo5: TPrinterInfo5;
  lPortsList: TStringList;
  lbIsLocal: Boolean;

begin

  uPrinter.Free;
  uPrinter := nil;

  FreePrinterList;
  FPrinters.Clear;

  {add 'screen' to list of available printers}
  lppPrinterInfo := TppScreenPrinterInfo.Create(cScreen, nil, nil, nil, True);
  FPrinters.InsertObject(0, cScreen, lppPrinterInfo);

  {add 'default' to list of available printers}
  lppPrinterInfo := TppPrinterInfo.Create(cDefault, nil, nil, nil, True);
  FPrinters.InsertObject(0, cDefault, lppPrinterInfo);

  {set flags and printer info level for WinNT or Win 95}
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    begin
      liFlags := PRINTER_ENUM_CONNECTIONS or PRINTER_ENUM_LOCAL;
      lLevel := 4;
    end
  else
    begin
      liFlags := PRINTER_ENUM_LOCAL;
      lLevel := 5;
    end;

  {get the buffer size required to retrieve the printer info}
  liBufferSize := 0;
  EnumPrinters(liFlags, nil, lLevel, nil, 0, liBufferSize, liPrinters);

  if liBufferSize = 0 then Exit;

  GetMem(lpBuffer, liBufferSize);
  lpPrinterInfo := lpBuffer;
  lPortsList    := nil;

  try

    {get the printer info}
    if not EnumPrinters(liFlags, nil, lLevel, PByte(lpBuffer), liBufferSize, liBufferSize, liPrinters) then
      Exit;

    for liPrinter := 0 to liPrinters-1 do
      begin

        if lLevel = 4 then
          begin
            lPrinterInfo4 := PPrinterInfo4(lpPrinterInfo)^;
            lbIsLocal := (lPrinterInfo4.Attributes <> PRINTER_ATTRIBUTE_NETWORK);

            lppPrinterInfo := TppPrinterInfo.Create(lPrinterInfo4.pPrinterName, nil, lPrinterInfo4.pPrinterName, nil, lbIsLocal);
            FPrinters.AddObject(lPrinterInfo4.pPrinterName, lppPrinterInfo);


            {increment buffer pointer}
            Inc(lpPrinterInfo, sizeof(TPrinterInfo4));

          end {if, PrinterInfo4}

        else
          begin
            lPrinterInfo5 := PPrinterInfo5(lpPrinterInfo)^;

            lbIsLocal := (lPrinterInfo5.Attributes <> PRINTER_ATTRIBUTE_NETWORK);

            if lPortsList = nil then
              lPortsList := TStringList.Create;

            ParseBuffer(lPrinterInfo5.pPortName, SizeOf(lPrinterInfo5.pPortName), lPortsList);

            for liPort := 0 to lPortsList.Count-1 do
              begin

                lppPrinterInfo := TppPrinterInfo.Create(lPrinterInfo5.pPrinterName, nil,
                                                        lPrinterInfo5.pPrinterName, PChar(lPortsList[liPort]), lbIsLocal);

                FPrinters.AddObject( lPrinterInfo5.pPrinterName, lppPrinterInfo);
              end;

            Inc(lpPrinterInfo, sizeof(TPrinterInfo5));

          end; {if, PrinterInfo5}

        end; {for, each Printer}

  finally

    FreeMem(lpBuffer, liBufferSize);
    lPortsList.Free;

  end; {try, finally}

end;  {procedure, BuildPrinterList}

{******************************************************************************
 *
 ** C U S T O M  P R I N T E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.Create }

constructor TppCustomPrinter.Create;
begin

  inherited Create;

  FAborted       := False;
  FPageNumber    := 0;
  FPrinting      := False;
  FPrinterName   := cDefault;
  FDocumentName  := '';
  FFileName      := '';

  FCanvas        := nil;
  FDC            := 0;
  FCurrentInfo   := nil;
  FDevMode       := 0;
  FOnSEtupChange := nil;
  FPDevMode      := nil;
  FPrinterHandle := 0;
  FResetDC       := False;

  FLock := TCriticalSection.Create;

end; {constructor, Create }

{------------------------------------------------------------------------------}
{ TppCustomPrinter.Destroy }

destructor TppCustomPrinter.Destroy;
begin

  FLock.Free;

  FreePrinterResources;

  FCanvas.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.BeginDoc }

procedure TppCustomPrinter.BeginDoc;
var
  lDocInfo: TDocInfo;
begin

{$IFDEF CodeSite}
  gCodeSite.EnterMethod('TppCustomPrinter.BeginDoc');
{$ENDIF}

  FLock.Acquire;

  try

    if FPrinting then Exit;

    FPrinting   := True;
    FAborted    := False;
    FPageNumber := 0;
    FStartPage  := False;

    {free the current device context and call resetDC to create a new one}
    FreeDC;
    ResetDC;

    FillChar(lDocInfo, SizeOf(lDocInfo), 0);
    lDocInfo.cbSize := SizeOf(lDocInfo);
    lDocInfo.lpszDocName := PChar(FDocumentName);

    if (FFileName <> '') then
      lDocInfo.lpszOutput := PChar(FFileName);

    {SetAbortProc(FDC, AbortProc);}
    StartDoc(FDC, lDocInfo);
    
  finally
    FLock.Release;
  end;

{$IFDEF CodeSite}
  gCodeSite.ExitMethod('TppCustomPrinter.BeginDoc');
{$ENDIF}

end;  {procedure, BeginDoc}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.EndDoc }

procedure TppCustomPrinter.EndDoc;
begin

{$IFDEF CodeSite}
  gCodeSite.EnterMethod('TppCustomPrinter.EndDoc');
{$ENDIF}

  if (Aborted) then
    exit;

  FLock.Acquire;

{$IFDEF CodeSite}
  gCodeSite.SendString('TppCustomPrinter.EndDoc', 'Lock acquired');
{$ENDIF}

  try

    if not FPrinting then Exit;

    EndPage;

{$IFDEF CodeSite}
  gCodeSite.SendString('TppCustomPrinter.EndDoc', 'EndPage');
{$ENDIF}


    if not FAborted then
      Windows.EndDoc(FDC);

{$IFDEF CodeSite}
  gCodeSite.SendString('TppCustomPrinter.EndDoc', 'Windows.EndDoc(FDC)');
{$ENDIF}

    FreeDC;

{$IFDEF CodeSite}
  gCodeSite.SendString('TppCustomPrinter.EndDoc', 'FreeDC');
{$ENDIF}

    FPrinting   := False;
    FStartPage  := False;
    FAborted    := False;
    FPageNumber := 0;
    
  finally
    FLock.Release;
  end;

{$IFDEF CodeSite}
  gCodeSite.ExitMethod('TppCustomPrinter.EndDoc');
{$ENDIF}

end; {procedure, EndDoc}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.Abort }

{procedure TppCustomPrinter.Abort;
begin

  if not FPrinting then Exit;

  AbortDoc(FDC);
  FAborted := True;
  EndDoc;

end; }


{------------------------------------------------------------------------------}
{ TppCustomPrinter.StartPage }

procedure TppCustomPrinter.StartPage;
begin

  FLock.Acquire;

  try

    if not FPrinting or FStartPage then Exit;

    FStartPage := True;

    if FResetDC then
      ResetDC;

    Windows.StartPage(FDC);

    Inc(FPageNumber);
    Canvas.Refresh;

  finally
    FLock.Release;
  end;

end; {procedure, StartPage}


{------------------------------------------------------------------------------}
{ TppCustomPrinter.ResetDC }

procedure TppCustomPrinter.ResetDC;
var
  lNewDC: HDC;
begin

  FLock.Acquire;

  try
    if not FPrinting then Exit;

    FResetDC := False;

    {deselect all resources canvas}
    Canvas.Refresh;

    if (FDC <> 0) then
      begin
        lNewDC := Windows.ResetDC(FDC, FPDevMode^);
        if (lNewDC <> 0) then
          FDC := lNewDC;
      end;

    DeviceContextChanged;

    TppPrinterCanvas(Canvas).UpdateDeviceContext;

    {if FDC = 0 then raise}

  finally
    FLock.Release;
  end;

end; {procedure, ResetDC}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.EndPage }

procedure TppCustomPrinter.EndPage;
begin

  FLock.Acquire;

  try
    if not FPrinting or not FStartPage then Exit;

    FStartPage := False;


    Windows.EndPage(FDC);

  finally
    FLock.Release;
  end;

end; {procedure, EndPage}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPrinterHandle }

function TppCustomPrinter.GetPrinterHandle: THandle;
begin

  FLock.Acquire;

  try

    if FPrinterHandle = 0 then
      begin
        FCurrentInfo := ppPrinters.PrinterInfo[FPrinterName];

        if FCurrentInfo <> nil then
          OpenPrinter(FCurrentInfo.Device, FPrinterHandle, nil);
      end;

    Result := FPrinterHandle;
    
  finally
    FLock.Release;
  end;

end; {procedure, GetPrinterHandle}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetDevMode }

procedure TppCustomPrinter.GetDevMode(var aDevMode: THandle);
begin
  FLock.Acquire;

  try
    aDevMode := CopyHandle(GetDocumentProperties);
  finally
    FLock.Release;
  end;

end; {procedure, GetDevMode}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetDocumentProperties }

function TppCustomPrinter.GetDocumentProperties: THandle;
var
  lStubDevMode: TDeviceMode;
  lPrinterInfo: TppPrinterInfo;
  llSizeDevMode: Longint;
begin

  FLock.Acquire;

  try

    Result := 0;

    if (FDevMode = 0) then
      begin

        {get printer info}
        lPrinterInfo := ppPrinters.PrinterInfo[FPrinterName];

        if (lPrinterInfo = nil) then Exit;

        {get size of DevMode for this printer}
        llSizeDevMode := DocumentProperties(0, PrinterHandle, lPrinterInfo.Device, lStubDevMode, lStubDevMode, 0);

        if (llSizeDevMode > 0) then
          begin

            {allocate gobal memory for DevMode }
            FDevMode := GlobalAlloc(GHND, llSizeDevMode);

            if (FDevMode <> 0) then
              begin
                {lock the DevMode structure }
                FPDevMode := GlobalLock(FDevMode);

                {get the current DevMode from the Printer}
                if (DocumentProperties(0, PrinterHandle, lPrinterInfo.Device, FPDevMode^, FPDevMode^, DM_OUT_BUFFER) >= 0) then
                 FDefaultBin := FPDevMode^.dmDefaultSource
                else
                  FreeDevMode;

              end;

          end;

      end;

    Result := FDevMode;

  finally
    FLock.Release;
  end;

end; {function, GetDocumentProperties}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPDevMode }

function TppCustomPrinter.GetPDevMode: PDevMode;
begin

  FLock.Acquire;

  try
    GetDocumentProperties;

    Result := FPDevMode;

  finally
    FLock.Release;
  end;
  
end;  {function, GetPDevMode}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetDC }

function TppCustomPrinter.GetDC: HDC;
var
  lPrinterInfo: TppPrinterInfo;

begin

  FLock.Acquire;

  Result := 0;

  try

    if FDC = 0 then
      begin

        lPrinterInfo := ppPrinters.PrinterInfo[FPrinterName];

        if (lPrinterInfo <> nil) and lPrinterInfo.IsValid then
          begin

            if (lPrinterInfo is TppScreenPrinterInfo) then
              begin
                if FPrinting then
                  raise EPrintError.Create('Screen printer does not support printing.')
                else
                  FDC := Windows.GetDC(0);
              end

            else if FPrinting then
              FDC := CreateDC(lPrinterInfo.Driver, lPrinterInfo.Device, lPrinterInfo.Port, GetPDevMode)
            else
              FDC := CreateIC(lPrinterInfo.Driver, lPrinterInfo.Device, lPrinterInfo.Port, GetPDevMode);

            if (FDC = 0) then
              begin
                lPrinterInfo.IsValid := False;

                {set printer name to screen and get screen dc}
                if not(FPrinting) and (FPrinterName <> cScreen) then
                  begin
                    SetPrinterName(cScreen);
                    FDC := GetDC;
                  end;
                
              end;

            if (FCanvas <> nil) then
              FCanvas.Handle := FDC;

            DeviceContextChanged;

          end;

      end;

    Result := FDC;

  finally
    FLock.Release;
  end;

end;  {function, GetDC}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPrinterInfo }

function TppCustomPrinter.GetPrinterInfo: TppPrinterInfo;
begin

  FLock.Acquire;

  try
    Result := ppPrinters.PrinterInfo[FPrinterName];
  finally
    FLock.Release;
  end;

end; {function, GetPrinterInfo}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPrinterCapabilities }

function TppCustomPrinter.GetPrinterCapabilities: TppPrinterCapabilities;
var
  lPrinterInfo: TppPrinterInfo;

begin

  FLock.Acquire;

  try

    lPrinterInfo := GetPrinterInfo;

    if lPrinterInfo <> nil then
      Result := lPrinterInfo.Capabilities
    else
      Result := nil;
  finally
    FLock.Release;
  end;

end;  {function, GetPrinterCapabilities}

{------------------------------------------------------------------------------}
{function TppCustomPrinter.CopyHandle}

function TppCustomPrinter.CopyHandle(aHandle: THandle): THandle;
var
  lpSource, lpDest: PChar;
  llSize: LongInt;
  lHandle: THandle;

begin

  FLock.Acquire;

  try
    Result  := 0;

    if aHandle = 0 then Exit;

    llSize := GlobalSize(aHandle);

    lHandle := GlobalAlloc(GHND, llSize);

    if lHandle <> 0 then
      try
        lpSource  := GlobalLock(aHandle);
        lpDest    := GlobalLock(lHandle);

        if (lpSource <> nil) and (lpDest <> nil) then
          Move(lpSource^, lpDest^, llSize);

      finally
        GlobalUnlock(aHandle);
        GlobalUnlock(lHandle);
      end;

    Result := lHandle;

  finally
    FLock.Release;
  end;

end; {function, ppCopyHandle }

{------------------------------------------------------------------------------}
{ TppCustomPrinter.FreeDC }

procedure TppCustomPrinter.FreeDC;
begin

  if FDC = 0 then Exit;

  if FCanvas <> nil then
    FCanvas.Handle := 0;

  DeleteDC(FDC);
  FDC := 0;

end;  {procedure, FreeDC}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.FreeDevMode }

procedure TppCustomPrinter.FreeDevMode;
begin

  if FDevMode = 0 then Exit;

  GlobalUnlock(FDevMode);
  GlobalFree(FDevMode);
  FDevMode  := 0;
  FPDevMode := nil;

end; {procedure, FreeDevMode}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.FreePrinterHandle }

procedure TppCustomPrinter.FreePrinterHandle;
begin

 if FPrinterHandle <> 0 then
   begin

     ClosePrinter(FPrinterHandle);

     FPrinterHandle := 0;

     FCurrentInfo := nil;

   end;

end; {procedure, FreePrinterHandle}


{------------------------------------------------------------------------------}
{ TppCustomPrinter.FreePrinterResources }

procedure TppCustomPrinter.FreePrinterResources;
begin

  if FPrinting then Exit;

  {free device context}
  FreeDC;

  {free device mode}
  FreeDevMode;

  {free printer handle}
  FreePrinterHandle;

end;   {procedure, FreePrinterResources}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetCanvas }

function TppCustomPrinter.GetCanvas: TCanvas;
begin

  FLock.Acquire;

  try

    if FCanvas = nil then
      FCanvas := TppPrinterCanvas.Create(Self);
    Result := FCanvas;
  finally
    FLock.Release;
  end;

end; {function, GetCanvas}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPrinterDescription }

function TppCustomPrinter.GetPrinterDescription: String;
begin

  FLock.Acquire;

  try
    if (FPrinterName = cDefault) then
      Result := ppPrinters.DefaultPrinterName
    else
      Result := FPrinterName;
  finally
    FLock.Release;
  end;

end;  {function, GetPrinterDescription}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.SetDevMode }

procedure TppCustomPrinter.SetDevMode(aDevMode: THandle);
begin

  FLock.Acquire;

  try

    {if printing set indicator to tell StartPage to get an updated DC}
    if FPrinting then
      FResetDC := True
    else
      FreeDC;

    {update the printer with the latest DevMode info }
    FreeDevMode;

    FDevMode := CopyHandle(aDevMode);

    FPDevMode := GlobalLock(FDevMode);

  finally
    FLock.Release;
  end;

end; {procedure, SetDevMode}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.SetPrinterName }

procedure TppCustomPrinter.SetPrinterName(aPrinterName: String);
var
  lPrinterInfo: TppPrinterInfo;
begin

  FLock.Acquire;

  try

    if FPrinting then Exit;

    {update system default printer}
    if (aPrinterName = cDefault) then
      ppPrinters.GetSystemDefaultPrinterName;

    lPrinterInfo := ppPrinters.PrinterInfo[aPrinterName];

    {if printerinfo is invalid, then revert to screen}
    if (lPrinterInfo = nil) or not(lPrinterInfo.IsValid) then
      lPrinterInfo := ppPrinters.PrinterInfo[cScreen];

    if (lPrinterInfo = nil) or (FCurrentInfo = lPrinterInfo) then Exit;

    if (FCurrentInfo <> nil) then
      FreePrinterResources;

    FPrinterName := lPrinterInfo.Name;

    FCurrentInfo := lPrinterInfo;
    
  finally
    FLock.Release;
  end;

end; {procedure, SetPrinterName}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.HasColor }

function TppCustomPrinter.HasColor: Boolean;
begin
  FLock.Acquire;

  try
    Result := (GetDeviceCaps(GetDC, NUMCOLORS) > 2) and
              (GetPDevMode^.dmColor = DMCOLOR_COLOR);
  finally
    FLock.Release;
  end;

end; {function, HasColor}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.ShowSetupDialog }

function TppCustomPrinter.ShowSetupDialog: Boolean;
var
  lSetupDlg: TppPrinterSetupDialog;
begin

  FLock.Acquire;

  try
    lSetupDlg := TppPrinterSetupDialog.Create(Application);

    try

      lSetupDlg.Printer := Self;

      Result := lSetupDlg.Execute;

    finally
      lSetupDlg.Free;

    end;

    if Result and Assigned(FOnSetupChange) then
      FOnSetupChange(Self);
  finally
    FLock.Release;
  end;

end; {procedure, ShowSetupDlg}


{------------------------------------------------------------------------------}
{ TppCustomPrinter.ShowPropertiesDialog }

function TppCustomPrinter.ShowPropertiesDialog: Boolean;
var
  lDevMode: THandle;
  lPDevMode: PDeviceMode;
  lForm: TForm;
begin

  FLock.Acquire;

  try

    Result := False;

    GetDevMode(lDevMode);

    try
      lPDevMode := GlobalLock(lDevMode);

      lForm := Screen.ActiveForm;

      if (lPDevMode <> nil) and (lForm <> nil) then
        Result := (Winspool.DocumentProperties(lForm.Handle, PrinterHandle, PrinterInfo.Device, lPDevMode^, lPDevMode^, DM_IN_BUFFER or DM_IN_PROMPT or DM_OUT_BUFFER) = IDOK);

      if Result then
        SetDevMode(lDevMode);

      GlobalUnlock(lDevMode);

    finally

      GlobalFree(lDevMode);

    end;

    if Result and Assigned(FOnSetupChange) then
      FOnSetupChange(Self);
      
  finally
   FLock.Release;
  end;

end; {procedure, ShowPropertiesDialog}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.UpdateForm }

procedure TppCustomPrinter.Initialize;
begin

  FLock.Acquire;

  try
    GetDC;

    DeviceContextChanged;
  finally
    FLock.Release;
  end;

end; {procedure, Initialize}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.UpdateForm }

{function GetForm(hPrinter: THandle; pFormName: PChar; Level: DWORD; pForm: Pointer;
  cbBuf: DWORD; var pcbNeeded: DWORD): BOOL; stdcall; }


procedure TppCustomPrinter.UpdateForm(const aFormName: String; aDimensions: TPoint; aPrintArea: TRect);
const
  FormLevel: Byte = 1;

var
  liSizeOfInfo: DWord;
  lFormInfo: TFormInfo1;
  lpNewFormInfo, lpCurrentFormInfo: PFormInfo1;

begin

  FLock.Acquire;

  try

    if not (Win32Platform = VER_PLATFORM_WIN32_NT) then Exit;

    {initialize the FormInfo data structure}
    with lFormInfo do
      begin
        Flags   := 0; {indicates form is not built-in}
        pName   := PChar(aFormName);
        Size.cx := aDimensions.X;
        Size.cy := aDimensions.Y;
        ImageableArea.Left   := aPrintArea.Left;
        ImageableArea.Top    := aPrintArea.Top;
        ImageableArea.Right  := aPrintArea.Right;
        ImageableArea.Bottom := aPrintArea.Bottom;
      end;

    lpNewFormInfo     := @lFormInfo;
    liSizeOfInfo      := 0;

    {get size of PrinterInfo buffer needed }
    GetForm(PrinterHandle, PChar(aFormName), FormLevel, nil, 0, liSizeOfInfo);

    {allocate required memory}
    GetMem(lpCurrentFormInfo, liSizeOfInfo);

    try

      {get form info}
      if GetForm(PrinterHandle, PChar(aFormName), FormLevel, lpCurrentFormInfo, liSizeOfInfo, liSizeOfInfo) then
        begin
          if (lpCurrentFormInfo.Size.cX <> lpNewFormInfo.Size.cX) or
             (lpCurrentFormInfo.Size.cY <> lpNewFormInfo.Size.cY) or
             (lpCurrentFormInfo.ImageableArea.Left <> lpNewFormInfo.ImageableArea.Left) or
             (lpCurrentFormInfo.ImageableArea.Top <> lpNewFormInfo.ImageableArea.Top) or
             (lpCurrentFormInfo.ImageableArea.Right <> lpNewFormInfo.ImageableArea.Right) or
             (lpCurrentFormInfo.ImageableArea.Bottom <> lpNewFormInfo.ImageableArea.Bottom) then

          {set existing form's dimensions}
          Winspool.SetForm(PrinterHandle, PChar(aFormName), FormLevel, lpNewFormInfo);
        end
      else
        {add a new form with required dimensions }
        Winspool.AddForm(PrinterHandle, FormLevel, lpNewFormInfo);

    finally

      FreeMem(lpCurrentFormInfo, liSizeOfInfo);

    end; {try, finally}
    
  finally
    FLock.Release;
  end;

end; {procedure, UpdateForm}


{------------------------------------------------------------------------------}
{ TppCustomPrinter.DeviceContextChanged }

procedure TppCustomPrinter.DeviceContextChanged;
var
  lPrintableSize, lOffSet: TPoint;

begin

  FLock.Acquire;

  try

    if FDC = 0 then Exit;

    FPixelsPerInch.X := GetDeviceCaps(FDC, LOGPIXELSX);
    FPixelsPerInch.Y := GetDeviceCaps(FDC, LOGPIXELSY);

    FPaperWidth  := GetDeviceCaps(FDC, PHYSICALWIDTH);
    FPaperHeight := GetDeviceCaps(FDC, PHYSICALHEIGHT);


    lPrintableSize.X := GetDeviceCaps(FDC, HorzRes);
    lPrintableSize.Y := GetDeviceCaps(FDC, VertRes);

    lOffSet.X   := GetDeviceCaps(FDC, PHYSICALOFFSETX);
    lOffSet.Y   := GetDeviceCaps(FDC, PHYSICALOFFSETY);

    FPrintableWidth  := lPrintableSize.X;
    FPrintableHeight := lPrintableSize.Y;

    {compute gutters }
    FPageGutters.Left := lOffSet.X;
    FPageGutters.Top  := lOffSet.Y;

    FPageGutters.Right  := FPaperWidth  - FPageGutters.Left - FPrintableWidth;
    FPageGutters.Bottom := FPaperHeight - FPageGutters.Top  - FPrintableHeight;

    FCanGrayScale := True;

    {for NT try to determine color capabilities for graycale}
    if (Win32Platform = VER_PLATFORM_WIN32_NT) and
       (GetDeviceCaps(FDC, SIZEPALETTE) = 2) and
       (GetDeviceCaps(FDC, NUMCOLORS) = 2) then

      FCanGrayScale := False;

  finally
    FLock.Release;
  end;


end; {procedure, DeviceContextChanged}


{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetCanGrayScale }

function TppCustomPrinter.GetCanGrayScale: Boolean;
begin

  FLock.Acquire;

  try

    {call GetDC which will create a DC and determine devcaps, if needed }
    GetDC;

    Result := FCanGrayScale;
  finally
   FLock.Release;
  end;

end; {function, GetCanGrayScale}


{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPaperWidth }

function TppCustomPrinter.GetPaperWidth: Longint;
begin

  FLock.Acquire;

  try

    {call GetDC which will create a DC and determine devcaps, if needed }
    GetDC;

    Result := FPaperWidth;

  finally
    FLock.Release;
  end;

end; {function, GetPaperWidth}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPaperHeight }

function TppCustomPrinter.GetPaperHeight: Longint;
begin

  FLock.Acquire;

  try

    {call GetDC which will create a DC and determine devcaps, if needed }
    GetDC;

    Result := FPaperHeight;

  finally
    FLock.Release;
  end;

end;  {function, GetPaperHeight}


{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPageGutters }

function TppCustomPrinter.GetPageGutters: TRect;
begin

  FLock.Acquire;

  try

    {call GetDC which will create a DC and determine devcaps, if needed }
    GetDC;

    Result := FPageGutters;

  finally
    FLock.Release;
  end;

end; {function, GetPageGutters}


{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPixelsPerInch }

function TppCustomPrinter.GetPixelsPerInch: TPoint;
begin

  FLock.Acquire;

  try

    {call GetDC which will create a DC and determine devcaps, if needed }
    GetDC;

    if FDC <> 0 then
      Result := FPixelsPerInch
    else
      Result := Point(Screen.PixelsPerInch, Screen.PixelsPerInch);
  finally
    FLock.Release;
  end;

end;  {function, GetPixelsPerInch}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPrintableHeight }

function TppCustomPrinter.GetPrintableHeight: LongInt;
begin

  FLock.Acquire;

  try

    {call GetDC which will create a DC and determine devcaps, if needed }
    GetDC;

    Result := FPrintableHeight;

  finally
    FLock.Release;
  end;

end;   {function, GetPrintableHeight}

{------------------------------------------------------------------------------}
{ TppCustomPrinter.GetPrintableWidth }

function TppCustomPrinter.GetPrintableWidth: LongInt;
begin

  FLock.Acquire;

  try

    {call GetDC which will create a DC and determine devcaps, if needed }
    GetDC;

    Result := FPrintableWidth;
    
  finally
    FLock.Release;
  end;

end; {function, GetPrintableWidth}


{******************************************************************************
 *
 ** P R I N T E R
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppPrinter.Create }

constructor TppPrinter.Create;
begin

  inherited Create;

  FPrinterSetup := TppPrinterSetup.Create(nil);
  FPrinterSetup.OnPageDefChange  := PrinterSetupChangeEvent;
  FPrinterSetup.OnPrintJobChange := PrinterSetupChangeEvent;
  FPrinterSetup.OnGetPrinter := PrinterSetupGetPrinterEvent;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppPrinter.Destroy }

destructor TppPrinter.Destroy;
begin

  FPrinterSetup.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppPrinter.GetPaperDimensions }

function TppPrinter.GetPaperDimensions: TPoint;
begin

  FPrinterSetup.Active := False;

  try

    if FPrinterSetup.Orientation = poPortrait then
      begin
        Result.X := Trunc(ppToMMTenths(FPrinterSetup.PaperWidth,  FPrinterSetup.Units, pprtHorizontal, Self));
        Result.Y := Trunc(ppToMMTenths(FPrinterSetup.PaperHeight, FPrinterSetup.Units, pprtVertical, Self));
      end
    else
      begin
        Result.X := Trunc(ppToMMTenths(FPrinterSetup.PaperHeight, FPrinterSetup.Units, pprtHorizontal, Self));
        Result.Y := Trunc(ppToMMTenths(FPrinterSetup.PaperWidth,  FPrinterSetup.Units, pprtVertical, Self));
      end;

  finally
    FPrinterSetup.Active := True;
  end;

end;  {function, GetPaperDimensions}

{------------------------------------------------------------------------------}
{ TppPrinter.SetPrinterSetup }

procedure TppPrinter.SetPrinterSetup(aPrinterSetup: TppPrinterSetup);
begin

  Lock.Acquire;

  try

    {optimization}
    if ((FCurrentInfo = nil) or (FCurrentInfo.Name = aPrinterSetup.PrinterDescription)) and
       FPrinterSetup.IsEqual(aPrinterSetup) then Exit;

    if not Printing and (FPrinterSetup.PrinterName <> aPrinterSetup.PrinterName) then
      FPrinterSetup.PrinterName := aPrinterSetup.PrinterName;

    FPrinterSetup.Active := False;

    try
      FPrinterSetup.Assign(aPrinterSetup);

      {translate to printer device mode settings}
      PrinterSetupToDevMode;

    finally
      FPrinterSetup.Active := True;
    end;
  finally
    Lock.Release;
  end;

end; {procedure, SetPrinterSetup }


{------------------------------------------------------------------------------}
{ TppPrinter.PrinterSetupToDevMode }

procedure TppPrinter.PrinterSetupToDevMode;
var
  lPaperDimensions: TPoint;
  lImageableArea: TRect;
  liIndex: Integer;
  lDevMode: THandle;
  lPDevMode: PDeviceMode;
  liBin: Integer;

begin

  FPrinterSetup.Active := False;

  PrinterName := FPrinterSetup.PrinterName;

  DocumentName := FPrinterSetup.DocumentName;
  FileName     := FPrinterSetup.FileName;

  GetDevMode(lDevMode);

  lPDevMode := GlobalLock(lDevMode);

  if (lPDevMode = nil) then Exit;


  {for Custom size paper on WinNT, need to add/modify a Form named Custom}
  if (Win32Platform = VER_PLATFORM_WIN32_NT) and (FPrinterSetup.PaperName = cCustom) then
    begin

      {convert paper dimensions to MMThousandths }
      if FPrinterSetup.Orientation = poPortrait then
        begin
         lPaperDimensions.X  := FPrinterSetup.PageDef.mmWidth;
         lPaperDimensions.Y  := FPrinterSetup.PageDef.mmHeight;
        end
      else
        begin
          lPaperDimensions.X  := FPrinterSetup.PageDef.mmHeight;
          lPaperDimensions.Y  := FPrinterSetup.PageDef.mmWidth;
        end;

      lImageableArea.Left   := 0;
      lImageableArea.Top    := 0;
      lImageableArea.Right  := lPaperDimensions.X;
      lImageableArea.Bottom := lPaperDimensions.Y;

      UpdateForm(FPrinterSetup.PaperName, lPaperDimensions, lImageableArea);
      StrPCopy(lPDevMode^.dmFormName, FPrinterSetup.PaperName);
    end;


  {set dmFields}
  lPDevMode^.dmFields := DM_COPIES or DM_DUPLEX or DM_ORIENTATION or DM_PAPERSIZE;

  if (FPrinterSetup.DelegateCopies) and not FPrinterSetup.Collation then
    lPDevMode^.dmCopies  := FPrinterSetup.Copies
  else  {copies for the printer devmode is always one, copies is handled by the TppPrinterDevice}
    lPDevMode^.dmCopies  := 1;

  {set duplex & orientation}
  lPDevMode^.dmDuplex      := Ord(FPrinterSetup.Duplex) + 1;
  lPDevMode^.dmOrientation := (Ord(FPrinterSetup.Orientation) + 1);

  {set paper size}
  lPDevMode^.dmPaperSize := FPrinterSetup.PaperSize;

  {if custom, set PaperLength, PaperWidth}
  if (FPrinterSetup.PaperName = cCustom) or (FPrinterSetup.PaperSize = 256)then
    begin
      lPDevMode^.dmFields := lPDevMode^.dmFields or DM_PAPERLENGTH or DM_PAPERWIDTH;
      lPaperDimensions := GetPaperDimensions;
      lPDevMode^.dmPaperWidth  := lPaperDimensions.X;
      lPDevMode^.dmPaperLength := lPaperDimensions.Y;

    end;

  liIndex := PrinterCapabilities.BinNames.IndexOf(FPrinterSetup.BinName);

  if (liIndex >= 0) and (liIndex < PrinterCapabilities.Bins.Count) then
    begin
      if FPrinterSetup.BinName = cDefault then
        liBin := FDefaultBin
      else
        liBin := StrToInt(PrinterCapabilities.Bins[liIndex]);

      lPDevMode^.dmDefaultSource := liBin;
      lPDevMode^.dmFields        := lPDevMode^.dmFields or DM_DEFAULTSOURCE;

    end;

  Winspool.DocumentProperties(0, PrinterHandle, PrinterInfo.Device, lPDevMode^, lPDevMode^, DM_IN_BUFFER or DM_OUT_BUFFER);

  GlobalUnlock(lDevMode);

  SetDevMode(lDevMode);

  GlobalFree(lDevMode);

  FPrinterSetup.Active := True;

end; {procedure, PrinterSetupToDevMode }

{------------------------------------------------------------------------------}
{ TppPrinter.GetDefaultBinName }

function TppPrinter.GetDefaultBinName: String;
var
 lPrinterSetup: TppPrinterSetup;
begin

  Lock.Acquire;

  try
    lPrinterSetup := GetPrinterSetup;

    if (DefaultBin >= 0) and (DefaultBin < lPrinterSetup.BinNames.Count) then
      Result := lPrinterSetup.BinNames[DefaultBin];
  finally
    Lock.Release;
  end;

end; {procedure, GetDefaultBinName }

{------------------------------------------------------------------------------}
{ TppPrinter.GetPrinterSetup }

function TppPrinter.GetPrinterSetup: TppPrinterSetup;
var
  liIndex: Integer;
  lDevMode: THandle;
  lPDevMode: PDeviceMode;
  lrPaperWidth,
  lrPaperHeight: Single;
begin

  Lock.Acquire;

  try
    Result := FPrinterSetup;

    FPrinterSetup.Active := False;

    GetDevMode(lDevMode);

    lPDevMode := GlobalLock(lDevMode);

    if (lpDevMode = nil) then Exit;

    if PrinterName <> FPrinterSetup.PrinterName then
      FPrinterSetup.PrinterName := PrinterName;

    {set copies}
    {do not get copies from DevMode, copies are handled by TppPrinterDevice}

    {set duplex }
    if (lPDevMode^.dmFields and DM_DUPLEX) > 0 then
      FPrinterSetup.Duplex := TppDuplexType(lPDevMode^.dmDuplex - 1);

    {set orientation}
    if (lPDevMode^.dmFields and DM_ORIENTATION) > 0 then
     FPrinterSetup.Orientation := TPrinterOrientation(lPDevMode^.dmOrientation - 1);

     {set paper size}
    if (lPDevMode^.dmFields and DM_PAPERSIZE) > 0 then
      begin
        liIndex := PrinterCapabilities.PaperSizes.IndexOf(IntToStr(lPDevMode^.dmPaperSize));

        if (liIndex >= 0) and (liIndex < PrinterCapabilities.PaperNames.Count) then
          begin
            FPrinterSetup.PaperName  := PrinterCapabilities.PaperNames[liIndex];

            if FPrinterSetup.Orientation = poPortrait then
              begin
                lrPaperWidth  := lPDevMode^.dmPaperWidth;
                lrPaperHeight := lPDevMode^.dmPaperLength;
              end
            else
              begin
                lrPaperWidth  := lPDevMode^.dmPaperLength;
                lrPaperHeight := lPDevMode^.dmPaperWidth;
              end;

            FPrinterSetup.PaperNameToDimensions(FPrinterSetup.PaperName, lrPaperWidth, lrPaperHeight);

            FPrinterSetup.PaperWidth  := lrPaperWidth;
            FPrinterSetup.PaperHeight := lrPaperHeight;
          end;
      end;


    {if custom, set PaperLength, PaperWidth}
    if (lPDevMode^.dmPaperSize = 256) then
      if FPrinterSetup.Orientation = poPortrait then
        begin
          FPrinterSetup.PaperWidth  := ppFromMMTenths(lPDevMode^.dmPaperWidth,  FPrinterSetup.Units, pprtHorizontal, Self);
          FPrinterSetup.PaperHeight := ppFromMMTenths(lPDevMode^.dmPaperLength, FPrinterSetup.Units, pprtVertical, Self);
        end
      else
        begin
          FPrinterSetup.PaperWidth  := ppFromMMTenths(lPDevMode^.dmPaperLength, FPrinterSetup.Units, pprtHorizontal, Self);
          FPrinterSetup.PaperHeight := ppFromMMTenths(lPDevMode^.dmPaperWidth,  FPrinterSetup.Units, pprtVertical, Self);
        end;


    {set paper bin, if needed}
    if (lPDevMode^.dmFields and DM_DEFAULTSOURCE) > 0 then
      begin
        if (lPDevMode^.dmDefaultSource = FDefaultBin) then
          FPrinterSetup.BinName := cDefault
        else
          begin
            liIndex := PrinterCapabilities.Bins.IndexOf(IntToStr(lPDevMode^.dmDefaultSource));

            if (liIndex >= 0) and (liIndex < PrinterCapabilities.BinNames.Count) then
              FPrinterSetup.BinName := PrinterCapabilities.BinNames[liIndex];

          end;

      end;

    GlobalUnlock(lDevMode);

    GlobalFree(lDevMode);

  finally
    FPrinterSetup.Active := True;

    Lock.Release;
  end;

end; {function, GetPrinterSetup }


{------------------------------------------------------------------------------}
{ TppPrinter.PrinterSetupChangeEvent }

procedure TppPrinter.PrinterSetupChangeEvent(Sender: TObject);
begin
  PrinterSetupToDevMode;
end; {procedure, PrinterSetupChangeEvent }

{------------------------------------------------------------------------------}
{ TppPrinter.PrinterSetupGetPrinterEvent }

procedure TppPrinter.PrinterSetupGetPrinterEvent(Sender: TObject; var aPrinter: TppPrinter);
begin
  aPrinter := Self;
end; {procedure, PrinterSetupGetPrinterEvent }



{******************************************************************************
 *
 ** P R I N T E R   S E T U P
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.Create }

constructor TppPrinterSetup.Create(aOwner: TComponent);
begin

  inherited Create;

  FActive         := True;
  FCollation      := True;
  FCopies         := 1;
  FDocumentName   := '';
  FFileName       := '';
  FDuplex         := dpNone;
  FUnits          := utInches;
  FDelegateCopies := False;
  FReadPaperSize  := 0;

  FOrientation    := poPortrait;
  FOwner          := aOwner;
  FPageDef        := TppPageDef.Create;
  FNewPageDef     := TppPageDef.Create;

  FOnGetPrinter         := nil;
  FOnPageDefChangeQuery := nil;
  FOnPageDefChange      := nil;
  FOnPrintJobChange     := nil;

  if DecimalSeparator = '.' then
    begin
      {default to Letter, 8 1/2- by 11-inches}
      FPageDef.mmWidth  := ppLetterPaperWidthInMM;
      FPageDef.mmHeight := ppLetterPaperHeightInMM;
    end
  else
    begin
      {default to A4 Sheet, 210- by 297-millimeters}
      FPageDef.mmWidth  := ppA4PaperWidthInMM;
      FPageDef.mmHeight := ppA4PaperHeightInMM;
    end;

  FPageDef.mmMarginBottom  := ppQuarterInchInMM;
  FPageDef.mmMarginLeft    := ppQuarterInchInMM;
  FPageDef.mmMarginRight   := ppQuarterInchInMM;
  FPageDef.mmMarginTop     := ppQuarterInchInMM;

  FPrinterName    := cDefault;
  FPaperName      := cCustom;
  FBinName        := cDefault;

  FPrinterInfo := ppPrinters.PrinterInfo[FPrinterName];

  FLock := TCriticalSection.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.Destroy }

destructor TppPrinterSetup.Destroy;
begin

  FLock.Free;
  FPageDef.Free;
  FNewPageDef.Free;

  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.Transfer }

procedure TppPrinterSetup.Transfer(Source: TPersistent);
var
  lPrinterSetup: TppPrinterSetup;
begin

  FLock.Acquire;

  try

    if (Source is TppPrinterSetup) then
      begin
        lPrinterSetup := TppPrinterSetup(Source);

        Assign(lPrinterSetup);

        FReadPaperSize  := lPrinterSetup.FReadPaperSize;
      end;

  finally
    FLock.Release;
  end;
  
end;

{------------------------------------------------------------------------------}
{ TppPrinterSetup.Assign }

procedure TppPrinterSetup.Assign(Source: TPersistent);
var
  lPrinterSetup: TppPrinterSetup;
  lPageDef: TppPageDef;
begin

  FLock.Acquire;

  try

    if (Source is TppPrinterSetup) then
      begin

        lPrinterSetup := TppPrinterSetup(Source);

        FCollation      := lPrinterSetup.FCollation;
        FCopies         := lPrinterSetup.FCopies;
        FDelegateCopies := lPrinterSetup.DelegateCopies;

        FDocumentName   := lPrinterSetup.FDocumentName;
        FFileName       := lPrinterSetup.FFileName;
        FPrinterName    := lPrinterSetup.FPrinterName;
        FDuplex         := lPrinterSetup.FDuplex;

        FOrientation    := lPrinterSetup.FOrientation;

        {note: assign from PageDef because both are in MMThousandths}
        lPageDef        := lPrinterSetup.PageDef;
        FPageDef.Assign(lPageDef);

        {when update printer name, also get printer info}
        FPrinterName    := lPrinterSetup.FPrinterName;
        FPrinterInfo    := ppPrinters.PrinterInfo[FPrinterName];

        {note: just set to custom - the GetPaperName will resolve this later}
       { FPaperName      := cCustom;}
        FPaperName      := lPrinterSetup.FPaperName;
        FReadPaperSize  := 0;  {clear the read paper size value}
        FBinName        := lPrinterSetup.FBinName;

        FUnits          := lPrinterSetup.FUnits;

      end
    else
      inherited Assign(Source);

  finally
    FLock.Release;
  end;

end; {procedure, Assign}




{------------------------------------------------------------------------------}
{ TppPrinterSetup.AssignJobDef }

procedure TppPrinterSetup.AssignJobDef(aPrinterSetup: TppPrinterSetup);
begin

  FLock.Acquire;

  try

    FPrinterName := aPrinterSetup.FPrinterName;
    FPrinterInfo := ppPrinters.PrinterInfo[FPrinterName];
    FBinName := aPrinterSetup.FBinName;
    FCollation := aPrinterSetup.FCollation;
    FCopies := aPrinterSetup.FCopies;
    FDuplex := aPrinterSetup.FDuplex;
  finally
    FLock.Release;
  end;

end; {procedure, AssignJobDef}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.Loaded }

procedure TppPrinterSetup.Loaded;
begin

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.ConvertPrinterSetup }

procedure TppPrinterSetup.ConvertPrinterSetup;
begin

  FLock.Acquire;

  try
    FPageDef.mmHeight := ppToMMThousandths(FOldPaperHeight, FUnits, pprtVertical, nil);
    FPageDef.mmWidth  := ppToMMThousandths(FOldPaperWidth, FUnits, pprtHorizontal, nil);
    
  finally
    FLock.Release;
  end;

end;

{------------------------------------------------------------------------------}
{ TppPrinterSetup.IsPrinterDefEqual }

function TppPrinterSetup.IsPrinterDefEqual(aPrinterSetup: TppPrinterSetup): Boolean;
begin

  FLock.Acquire;

  try

    Result := (PrinterDescription = aPrinterSetup.PrinterDescription)  and
              (FOrientation       = aPrinterSetup.FOrientation) and
              (FPaperName         = aPrinterSetup.FPaperName);
              {note: compare properties so that units are the same }
              {PageDef.IsEqual(aPrinterSetup.PageDef);}
  finally
    FLock.Release;
  end;

end; {function, IsPrinterDef}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.IsEqual }

function TppPrinterSetup.IsEqual(aPrinterSetup: TppPrinterSetup): Boolean;
begin

  FLock.Acquire;

  try

    Result := (PrinterDescription = aPrinterSetup.PrinterDescription)  and
              (FBinName           = aPrinterSetup.FBinName)            and
              (FCollation         = aPrinterSetup.FCollation)          and
              (FCopies            = aPrinterSetup.FCopies)             and
              (FDelegateCopies    = aPrinterSetup.DelegateCopies)      and
              (FDocumentName      = aPrinterSetup.FDocumentName)       and
              (FFileName          = aPrinterSetup.FFileName)           and
              (FDuplex            = aPrinterSetup.FDuplex)             and
              (FOrientation       = aPrinterSetup.FOrientation)        and

              {note: compare properties so that units are the same }
              PageDef.IsEqual(aPrinterSetup.PageDef);

  finally
    FLock.Release;
  end;

end; {function, IsEqual}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.DefineProperties - read/write private 'fake' properties }

procedure TppPrinterSetup.DefineProperties(Filer: TFiler);
var
  lAncestor: TppPrinterSetup;

begin

  inherited DefineProperties(Filer);

  if (Filer.Ancestor is TppPrinterSetup) then
    lAncestor := TppPrinterSetup(Filer.Ancestor)
  else
    lAncestor := nil;


  if (lAncestor <> nil) then
    begin
      Filer.DefineProperty('mmMarginBottom', ReadMarginBottom, WriteMarginBottom,
                                 FPageDef.mmMarginBottom <> lAncestor.FPageDef.mmMarginBottom);
      Filer.DefineProperty('mmMarginLeft', ReadMarginLeft, WriteMarginLeft,
                                 FPageDef.mmMarginLeft <> lAncestor.FPageDef.mmMarginLeft);
      Filer.DefineProperty('mmMarginRight', ReadMarginRight, WriteMarginRight,
                                 FPageDef.mmMarginRight <> lAncestor.FPageDef.mmMarginRight);
      Filer.DefineProperty('mmMarginTop', ReadMarginTop, WriteMarginTop,
                                 FPageDef.mmMarginTop <> lAncestor.FPageDef.mmMarginTop);

      Filer.DefineProperty('mmPaperHeight', ReadPaperHeight, WritePaperHeight,
                                 FPageDef.mmHeight <> lAncestor.FPageDef.mmHeight);
      Filer.DefineProperty('mmPaperWidth', ReadPaperWidth, WritePaperWidth,
                                 FPageDef.mmWidth <> lAncestor.FPageDef.mmWidth);
      Filer.DefineProperty('PaperSize', ReadPaperSize, WritePaperSize,
                                  GetPaperSize <> lAncestor.GetPaperSize);

    end
  else
    begin
      Filer.DefineProperty('mmMarginBottom', ReadMarginBottom, WriteMarginBottom, True);
      Filer.DefineProperty('mmMarginLeft',   ReadMarginLeft,   WriteMarginLeft,   True);
      Filer.DefineProperty('mmMarginRight',  ReadMarginRight,  WriteMarginRight,  True);
      Filer.DefineProperty('mmMarginTop',    ReadMarginTop,    WriteMarginTop,    True);

      Filer.DefineProperty('mmPaperHeight',  ReadPaperHeight, WritePaperHeight, True);
      Filer.DefineProperty('mmPaperWidth',   ReadPaperWidth,  WritePaperWidth,  True);
      Filer.DefineProperty('PaperSize',      ReadPaperSize,   WritePaperSize,   True);
    end;

end; {procedure, DefineProperties}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.ReadMarginBottom }

procedure TppPrinterSetup.ReadMarginBottom(Reader: TReader);
begin
  FPageDef.mmMarginBottom := ppReadIntegerPropValue(Reader);
end; {procedure, ReadMarginBottom}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.ReadMarginLeft }

procedure TppPrinterSetup.ReadMarginLeft(Reader: TReader);
begin
  FPageDef.mmMarginLeft := ppReadIntegerPropValue(Reader);
end;  {procedure, ReadMarginLeft}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.ReadMarginRight }

procedure TppPrinterSetup.ReadMarginRight(Reader: TReader);
begin
  FPageDef.mmMarginRight := ppReadIntegerPropValue(Reader);
end;  {procedure, ReadMarginRight}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.ReadMarginTop }

procedure TppPrinterSetup.ReadMarginTop(Reader: TReader);
begin
  FPageDef.mmMarginTop := ppReadIntegerPropValue(Reader);
end; {procedure, ReadMarginTop}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.ReadPaperHeight }

procedure TppPrinterSetup.ReadPaperHeight(Reader: TReader);
begin
  FPageDef.mmHeight := ppReadIntegerPropValue(Reader);
end; {procedure, ReadPaperHeight}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.ReadPaperWidth }

procedure TppPrinterSetup.ReadPaperWidth(Reader: TReader);
begin
  FPageDef.mmWidth := ppReadIntegerPropValue(Reader);

end; {procedure, ReadPaperWidth}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.ReadPaperSize }

procedure TppPrinterSetup.ReadPaperSize(Reader: TReader);
begin
  FReadPaperSize := ppReadIntegerPropValue(Reader);

end; {procedure, ReadPaperSize}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.WriteMarginBottom }

procedure TppPrinterSetup.WriteMarginBottom(Writer: TWriter);
begin
   Writer.WriteInteger(FPageDef.mmMarginBottom);
end;  {procedure, WriteMarginBottom}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.WriteMarginLeft }

procedure TppPrinterSetup.WriteMarginLeft(Writer: TWriter);
begin
   Writer.WriteInteger(FPageDef.mmMarginLeft);
end;  {procedure, WriteMarginLeft}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.WriteMarginRight }

procedure TppPrinterSetup.WriteMarginRight(Writer: TWriter);
begin
   Writer.WriteInteger(FPageDef.mmMarginRight);
end;  {procedure, WriteMarginRight}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.WriteMarginTop }

procedure TppPrinterSetup.WriteMarginTop(Writer: TWriter);
begin
   Writer.WriteInteger(FPageDef.mmMarginTop);
end; {procedure, WriteMarginTop}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.WritePaperHeight }

procedure TppPrinterSetup.WritePaperHeight(Writer: TWriter);
begin
   Writer.WriteInteger(FPageDef.mmHeight);
end;  {procedure, WritePaperHeight}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.WritePaperWidth }

procedure TppPrinterSetup.WritePaperWidth(Writer: TWriter);
begin
   Writer.WriteInteger(FPageDef.mmWidth);
end; {procedure, WritePaperWidth}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.WritePaperSize }

procedure TppPrinterSetup.WritePaperSize(Writer: TWriter);
begin
   Writer.WriteInteger(GetPaperSize);
end; {procedure, WritePaperSize}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.DoConfirmPageDefChange }

function TppPrinterSetup.DoConfirmPageDefChange(aPageDef: TppPageDef): Boolean;
begin

  Result := True;

  if Assigned(FOnPageDefChangeQuery) and Active then
    FOnPageDefChangeQuery(Self, aPageDef, Result);
    
end; {function, DoConfirmPageDefChange}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.DoPageDefChange }

procedure TppPrinterSetup.DoPageDefChange;
begin

  if Assigned(FOnPageDefChange) and Active then
    FOnPageDefChange(Self);

end; {procedure, DoPageDefChange}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.DoPrintJobChange }

procedure TppPrinterSetup.DoPrintJobChange;
begin

  if Assigned(FOnPrintJobChange) and Active then
    FOnPrintJobChange(Self);

end; {procedure, DoPrintJobChange}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetActive }

function TppPrinterSetup.GetActive: Boolean;
begin

  FLock.Acquire;

  try

    if (FOwner <> nil) and ((csReading in FOwner.ComponentState) or (csLoading in FOwner.ComponentState)) then
      Result := False
    else
      Result := FActive;

  finally
    FLock.Release;
  end;

end;  {function, GetActive}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetBin }

function TppPrinterSetup.GetBin: Integer;
var
  liIndex: Integer;
begin

  Result := -1;

  if (FPrinterInfo <> nil) and (FBinName <> cDefault) then
    begin
      liIndex := FPrinterInfo.Capabilities.BinNames.IndexOf(FBinName);

      if (liIndex >= 0) then
         Result := StrToInt(FPrinterInfo.Capabilities.Bins[liIndex]);

    end;


end;

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetBinNames }

function TppPrinterSetup.GetBinNames: TStrings;
begin

  FLock.Acquire;

  try

    if (FPrinterInfo <> nil) then
      Result := FPrinterInfo.Capabilities.BinNames
    else
      Result := ppNoPrinterInfo.Capabilities.BinNames;
      
  finally
    FLock.Release;
  end;

end; {function, GetBinNames}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetPrinter }

function TppPrinterSetup.GetPrinter: TppPrinter;
begin

  FLock.Acquire;

  Result := nil;

  try

    {optimization: only need printer when converting from/to printer pixels}
    if (Units <> utPrinterPixels) then Exit;

    if Assigned(FOnGetPrinter) then FOnGetPrinter(Self, Result);

    {if no printer assigned, return the global printer}
    if (Result = nil) then
      Result := ppPrinter;

  finally
    FLock.Release;
  end;

end; {function, GetPrinter}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetMarginBottom }

function TppPrinterSetup.GetMarginBottom: Single;
begin

  FLock.Acquire;

  try
    Result := ppFromMMThousandths(FPageDef.mmMarginBottom, FUnits, pprtVertical, GetPrinter);

  finally
    FLock.Release;
  end;

end;  {function, GetMarginBottom}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetMarginLeft }

function TppPrinterSetup.GetMarginLeft: Single;
begin

  FLock.Acquire;

  try
    Result := ppFromMMThousandths(FPageDef.mmMarginLeft, FUnits, pprtHorizontal, GetPrinter);

  finally
    FLock.Release;
  end;

end;  {function, GetMarginLeft}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetMarginRight }

function TppPrinterSetup.GetMarginRight: Single;
begin

  FLock.Acquire;

  try
    Result := ppFromMMThousandths(FPageDef.mmMarginRight, FUnits, pprtHorizontal, GetPrinter);

  finally
    FLock.Release;
  end;

end;  {function, GetMarginRight}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetMarginTop }

function TppPrinterSetup.GetMarginTop: Single;
begin

  FLock.Acquire;

  try
    Result := ppFromMMThousandths(FPageDef.mmMarginTop, FUnits, pprtVertical, GetPrinter);

  finally
    FLock.Release;
  end;

end;  {function, GetMarginTop}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetPaperHeight }

function TppPrinterSetup.GetPaperHeight: Single;
begin

  FLock.Acquire;

  try
    Result := ppFromMMThousandths(FPageDef.mmHeight, FUnits, pprtVertical, GetPrinter);

  finally
    FLock.Release;
  end;

end;  {function, GetPaperHeight}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetPaperWidth }

function TppPrinterSetup.GetPaperWidth: Single;
begin

  FLock.Acquire;

  try
    Result := ppFromMMThousandths(FPageDef.mmWidth, FUnits, pprtHorizontal, GetPrinter);
 
  finally
    FLock.Release;
  end;

end;  {function, GetPaperWidth}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetPrintableHeight }

function TppPrinterSetup.GetPrintableHeight: Single;
begin

  FLock.Acquire;

  try
    Result := ppFromMMThousandths(FPageDef.mmPrintableHeight, FUnits, pprtVertical, GetPrinter);

  finally
    FLock.Release;
  end;

end;  {function, GetPrintableHeight}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetPrintableWidth }

function TppPrinterSetup.GetPrintableWidth: Single;
begin

  FLock.Acquire;

  try
    Result := ppFromMMThousandths(FPageDef.mmPrintableWidth, FUnits, pprtVertical, GetPrinter);

  finally
    FLock.Release;
  end;

end;  {function, GetPrintableWidth}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetPrinterDescription }

function TppPrinterSetup.GetPrinterDescription: String;
begin

  FLock.Acquire;

  try

    if (FPrinterName = cDefault) then
      Result := ppPrinters.DefaultPrinterName
    else
      Result := FPrinterName;
      
  finally
    FLock.Release;
  end;

end; {function, GetPrinterDescription}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetPaperSize }

function TppPrinterSetup.GetPaperSize: Word;
var
  liIndex: Integer;
  lPrinterCapabilities: TppPrinterCapabilities;
  lsPaperName: String;

begin

  FLock.Acquire;

  Result := 0;

  try

    if (FPrinterInfo = nil) then Exit;

    lPrinterCapabilities := FPrinterInfo.Capabilities;

    {search for the paper name}
    liIndex := lPrinterCapabilities.PaperNames.IndexOf(FPaperName);

    if liIndex <= 0 then
      begin
        PaperDimensionsToName(PaperWidth, PaperHeight, lsPaperName);
        liIndex := lPrinterCapabilities.PaperNames.IndexOf(lsPaperName);
      end;

    {return the paper size}
    if (liIndex >= 0) and (liIndex < lPrinterCapabilities.PaperSizes.Count) then

      Result := StrToInt(lPrinterCapabilities.PaperSizes[liIndex])
    else
      Result := 256; {custom}

  finally
    FLock.Release;
  end;

end;  {function, GetPaperSize}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.PaperSizeToName }

function TppPrinterSetup.PaperSizeToName(aPaperSize: Word; var lsPaperName: String): Boolean;
var
  liIndex: Integer;
  lPrinterCapabilities: TppPrinterCapabilities;

begin

  Result := False;
  lsPaperName := '';

  if (FPrinterInfo = nil) then Exit;

  lPrinterCapabilities := FPrinterInfo.Capabilities;

  liIndex := lPrinterCapabilities.PaperSizes.IndexOf(IntToStr(aPaperSize));

  if (liIndex >= 0) and (liIndex < lPrinterCapabilities.PaperSizes.Count) then
    lsPaperName := lPrinterCapabilities.PaperNames[liIndex];

  Result := lsPaperName <> '';

end; {function, PaperSizeToName}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetPrinterNames }

function TppPrinterSetup.GetPrinterNames: TStrings;
begin

  FLock.Acquire;

  try
    Result := ppPrinters.PrinterNames;
    
  finally
    FLock.Release;
  end;

end;  {function, GetPrinterNames}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetPaperNames }

function TppPrinterSetup.GetPaperNames: TStrings;
begin

  FLock.Acquire;

  try

  if (FPrinterInfo <> nil) then
    Result := FPrinterInfo.Capabilities.PaperNames
  else
    Result := ppNoPrinterInfo.Capabilities.PaperNames;

  finally
    FLock.Release;
  end;

end;  {function, GetPaperNames}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.GetPaperName }

function TppPrinterSetup.GetPaperName: String;
var
  lsPaperName: String;
begin

  {if printersetup was just loaded, derive the papername from the saved papersize}
  if FReadPaperSize > 0 then
    begin
      if PaperSizeToName(FReadPaperSize, lsPaperName) then
        FPaperName := lsPaperName;
      FReadPaperSize := 0;
    end;


  if FPaperName = cCustom then
    PaperDimensionsToName(PaperWidth, PaperHeight, FPaperName);

  Result := FPaperName;

end; {function, GetPaperName}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetBinName }

procedure TppPrinterSetup.SetBinName(aBinName: String);
begin

  FLock.Acquire;

  try

    if (aBinName = cCurrent) then
      aBinName := cDefault;

    if FBinName = aBinName then Exit;

    FBinName  := aBinName;

    DoPrintJobChange;

  finally
    FLock.Release;
  end;

end; {procedure, SetBinName}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetCollation }

procedure TppPrinterSetup.SetCollation(aValue: Boolean);
begin

  FLock.Acquire;

  try

    if (FCollation = aValue) then Exit;

    FCollation  := aValue;

    DoPrintJobChange;

  finally
    FLock.Release;
  end;

end; {procedure, SetCollation}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetCopies }

procedure TppPrinterSetup.SetCopies(aCopies: Integer);
begin

  FLock.Acquire;

  try

    if (FCopies = aCopies) or (aCopies < 1) then Exit;

    FCopies  := aCopies;

    DoPrintJobChange;

  finally
    FLock.Release;
  end;

end; {procedure, SetCopies}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetDocumentName }

procedure TppPrinterSetup.SetDocumentName(aDocumentName: String);
begin

  FLock.Acquire;

  try

    if (FDocumentName = aDocumentName) then Exit;

    FDocumentName := aDocumentName;

    DoPrintJobChange;

  finally
    FLock.Release;
  end;

end; {procedure, SetDocumentName}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetDuplex }

procedure TppPrinterSetup.SetDuplex(aDuplex: TppDuplexType);
begin

  FLock.Acquire;

  try

    if (FDuplex = aDuplex) then Exit;

    FDuplex := aDuplex;

    DoPrintJobChange;

  finally
    FLock.Release;
  end;

end; {procedure, SetDuplex}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetMarginBottom }

procedure TppPrinterSetup.SetMarginBottom(aMargin: Single);
begin

  FLock.Acquire;

  try

    if (aMargin < 0) then Exit;

    FNewPageDef.Assign(FPageDef);
    FNewPageDef.mmMarginBottom := ppToMMThousandths(aMargin, FUnits, pprtVertical, GetPrinter);

    if DoConfirmPageDefChange(FNewPageDef) then
      begin

        FPageDef.mmMarginBottom := FNewPageDef.mmMarginBottom;

        DoPageDefChange;

      end;

  finally
    FLock.Release;
  end;

end; {procedure, SetMarginBottom}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetMarginLeft }

procedure TppPrinterSetup.SetMarginLeft(aMargin: Single);
begin

  FLock.Acquire;

  try

    if (aMargin < 0) then Exit;

    FNewPageDef.Assign(FPageDef);
    FNewPageDef.mmMarginLeft := ppToMMThousandths(aMargin, FUnits, pprtHorizontal, GetPrinter);

    if DoConfirmPageDefChange(FNewPageDef) then
      begin

        FPageDef.mmMarginLeft := FNewPageDef.mmMarginLeft;

        DoPageDefChange;

      end;

  finally
    FLock.Release;
  end;

end; {procedure, SetMarginLeft}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetMarginRight }

procedure TppPrinterSetup.SetMarginRight(aMargin: Single);
begin

  FLock.Acquire;

  try

    if (aMargin < 0) then Exit;

    FNewPageDef.Assign(FPageDef);
    FNewPageDef.mmMarginRight := ppToMMThousandths(aMargin, FUnits, pprtHorizontal, GetPrinter);

    if DoConfirmPageDefChange(FNewPageDef) then
      begin

        FPageDef.mmMarginRight := FNewPageDef.mmMarginRight;

        DoPageDefChange;

      end;

  finally
    FLock.Release;
  end;

end; {procedure, SetMarginRight}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetMarginTop }

procedure TppPrinterSetup.SetMarginTop(aMargin: Single);
begin

  FLock.Acquire;

  try

    if (aMargin < 0) then Exit;

    FNewPageDef.Assign(FPageDef);
    FNewPageDef.mmMarginTop := ppToMMThousandths(aMargin, FUnits, pprtVertical, GetPrinter);

    if DoConfirmPageDefChange(FNewPageDef) then
      begin

        FPageDef.mmMarginTop := FNewPageDef.mmMarginTop;

        DoPageDefChange;

      end;

  finally
    FLock.Release;
  end;

end; {procedure, SetMarginTop}



{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetPrinterName }

procedure TppPrinterSetup.SetPrinterName(aPrinterName: String);
var
  lsPaperName: String;
  lPrinterInfo: TppPrinterInfo;
  liPaperSize: Word;

begin
  
  FLock.Acquire;

  try

    if (aPrinterName = cCurrent) then
      aPrinterName := cDefault;

    {get the current paper size word value}
    if Active then
      liPaperSize := GetPaperSize
    else
      liPaperSize := 0;

    {check whether printer info exists for this printer name}
    lPrinterInfo := ppPrinters.PrinterInfo[aPrinterName];

    if lPrinterInfo = nil then Exit;

    {convert to standardized the name}
    if aPrinterName <> cDefault then
      aPrinterName := lPrinterInfo.Name;

    FPrinterName := aPrinterName;

    FPrinterInfo := lPrinterInfo;

    if not Active then Exit;

    {set paper name for new printer }
    if (liPaperSize > 0) and (liPaperSize <> 256) then
      PaperSizeToName(liPaperSize, lsPaperName)
    else
      lsPaperName := '';

    {if paper size not available then set based on dimensions}
    if lsPaperName = '' then
      PaperDimensionsToName(PaperWidth, PaperHeight, lsPaperName);

    FPaperName := lsPaperName;

    DoPrintJobChange;

  finally
    FLock.Release;
  end;

end; {procedure, SetPrinterName }

{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetPaperName }

procedure TppPrinterSetup.SetPaperName(aPaperName: String);
var
  lNewHeight: Single;
  lNewWidth: Single;

begin

  FLock.Acquire;

  try

    if not Active or (aPaperName = cCustom) then

      FPaperName := aPaperName
    else
      begin

        {initialize the papername property for the case in which the report has
         just been loaded. This will set FReadPaperSize to 0.}
        if (FReadPaperSize > 0) then
          GetPaperName;

        {set orientation to Landscape for envelopes }
        if (Pos('Envelope', aPaperName) > 0) then
          FOrientation := poLandscape;

        lNewWidth  :=  PaperWidth;
        lNewHeight :=  PaperHeight;

        PaperNameToDimensions(aPaperName, lNewWidth, lNewHeight);

        FNewPageDef.Assign(FPageDef);
        FNewPageDef.mmWidth  := ppToMMThousandths(lNewWidth, FUnits, pprtHorizontal, GetPrinter);
        FNewPageDef.mmHeight := ppToMMThousandths(lNewHeight, FUnits, pprtVertical, GetPrinter);

        if DoConfirmPageDefChange(FNewPageDef) then
          begin

            FPaperName        := aPaperName;
            FPageDef.mmWidth  := FNewPageDef.mmWidth;
            FPageDef.mmHeight := FNewPageDef.mmHeight;

            DoPageDefChange;

          end;

      end;

  finally
    FLock.Release;
  end;

end; {procedure, SetPaperName }

{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetPaperHeight }

procedure TppPrinterSetup.SetPaperHeight(aPaperHeight: Single);
begin

  FLock.Acquire;

  try

    {used to convert to 3.0}
    if (FOwner <> nil) and (csReading in FOwner.ComponentState) then
      begin
        FOldPaperHeight := aPaperHeight;
        Exit;
      end;


    if (aPaperHeight < 0) then Exit;

    FNewPageDef.Assign(FPageDef);
    FNewPageDef.mmHeight := ppToMMThousandths(aPaperHeight, FUnits, pprtVertical, GetPrinter);

    if DoConfirmPageDefChange(FNewPageDef) then
      begin

        FPageDef.mmHeight := FNewPageDef.mmHeight;

        PaperDimensionsToName(GetPaperWidth, GetPaperHeight, FPaperName);

        DoPageDefChange;

      end;

  finally
    FLock.Release;
  end;

end; {procedure, SetPaperHeight}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetPaperWidth }

procedure TppPrinterSetup.SetPaperWidth(aPaperWidth: Single);
begin
     
  FLock.Acquire;

  try

    {used to convert to 3.0}
    if (FOwner <> nil) and (csReading in FOwner.ComponentState) then
      begin
        FOldPaperWidth := aPaperWidth;
        Exit;
      end;


    if (aPaperWidth < 0) then Exit;

    FNewPageDef.Assign(FPageDef);
    FNewPageDef.mmWidth := ppToMMThousandths(aPaperWidth, FUnits, pprtHorizontal, GetPrinter);

    if DoConfirmPageDefChange(FNewPageDef) then
      begin

        FPageDef.mmWidth := FNewPageDef.mmWidth;

        PaperDimensionsToName(GetPaperWidth, GetPaperHeight, FPaperName);

        DoPageDefChange;

      end;

  finally
    FLock.Release;
  end;

end; {procedure, SetPaperWidth}


{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetOrientation }

procedure TppPrinterSetup.SetOrientation(aOrientation: TPrinterOrientation);
var
  lNewWidth: LongInt;

begin

  FLock.Acquire;

  try

    if (FOrientation = aOrientation) then Exit;

    FNewPageDef.Assign(FPageDef);
    FNewPageDef.mmWidth  := FPageDef.mmHeight;
    FNewPageDef.mmHeight := FPageDef.mmWidth;

    if DoConfirmPageDefChange(FNewPageDef) then
      begin

        FOrientation := aOrientation;

        lNewWidth         := FPageDef.mmWidth;
        FPageDef.mmWidth  := FPageDef.mmHeight;
        FPageDef.mmHeight := lNewWidth;

        DoPageDefChange;

      end;

  finally
    FLock.Release;
  end;

 end; {procedure, SetOrientation}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.SetUnits }

procedure TppPrinterSetup.SetUnits(aUnits: TppUnitType);
var
  lNewHeight: Single;
  lNewWidth: Single;
  lsPaperName: String;
begin

  FLock.Acquire;

  try

    if (FUnits = aUnits) then Exit;

    FUnits := aUnits;

    {for accuracy need to recalc the paper width and height using the printer
     drivers paper dimensions}
    if Active then
      begin
        lNewWidth  :=  PaperWidth;
        lNewHeight :=  PaperHeight;

        lsPaperName := GetPaperName;

        if (lsPaperName <> cCustom) then
          PaperNameToDimensions(lsPaperName, lNewWidth, lNewHeight);

        FPageDef.mmWidth  := ppToMMThousandths(lNewWidth, FUnits, pprtHorizontal, GetPrinter);
        FPageDef.mmHeight := ppToMMThousandths(lNewHeight, FUnits, pprtVertical, GetPrinter);

        DoPageDefChange;

     end;

  finally
    FLock.Release;
  end;

end;  {procedure, SetUnits}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.PaperNameToDimensions }

procedure TppPrinterSetup.PaperNameToDimensions(const aPaperName: String; var aPaperWidth, aPaperHeight: Single);
var
  llHeightInMM: Longint;
  llWidthInMM: Longint;
  liPaperIndex: Integer;

begin

  {note: do not optimize this any further}
  if (FPrinterInfo = nil) {or (aPaperName = cCustom)} then Exit;

  {set stock paper sizes for this paper name }

  liPaperIndex :=  FPrinterInfo.Capabilities.PaperNames.IndexOf(aPaperName);

  if (liPaperIndex >= 0) and (liPaperIndex < FPrinterInfo.Capabilities.PaperWidths.Count) then
    begin

      llWidthInMM  := StrToInt(FPrinterInfo.Capabilities.PaperWidths[liPaperIndex]);
      if (liPaperIndex >= 0) and (liPaperIndex < FPrinterInfo.Capabilities.PaperHeights.Count) then
        llHeightInMM := StrToInt(FPrinterInfo.Capabilities.PaperHeights[liPaperIndex])
      else
        llHeightInMM := 0;

      if FOrientation = poPortrait then
        begin
          aPaperWidth  := ppFromMMTenths(llWidthInMM, FUnits, pprtHorizontal, GetPrinter);
          aPaperHeight := ppFromMMTenths(llHeightInMM, FUnits, pprtVertical, GetPrinter);
        end
      else
        begin
          aPaperWidth := ppFromMMTenths(llHeightInMM, FUnits, pprtHorizontal, GetPrinter);
          aPaperHeight := ppFromMMTenths(llWidthInMM, FUnits, pprtVertical, GetPrinter)
        end;

   end;

end; {procedure, PaperNameToDimensions}

{------------------------------------------------------------------------------}
{ TppPrinterSetup.PaperDimensionsToName }

procedure TppPrinterSetup.PaperDimensionsToName(aPaperWidth, aPaperHeight: Single; var aPaperName: String);
var
  llHeightInMM: Longint;
  llWidthInMM: Longint;
  lbPaperFound: Boolean;
  lPrinterCapabilities: TppPrinterCapabilities;
  liPaperIndex: Integer;

begin


  if (FPrinterInfo = nil) then Exit;

  lPrinterCapabilities := FPrinterInfo.Capabilities;

  {determine whether paper size is a stock size supported by the printer}
  lbPaperFound := False;
  liPaperIndex := 0;


  if FOrientation = poPortrait then
    begin
      llWidthInMM  := Trunc(ppToMMTenths(aPaperWidth,  FUnits, pprtHorizontal, GetPrinter));
      llHeightInMM := Trunc(ppToMMTenths(aPaperHeight, FUnits, pprtVertical, GetPrinter));
    end
  else
    begin
      llWidthInMM  := Trunc(ppToMMTenths(aPaperHeight,  FUnits, pprtVertical, GetPrinter));
      llHeightInMM := Trunc(ppToMMTenths(aPaperWidth,   FUnits, pprtHorizontal, GetPrinter));
    end;


  while not lbPaperFound and (liPaperIndex <= lPrinterCapabilities.PaperHeights.Count-1) do
    begin
      if ( Abs ( (llHeightInMM - StrToInt(lPrinterCapabilities.PaperHeights[liPaperIndex]))) <= 10) and
         ( Abs ( (llWidthInMM  - StrToInt(lPrinterCapabilities.PaperWidths[liPaperIndex])))  <= 10)  then
           lbPaperFound := True

      else
        Inc(liPaperIndex);

    end;

  {set paper name}
  if lbPaperFound and (liPaperIndex < lPrinterCapabilities.PaperNames.Count) then
    aPaperName := lPrinterCapabilities.PaperNames[liPaperIndex]
  else
    aPaperName := cCustom;

end; {procedure, PaperDimensionsToName}



{******************************************************************************
 *
 ** P A G E D E F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPageDef.PageRect }

function TppPageDef.PageRect: TppRect;
begin

  Result := ppRect( FMarginLeft,
                    FMarginTop,
                    FWidth - FMarginRight,
                    FHeight - FMarginBottom);

end; {function, PageRect}

{------------------------------------------------------------------------------}
{ TppPageDef.IsEqual }

function TppPageDef.IsEqual(aPageDef: TppPageDef): Boolean;
begin
  Result := (FHeight       = aPageDef.mmHeight)        and
            (FWidth        = aPageDef.mmWidth)         and
            (FMarginLeft   = aPageDef.mmMarginLeft)    and
            (FMarginRight  = aPageDef.mmMarginRight)   and
            (FMarginTop    = aPageDef.mmMarginTop)     and
            (FMarginBottom = aPageDef.mmMarginBottom);
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetPrintableHeight }

function TppPageDef.GetPrintableHeight: Longint;
begin
  Result := FHeight - (FMarginTop + FMarginBottom);
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetPrintableWidth }

function TppPageDef.GetPrintableWidth: Longint;
begin
  Result := FWidth - (FMarginLeft + FMarginRight);
end;

{------------------------------------------------------------------------------}
{ TppPageDef.Assign }

procedure TppPageDef.Assign(Source: TPersistent);
var
  lPageDef: TppPageDef;
begin

  {if object passed is not a PageDef, allow inherited Assign to raise exception}
  if not(Source is TppPageDef) then
    inherited Assign(Source);

  lPageDef := TppPageDef(Source);

  FHeight       := lPageDef.mmHeight;
  FWidth        := lPageDef.mmWidth;
  FMarginLeft   := lPageDef.mmMarginLeft;
  FMarginRight  := lPageDef.mmMarginRight;
  FMarginTop    := lPageDef.mmMarginTop;
  FMarginBottom := lPageDef.mmMarginBottom;

end; {procedure, Assign}


{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelPrintableHeight }

function TppPageDef.GetScreenPixelPrintableHeight: Integer;
begin
  Result := Trunc(ppFromMMThousandths(GetPrintableHeight, utScreenPixels, pprtVertical, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelPrintableWidth }

function TppPageDef.GetScreenPixelPrintableWidth: Integer;
begin
  Result := Trunc(ppFromMMThousandths(GetPrintableWidth, utScreenPixels, pprtHorizontal, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelHeight }

function TppPageDef.GetScreenPixelHeight: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FHeight, utScreenPixels, pprtVertical, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelHeight }

function TppPageDef.GetScreenPixelWidth: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FWidth, utScreenPixels, pprtHorizontal, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelMarginLeft }

function TppPageDef.GetScreenPixelMarginLeft: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FMarginLeft, utScreenPixels, pprtHorizontal, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelMarginRight }

function TppPageDef.GetScreenPixelMarginRight: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FMarginRight, utScreenPixels, pprtHorizontal, nil));
end;

{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelMarginTop }

function TppPageDef.GetScreenPixelMarginTop: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FMarginTop, utScreenPixels, pprtVertical, nil));
end;
{------------------------------------------------------------------------------}
{ TppPageDef.GetScreenPixelMarginBottom }

function TppPageDef.GetScreenPixelMarginBottom: Integer;
begin
  Result := Trunc(ppFromMMThousandths(FMarginBottom, utScreenPixels, pprtVertical, nil));
end;



{******************************************************************************
 *
 ** G L O B A L  P R I N T E R  O B J E C T  S T U F F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppNoPrinterInfo }


function ppNoPrinterInfo: TppPrinterInfo;
var
  lDriver, lDevice, lPort: array [0..255] of char;

begin

  EnterCriticalSection(uCSPrinter);

  lDriver := 'None';
  lDevice := 'None';
  lPort   := '';

  uNoPrinterInfo := TppPrinterInfo.Create('No Printer Installed', lDriver, lDevice, lPort, True);

  Result := uNoPrinterInfo;

  LeaveCriticalSection(uCSPrinter);

end;

{------------------------------------------------------------------------------}
{ ppPrinters }

function ppPrinters: TppPrinterList;
begin

  {create global printer list object, if needed}
  if uPrinters = nil then
    begin
      EnterCriticalSection(uCSPrinter);
      try
        {check nil here again incase}
        if (uPrinters = nil) then
          uPrinters := TppPrinterList.Create;
      finally
        LeaveCriticalSection(uCSPrinter);
      end;

    end;



  {return global printer list object }
  Result := uPrinters;

{$IFDEF NoPrinter}
  uPrinters.PrinterNames.Clear;
{$ENDIF}

end; {function, ppPrinters}

{------------------------------------------------------------------------------}
{ ppPrinter }

function ppPrinter: TppPrinter;
begin

  {create global Printer object, if needed
    - there are two default settings: default and screen}
  if (uPrinter = nil) then
    begin
      EnterCriticalSection(uCSPrinter);

      try
        {check nil here again incase}
        if uPrinter = nil then
          uPrinter := TppPrinter.Create;
      finally
        LeaveCriticalSection(uCSPrinter);
      end;
      
    end;

  {return global Printer object }
  Result := uPrinter;

end; {function, ppPrinter}



{******************************************************************************
 *
 *
 *
 ** R T T I
 *
 *
 *
{******************************************************************************}

{******************************************************************************
 *
 ** P R I N T E R   S E T U P   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppPrinterSetupRTTI.RefClass }

class function TraTppPrinterSetupRTTI.RefClass: TClass;
begin
  Result := TppPrinterSetup;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppPrinterSetupRTTI.GetPropList }

class procedure TraTppPrinterSetupRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddProp('Bin');
  aPropList.AddProp('Units');
  aPropList.AddProp('DelegateCopies');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppPrinterSetupRTTI.GetPropRec }

class function TraTppPrinterSetupRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Active') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'Bin') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'BinNames') = 0) then
    ClassPropToRec(aPropName, TStrings, True, aPropRec)

  else if (CompareText(aPropName, 'PaperNames') = 0) then
    ClassPropToRec(aPropName, TStrings, True, aPropRec)

  else if (CompareText(aPropName, 'PrinterDescription') = 0) then
    PropToRec(aPropName, daString, True, aPropRec)

  else if (CompareText(aPropName, 'PrinterNames') = 0) then
    ClassPropToRec(aPropName, TStrings, True, aPropRec)

  else if (CompareText(aPropName, 'PrinterInfo') = 0) then
    ClassPropToRec(aPropName, TppPrinterInfo, True, aPropRec)

  else if (CompareText(aPropName, 'PageDef') = 0) then
    ClassPropToRec(aPropName, TppPageDef, True, aPropRec)

  else if (CompareText(aPropName, 'PrintableHeight') = 0) then
    PropToRec(aPropName, daSingle, True, aPropRec)

  else if (CompareText(aPropName, 'PrintableWidth') = 0) then
    PropToRec(aPropName, daSingle, True, aPropRec)

  else if (CompareText(aPropName, 'Units') = 0) then
    EnumPropToRec(aPropName, 'TppUnitType', False, aPropRec)

  else if (CompareText(aPropName, 'BinName') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'Collation') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Copies') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'DelegateCopies') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'DocumentName') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'Duplex') = 0) then
    EnumPropToRec(aPropName, 'TppDuplexType', False, aPropRec)

  else if (CompareText(aPropName, 'MarginBottom') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'MarginLeft') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'MarginRight') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'MarginTop') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'Orientation') = 0) then
    EnumPropToRec(aPropName, 'TPrinterOrientation', False, aPropRec)

  else if (CompareText(aPropName, 'PaperHeight') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'PaperName') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'PaperWidth') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'PrinterName') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppPrinterSetupRTTI.GetPropValue }

class function TraTppPrinterSetupRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Active') = 0) then
    Boolean(aValue) := TppPrinterSetup(aObject).Active

  else if (CompareText(aPropName, 'Bin') = 0) then
    Integer(aValue) := TppPrinterSetup(aObject).Bin

  else if (CompareText(aPropName, 'BinNames') = 0) then
    Integer(aValue) := Integer(TppPrinterSetup(aObject).BinNames)

  else if (CompareText(aPropName, 'PaperNames') = 0) then
    Integer(aValue) := Integer(TppPrinterSetup(aObject).PaperNames)

  else if (CompareText(aPropName, 'PrinterDescription') = 0) then
    String(aValue) := TppPrinterSetup(aObject).PrinterDescription

  else if (CompareText(aPropName, 'PrinterNames') = 0) then
    Integer(aValue) := Integer(TppPrinterSetup(aObject).PrinterNames)

  else if (CompareText(aPropName, 'PrinterInfo') = 0) then
    Integer(aValue) := Integer(TppPrinterSetup(aObject).PrinterInfo)

  else if (CompareText(aPropName, 'PageDef') = 0) then
    Integer(aValue) := Integer(TppPrinterSetup(aObject).PageDef)

  else if (CompareText(aPropName, 'PrintableHeight') = 0) then
    Single(aValue) := TppPrinterSetup(aObject).PrintableHeight

  else if (CompareText(aPropName, 'PrintableWidth') = 0) then
    Single(aValue) := TppPrinterSetup(aObject).PrintableWidth

  else if (CompareText(aPropName, 'Units') = 0) then
    Byte(aValue) := Ord(TppPrinterSetup(aObject).Units)

  else if (CompareText(aPropName, 'BinName') = 0) then
    String(aValue) := TppPrinterSetup(aObject).BinName

  else if (CompareText(aPropName, 'Collation') = 0) then
    Boolean(aValue) := TppPrinterSetup(aObject).Collation

  else if (CompareText(aPropName, 'Copies') = 0) then
    Integer(aValue) := TppPrinterSetup(aObject).Copies

  else if (CompareText(aPropName, 'DelegateCopies') = 0) then
    Boolean(aValue) := TppPrinterSetup(aObject).DelegateCopies

  else if (CompareText(aPropName, 'DocumentName') = 0) then
    String(aValue) := TppPrinterSetup(aObject).DocumentName

  else if (CompareText(aPropName, 'Duplex') = 0) then
    Byte(aValue) := Ord(TppPrinterSetup(aObject).Duplex)

  else if (CompareText(aPropName, 'MarginBottom') = 0) then
    Single(aValue) := TppPrinterSetup(aObject).MarginBottom

  else if (CompareText(aPropName, 'MarginLeft') = 0) then
    Single(aValue) := TppPrinterSetup(aObject).MarginLeft

  else if (CompareText(aPropName, 'MarginRight') = 0) then
    Single(aValue) := TppPrinterSetup(aObject).MarginRight

  else if (CompareText(aPropName, 'MarginTop') = 0) then
    Single(aValue) := TppPrinterSetup(aObject).MarginTop

  else if (CompareText(aPropName, 'Orientation') = 0) then
    Byte(aValue) := Ord(TppPrinterSetup(aObject).Orientation)

  else if (CompareText(aPropName, 'PaperHeight') = 0) then
    Single(aValue) := TppPrinterSetup(aObject).PaperHeight

  else if (CompareText(aPropName, 'PaperName') = 0) then
    String(aValue) := TppPrinterSetup(aObject).PaperName

  else if (CompareText(aPropName, 'PaperWidth') = 0) then
    Single(aValue) := TppPrinterSetup(aObject).PaperWidth

  else if (CompareText(aPropName, 'PrinterName') = 0) then
    String(aValue) := TppPrinterSetup(aObject).PrinterName

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppPrinterSetupRTTI.SetPropValue }

class function TraTppPrinterSetupRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Units') = 0) then
    TppPrinterSetup(aObject).Units := TppUnitType(aValue)

  else if (CompareText(aPropName, 'BinName') = 0) then
    TppPrinterSetup(aObject).BinName := String(aValue)

  else if (CompareText(aPropName, 'Collation') = 0) then
    TppPrinterSetup(aObject).Collation := Boolean(aValue)

  else if (CompareText(aPropName, 'Copies') = 0) then
    TppPrinterSetup(aObject).Copies := Integer(aValue)

  else if (CompareText(aPropName, 'DelegateCopies') = 0) then
    TppPrinterSetup(aObject).DelegateCopies := Boolean(aValue)

  else if (CompareText(aPropName, 'DocumentName') = 0) then
    TppPrinterSetup(aObject).DocumentName := String(aValue)

  else if (CompareText(aPropName, 'Duplex') = 0) then
    TppPrinterSetup(aObject).Duplex := TppDuplexType(aValue)

  else if (CompareText(aPropName, 'MarginBottom') = 0) then
    TppPrinterSetup(aObject).MarginBottom := Single(aValue)

  else if (CompareText(aPropName, 'MarginLeft') = 0) then
    TppPrinterSetup(aObject).MarginLeft := Single(aValue)

  else if (CompareText(aPropName, 'MarginRight') = 0) then
    TppPrinterSetup(aObject).MarginRight := Single(aValue)

  else if (CompareText(aPropName, 'MarginTop') = 0) then
    TppPrinterSetup(aObject).MarginTop := Single(aValue)

  else if (CompareText(aPropName, 'Orientation') = 0) then
    TppPrinterSetup(aObject).Orientation := TPrinterOrientation(aValue)

  else if (CompareText(aPropName, 'PaperHeight') = 0) then
    TppPrinterSetup(aObject).PaperHeight := Single(aValue)

  else if (CompareText(aPropName, 'PaperName') = 0) then
    TppPrinterSetup(aObject).PaperName := String(aValue)

  else if (CompareText(aPropName, 'PaperWidth') = 0) then
    TppPrinterSetup(aObject).PaperWidth := Single(aValue)

  else if (CompareText(aPropName, 'PrinterName') = 0) then
    TppPrinterSetup(aObject).PrinterName := String(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}



initialization

  InitializeCriticalSection(uCSPrinter);

  uWin32MajorVersion := ppGetWin32MajorVersion;

  raRegisterRTTI(TraTppPrinterSetupRTTI);

finalization

  DeleteCriticalSection(uCSPrinter);

  uPrinters.Free;
  uPrinters := nil;

  uPrinter.Free;
  uPrinter := nil;

  uNoPrinterInfo.Free;
  uNoPrinterInfo := nil;

  raUnRegisterRTTI(TraTppPrinterSetupRTTI);

end.

{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                    BBBBB   }


  unit ppDesignerTools;

interface

{$I ppIfDef.pas}

{x$DEFINE CodeSite}

uses
  {$IFDEF CodeSite}CodeSite,{$ENDIF}
  Windows,
  Types,
  ComCtrls,
  SysUtils,
  Classes,
  Controls,
  ExtCtrls,
  Forms,
  Graphics,
  Dialogs,
  Menus,
  Messages,
  StdCtrls,
  Buttons,
  Variants,

  ppTypes,
  ppUtils,
//  ppGraphics,
  ppPrintr,
  ppToolbars,
  ppClass,
  ppReport,
  ppSubrpt,
  ppIniStorage,
  ppPreviewIcons,
  ppCmpReg;

type
  {internal border drawing state types}
  TppBorderOrientationType = (botHorizontal, botVertical);
  TppCornerType = (ctLeftTop, ctRightTop, ctLeftBottom, ctRightBottom);

  {@TppCustomPalette }
  TppCustomPalette = class(TppDropDownPanel)
  private
    FButtons: TList;
    FPaletteEnabled: Boolean;
    FOnButtonClick: TNotifyEvent;

    function  GetButton(aIndex: Integer): TSpeedButton;
    function  GetButtonCount: Integer;


  protected
    function AddButton(aButton: TSpeedButton): Integer;

    procedure ButtonClickEvent(Sender: TObject); virtual;
    procedure EnablePalette(aValue: Boolean); virtual;

    procedure SetPaletteEnabled(aValue: Boolean); virtual;

    procedure VisibleChanged; virtual;

    property Buttons[Index: Integer]: TSpeedButton read GetButton;
    property ButtonCount: Integer read GetButtonCount;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure CMVisibleChanged (var Message: TMessage); message CM_VISIBLECHANGED;

    property PaletteEnabled: Boolean read FPaletteEnabled write SetPaletteEnabled;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;

  end; {class, TppCustomPalette}


   {@TppCustomPaletteButton }
  TppCustomPaletteButton = class(TppToolbarButton)
  private
    FPalette: TppCustomPalette;
    FPaletteEnabled: Boolean;
    FOnPaletteButtonClick: TNotifyEvent;
    FInactiveTimer: TTimer;

    procedure SetPaletteEnabled(aValue: Boolean);
    procedure InactiveTimerEvent(Sender: TObject);

  protected
    function GetDropDownPanel: TppDropDownPanel; override;
    procedure DropDownPanelHideEvent(Sender: TObject); override;

    function CreatePalette: TppCustomPalette; virtual;  abstract;
    procedure FreePalette; virtual;
    procedure PaletteButtonClickEvent(Sender: TObject); virtual;

    property Palette: TppCustomPalette read FPalette write FPalette;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property OnPaletteButtonClick: TNotifyEvent read FOnPaletteButtonClick write FOnPaletteButtonClick;
    property PaletteEnabled: Boolean read FPaletteEnabled write SetPaletteEnabled;

  end; {class, TppCustomPaletteButton}


 
   {@TppColorPalette }
  TppColorPalette = class(TppCustomPalette)
  private
    FAutoButton: TSpeedButton;
    FAutoCaption: String;
    FAutoGlyph: TBitmap;
    FColorButtons: TList;
    FCurrentColor: TColor;
    FIsClear: Boolean;
    FLanguageIndex: Longint;
    FMoreColorsButton: TSpeedButton;
    FMoreColorsCaption: String;
    FOnColorChange: TNotifyEvent;
    FPaletteType: TppColorPaletteType;
    FTWAutoButton: TSpeedButton;
    FTWColorButtons: TList;
    FTWMoreColorsButton: TSpeedButton;

    procedure CreateControls;
    procedure DrawAutoButtonGlyph(aColor: TColor);
    procedure DrawColorButtonGlyph(aGlyph: TBitmap; aColor: TColor);
    function  GetColorButton(aIndex: Integer): TSpeedButton;
    procedure SetAutoCaption(aCaption: String);
    procedure SetCurrentColor(aColor: TColor);
    procedure SetIsClear(aValue: Boolean);
    procedure SetMoreColorsCaption(aCaption: String);
    procedure SetPaletteType(aPaletteType: TppColorPaletteType);
    procedure UpdateToolWindowState;

    {button event handlers}
    procedure ColorButtonClickEvent(Sender: TObject);
    procedure MoreColorsButtonClickEvent(Sender: TObject);
    procedure AutoButtonClickEvent(Sender: TObject);


  protected

    procedure EnablePalette(aValue: Boolean); override;
    function  ShowColorDialog(var aColor: TColor): Boolean;

    procedure SetLanguageIndex(aLanguageIndex: Longint); virtual;
    procedure SetPaletteEnabled(aValue: Boolean); override;
    procedure VisibleChanged; override;

    property ColorButtons[Index: Integer]: TSpeedButton read GetColorButton;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure ActivateToolWindow; override;
    procedure CreateToolWindow; override;

    property AutoCaption: String read FAutoCaption write SetAutoCaption;
    property CurrentColor: TColor read FCurrentColor write SetCurrentColor;
    property IsClear: Boolean read FIsClear write SetIsClear;
    property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;
    property MoreColorsCaption: String read FMoreColorsCaption write SetMoreColorsCaption;
    property PaletteType: TppColorPaletteType read FPaletteType write SetPaletteType;

    property OnColorChange: TNotifyEvent read FOnColorChange write FOnColorChange;

  end; {class TppColorPalette}



  {@TppColorButton }
  TppColorButton = class(TppCustomPaletteButton)
  private
    FColorPalette: TppColorPalette;
    FColorType: TppColorButtonType;
    FDefaultColor: TColor;
    FIsClear: Boolean;
    FLanguageIndex: Longint;
    FOnPaletteColorChange: TNotifyEvent;
    FPaletteColor: TColor;
    FPaletteIsClear: Boolean;
    FPopupMenu: TPopupMenu;

    procedure DrawButtonGlyph(aColor: TColor);
    procedure SetColorType(aColorType: TppColorButtonType);

    procedure PaletteColorChangeEvent(Sender: TObject);
    procedure LoadImages(aBitmap, aMask: TBitmap);
    procedure ehMenuPopup(Sender: TObject);

  protected
    function CreatePalette: TppCustomPalette; override;
    procedure FreePalette; override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); virtual;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure GetDefaultColor(var aColor: TColor; var aIsClear: Boolean);
    procedure GetPaletteColor(var aColor: TColor; var aIsClear: Boolean);

    procedure SetPaletteColor(aColor: TColor; aIsClear: Boolean);
    procedure SetDefaultColor(aColor: TColor; aIsClear: Boolean);

    property ColorType: TppColorButtonType read FColorType write SetColorType;
    property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;
    property OnPaletteColorChange: TNotifyEvent read FOnPaletteColorChange write FOnPaletteColorChange;
    property PaletteEnabled;

  end; {class, TppColorButton}


  {@TppCornerGraphic }
  TppCornerGraphic = class(TGraphicControl)
    private
      FCornerType: TppCornerType;

    public
      constructor Create(AOwner: TComponent); override;
      procedure Paint; override;

      property CornerType: TppCornerType read FCornerType write FCornerType;

    end; {class, TppCornerGraphic}


  {@TppBorderGraphic }
  TppBorderGraphic = class(TGraphicControl)
    private
      FOnMouseLeave: TNotifyEvent;
      FOnMouseEnter: TNotifyEvent;
      FSelected: Boolean;
      FMouseOver: Boolean;
      FMousePos: TPoint;
      FOrientation: TppBorderOrientationType;
      FMouseTimer: TTimer;

      procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
      procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
      procedure SetMouseOver(const Value: Boolean);
      procedure SetSelected(const Value: Boolean);
      procedure MouseTimerEvent(Sender: TObject);

    protected
      procedure Paint; override;
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
      procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      property Selected: Boolean read FSelected write SetSelected;
      property MouseOver: Boolean read FMouseOver write SetMouseOver;
      property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
      property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
      property OnMouseDown;
      property Orientation: TppBorderOrientationType read FOrientation write FOrientation;

  end; {class, TppBorderGraphic}


  {@TppBorderButton}
  TppBorderButton = class(TppCustomPaletteButton)
  private
    FBorderPositions: TppBorderPositions;

    procedure SetBorderPositions(aBorderPositions: TppBorderPositions);

  protected
    function  CreatePalette: TppCustomPalette; override;
    procedure PaletteButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(AOwner: TComponent); override;

  published
    property BorderPositions: TppBorderPositions read FBorderPositions write SetBorderPositions;
    property OnPaletteButtonClick;
    property PaletteEnabled;
  end;

  {@TppBorderPalette}
  TppBorderPalette = class(TppCustomPalette)
  private
    FCurrentBorderPositions: TppBorderPositions;
    FTextLabel: TLabel;
    FWorkSpace: TShape;

    FAllButtonGlyph: TBitmap;
    FNoneButtonGlyph: TBitmap;
    FAllButton: TSpeedButton;
    FNoneButton: TSpeedButton;

    FLTCornerGraphic: TppCornerGraphic;
    FRTCornerGraphic: TppCornerGraphic;
    FLBCornerGraphic: TppCornerGraphic;
    FRBCornerGraphic: TppCornerGraphic;

    FLeftBorderGraphic: TppBorderGraphic;
    FTopBorderGraphic: TppBorderGraphic;
    FRightBorderGraphic: TppBorderGraphic;
    FBottomBorderGraphic: TppBorderGraphic;

    procedure CreateBorderWorkspace;
    procedure CreateBorderGraphics;
    procedure CreateBorderButtons;
    procedure DrawButtonGlyph(aButton: TSpeedButton; aGlyph: TBitmap; aColor: TColor; aCaption: String);
    procedure SetCurrentBorderPositions(aBorderPositions: TppBorderPositions);

    procedure AllButtonClickEvent(Sender: TObject);
    procedure NoneButtonClickEvent(Sender: TObject);

    procedure LeftBorderMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TopBorderMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RightBorderMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BottomBorderMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  protected
    procedure ButtonClickEvent(Sender: TObject); override;
    procedure EnablePalette(aValue: Boolean); override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure UpdatePaletteBorderSelection(aBorderPositions: TppBorderPositions);

    property CurrentBorderPositions: TppBorderPositions read FCurrentBorderPositions write SetCurrentBorderPositions;
    property PaletteEnabled;

  end;
  

  {@TppAnchorsButton}
  TppAnchorsButton = class(TppCustomPaletteButton)
  private
    FAnchors: TppAnchors;

    procedure SetAnchors(aAnchors: TppAnchors);

  protected
    function  CreatePalette: TppCustomPalette; override;
    procedure PaletteButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(aOwner: TComponent); override;

  published
    property Anchors: TppAnchors read FAnchors write SetAnchors;
    property OnPaletteButtonClick;
    property PaletteEnabled;

  end; {class, TppAnchorsButton}


  {@TppAnchorsPalette}
  TppAnchorsPalette = class(TppCustomPalette)
  private
    FCurrentAnchors: TppAnchors;

    procedure CreateControls;
    procedure SetCurrentAnchors(aAnchors: TppAnchors);

  protected
    procedure ButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property CurrentAnchors: TppAnchors read FCurrentAnchors write SetCurrentAnchors;

    property PaletteEnabled;
    property OnButtonClick;

  end; {class, TppAnchorsPalette}


  {@TppLineStylePalette }
  TppLineStylePalette = class(TppCustomPalette)
  private
    FCurrentLineStyle: TPenStyle;

    procedure CreateControls;
    procedure SetCurrentLineStyle(aLineStyle: TPenStyle);

  protected
   procedure ButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property CurrentLineStyle: TPenStyle read FCurrentLineStyle write SetCurrentLineStyle;

    property PaletteEnabled;
    property OnButtonClick;

  end; {class, TppLineStylePalette}


  {@TppLineStyleButton }
  TppLineStyleButton = class(TppCustomPaletteButton)
  private
    FLineStyle: TPenStyle;

    procedure SetLineStyle(aLineStyle: TPenStyle);

  protected
    function CreatePalette: TppCustomPalette; override;
    procedure PaletteButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(aOwner: TComponent); override;

  published
    property LineStyle: TPenStyle read FLineStyle write SetLineStyle;
    property OnPaletteButtonClick;
    property PaletteEnabled;

  end; {class, TppLineStyleButton}


  {@TppLineThicknessButton }
  TppLineThicknessButton = class(TppCustomPaletteButton)
  private
    FLineThickness: Single;
    FLineStyle: TppLineStyleType;
    FDoubleLines: Boolean;

    procedure SetLineThickness(aLineThickness: Single);
    procedure SetLineStyle(aLineStyle: TppLineStyleType);
    procedure SetDoubleLines(const Value: Boolean);

  protected
    function CreatePalette: TppCustomPalette; override;
    procedure PaletteButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(aOwner: TComponent); override;

  published
    property DoubleLines: Boolean read FDoubleLines write SetDoubleLines;
    property LineStyle: TppLineStyleType read FLineStyle write SetLineStyle;
    property LineThickness: Single read FLineThickness write SetLineThickness;
    property OnPaletteButtonClick;
    property PaletteEnabled;

  end; {class, TppLineThicknessButton}


  {@TppFontButton }
  TppFontButton = class(TSpeedButton)
  private
    FCurrentFont: TFont;
    FFontAttributeType: TppFontAttributeType;


    procedure SetCurrentFont(aFont: TFont);
    procedure SetFontAttributeType(aValue: TppFontAttributeType);

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property FontAttributeType: TppFontAttributeType read FFontAttributeType write SetFontAttributeType;
    procedure Click; override;

    property CurrentFont: TFont read FCurrentFont write SetCurrentFont;

  end; {class, TppFontButton}

  {@TppFontComboBox}
  TppFontComboBox = class(TComboBox)
  private
    FPrinterName: String;
    FPrinterGraphic: TBitmap;
    FSelPrinterGraphic: TBitmap;
    FSelTrueTypeGraphic: TBitmap;
    FTrueTypeGraphic: TBitmap;
    FOnGetPrinter: TppGetPrinterEvent;
    FCurrentFont: TFont;
    FFontList: TppFontList;

    procedure BuildFontList;
    function GetCurrentFont: TFont;

    function GetFontName: String;
    function GetPrinter: TppPrinter;
    procedure InitializeFontGraphics;
    procedure SetFontName(aFontName: String);
    procedure SetCurrentFont(aFont: TFont);

    {private event handlers}
    procedure DrawItemEvent(Control: TWinControl; Index: Integer;
                                      Rect: TRect; State: TOwnerDrawState);
    procedure DropDownEvent(Sender: TObject);
    procedure MeasureItemEvent(Control: TWinControl; Index: Integer; var Height: Integer);

  public

    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    property FontName: String read GetFontName write SetFontName;
    property CurrentFont: TFont read GetCurrentFont write SetCurrentFont;

    property OnGetPrinter: TppGetPrinterEvent read FOnGetPrinter write FOnGetPrinter;

  end; {class, TppFontComboBox }


  {@TppLineThicknessPalette }
  TppLineThicknessPalette = class(TppCustomPalette)
  private
    FCurrentLineThickness: Single;
    FCurrentLineStyle: TppLineStyleType;

    procedure CreateControls;
    procedure SetCurrentLineThickness(aLineThickness: Single);
    procedure SetCurrentLineStyle(aLineStyle: TppLineStyleType);
    procedure UpdateButtonStates;

  protected
    procedure ButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property CurrentLineThickness: Single read FCurrentLineThickness write SetCurrentLineThickness;
    property CurrentLineStyle: TppLineStyleType read FCurrentLineStyle write SetCurrentLineStyle;

    property Buttons;
    property PaletteEnabled;
    property OnButtonClick;

  end; {class, TppLineThicknessPalette}



  {@TppAlignToolbar}
  TppAlignToolbar = class(TppToolbar)
  private
    FAlignType: TppAlignType;
    FOnButtonClick: TNotifyEvent;

    procedure ButtonClickEvent(Sender: TObject);

  protected
    procedure CreateControls; override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public
    constructor Create(aOwner: TComponent); override;

    property AligType: TppAlignType read FAlignType write FAlignType;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;

  end; {class, TppAlignToolbar}



  {@TppSizeToolbar}
  TppSizeToolbar = class(TppToolbar)
  private
    FSizeType: TppSizeType;
    FOnButtonClick: TNotifyEvent;

    procedure ButtonClickEvent(Sender: TObject);

  protected
    procedure CreateControls; override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public
    constructor Create(aOwner: TComponent); override;

    property SizeType: TppSizeType read FSizeType write FSizeType;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;

  end; {class, TppSizeToolbar}


   {@TppNudgeToolbar}
  TppNudgeToolbar = class(TppToolbar)
  private
    FDirectionType: TppDirectionType;
    FOnButtonClick: TNotifyEvent;

    procedure ButtonClickEvent(Sender: TObject);

  protected
    procedure CreateControls; override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public
    constructor Create(aOwner: TComponent); override;

    property DirectionType: TppDirectionType read FDirectionType write FDirectionType;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;

  end; {class, TppNudgeToolbar}


  {@TppDrawToolbar}
  TppDrawToolbar = class(TppToolbar)
  private
    FFillColorButton: TppColorButton;
    FLineColorButton: TppColorButton;
    FLineThicknessButton: TppLineThicknessButton;
    FLineStyleButton: TppLineStyleButton;

  protected
    procedure CreateControls; override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public
    constructor Create(aOwner: TComponent); override;

    procedure LoadPreferences(aIniStorage: TppIniStorage); override;
    procedure SavePreferences(aIniStorage: TppIniStorage); override;

    property FillColorButton: TppColorButton read FFillColorButton;
    property LineColorButton: TppColorButton read FLineColorButton;
    property LineThicknessButton: TppLineThicknessButton read FLineThicknessButton;
    property LineStyleButton: TppLineStyleButton read FLineStyleButton;

  end; {class, TppDrawToolbar}



  {@TppEditToolbar}
  TppEditToolbar = class(TppToolbar)
  private
    FEditBox: TEdit;
    FComboBox: TComboBox;
    FComboBox2: TComboBox;
    FPanel: TPanel;
    FEnabledControl: TControl;

  protected
    procedure CreateControls; override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public

    constructor Create(aOwner: TComponent); override;

    procedure EnableControl(aControl: TControl);

    property EditBox: TEdit read FEditBox;
    property ComboBox: TComboBox read FComboBox;
    property ComboBox2: TComboBox read FComboBox2;

  end; {class, TppEditToolbar}



  {@TppCustomFormatToolbar }
  TppCustomFormatToolbar = class(TppToolbar)
  private
    FFont: TFont;
    FFontComboBox: TppFontComboBox;
    FFontNameButton: TppFontButton;
    FFontSizeButton: TppFontButton;
    FFontSizeComboBox: TComboBox;
    FBoldButton: TppToolbarButton;
    FItalicButton: TppToolbarButton;
    FUnderlineButton:  TppToolbarButton;
    FAlignLeftButton: TppToolbarButton;
    FCenterButton: TppToolbarButton;
    FAlignRightButton: TppToolbarButton;
    FFullJustifyButton: TppToolbarButton;
    FFontColorButton: TppColorButton;
    FHighlightColorButton: TppColorButton;


    function GetAlignment: TAlignment;
    function GetFont: TFont;
    function GetTextAlignment: TppTextAlignment;

    procedure SetAlignment(aAlignment: TAlignment);
    procedure SetFont(aFont: TFont);
    procedure SetTextAlignment(aTextAlignment: TppTextAlignment);


  protected
    procedure CreateControls; override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;


  public

    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetHighlightColor(aColor: TColor; aIsClear: Boolean);

    property FontComboBox: TppFontComboBox read FFontComboBox;
    property FontSizeComboBox: TComboBox read FFontSizeComboBox;
    property FontNameButton: TppFontButton read FFontNameButton;
    property FontSizeButton: TppFontButton read FFontSizeButton;
    property BoldButton: TppToolbarButton read FBoldButton;
    property ItalicButton: TppToolbarButton read FItalicButton;
    property UnderlineButton:  TppToolbarButton read FUnderlineButton;

    property AlignLeftButton: TppToolbarButton read FAlignLeftButton;
    property CenterButton: TppToolbarButton read FCenterButton;
    property AlignRightButton: TppToolbarButton read FAlignRightButton;
    property FullJustifyButton: TppToolbarButton read FFullJustifyButton;

    property FontColorButton: TppColorButton read FFontColorButton;
    property HighlightColorButton: TppColorButton read FHighlightColorButton;

    property Font: TFont read GetFont write SetFont;
    property Alignment: TAlignment read GetAlignment write SetAlignment;
    property TextAlignment: TppTextAlignment read GetTextAlignment write SetTextAlignment;

  end; {class, TppCustomFormatToolbar}



  {@TppFormatToolbar }
  TppFormatToolbar = class(TppCustomFormatToolbar)
  private
    FAnchorsButton: TppAnchorsButton;
    FBorderButton: TppBorderButton;
    FBringToFrontButton: TppToolbarButton;
    FSendToBackButton: TppToolbarButton;

  protected
    procedure CreateControls;  override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public
    constructor Create(aOwner: TComponent); override;

    procedure LoadPreferences(aIniStorage: TppIniStorage); override;
    procedure SavePreferences(aIniStorage: TppIniStorage); override;

    property AnchorsButton: TppAnchorsButton read FAnchorsButton;
    property BorderButton: TppBorderButton read FBorderButton;
    property BringToFrontButton: TppToolbarButton read FBringToFrontButton;
    property SendToBackButton: TppToolbarButton read FSendToBackButton;

  end; {class, TppFormatToolbar}




  {@TppStandardToolbar}
  TppStandardToolbar = class(TppToolbar)
  private
    FFileNewButton: TppToolbarButton;
    FFileOpenButton: TppToolbarButton;
    FFileSaveButton: TppToolbarButton;
    FPageSetupButton: TppToolbarButton;
    FPrintButton: TppToolbarButton;
    FPrintPreviewButton: TppToolbarButton;
    FCutButton: TppToolbarButton;
    FCopyButton: TppToolbarButton;
    FPasteButton: TppToolbarButton;
    FSeparator1: TppToolbarSeparator;
    FSeparator2: TppToolbarSeparator;


  protected
   procedure CreateControls; override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public

    constructor Create(aOwner: TComponent); override;

    property FileNewButton: TppToolbarButton read FFileNewButton;
    property FileOpenButton: TppToolbarButton read FFileOpenButton;
    property FileSaveButton: TppToolbarButton read FFileSaveButton;
    property Separator1: TppToolbarSeparator read FSeparator1;
    property PageSetupButton: TppToolbarButton read FPageSetupButton;
    property PrintButton: TppToolbarButton read FPrintButton;
    property PrintPreviewButton: TppToolbarButton read FPrintPreviewButton;
    property Separator2: TppToolbarSeparator read FSeparator2;
    property CutButton: TppToolbarButton read FCutButton;
    property CopyButton: TppToolbarButton read FCopyButton;
    property PasteButton: TppToolbarButton read FPasteButton;

  end; {class, TppStandardToolbar}



  {@TppToolbarManager }
  TppToolbarManager = class(TppRegListSubscriber)
  private
    FComponentBars: TList;
    FComponentClasses: TStrings;
    FFloatingToolWindows: TList;
    FCaptionsList: TList;
    FForm: TForm;
    FPaletteButton: TppToolbarButton;
    FSelectObjectButton: TppToolbarButton;
    FStandardBars: TList;
    FToolbars: TStringList;
    FToolWindows: TList;
    FPaletteButtons: TList;
    FLeftDock: TppVerticalDock;
    FTopDock: TppHorizontalDock;
    FBottomDock: TppHorizontalDock;
    FRightDock: TppVerticalDock;
    FPopupMenu: TPopupMenu;
    FLanguageIndex: Longint;
    FOnToolUnDock: TNotifyEvent;
//    FLeftToolBarDock: TppVerticalToolbarDock;

    procedure AddComponentClass(aClassName: String);
    procedure BuildComponentPalette;
    procedure BuildPopupMenu;
    procedure CreateStandardToolbars;
    procedure FreeMenuItems;
    procedure FreeToolbars(aList: TList);
    function  GetToolbar(aIndex: Integer): TppToolbar;
    function  GetToolbarCount: Integer;
    function GetToolWindow(aIndex: Integer): TppToolWindow;
    function  GetToolWindowCount: Integer;
    procedure RemoveComponentClass(aClassName: String);
    procedure SetComponentClasses(aComponentClasses: TStrings);
    procedure SetLanguageIndex(aLanguageIndex: Longint);
    function  TranslateToolbarCaption(const aToolbarCaption: String): String;
    function CreateToolBar(aToolbarClass: TppToolbarClass; const aToolbarName: String; aDockRow: Integer): TppToolbar;
    procedure SetOnToolUnDock(const Value: TNotifyEvent);

  protected
    procedure LoadToolWindowPreferences(aIniStorage: TppIniStorage);
    procedure SaveToolWindowPreferences(aIniStorage: TppIniStorage);
    procedure LoadToolbarPreferences(aIniStorage: TppIniStorage);
    procedure SaveToolbarPreferences(aIniStorage: TppIniStorage);
    procedure ComponentPaletteButtonClickEvent(Sender: TObject);
    procedure MenuItemClickEvent(Sender: TObject);

  public
    constructor Create(aForm: TForm);
    destructor Destroy; override;

    procedure AddToolbar(aToolbarName: String; aToolbar: TppToolbar);
    function  FindToolbar(aToolbarName: String): TppToolbar;
    function FindToolWindow(aToolWindoName: String): TppToolWindow;
    function FindDock(aDockName: String): TWinControl;

    procedure HideFloatingToolWindows;
    procedure Initialize(aTopDock, aBottomDock, aLeftDock, aRightDock: TWinControl);
    procedure MenuPopupEvent(Sender: TObject);
    function  NewToolbar(aToolbarName: String): TppToolbar;
    procedure RemoveToolbar(aToolbarName: String);
    procedure ShowFloatingToolWindows;
    procedure LoadToolPreferences;
    procedure SaveToolPreferences;
    procedure EnableToolWindowCaptions(aValue: Boolean);
    procedure BuildFloatingToolWindowList(aList: TList);
    procedure RegisterListChanged; override;

    property ComponentClasses: TStrings read FComponentClasses write SetComponentClasses;
    property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;
    property LeftDock: TppVerticalDock read FLeftDock write FLeftDock;
    property TopDock: TppHorizontalDock  read FTopDock write FTopDock;
    property BottomDock: TppHorizontalDock read FBottomDock write FBottomDock;
    property RightDock: TppVerticalDock read FRightDock write FRightDock;

    property Toolbars[Index: Integer]: TppToolbar read GetToolbar;
    property ToolbarCount: Integer read GetToolbarCount;

    property ToolWindows[Index: Integer]: TppToolWindow read GetToolWindow;
    property ToolWindowCount: Integer read GetToolWindowCount;

    property PopupMenu: TPopupMenu read FPopupMenu;
    property PaletteButton: TppToolbarButton read FPaletteButton;
    property SelectObjectButton: TppToolbarButton read FSelectObjectButton;

    property OnToolUnDock: TNotifyEvent read FOnToolUnDock write SetOnToolUnDock;

  end; {class, TppToolbarManager}

  procedure ppSaveFontState(aStateStorag: TppIniStorage; aSection, aIdent: String; aFont: TFont);
  procedure ppLoadFontState(aStateStorag: TppIniStorage; aSection, aIdent: String; aFont: TFont);



const
  cAnchors: array [0..8] of TppAnchors =
                  ([atLeft, atTop], [atTop], [atTop, atRight], [atLeft], [],
                   [atRight], [atLeft, atBottom], [atBottom], [atRight, atBottom]);

  cStdColors: array [0..15] of TColor =
                  (clBlack, clGray, clMaroon, clOlive, clGreen, clTeal, clNavy, clPurple,
                   clWhite, clLtGray, clRed, clYellow,  clLime, clAqua, clBlue, clFuchsia);

  cLineStyle: array [0..4] of TPenStyle =
                  (psSolid, psDot, psDash, psDashDot, psDashDotDot);

  cAnchorResNames: array [0..8] of String =
                   ('PPANCHORLEFTTOP', 'PPANCHORTOP', 'PPANCHORRIGHTTOP', 'PPANCHORLEFT',
                    'PPANCHORNONE', 'PPANCHORRIGHT', 'PPANCHORLEFTBOTTOM', 'PPANCHORBOTTOM',
                    'PPANCHORRIGHTBOTTOM');

  cLineStyleResNames: array [0..4] of String =
                   ('PPSTYLESOLID', 'PPSTYLEDOT', 'PPSTYLEDASH', 'PPSTYLEDASHDOT', 'PPSTYLEDASHDOTDOT');

  cLineThickness: array [0..12] of Single =
                  (0.125, 0.25, 0.5, 0.75, 1.0, 1.5, 2.25, 3.0, 4.5, 6.0, 3.0, 4.5, 6.0);

  cLineThicknessStyle: array [0..12] of TppLineStyleType =
                  (lsSingle, lsSingle, lsSingle, lsSingle, lsSingle, lsSingle, lsSingle,
                   lsSingle, lsSingle, lsSingle, lsDouble, lsDouble, lsDouble);

  cLineThicknessResNames: array [0..12] of String =
                   ('PPLINE18','PPLINE14', 'PPLINE12', 'PPLINE34', 'PPLINE1', 'PPLINE112', 'PPLINE214',
                    'PPLINE3', 'PPLINE412', 'PPLINE6', 'PPDOUBLELINE3', 'PPDOUBLELINE412', 'PPDOUBLELINE6');


  cAlignResNames: array [0..9] of String =
                   ('PPALIGNLEFTEDGES', 'PPALIGNVERTICALCENTERS', 'PPALIGNRIGHTEDGES',
                    'PPALIGNTOPEDGES',  'PPALIGNHORIZONTALCENTERS',  'PPALIGNBOTTOMEDGES',
                    'PPSPACEHORIZONTALLY', 'PPSPACEVERTICALLY',
                    'PPCENTERHORIZONTALLY', 'PPCENTERVERTICALLY');

 { cAlignHints: array [0..9] of String =
                   ('Align Left', 'Align Middle', 'Align Right',
                    'Align Top',  'Align Center',  'Align Bottom',
                    'Space Horizontally', 'Space Vertically',
                     'Center Horizontally in Band', 'Center Vertically in Band'); }

  cAlignHints: array [0..9] of Integer =
                   (103, 106, 104,
                    105, 102, 101,
                    113, 114,
                    107, 108);

  cSizeResNames: array [0..3] of String =
                   ('PPSHRINKWIDTH', 'PPGROWWIDTH', 'PPSHRINKHEIGHT', 'PPGROWHEIGHT');


 { cSizeHints: array [0..3] of String =
                   ('Shrink Width to Smallest',  'Grow Width to Largest',
                    'Shrink Height to Smallest', 'Grow Height to Largest'); }


  cSizeHints: array [0..3] of Integer = (112, 110, 111, 109);


  cNudgeResNames: array [0..3] of String =
                   ('PPNUDGEUP', 'PPNUDGEDOWN', 'PPNUDGELEFT', 'PPNUDGERIGHT');


 { cNudgeHints: array [0..3] of String =
                   ('Nudge Up', 'Nudge Down', 'Nudge Left', 'Nudge Right');}

  cNudgeHints: array [0..3] of Integer = (467, 468, 469, 470);


  cFontSizes: array [0..15] of Integer =
                    (8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36, 48, 72);



implementation

uses
  ppToolWn;

{------------------------------------------------------------------------------}
{ ppSaveFontState}

procedure ppSaveFontState(aStateStorag: TppIniStorage; aSection, aIdent: String; aFont: TFont);
begin

  aStateStorag.WriteString(aSection, aIdent + 'Name', aFont.Name);
  aStateStorag.WriteInteger(aSection, aIdent + 'Size', aFont.Size);
  aStateStorag.WriteInteger(aSection, aIdent + 'Color', aFont.Color);
  aStateStorag.WriteInteger(aSection, aIdent + 'Charset', aFont.Charset);
  aStateStorag.WriteBool(aSection, aIdent + 'Bold', (fsBold in aFont.Style));
  aStateStorag.WriteBool(aSection, aIdent + 'Italic', (fsItalic in aFont.Style));
  aStateStorag.WriteBool(aSection, aIdent + 'Underline', (fsUnderline in aFont.Style));
  aStateStorag.WriteBool(aSection, aIdent + 'StrikeOut', (fsStrikeOut in aFont.Style));

end; {procedure, ppSaveFontState}

{------------------------------------------------------------------------------}
{ ppLoadFontState}

procedure ppLoadFontState(aStateStorag: TppIniStorage; aSection, aIdent: String; aFont: TFont);
var
  lFontStyle: TFontStyles;

begin

  aFont.Color := aStateStorag.ReadInteger(aSection,aIdent + 'Color', clWindowText);
  aFont.Charset := aStateStorag.ReadInteger(aSection, aIdent + 'Charset', DEFAULT_CHARSET);
  aFont.Name := aStateStorag.ReadString(aSection, aIdent + 'Name', 'Arial');
  aFont.Size := aStateStorag.ReadInteger(aSection, aIdent + 'Size', 12);

  lFontStyle := [];

  if aStateStorag.ReadBool(aSection, aIdent + 'Bold', False) then
    Include(lFontStyle, fsBold);

  if aStateStorag.ReadBool(aSection, aIdent + 'Italic', False) then
    Include(lFontStyle, fsItalic);

  if aStateStorag.ReadBool(aSection, aIdent + 'Underline', False) then
    Include(lFontStyle, fsUnderline);

   if aStateStorag.ReadBool(aSection, aIdent + 'StrikeOut', False) then
     Include(lFontStyle, fsStrikeOut);

   aFont.Style := lFontStyle;

end; {procedure, ppLoadFontState}


{------------------------------------------------------------------------------}
{ ppRemoveSpacesFromString}

function ppRemoveSpacesFromString(aString: String): String;
begin

  Result := aString;

  while Pos(' ', Result) > 0 do
    Delete(Result, Pos(' ', Result), 1);

end; {function, ppRemoveSpacesFromString}

{******************************************************************************
 *
 **  C u s t o m P a l e t t e B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.Create}

constructor TppCustomPaletteButton.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FPaletteEnabled  := True;

  FPalette := nil;
  FInactiveTimer := TTimer.Create(nil);
  FInactiveTimer.Enabled  := False;
  FInactiveTimer.Interval := 5000;
  FInactiveTimer.OnTimer  := InactiveTimerEvent;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.Destroy}

destructor TppCustomPaletteButton.Destroy;
begin

  FInactiveTimer.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.GetDropDownPanel}

function TppCustomPaletteButton.GetDropDownPanel: TppDropDownPanel;
begin

  Result := FPalette;

  FInactiveTimer.Enabled := False;

  if (csDesigning in ComponentState) or (FPalette <> nil) then Exit;

  FPalette := CreatePalette;
  FPalette.Visible := False;

  if (Owner is TForm) then
    FPalette.Parent  := TForm(Owner);

  FPalette.PaletteEnabled := FPaletteEnabled;

  FPalette.OnButtonClick := PaletteButtonClickEvent;

  DropDownPanel := FPalette;

  Result := FPalette;

end; {procedure, GetDropDownPanel}

{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.DropDownPanelHideEvent}

procedure TppCustomPaletteButton.DropDownPanelHideEvent(Sender: TObject);
begin

  inherited DropDownPanelHideEvent(Sender);

  FInactiveTimer.Enabled := True;


end; {procedure, DropDownPanelHideEvent}


{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.InactiveTimerEvent}

procedure TppCustomPaletteButton.InactiveTimerEvent(Sender: TObject);
begin

  if Active then Exit;

  FInactiveTimer.Enabled := False;

  FreePalette;

end; {procedure, InactiveTimerEvent}



{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.FreePalette}

procedure TppCustomPaletteButton.FreePalette;
begin
  {default behavior - but may be overridden by descendants}
  DropDownPanel := nil;
  FPalette.Free;
  FPalette := nil;

end; {procedure, FreePalette}

{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.SetPaletteEnabled}

procedure TppCustomPaletteButton.SetPaletteEnabled(aValue: Boolean);
begin

  if (FPaletteEnabled = aValue) then Exit;

  FPaletteEnabled := aValue;

  if FPalette <> nil then
    FPalette.PaletteEnabled := aValue

end; {procedure, SetPaletteEnabled}

{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.PaletteButtonClickEvent}

procedure TppCustomPaletteButton.PaletteButtonClickEvent(Sender: TObject);
begin

  if Assigned(FOnPaletteButtonClick) then FOnPaletteButtonClick(Self);

end; {procedure, PaletteButtonClickEvent}


{******************************************************************************
 *
 ** A n c h o r s  B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAnchorsButton.Create}

constructor TppAnchorsButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  SetAnchors([atLeft, atTop]);

  ImageIndex := ToolImageList.AddTool('PPANCHORS');

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppAnchorsButton.CreatePalette}

function TppAnchorsButton.CreatePalette: TppCustomPalette;
begin
  Result := TppAnchorsPalette.Create(Owner);
  TppAnchorsPalette(Result).CurrentAnchors := FAnchors;

end; {procedure, CreatePalette}

{------------------------------------------------------------------------------}
{ TppAnchorsButton.PaletteButtonClickEvent}

procedure TppAnchorsButton.PaletteButtonClickEvent(Sender: TObject);
begin
  FAnchors := TppAnchorsPalette(FPalette).CurrentAnchors;

  inherited PaletteButtonClickEvent(Self);

end; {procedure, PaletteButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppAnchorsButton.SetAnchors}

procedure TppAnchorsButton.SetAnchors(aAnchors: TppAnchors);
begin
  FAnchors := aAnchors;

  if (FPalette <> nil) then
    TppAnchorsPalette(FPalette).CurrentAnchors := FAnchors;

end; {procedure, SetAnchors}


{******************************************************************************
 *
 ** B o r d e r   B u t t o n
 *
{******************************************************************************}

constructor TppBorderButton.Create(AOwner: TComponent);
begin
  inherited;
  SetBorderPositions([]);
end;

function TppBorderButton.CreatePalette: TppCustomPalette;
begin
  Result := TppBorderPalette.Create(Owner);
  TppBorderPalette(Result).CurrentBorderPositions := FBorderPositions;
  TppBorderPalette(Result).UpdatePaletteBorderSelection(FBorderPositions);

end;

procedure TppBorderButton.PaletteButtonClickEvent(Sender: TObject);
begin
  FBorderPositions := TppBorderPalette(FPalette).CurrentBorderPositions;

  inherited PaletteButtonClickEvent(Self);

end;

procedure TppBorderButton.SetBorderPositions(aBorderPositions: TppBorderPositions);
begin
  FBorderPositions := aBorderPositions;

  if (FPalette <> nil) then
    TppBorderPalette(FPalette).CurrentBorderPositions := FBorderPositions;

end;


{******************************************************************************
 *
 ** L i n e S t y l e B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppLineStyleButton.Create}

constructor TppLineStyleButton.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  SetLineStyle(psSolid);

  ImageIndex := ToolImageList.AddTool('PPLINESTYLE');

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppLineStyleButton.CreatePalette}

function TppLineStyleButton.CreatePalette: TppCustomPalette;
begin
  Result := TppLineStylePalette.Create(Owner);
  TppLineStylePalette(Result).CurrentLineStyle := FLineStyle;

end; {procedure, CreatePalette}



{------------------------------------------------------------------------------}
{ TppLineStyleButton.PaletteButtonClickEvent}

procedure TppLineStyleButton.PaletteButtonClickEvent(Sender: TObject);
begin

  FLineStyle := TppLineStylePalette(FPalette).CurrentLineStyle;

  inherited PaletteButtonClickEvent(Self);

end; {procedure, PaletteButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppLineStyleButton.SetLineStyle}

procedure TppLineStyleButton.SetLineStyle(aLineStyle: TPenStyle);
begin
  FLineStyle := aLineStyle;

  if (FPalette <> nil) then
    TppLineStylePalette(FPalette).CurrentLineStyle := FLineStyle;

end; {procedure, SetCurrentLineStyle}



{******************************************************************************
 *
 ** L i n e T h i c k n e  s s B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppLineThicknessButton.Create}

constructor TppLineThicknessButton.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  SetLineThickness(0.75);
  SetLineStyle(lsSingle);

  ImageIndex := ToolImageList.AddTool('PPLINETHICKNESS');

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppLineThicknessButton.CreatePalette}

function TppLineThicknessButton.CreatePalette: TppCustomPalette;
begin
  Result := TppLineThicknessPalette.Create(Owner);
  TppLineThicknessPalette(Result).CurrentLineStyle := FLineStyle;
  TppLineThicknessPalette(Result).CurrentLineThickness := FLineThickness;

  if not(FDoubleLines) then
    begin
      TppLineThicknessPalette(Result).Buttons[10].Enabled := False;
      TppLineThicknessPalette(Result).Buttons[11].Enabled := False;
      TppLineThicknessPalette(Result).Buttons[12].Enabled := False;
    end;


end; {procedure, CreatePalette}


{------------------------------------------------------------------------------}
{ TppLineThicknessButton.PaletteButtonClickEvent}

procedure TppLineThicknessButton.PaletteButtonClickEvent(Sender: TObject);
begin

  FLineStyle     := TppLineThicknessPalette(FPalette).CurrentLineStyle;
  FLineThickness := TppLineThicknessPalette(FPalette).CurrentLineThickness;

  inherited PaletteButtonClickEvent(Self);

end; {procedure, PaletteButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppLineThicknessButton.SetCurrentLineStyle}

procedure TppLineThicknessButton.SetLineStyle(aLineStyle: TppLineStyleType);
begin

  if (FLineStyle = aLineStyle) then Exit;

  FLineStyle := aLineStyle;

  if (FPalette <> nil) then
    TppLineThicknessPalette(FPalette).CurrentLineStyle := FLineStyle;

end; {procedure, SetLineStyle}

procedure TppLineThicknessButton.SetDoubleLines(const Value: Boolean);
begin
  FDoubleLines := Value;

  if (FPalette <> nil) then
    begin
      TppLineThicknessPalette(FPalette).Buttons[10].Enabled := Value;
      TppLineThicknessPalette(FPalette).Buttons[11].Enabled := Value;
      TppLineThicknessPalette(FPalette).Buttons[12].Enabled := Value;
    end;
end;

{------------------------------------------------------------------------------}
{ TppLineThicknessButton.SetLineThickness}

procedure TppLineThicknessButton.SetLineThickness(aLineThickness: Single);
begin

  if (FLineThickness = aLineThickness) then Exit;

  FLineThickness := aLineThickness;

  if (FPalette <> nil) then
    TppLineThicknessPalette(FPalette).CurrentLineThickness := FLineThickness;

end; {procedure, SetLineThickness}



{******************************************************************************
 *
 ** F o n t B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFontButton.Create}

constructor TppFontButton.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FCurrentFont := TFont.Create;
  Flat := True;

  FFontAttributeType := faFontName;


end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppFontButton.Destroy}

destructor TppFontButton.Destroy;
begin

  FCurrentFont.Free;

  inherited Destroy;

end; {destructor, Destroy}



{------------------------------------------------------------------------------}
{ TppFontButton.Click}

procedure TppFontButton.Click;
var
  lFontDialog: TppPrinterFontDialog;
begin

  lFontDialog := TppPrinterFontDialog.Create(Self);
  lFontDialog.Font := FCurrentFont;
  lFontDialog.Printer := ppPrinter;

  if lFontDialog.Execute then
    SetCurrentFont(lFontDialog.Font);

  lFontDialog.Free;

  inherited Click;

end; {procedure, Click}


{------------------------------------------------------------------------------}
{ TppFontButton.SetCurrentFont}

procedure TppFontButton.SetCurrentFont(aFont: TFont);
begin
  FCurrentFont.Assign(aFont);

end; {procedure, SetFont}


{------------------------------------------------------------------------------}
{ TppFontButton.SetFontAttributeType}

procedure TppFontButton.SetFontAttributeType(aValue: TppFontAttributeType);
{var
  liImageIndex: Integer; }
begin

  FFontAttributeType := aValue;

  if FFontAttributeType = faFontName then

    Glyph.Handle := ppBitmapFromResource('PPFONTNAME')
  else
    Glyph.Handle := ppBitmapFromResource('PPFONTSIZE');

end; {procedure, SetFontAttributeType}



{******************************************************************************
 *
 **  C o l o r B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppColorButton.Create}

constructor TppColorButton.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDefaultColor   := clWindowText;
  FIsClear        := False;
  FPaletteColor   := FDefaultColor;
  FPaletteIsClear := FIsClear;

  FPaletteEnabled := True;
  FLanguageIndex  := 0;

  FColorPalette := nil;
  Style := tbsDropDown;

  FPopupMenu := TPopupMenu.Create(Self);
  FPopupMenu.OnPopup := ehMenuPopup;
  DropDownMenu := FPopupMenu;

  FOnPaletteColorChange := nil;

  SetColorType(ctFont);

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppColorButton.Destroy}

destructor TppColorButton.Destroy;
begin

  FPopupMenu.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppColorButton.ehMenuPopup}

procedure TppColorButton.ehMenuPopup(Sender: TObject);
begin
  Active := not Active;

end;

{------------------------------------------------------------------------------}
{ TppColorButton.CreatePalette}

function TppColorButton.CreatePalette: TppCustomPalette;
begin
  FColorPalette := TppColorPalette.Create(Owner);

  FColorPalette.PaletteType   := TppColorPaletteType(FColorType);
  FColorPalette.CurrentColor  := FPaletteColor;
  FColorPalette.IsClear       := FPaletteIsClear;
  FColorPalette.OnColorChange := PaletteColorChangeEvent;
  FColorPalette.LanguageIndex := LanguageIndex;

  Result := FColorPalette;

end; {procedure, CreatePalette}

{------------------------------------------------------------------------------}
{ TppColorButton.FreePalette}

procedure TppColorButton.FreePalette;
begin

  {do not free palette if tool window exists}
  if (Palette.ToolWindow = nil) or not (Palette.ToolWindow.Visible) then
    begin
      FColorPalette := nil;
      inherited FreePalette;
    end;

end; {procedure, FreePalette}


{------------------------------------------------------------------------------}
{ TppColorButton.DrawButtonGlyph}

procedure TppColorButton.DrawButtonGlyph(aColor: TColor);
var
  lBitmap: TBitmap;
  lMask: TBitmap;
begin

  BeginUpdate;

  lBitMap := TBitmap.Create;
  lMask := TBitmap.Create;

  try
    LoadImages(lBitMap, lMask);

    lBitMap.Canvas.Brush.Style := bsSolid;

    if FIsClear then
      lBitMap.Canvas.Brush.Color := clBtnFace
    else
      lBitMap.Canvas.Brush.Color := aColor;

    lBitMap.Canvas.FillRect(Rect(0, 12, 16, 16));

    ToolImageList.Replace(ImageIndex, lBitMap, lMask);

  finally
    lMask.Free;
    lBitmap.Free;

    EndUpdate;
  end;

end; {procedure, DrawButtonGlyph}

{------------------------------------------------------------------------------}
{ TppColorButton.LoadImages}

procedure TppColorButton.LoadImages(aBitmap, aMask: TBitmap);
begin


  case FColorType of

    ctFont:
      begin
        aBitmap.Handle := ppBitmapFromResource('PPFONTCOLOR');
        aMask.Handle := ppBitmapFromResource('PPFONTCOLORMASK');
      end;

    ctHighlight:
      begin
        aBitmap.Handle     := ppBitmapFromResource('PPHIGHLIGHTCOLOR');
        aMask.Handle := ppBitmapFromResource('PPHIGHLIGHTCOLORMASK');
      end;

    ctFill:
      begin
        aBitmap.Handle     := ppBitmapFromResource('PPFILLCOLOR');
        aMask.Handle := ppBitmapFromResource('PPFILLCOLORMASK');
      end;

    ctLine:
      begin
        aBitmap.Handle     := ppBitmapFromResource('PPLINECOLOR');
        aMask.Handle := ppBitmapFromResource('PPLINECOLORMASK');
      end;

  end;


end;


{------------------------------------------------------------------------------}
{ TppColorButton.SetColorType}

procedure TppColorButton.SetColorType(aColorType: TppColorButtonType);
begin

  FColorType := aColorType;

  case aColorType of

    ctFont:
      ImageIndex := ToolImageList.AddToolWithMask('PPFONTCOLOR', 'PPFONTCOLORMASK');

    ctHighlight:
      ImageIndex := ToolImageList.AddToolWithMask('PPHIGHLIGHTCOLOR', 'PPHIGHLIGHTCOLORMASK');

    ctFill:
      ImageIndex := ToolImageList.AddToolWithMask('PPFILLCOLOR', 'PPFILLCOLOR');

    ctLine:
      ImageIndex := ToolImageList.AddToolWithMask('PPLINECOLOR', 'PPLINECOLORMASK');

  end;

  if (FColorPalette <> nil) then
    FColorPalette.PaletteType := TppColorPaletteType(Ord(aColorType));

  {load lang strings for hints}
  SetLanguageIndex(FLanguageIndex);

  DrawButtonGlyph(FDefaultColor);

end; {procedure, SetColorType}


{------------------------------------------------------------------------------}
{ TppColorButton.PaletteColorChangeEvent}

procedure TppColorButton.PaletteColorChangeEvent(Sender: TObject);
begin

  if FColorPalette = nil then Exit;

  FPaletteColor    := FColorPalette.CurrentColor;
  FPaletteIsClear  := FColorPalette.IsClear;
  FDefaultColor    := FColorPalette.CurrentColor;
  FIsClear         := FColorPalette.IsClear;

  DrawButtonGlyph(FDefaultColor);

  if Assigned(FOnPaletteColorChange) then FOnPaletteColorChange(Self);

end; {procedure, PaletteColorChangeEvent}


{------------------------------------------------------------------------------}
{ TppColorButton.GetDefaultColor}

procedure TppColorButton.GetDefaultColor(var aColor: TColor; var aIsClear: Boolean);
begin
  aColor   := FDefaultColor;
  aIsClear := FIsClear;

end; {procedure, GetDefaultColor}


{------------------------------------------------------------------------------}
{ TppColorButton.GetPaletteColor}

procedure TppColorButton.GetPaletteColor(var aColor: TColor; var aIsClear: Boolean);
begin

  aColor   := FPaletteColor;
  aIsClear := FPaletteIsClear;

end; {procedure, GetPaletteColor}

{------------------------------------------------------------------------------}
{ TppColorButton.SetDefaultColor}

procedure TppColorButton.SetDefaultColor(aColor: TColor; aIsClear: Boolean);
begin

  FDefaultColor := aColor;
  FIsClear      := aIsClear;

  DrawButtonGlyph(FDefaultColor);

end; {procedure, SetDefaultColor}

{------------------------------------------------------------------------------}
{ TppColorButton.SetPaletteColor}

procedure TppColorButton.SetPaletteColor(aColor: TColor; aIsClear: Boolean);
begin

  FPaletteColor   := aColor;
  FPaletteIsClear := aIsClear;

  if (FColorPalette = nil) then Exit;

  if (FColorPalette.CurrentColor <> aColor) then
    FColorPalette.CurrentColor := aColor;

  if (FColorPalette.IsClear <> aIsClear) then
    FColorPalette.IsClear := aIsClear;

end; {procedure, SetPaletteColor}


{------------------------------------------------------------------------------}
{ TppColorButton.SetLanguageIndex}

procedure TppColorButton.SetLanguageIndex(aLanguageIndex: Longint);
begin

  FLanguageIndex := aLanguageIndex;

  case FColorType of

    ctFont:
      Hint := ppLoadStr(480);  {Font Color}

    ctHighlight:
      Hint := ppLoadStr(481);  {Highlight Color}

    ctFill:
      Hint := ppLoadStr(482);  {Fill Color}

    ctLine:
      Hint := ppLoadStr(483);  {Line Color}

  end;

  if (FColorPalette <> nil) then
    FColorPalette.LanguageIndex :=  aLanguageIndex


end; {procedure, SetLanguageIndex}

{******************************************************************************
 *
 **  C u s t o m P a l e t t e
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomPalette.Create}

constructor TppCustomPalette.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FButtons        := TList.Create;
  FPaletteEnabled := True;

  FOnButtonClick  := nil;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppCustomPalette.Destroy}

destructor TppCustomPalette.Destroy;
begin

  FButtons.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomPalette.AddButton}

function TppCustomPalette.AddButton(aButton: TSpeedButton): Integer;
begin
  aButton.OnClick := ButtonClickEvent;
  Result := FButtons.Add(aButton);

end; {function, AddButton}

{------------------------------------------------------------------------------}
{ TppCustomPalette.GetButton}

function TppCustomPalette.GetButton(aIndex: Integer): TSpeedButton;
begin
  Result := TSpeedButton(FButtons[aIndex]);

end; {function, GetColorButton}

{------------------------------------------------------------------------------}
{ TppCustomPalette.GetButtonCount}

function TppCustomPalette.GetButtonCount: Integer;
begin
  Result := FButtons.Count;

end; {function, GetButtonCount}


{------------------------------------------------------------------------------}
{ TppCustomPalette.SetPaletteEnabled}

procedure TppCustomPalette.SetPaletteEnabled(aValue: Boolean);
begin

  if  (FPaletteEnabled = aValue) then Exit;

  FPaletteEnabled := aValue;

  if Visible then
    EnablePalette(aValue);

end;{function, SetPaletteEnabled}

{------------------------------------------------------------------------------}
{ TppCustomPalette.EnablePalette}

procedure TppCustomPalette.EnablePalette(aValue: Boolean);
var
  liButton: Integer;

begin

  if (FButtons.Count = 0) or Buttons[0].Enabled = aValue then Exit;

  for liButton := 0 to FButtons.Count-1 do
    Buttons[liButton].Enabled := aValue;

end; {procedure, EnablePalette}

{------------------------------------------------------------------------------}
{ TppCustomPalette.ButtonClickEvent}

procedure TppCustomPalette.ButtonClickEvent(Sender: TObject);
begin

  if Assigned(FOnButtonClick) then FOnButtonClick(Sender);

  Visible := False;

end; {procedure, ButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppCustomPalette.CMVisibleChanged}

procedure TppCustomPalette.CMVisibleChanged (var Message: TMessage);
begin

  VisibleChanged;

  inherited;

end; {procedure, CMVisibleChanged}


{------------------------------------------------------------------------------}
{ TppCustomPalette.VisibleChanged}

procedure TppCustomPalette.VisibleChanged;
begin

  if Visible then
    EnablePalette(FPaletteEnabled);

end; {procedure, VisibleChanged}


{******************************************************************************
 *
 **  A n c h o r s  P a l e t t e
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAnchorsPalette.Create}

constructor TppAnchorsPalette.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCurrentAnchors := [atLeft, atTop];

  Height := 69;
  Width  := 69;

  CreateControls;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppAnchorsPalette.Destroy}

destructor TppAnchorsPalette.Destroy;
begin
  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppAnchorsPalette.ButtonClickEvent}

procedure TppAnchorsPalette.ButtonClickEvent(Sender: TObject);
var
  liIndex: Integer;
begin

  liIndex := TComponent(Sender).Tag;

  SetCurrentAnchors(cAnchors[liIndex]);

  inherited ButtonClickEvent(Sender);

end; {procedure, ButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppAnchorsPalette.CreateControls}

procedure TppAnchorsPalette.CreateControls;
var
  liLeft: Integer;
  liTop: Integer;
  liButton: Integer;
  lAnchorButton: TSpeedButton;
begin

  {create the anchor buttons: 3 rows of 3 buttons}
  liLeft := 2;
  liTop  := 2;

  for liButton := 0 to 8 do
    begin
      {create anchor button}
      lAnchorButton := TSpeedButton.Create(nil);
      lAnchorButton.SetBounds(liLeft, liTop, 22, 22);
      lAnchorButton.GroupIndex := 1;
      lAnchorButton.AllowAllUp := True;
      lAnchorButton.Tag        := liButton;
      lAnchorButton.Parent := Self;
      lAnchorButton.Flat := True;
      lAnchorButton.Layout := blGlyphRight;

      {draw anchor glyph}
      lAnchorButton.Glyph.Handle := ppBitmapFromResource(cAnchorResNames[liButton]);

      AddButton(lAnchorButton);

      Inc(liLeft, lAnchorButton.Width);

      {after the 3rd and 6th button, start a new row}
      if (liButton = 2) or (liButton = 5) then
        begin
          Inc(liTop, lAnchorButton.Height);
          liLeft := 2;
        end;

    end; {for each anchor button}
    
end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TppAnchorsPalette.SetCurrentAnchors}

procedure TppAnchorsPalette.SetCurrentAnchors(aAnchors: TppAnchors);
var
  liButton: Integer;
begin

  //if (FCurrentAnchors = aAnchors) then Exit;

  FCurrentAnchors := aAnchors;

  for liButton := 0 to ButtonCount - 1 do
    if cAnchors[liButton] = aAnchors then
      Buttons[liButton].Down := True;

  Invalidate;

end; {procedure, SetCurrentAnchors}


{******************************************************************************
 *
 **  B o r d e r   P a l e t t e
 *
{******************************************************************************}

constructor TppBorderPalette.Create(aOwner: TComponent);
begin
  inherited;

  FCurrentBorderPositions := [];

  Width := 145;
  Height := 115;

  FWorkspace := TShape.Create(Self);
  FWorkspace.Parent := Self;

  CreateBorderWorkspace;
  CreateBorderGraphics;
  CreateBorderButtons;

end;

destructor TppBorderPalette.Destroy;
begin

  inherited Destroy;
end;

procedure TppBorderPalette.ButtonClickEvent(Sender: TObject);
begin
  if Assigned(FOnButtonClick) then FOnButtonClick(Sender);
end;

procedure TppBorderPalette.EnablePalette(aValue: Boolean);
begin
  FLeftBorderGraphic.Enabled := aValue;
  FTopBorderGraphic.Enabled := aValue;
  FRightBorderGraphic.Enabled := aValue;
  FBottomBorderGraphic.Enabled := aValue;

  FLeftBorderGraphic.Visible := aValue;
  FTopBorderGraphic.Visible := aValue;
  FRightBorderGraphic.Visible := aValue;
  FBottomBorderGraphic.Visible := aValue;

  FLTCornerGraphic.Enabled := aValue;
  FRTCornerGraphic.Enabled := aValue;
  FLBCornerGraphic.Enabled := aValue;
  FRBCornerGraphic.Enabled := aValue;

  FTextLabel.Enabled := aValue;

  FAllButton.Enabled := aValue;
  FNoneButton.Enabled := aValue;

end;

procedure TppBorderPalette.CreateBorderGraphics;
begin
  FLeftBorderGraphic := TppBorderGraphic.Create(Self);
  FLeftBorderGraphic.Parent := Self;
  FLeftBorderGraphic.Left := 5;
  FLeftBorderGraphic.Top := 60;
  FLeftBorderGraphic.Width := 20;
  FLeftBorderGraphic.Height := 35;
  FLeftBorderGraphic.Orientation := botVertical;
  FLeftBorderGraphic.OnMouseDown := LeftBorderMouseDownEvent;

  FTopBorderGraphic := TppBorderGraphic.Create(Self);
  FTopBorderGraphic.Parent := Self;
  FTopBorderGraphic.Left := 20;
  FTopBorderGraphic.Top := 45;
  FTopBorderGraphic.Width := 105;
  FTopBorderGraphic.Height := 20;
  FTopBorderGraphic.Orientation := botHorizontal;
  FTopBorderGraphic.OnMouseDown := TopBorderMouseDownEvent;

  FRightBorderGraphic := TppBorderGraphic.Create(Self);
  FRightBorderGraphic.Parent := Self;
  FRightBorderGraphic.Left := 120;
  FRightBorderGraphic.Top := 60;
  FRightBorderGraphic.Width := 20;
  FRightBorderGraphic.Height := 35;
  FRightBorderGraphic.Orientation := botVertical;
  FRightBorderGraphic.OnMouseDown := RightBorderMouseDownEvent;

  FBottomBorderGraphic := TppBorderGraphic.Create(Self);
  FBottomBorderGraphic.Parent := Self;
  FBottomBorderGraphic.Left := 20;
  FBottomBorderGraphic.Top := 90;
  FBottomBorderGraphic.Width := 105;
  FBottomBorderGraphic.Height := 20;
  FBottomBorderGraphic.Orientation := botHorizontal;
  FBottomBorderGraphic.OnMouseDown := BottomBorderMouseDownEvent;

end;

procedure TppBorderPalette.CreateBorderWorkspace;
begin
  {Workspace area}
  FWorkspace.Left := 5;
  FWorkspace.Top := 45;
  FWorkspace.Width := 135;
  FWorkspace.Height := 65;
  FWorkspace.Brush.Color := clWhite;
  FWorkspace.Brush.Style := bsSolid;

  {Corner Graphics}
  FLTCornerGraphic := TppCornerGraphic.Create(Self);
  FLTCornerGraphic.Parent := Self;
  FLTCornerGraphic.CornerType := ctLeftTop;
  FLTCornerGraphic.Left := 5;
  FLTCornerGraphic.Top := 45;

  FRTCornerGraphic := TppCornerGraphic.Create(Self);
  FRTCornerGraphic.Parent := Self;
  FRTCornerGraphic.CornerType := ctRightTop;
  FRTCornerGraphic.Left := 125;
  FRTCornerGraphic.Top := 45;

  FLBCornerGraphic := TppCornerGraphic.Create(Self);
  FLBCornerGraphic.Parent := Self;
  FLBCornerGraphic.CornerType := ctLeftBottom;
  FLBCornerGraphic.Left := 5;
  FLBCornerGraphic.Top := 95;

  FRBCornerGraphic := TppCornerGraphic.Create(Self);
  FRBCornerGraphic.Parent := Self;
  FRBCornerGraphic.CornerType := ctRightBottom;
  FRBCornerGraphic.Left := 125;
  FRBCornerGraphic.Top := 95;

  {Text Label}
  FTextLabel := TLabel.Create(Self);
  FTextLabel.Parent := Self;
  FTextLabel.Color := clWhite;
  FTextLabel.Caption := ppLoadStr(1154); {Text}
  FTextLabel.AutoSize := True;
  FTextLabel.Left := 60;
  FTextLabel.Top := 71;

end;


procedure TppBorderPalette.CreateBorderButtons;
var
  liButtonHeight: Integer;
begin

  liButtonHeight := 20;

  {create the all button }
  FAllButton := TSpeedButton.Create(nil);
  FAllButton.SetBounds(3, 2, 140, liButtonHeight);
  FAllButton.GroupIndex := 1;
  FAllButton.AllowAllUp := True;
  FAllButton.OnClick := AllButtonClickEvent;
  FAllButton.Parent := Self;
  FAllButton.Flat := True;

  FAllButtonGlyph        := TBitmap.Create;

  DrawButtonGlyph(FAllButton, FAllButtonGlyph, clBlack, ppLoadStr(1155)); {All}

  FAllButtonGlyph.Free;

  {create the None button }
  FNoneButton := TSpeedButton.Create(nil);
  FNoneButton.SetBounds(3, 2 + liButtonHeight, 140, liButtonHeight);
  FNoneButton.GroupIndex := 1;
  FNoneButton.AllowAllUp := True;
  FNoneButton.OnClick := NoneButtonClickEvent;
  FNoneButton.Parent := Self;
  FNoneButton.Flat := True;

  FNoneButtonGlyph        := TBitmap.Create;

  DrawButtonGlyph(FNoneButton, FNoneButtonGlyph, clSilver, ppLoadStr(474)); {None}

  FNoneButtonGlyph.Free;

end;

procedure TppBorderPalette.DrawButtonGlyph(aButton: TSpeedButton; aGlyph: TBitmap; aColor: TColor; aCaption: String);
var
  liLeft: Integer;
  liTop: Integer;
  liSide: Integer;
begin

  aGlyph.Width  := aButton.Width - 2;
  aGlyph.Height := aButton.Height - 2;

  {draw a gray frame to outline the button}
  aGlyph.Canvas.Brush.Style := bsSolid;
  aGlyph.Canvas.Brush.Color := clGray;
  aGlyph.Canvas.FrameRect(Rect(2,2,aGlyph.Width-3, aGlyph.Height-2));

  liSide := aGlyph.Height - 5;
  aGlyph.Canvas.Brush.Color := aColor;
  aGlyph.Canvas.FrameRect(Rect(5, 4, liSide + 1, liSide));

  aGlyph.Canvas.Brush.Style := bsClear;
  aGlyph.Canvas.Pen.Style := psSolid;
  aGlyph.Canvas.Pen.Color := clSilver;
  aGlyph.Canvas.MoveTo(6, 8);
  aGlyph.Canvas.LineTo(13, 8);
  aGlyph.Canvas.MoveTo(9, 5);
  aGlyph.Canvas.LineTo(9, 12);

  liLeft := (aGlyph.Width  - aGlyph.Canvas.TextWidth(aCaption)) div 2;
  liTop  := (aGlyph.Height - aGlyph.Canvas.TextHeight(aCaption)) div 2;

  aGlyph.Canvas.Font.Name  := 'MS Sans Serif';
  aGlyph.Canvas.Font.Size  := 8;

  aGlyph.Canvas.TextOut(liLeft, liTop, aCaption);

  aButton.Glyph := aGlyph;
end;

procedure TppBorderPalette.LeftBorderMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if bpLeft in FCurrentBorderPositions then
    Exclude(FCurrentBorderPositions, bpLeft)
  else
    Include(FCurrentBorderPositions, bpLeft);

  ButtonClickEvent(Sender);

end;

procedure TppBorderPalette.TopBorderMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if bpTop in FCurrentBorderPositions then
    Exclude(FCurrentBorderPositions, bpTop)
  else
    Include(FCurrentBorderPositions, bpTop);

  ButtonClickEvent(Sender);

end;

procedure TppBorderPalette.RightBorderMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if bpRight in FCurrentBorderPositions then
    Exclude(FCurrentBorderPositions, bpRight)
  else
    Include(FCurrentBorderPositions, bpRight);

  ButtonClickEvent(Sender);

end;

procedure TppBorderPalette.BottomBorderMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if bpBottom in FCurrentBorderPositions then
    Exclude(FCurrentBorderPositions, bpBottom)
  else
    Include(FCurrentBorderPositions, bpBottom);

  ButtonClickEvent(Sender);
    
end;

procedure TppBorderPalette.AllButtonClickEvent(Sender: TObject);
begin
  FCurrentBorderPositions := [bpLeft, bpTop, bpRight, bpBottom];

  UpdatePaletteBorderSelection(FCurrentBorderPositions);

  ButtonClickEvent(Sender);

end;

procedure TppBorderPalette.NoneButtonClickEvent(Sender: TObject);
begin
  FCurrentBorderPositions := [];

  UpdatePaletteBorderSelection(FCurrentBorderPositions);

  ButtonClickEvent(Sender);
  
end;

procedure TppBorderPalette.SetCurrentBorderPositions(aBorderPositions: TppBorderPositions);
begin
  FCurrentBorderPositions := aBorderPositions;

  UpdatePaletteBorderSelection(FCurrentBorderPositions);

end;

procedure TppBorderPalette.UpdatePaletteBorderSelection(aBorderPositions: TppBorderPositions);
begin
  FLeftBorderGraphic.Selected := (bpLeft in aBorderPositions);
  FTopBorderGraphic.Selected := (bpTop in aBorderPositions);
  FRightBorderGraphic.Selected := (bpRight in aBorderPositions);
  FBottomBorderGraphic.Selected := (bpBottom in aBorderPositions);

  FAllButton.Down := (aBorderPositions = [bpLeft, bpTop, bpRight, bpBottom]);
  FNoneButton.Down := (aBorderPositions = []);

end;


{******************************************************************************
 *
 **  L i n e S t y l e P a l e t t e
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppLineStylePalette.Create}

constructor TppLineStylePalette.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCurrentLineStyle := psSolid;

  Height := 77;
  Width  := 104;

  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppLineStylePalette.Destroy}

destructor TppLineStylePalette.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppLineStylePalette.CreateControls}

procedure TppLineStylePalette.CreateControls;
var
  liTop: Integer;
  liButton: Integer;
  lButton: TSpeedButton;

begin


  {create the line style buttons: 1 col of 5 buttons}
  liTop  := 3;

  for liButton := 0 to 4 do
    begin

      {create button}
      lButton := TSpeedButton.Create(nil);
      lButton.SetBounds(3, liTop, 98, 14);
      lButton.GroupIndex := 1;
      lButton.Tag := liButton;
      lButton.Parent := Self;
      lButton.Flat := True;

      {load button glyph}
      lButton.Glyph.Handle := ppBitmapFromResource(cLineStyleResNames[liButton]);

      AddButton(lButton);

      Inc(liTop, lButton.Height);

    end; {for each button}


end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppLineStylePalette.ButtonClickEvent}

procedure TppLineStylePalette.ButtonClickEvent(Sender: TObject);
var
  liIndex: Integer;
begin

  liIndex := TComponent(Sender).Tag;

  SetCurrentLineStyle(cLineStyle[liIndex]);

  inherited ButtonClickEvent(Sender);

end;  {procedure, ButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppLineStylePalette.SetCurrentLineStyle}

procedure TppLineStylePalette.SetCurrentLineStyle(aLineStyle: TPenStyle);
var
  liButton: Integer;
  
begin

  if (FCurrentLineStyle = aLineStyle) then Exit;

  FCurrentLineStyle := aLineStyle;

  for liButton := 0 to ButtonCount-1 do
    if cLineStyle[liButton] = aLineStyle then
      Buttons[liButton].Down := True;

  Invalidate;
  
end;  {procedure, SetCurrentLineStyle}



{******************************************************************************
 *
 **  L i n e T h i c k n e s s P a l e t t e
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.Create}

constructor TppLineThicknessPalette.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  {0.75 is one screen pixel (if screen res is 96 ppi) }
  FCurrentLineThickness := 0.75;
  FCurrentLineStyle     := lsSingle;

  Height := 215;
  Width  := 134;

  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.Destroy}

destructor TppLineThicknessPalette.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.CreateControls}

procedure TppLineThicknessPalette.CreateControls;
var
  liTop: Integer;
  liButton: Integer;
  lButton: TSpeedButton;

begin


  {create the line width buttons: 1 col of 12 buttons}
  liTop  := 3;

  for liButton := 0 to 12 do
    begin

      {create button}
      lButton := TSpeedButton.Create(Self);
      lButton.SetBounds(3, liTop, 128, 16);
      lButton.GroupIndex := 1;
      lButton.Tag := liButton;
      lButton.Parent := Self;
      lButton.Flat := True;

      {load button glyph}
      lButton.Glyph.Handle := ppBitmapFromResource(cLineThicknessResNames[liButton]);

      AddButton(lButton);

      Inc(liTop, lButton.Height);

    end; {for each button}


end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.ButtonClickEvent}

procedure TppLineThicknessPalette.ButtonClickEvent(Sender: TObject);
var
  liIndex: Integer;
begin

  liIndex := TSpeedButton(Sender).Tag;

  FCurrentLineThickness := cLineThickness[liIndex];
  FCurrentLineStyle     := cLineThicknessStyle[liIndex];

  inherited ButtonClickEvent(Sender);

end;  {procedure, ButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.UpdateButtonStates}

procedure TppLineThicknessPalette.UpdateButtonStates;
var
  liButton: Integer;

begin

  for liButton := 0 to ButtonCount-1 do
    if (cLineThickness[liButton]      = FCurrentLineThickness) and
       (cLineThicknessStyle[liButton] = FCurrentLineStyle) then
      Buttons[liButton].Down := True
    else
      Buttons[liButton].Down := False;

  Invalidate;

end;  {procedure, UpdateButtonStates}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.SetCurrentLineThickness}

procedure TppLineThicknessPalette.SetCurrentLineThickness(aLineThickness: Single);
begin

  if (FCurrentLineThickness = aLineThickness) then Exit;

  FCurrentLineThickness := aLineThickness;

  UpdateButtonStates;

end;  {procedure, SetCurrentLineThickness}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.SetCurrentLineStyle}

procedure TppLineThicknessPalette.SetCurrentLineStyle(aLineStyle: TppLineStyleType);
begin

  if (FCurrentLineStyle = aLineStyle) then Exit;

  FCurrentLineStyle := aLineStyle;

  UpdateButtonStates;

end;  {procedure, SetCurrentLineStyle}

{******************************************************************************
 *
 **  C o l o r P a l e t t e
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppColorPalette.Create}

constructor TppColorPalette.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FLanguageIndex := 0;

  FColorButtons   := TList.Create;
  FTWColorButtons := TList.Create;

  FPaletteEnabled := True;

  Width :=  150;
  Height := 103;
  CreateControls;

  FAutoButton.Down := True;

  TearAway := True;
 
end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppColorPalette.Destroy}

destructor TppColorPalette.Destroy;
begin

  FAutoGlyph.Free;
  FColorButtons.Free;
  FTWColorButtons.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppColorPalette.CreateControls}

procedure TppColorPalette.CreateControls;
var
  liLeft, liTop: Integer;
  liButton: Integer;
  lColorButton: TSpeedButton;
  lBevel: TBevel;
  liDesignFontHeight: Integer;
  liCurrentFontHeight: Integer;
  lfScale: Single;
  liAutoHeight: Integer;
  liAutoBottom: Integer;
  lFont: TFont;
begin

  {check for large fonts anc scale accordingly}
  liDesignFontHeight := 11;

  if (Parent is TForm) then
    lFont := TForm(Parent).Font
  else if (Owner is TForm) then
    lFont := TForm(Owner).Font
  else
    lFont := Font;

  liCurrentFontHeight := Round(lFont.Size * Screen.PixelsPerInch / 72);

  if liDesignFontHeight = liCurrentFontHeight then
    lfScale := 1
  else
    lfScale := liCurrentFontHeight / liDesignFontHeight;


  liAutoHeight := Round(23 * lfScale);

  {create the auto button }
  FAutoButton := TSpeedButton.Create(nil);
  FAutoButton.SetBounds(3, 2, 144, liAutoHeight);
  FAutoButton.GroupIndex := 1;
  FAutoButton.AllowAllUp := True;
  FAutoButton.OnClick := AutoButtonClickEvent;
  FAutoButton.Parent := Self;
  FAutoButton.Flat := True;

  FAutoGlyph        := TBitmap.Create;
  FAutoGlyph.Width  := FAutoButton.Width-2;
  FAutoGlyph.Height := FAutoButton.Height-2;


  DrawAutoButtonGlyph(clWindowText);

  liAutoBottom := FAutoButton.Top + FAutoButton.Height;

  {create the more colors button}
  FMoreColorsButton := TSpeedButton.Create(nil);
  FMoreColorsButton.SetBounds(3, liAutoBottom + 47, 142, liAutoHeight);
  FMoreColorsButton.OnClick := MoreColorsButtonClickEvent;
  FMoreColorsButton.Parent := Self;
  FMoreColorsButton.Flat := True;

  {create the color buttons: 2 rows of 8 buttons}
  liLeft := 3;
  liTop  := liAutoBottom + 4;

  for liButton := Low(cStdColors) to High(cStdColors) do
    begin

      {create color button}
      lColorButton := TSpeedButton.Create(nil);
      lColorButton.SetBounds(liLeft, liTop, 18, 18);
      lColorButton.GroupIndex := 1;
      lColorButton.AllowAllUp := True;
      lColorButton.OnClick    := ColorButtonClickEvent;
      lColorButton.Tag        := cStdColors[liButton];
      lColorButton.Parent := Self;
      lColorButton.Flat := True;

      lColorButton.NumGlyphs := 2;

      lColorButton.Glyph.Width := 16;
      lColorButton.Glyph.Height := 16;
      lColorButton.Glyph.Handle := ppBitmapFromResource('PPPALETTECOLORBOX');
      lColorButton.Glyph.MaskHandle := ppBitmapFromResource('PPPALETTECOLORBOXMASK');

      {draw color glyph}
      DrawColorButtonGlyph(lColorButton.Glyph, cStdColors[liButton]);

      FColorButtons.Add(lColorButton);

      Inc(liLeft, lColorButton.Width);

      {after the 8th button, start a new row}
      if (liButton = 7) then
        begin
          Inc(liTop, lColorButton.Height);
          liLeft := 3;
        end;

    end; {for each color button}

   lBevel := TBevel.Create(nil);
   lBevel.Shape  := bsTopLine;
   lBevel.SetBounds(3, liAutoBottom + 43, Width-6, 3);
   lBevel.Parent := Self;


  ClientHeight := FMoreColorsButton.Top + FMoreColorsButton.Height + 3;

  {load language strings}
  SetLanguageIndex(FLanguageIndex);


end; {procedure, CreateControls}



{------------------------------------------------------------------------------}
{ TppColorPalette.DrawAutoButtonGlyph}

procedure TppColorPalette.DrawAutoButtonGlyph(aColor: TColor);

var
  liLeft: Integer;
  liTop: Integer;
  liSide: Integer;

begin

  FAutoGlyph.TransparentColor := clWhite;

  {erase prior button caption etc.}
  FAutoGlyph.Canvas.Brush.Style := bsSolid;
  FAutoGlyph.Canvas.Brush.Color := clWhite;
  FAutoGlyph.Canvas.FillRect(Rect(0,0,FAutoGlyph.Width, FAutoGlyph.Height));


  {draw a gray frame to outline the button}
  FAutoGlyph.Canvas.Brush.Style := bsSolid;
  FAutoGlyph.Canvas.Brush.Color := clGray;
  FAutoGlyph.Canvas.FrameRect(Rect(2,2,FAutoGlyph.Width-3, FAutoGlyph.Height-2));

  if (FPaletteType = ptFont) then
    begin
      liSide := FAutoGlyph.Height-5;

      {draw a gray frame to outline the color}
      FAutoGlyph.Canvas.FrameRect(Rect(5,4,liSide, liSide));

      if not FPaletteEnabled then
        aColor := clWhite;

      Dec(liSide);

      {draw the windows text color}
      FAutoGlyph.Canvas.Brush.Color := aColor;
      FAutoGlyph.Canvas.FillRect(Rect(6,5,liSide, liSide));
    end;

  {draw the text}
  FAutoGlyph.Canvas.Brush.Style := bsClear;
  FAutoGlyph.Canvas.Font.Name  := 'MS Sans Serif';
  FAutoGlyph.Canvas.Font.Size  := 8;

  liLeft := (FAutoGlyph.Width  - Canvas.TextWidth(FAutoCaption)) div 2;
  liTop  := (FAutoGlyph.Height - Canvas.TextHeight(FAutoCaption)) div 2;

  FAutoGlyph.Canvas.TextOut(liLeft, liTop, FAutoCaption);

  FAutoButton.Glyph := FAutoGlyph;

end; {procedure, DrawAutoButtonGlyph}


{------------------------------------------------------------------------------}
{ TppColorPalette.DrawColorButtonGlyph}

procedure TppColorPalette.DrawColorButtonGlyph(aGlyph: TBitmap; aColor: TColor);
begin

  aGlyph.Canvas.Brush.Style := bsSolid;

  aGlyph.Canvas.Brush.Color := aColor;

  aGlyph.Canvas.FillRect(Rect(1,1,11, 11));

end; {procedure, DrawColorButtonGlyph}


{------------------------------------------------------------------------------}
{ TppColorPalette.GetColorButton}

function TppColorPalette.GetColorButton(aIndex: Integer): TSpeedButton;
begin

  Result := TSpeedButton(FColorButtons[aIndex]);

end; {function, GetColorButton}


{------------------------------------------------------------------------------}
{ TppColorPalette.SetPaletteEnabled}

procedure TppColorPalette.SetPaletteEnabled(aValue: Boolean);
begin

  if (FPaletteEnabled = aValue) then Exit;

  FPaletteEnabled := aValue;

  if Visible then
    EnablePalette(aValue);

  UpdateToolWindowState;


end;{function, SetPaletteEnabled}

{------------------------------------------------------------------------------}
{ TppColorPalette.EnablePalette}

procedure TppColorPalette.EnablePalette(aValue: Boolean);
var
  liButton: Integer;

begin

  if (FMoreColorsButton.Enabled = aValue) then Exit;

  FMoreColorsButton.Enabled := aValue;

  DrawAutoButtonGlyph(clWindowText);
  FAutoButton.Enabled := aValue;


  for liButton := 0 to FColorButtons.Count-1 do
    ColorButtons[liButton].Enabled := aValue;

end; {procedure, EnablePalette}

{------------------------------------------------------------------------------}
{ TppColorPalette.VisibleChanged}

procedure TppColorPalette.VisibleChanged;
var
  liButton: Integer;
  lColor: Integer;
  
begin

  if Visible then
    begin

      EnablePalette(FPaletteEnabled);

      {set button down}
      if (FPaletteType = ptFont) then
        FAutoButton.Down := (FCurrentColor = clWindowText)
      else
        FAutoButton.Down := FIsClear;


      for liButton := 0 to FColorButtons.Count-1 do
        begin
          lColor := (ColorButtons[liButton].Tag);

          ColorButtons[liButton].Down := (not (FAutoButton.Down)) and
                                        (lColor = FCurrentColor);
        end;

    end;



end; {procedure, VisibleChanged}

{------------------------------------------------------------------------------}
{ TppColorPalette.SetCurrentColor}

procedure TppColorPalette.SetCurrentColor(aColor: TColor);
begin

  if (FCurrentColor = aColor) then Exit;

  FCurrentColor := aColor;

  UpdateToolWindowState;

end; {procedure, SetCurrentColor}


{------------------------------------------------------------------------------}
{ TppColorPalette.SetIsClear}

procedure TppColorPalette.SetIsClear(aValue: Boolean);
begin

  if (FIsClear = aValue) then Exit;

  FIsClear := aValue;

  UpdateToolWindowState;
  
end; {procedure, SetCurrentColor}

{------------------------------------------------------------------------------}
{ TppColorPalette.SetPaletteType}

procedure TppColorPalette.SetPaletteType(aPaletteType: TppColorPaletteType);
begin

  FPaletteType := aPaletteType;

  FIsClear      := (FPaletteType <> ptFont);
  FCurrentColor := clWindowText;

  {load button strings}
  SetLanguageIndex(LanguageIndex);

  if Assigned(FOnColorChange) then FOnColorChange(Self);


end; {procedure, SetPaletteType}

{------------------------------------------------------------------------------}
{ TppColorPalette.SetAutoCaption}

procedure  TppColorPalette.SetAutoCaption(aCaption: String);
begin

  if (FAutoCaption = aCaption) then Exit;

  FAutoCaption := aCaption;

  DrawAutoButtonGlyph(clWindowText);

end; {procedure, SetAutoCaption}

{------------------------------------------------------------------------------}
{ TppColorPalette.SetMoreColorsCaption}

procedure  TppColorPalette.SetMoreColorsCaption(aCaption: String);
begin

  if (FMoreColorsCaption = aCaption) then Exit;

  FMoreColorsCaption := aCaption;
  FMoreColorsButton.Caption := FMoreColorsCaption;

end; {procedure, SetMoreColorsCaption}


{------------------------------------------------------------------------------}
{ TppColorPalette.ColorButtonClickEvent}

procedure TppColorPalette.ColorButtonClickEvent(Sender: TObject);
var
  lColor: Integer;
begin

  FIsClear := False;

  lColor := Integer(TSpeedButton(Sender).Tag);

  FCurrentColor := TColor(lColor);

  if Assigned(FOnColorChange) then FOnColorChange(Sender);

  if Visible then
    Visible := False;


  UpdateToolWindowState;

  
end; {procedure, ColorButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppColorPalette.MoreColorsButtonClickEvent}

procedure TppColorPalette.MoreColorsButtonClickEvent(Sender: TObject);
var
  lColor: TColor;

begin

  if ShowColorDialog(lColor) then
    begin
      FIsClear := False;

      SetCurrentColor(lColor);
    end;

  if Visible then
    Visible := False;


  if Assigned(FOnColorChange) then FOnColorChange(Sender);

end; {procedure, MoreColorsButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppColorPalette.AutoButtonClickEvent}

procedure TppColorPalette.AutoButtonClickEvent(Sender: TObject);
begin

  FIsClear := (FPaletteType <> ptFont);

  if (FPaletteType = ptFont) then
    FCurrentColor := clWindowText
  else
    FCurrentColor := clWindow;

  if Visible then
    begin
      UpdateToolWindowState;

      Visible := False;
    end;


  if Assigned(FOnColorChange) then FOnColorChange(Sender);


end; {procedure, AutoButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppColorPalette.ShowColorDialog}

function TppColorPalette.ShowColorDialog(var aColor: TColor): Boolean;
var
  ldlgColor: TColorDialog;

begin

  {create color dialog}
  ldlgColor := TColorDialog.Create(Self);

  Result := ldlgColor.Execute;

  if Result then
    {convert color to long int}
    aColor := ColorToRGB(ldlgColor.Color);

  ldlgColor.Free;

end;  {procedure, ShowColorDialog}


{------------------------------------------------------------------------------}
{ TppColorPalette.CreateToolWindow}

procedure TppColorPalette.CreateToolWindow;
var
  lButton: TSpeedButton;
  liControl: Integer;

begin

  inherited CreateToolWindow;

  FTWAutoButton       :=  TSpeedButton(ToolWindow.Controls[0]);
  FTWMoreColorsButton :=  TSpeedButton(ToolWindow.Controls[1]);

  FTWAutoButton.OnClick := AutoButtonClickEvent;
  FTWMoreColorsButton.OnClick := MoreColorsButtonClickEvent;

  for liControl := 2 to ToolWindow.ControlCount-1 do
    if (ToolWindow.Controls[liControl] is TSpeedButton) then
      begin
        lButton :=  TSpeedButton(ToolWindow.Controls[liControl]);
        lButton.OnClick := ColorButtonClickEvent;
        FTWColorButtons.Add(lButton);
      end;


  {initialize tool window caption}
  SetLanguageIndex(FLanguageIndex);

end; {procedure, CreateToolWindow}


{------------------------------------------------------------------------------}
{ TppColorPalette.ActivateToolWindow}

procedure TppColorPalette.ActivateToolWindow;
begin

  inherited ActivateToolWindow;

  UpdateToolWindowState;


end; {procedure, ActivateToolWindow}


{------------------------------------------------------------------------------}
{ TppColorPalette.UpdateToolWindowState}

procedure TppColorPalette.UpdateToolWindowState;
var
  liButton: Integer;
  lButton: TSpeedButton;

begin

  if (ToolWindow = nil) or not ToolWindow.Visible then Exit;

  {set button down}
  if (FPaletteType = ptFont) then
    FTWAutoButton.Down := (FCurrentColor = clWindowText)
  else
    FTWAutoButton.Down := FIsClear;

  FTWAutoButton.Enabled       :=  FPaletteEnabled;
  FTWMoreColorsButton.Enabled :=  FPaletteEnabled;

  FTWMoreColorsButton.Caption := FMoreColorsCaption;

  DrawAutoButtonGlyph(clWindowText);
  FTWAutoButton.Glyph.Canvas.Draw(0,0,FAutoButton.Glyph);

  for liButton := 0 to FTWColorButtons.Count-1 do
    begin
      lButton := TSpeedButton(FTWColorButtons[liButton]);
      lButton.Down := (not FTWAutoButton.Down) and (lButton.Tag = Integer(FCurrentColor));
      lButton.Enabled := FPaletteEnabled;
    end;

end; {procedure, UpdateToolWindowState}


{------------------------------------------------------------------------------}
{ TppColorPalette.SetLanguageIndex}

procedure TppColorPalette.SetLanguageIndex(aLanguageIndex: Longint);
begin

  FLanguageIndex := aLanguageIndex;

  TitleBarHint := ppLoadStr(207);   {drag to make window float}

  case FPaletteType of
    ptFont:
      begin
        SetAutoCaption(ppLoadStr(472))       {Automatic};
        SetMoreColorsCaption(ppLoadStr(473)) {More Font Colors...}
      end;

    ptHighlight:
      begin
        SetAutoCaption(ppLoadStr(474));       {None}
        SetMoreColorsCaption(ppLoadStr(475)); {More Highlight Colors...}
      end;

   ptFill:
      begin
        SetAutoCaption(ppLoadStr(476));       {No Fill}
        SetMoreColorsCaption(ppLoadStr(477)); {More Fill Colors...}
      end;

   ptLine:
      begin
        SetAutoCaption(ppLoadStr(478));       {No Line}
        SetMoreColorsCaption(ppLoadStr(479)); {More Line Colors...}
      end
   else
     FMoreColorsButton.Caption := 'More Colors...'; {currently not used}



  end; {case, PaletteType}


  if ToolWindow <> nil then
    begin
      UpdateToolWindowState;

      case FPaletteType of

        ptFont     : ToolWindow.Caption := (ppLoadStr(480)); {Font Color}

        ptHighlight: ToolWindow.Caption := (ppLoadStr(481)); {Highlight Color}

        ptFill     : ToolWindow.Caption := (ppLoadStr(482)); {Fill Color}

        ptLine     : ToolWindow.Caption := (ppLoadStr(483)); {Line Color}

      end;

    end;

end;  {procedure, SetLanguageIndex}


{******************************************************************************
 *
 **  F o n t C o  m b o B o x
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFontComboBox.Create}

constructor TppFontComboBox.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FPrinterName := '';

  FCurrentFont := TFont.Create;
  FFontList := nil;

  FTrueTypeGraphic    := TBitmap.Create;
  FPrinterGraphic     := TBitmap.Create;
  FSelPrinterGraphic  := TBitmap.Create;
  FSelTrueTypeGraphic := TBitmap.Create;

  InitializeFontGraphics;

  Style := csOwnerDrawVariable;
  Sorted := True;

  {attache event handlers}
  OnDrawItem    := DrawItemEvent;
  OnDropDown    := DropDownEvent;
  OnMeasureItem := MeasureItemEvent;


end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppFontComboBox.Destroy}

destructor TppFontComboBox.Destroy;
begin

  FCurrentFont.Free;
  FFontList.Free;

  FTrueTypeGraphic.Free;
  FSelTrueTypeGraphic.Free;
  FPrinterGraphic.Free;
  FSelPrinterGraphic.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppFontComboBox.InitializeFontGraphics }

procedure TppFontComboBox.InitializeFontGraphics;
begin

  {create true type font graphics (normal and selected}
  FTrueTypeGraphic.Handle    := ppBitmapFromResource('PPTRUETYPEFONT');
  FSelTrueTypeGraphic.Handle := ppBitmapFromResource('PPTRUETYPEFONT');

  {fill white space in bitmap with the Window's Highlight color}
  FSelTrueTypeGraphic.Canvas.Brush.Color := clHighlight;
  FSelTrueTypeGraphic.Canvas.Brush.Style := bsSolid;
  FSelTrueTypeGraphic.Canvas.FloodFill(0,0,clWhite,fsSurface);
  FSelTrueTypeGraphic.Canvas.FloodFill(7,7,clWhite,fsSurface);
  FSelTrueTypeGraphic.Canvas.FloodFill(6,2,clWhite,fsSurface);


  {create printer font graphics (normal and selected) }
  FPrinterGraphic.Handle    := ppBitmapFromResource('PPPRINTERFONT');
  FSelPrinterGraphic.Handle := ppBitmapFromResource('PPPRINTERFONT');

  {fill white space in bitmap with the Window's Highlight color}
  FSelPrinterGraphic.Canvas.Brush.Color := clHighlight;
  FSelPrinterGraphic.Canvas.Brush.Style := bsSolid;
  FSelPrinterGraphic.Canvas.FloodFill(0,0,clWhite,fsSurface);

end; {procedure, InitializeFontGraphics}


{------------------------------------------------------------------------------}
{ TppFontComboBox.BuildFontList}

procedure TppFontComboBox.BuildFontList;
var
  lbValidPrinter: Boolean;
  lPrinter: TppPrinter;
  lDC: HDC;

begin

  lPrinter := GetPrinter;

  lbValidPrinter := (lPrinter <> nil) and (lPrinter.DC <> 0);

  if (lbValidPrinter) then
    begin
      if (FPrinterName = lPrinter.PrinterDescription) and (Items.Count > 0) then Exit;
      FPrinterName := lPrinter.PrinterDescription;
      lDC := lPrinter.DC

    end
  else
    begin
      if Items.Count > 0 then Exit;
      lDC := 0;
    end;

  {free the old font list}
  if (FFontList <> nil) then
    FFontList.Free;

  {create new font list}
  FFontList := TppFontList.CreateList(lDC);

  Items.Assign(FFontList);

  ItemIndex := Items.IndexOf(Text);


end; {procedure, BuildFontList}

{------------------------------------------------------------------------------}
{ TppFontComboBox.GetPrinter}

function TppFontComboBox.GetPrinter: TppPrinter;
begin

  Result := nil;

  if Assigned(FOnGetPrinter) then
    FOnGetPrinter(Self, Result);

end; {function, GetPrinter}

{------------------------------------------------------------------------------}
{ TppFontComboBox.GetFontName}

function TppFontComboBox.GetFontName: String;
begin
  if (Items.Count = 0) then
    BuildFontList;

  Result := Text

end; {function, GetFontName}

{------------------------------------------------------------------------------}
{ TppFontComboBox.SetFontName}

procedure TppFontComboBox.SetCurrentFont(aFont: TFont);
begin
  BuildFontList;

  FCurrentFont.Assign(aFont);

end; {procedure, SetCurrentFont}


{------------------------------------------------------------------------------}
{ TppFontComboBox.GetCurrentFont}

function TppFontComboBox.GetCurrentFont: TFont;
begin

  BuildFontList;

  if (ItemIndex >= 0) and (ItemIndex < FFontList.Count) then
    FCurrentFont.CharSet := FFontList.FontInfo[ItemIndex].CharSet;

  FCurrentFont.Name := Text;

  Result := FCurrentFont;

end; {function, GetFontName}



{------------------------------------------------------------------------------}
{ TppFontComboBox.SetFontName}

procedure TppFontComboBox.SetFontName(aFontName: String);
var
  liIndex: Integer;

begin

  BuildFontList;

  liIndex := Items.IndexOf(aFontName);

  if liIndex >= 0 then
   ItemIndex := liIndex;

  Text := aFontName;


end; {procedure, SetFontName}

{------------------------------------------------------------------------------}
{ TppFontComboBox.DrawItemEvent}

procedure TppFontComboBox.DrawItemEvent(Control: TWinControl; Index: Integer;
                                      Rect: TRect; State: TOwnerDrawState);
var
  liOffset: Byte;
  liFontType: Byte;
  llDeviceFont: Boolean;
  llTrueTypeFont: Boolean;
  lBitmap: TBitmap;

begin

  {clear drawing area}
  Canvas.FillRect(Rect);

  if (Index >= 0) and (Index < FFontList.Count) then
    liFontType := FFontList.FontInfo[Index].FontType
  else
    liFontType := 0;

  llDeviceFont   := (liFontType and TMPF_DEVICE)   > 0;
  llTrueTypeFont := (liFontType and TMPF_TRUETYPE) > 0;


  lBitmap := nil;

  {draw bitmap}
  if DroppedDown then
    begin

      if llTrueTypeFont and (odSelected in State) then
        lBitmap := FSelTrueTypeGraphic

      else if llTrueTypeFont and not (odSelected in State) then
        lBitmap := FTrueTypeGraphic

      else if llDeviceFont and (odSelected in State) then
        lBitmap := FSelPrinterGraphic

      else if llDeviceFont and not (odSelected in State) then
        lBitmap := FPrinterGraphic;

      if lBitmap <> nil  then
        Canvas.Draw(Rect.Left + 1, Rect.Top, lBitmap);

    end;

  {draw text}
  if DroppedDown then
    liOffset := FTrueTypeGraphic.Width + 3
  else
    liOffset := 1;

  Canvas.TextOut(Rect.Left + liOffset, Rect.Top, Items[Index]);

end; {procedure, DrawItemEvent}


{------------------------------------------------------------------------------}
{ TppFontComboBox.DropDownEvent}

procedure TppFontComboBox.DropDownEvent(Sender: TObject);
begin
  BuildFontList;

end; {procedure, DropDownEvent}


{------------------------------------------------------------------------------}
{ TppFontComboBox.MeasureItemEvent}

procedure TppFontComboBox.MeasureItemEvent(Control: TWinControl; Index: Integer; var Height: Integer);
begin
 {adjust height of list box for large fonts}
  Height := Trunc(Screen.PixelsPerInch * 0.15625);

end;


{******************************************************************************
 *
 **  A l i g n T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAlignToolbar.Create}

constructor TppAlignToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FOnButtonClick := nil;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppAlignToolbar.CreateControls}

procedure TppAlignToolbar.CreateControls;
var
  liButton: Integer;
  lButton: TppToolbarButton;
  lSeparator: TppToolbarSeparator;
  
begin

  BeginUpdate;

  Caption := ppLoadStr(484); {'Align or Space'}

  for liButton := 0 to 9 do
    begin

      lButton := TppToolbarButton.Create(nil);
      lButton.Tag        := liButton;
      lButton.OnClick    := ButtonClickEvent;
      AddControl(lButton);

      {load button glyph}
      lButton.ImageIndex := ToolImageList.AddTool(cAlignResNames[liButton]);

      lButton.Hint := ppLoadStr(cAlignHints[liButton]);

      if (liButton = 2) or (liButton = 5) or (liButton = 7) then
        begin
          lSeparator := TppToolbarSeparator.Create(Owner);
          AddControl(lSeparator);
        end;


    end;

  EndUpdate;


end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TppAlignToolbar.ButtonClickEvent}

procedure TppAlignToolbar.ButtonClickEvent(Sender: TObject);
var
  liEnumValue: Integer;
begin

  liEnumValue := TComponent(Sender).Tag;

  FAlignType := TppAlignType(liEnumValue);

  if Assigned(FOnButtonClick) then FOnButtonClick(Sender);

end; {procedure, ButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppAlignToolbar.SetLanguageIndex}

procedure TppAlignToolbar.SetLanguageIndex(aLanguageIndex: Longint);
var
  liControl: Integer;
  lButton: TppToolbarButton;
  liHint: Integer;
begin

  inherited SetLanguageIndex(aLanguageIndex);


  Caption := ppLoadStr(484); {'Align or Space'}

  for liControl := 0 to ControlCount-1 do

    if Controls[liControl] is TppToolbarButton then
      begin

        lButton := TppToolbarButton(Controls[liControl]);
        liHint := lButton.Tag;
        lButton.Hint := ppLoadStr(cAlignHints[liHint]);

      end;


end; {procedure, SetLanguageIndex}



{******************************************************************************
 *
 **  S i z e T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSizeToolbar.Create}

constructor TppSizeToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FOnButtonClick := nil;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppSizeToolbar.CreateControls}

procedure TppSizeToolbar.CreateControls;
var
  liButton: Integer;
  lButton: TppToolbarButton;
  lSeparator: TppToolbarSeparator;
  
begin

  BeginUpdate;

  Caption := ppLoadStr(485); {'Size'}

  for liButton := 0 to High(cSizeResNames) do
    begin

      lButton := TppToolbarButton.Create(nil);
      lButton.Tag        := liButton;
      lButton.OnClick    := ButtonClickEvent;
      AddControl(lButton);

      {load button glyph}
      lButton.ImageIndex := ToolImageList.AddTool(cSizeResNames[liButton]);

      lButton.Hint := ppLoadStr(cSizeHints[liButton]);

      {add a separator after the second button}
      if (liButton = 1) then
        begin
          lSeparator := TppToolbarSeparator.Create(Owner);
          AddControl(lSeparator);
        end;


    end;


  EndUpdate;


end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppSizeToolbar.ButtonClickEvent}

procedure TppSizeToolbar.ButtonClickEvent(Sender: TObject);
var
  liEnumValue: Integer;
begin
  liEnumValue := TComponent(Sender).Tag;
  
  FSizeType := TppSizeType(liEnumValue);

  if Assigned(FOnButtonClick) then FOnButtonClick(Sender);

end; {procedure, ButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppSizeToolbar.SetLanguageIndex}

procedure TppSizeToolbar.SetLanguageIndex(aLanguageIndex: Longint);
var
  liControl: Integer;
  lButton: TppToolbarButton;
  liHint: Integer;

begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption := ppLoadStr(485); {'Size'}

  for liControl := 0 to ControlCount-1 do
  
    if Controls[liControl] is TppToolbarButton then
      begin

        lButton := TppToolbarButton(Controls[liControl]);
        liHint := lButton.Tag;
        lButton.Hint := ppLoadStr(cSizeHints[liHint]);

      end;


end; {procedure, SetLanguageIndex}





{******************************************************************************
 *
 **  N u d g e T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppNudgeToolbar.Create}

constructor TppNudgeToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FOnButtonClick := nil;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppNudgeToolbar.CreateControls}

procedure TppNudgeToolbar.CreateControls;
var
  liButton: Integer;
  lButton: TppToolbarButton;
  lSeparator: TppToolbarSeparator;
  
begin
  Caption := ppLoadStr(486); {'Nudge'}

  BeginUpdate;

  for liButton := 0 to High(cNudgeResNames) do
    begin

      lButton := TppToolbarButton.Create(nil);
      lButton.Tag        := liButton;
      lButton.OnClick    := ButtonClickEvent;
      AddControl(lButton);

      {load button glyph}
      lButton.ImageIndex := ToolImageList.AddTool(cNudgeResNames[liButton]);

      lButton.Hint := ppLoadStr(cNudgeHints[liButton]);

      {add a separator after the second button}
      if (liButton = 1) then
        begin
          lSeparator := TppToolbarSeparator.Create(Owner);
          AddControl(lSeparator);
        end;


    end;


  EndUpdate;

end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppNudgeToolbar.ButtonClickEvent}

procedure TppNudgeToolbar.ButtonClickEvent(Sender: TObject);
var
  liEnumValue: Integer;
begin

  liEnumValue := TComponent(Sender).Tag;

  FDirectionType := TppDirectionType(liEnumValue);

  if Assigned(FOnButtonClick) then FOnButtonClick(Sender);

end; {procedure, ButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppNudgeToolbar.SetLanguageIndex}

procedure TppNudgeToolbar.SetLanguageIndex(aLanguageIndex: Longint);
var
  liControl: Integer;
  lButton: TppToolbarButton;
  liHint: Integer;

begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption := ppLoadStr(486); {'Nudge'}

  for liControl := 0 to ControlCount-1 do
  
    if Controls[liControl] is TppToolbarButton then
      begin

        lButton := TppToolbarButton(Controls[liControl]);
        liHint := lButton.Tag;
        lButton.Hint := ppLoadStr(cNudgeHints[liHint]);

      end;

end; {procedure, SetLanguageIndex}


{******************************************************************************
 *
 **  D r a w T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawToolbar.Create}

constructor TppDrawToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppDrawToolbar.CreateControls}

procedure TppDrawToolbar.CreateControls;
begin

  BeginUpdate;

  FFillColorButton := TppColorButton.Create(Owner);
  AddControl(FFillColorButton);
  FFillColorButton.ColorType := ctFill;
  FFillColorButton.PaletteEnabled := False;

  FLineColorButton := TppColorButton.Create(Owner);
  AddControl(FLineColorButton);
  FLineColorButton.ColorType := ctLine;
  FLineColorButton.PaletteEnabled := False;

  FLineThicknessButton := TppLineThicknessButton.Create(Owner);
  AddControl(FLineThicknessButton);
  FLineThicknessButton.Parent := Self;
  FLineThicknessButton.PaletteEnabled := False;

  FLineStyleButton := TppLineStyleButton.Create(Owner);
  AddControl(FLineStyleButton);
  FLineStyleButton.PaletteEnabled := False;
  FLineStyleButton.Left := (FLineStyleButton.Width * 3) + 1;

  {this will load the hint strings}
  SetLanguageIndex(LanguageIndex);

  EndUpdate;

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TppDrawToolbar.SetLanguageIndex}

procedure TppDrawToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption :=  ppLoadStr(487); {'Draw'}

  FFillColorButton.LanguageIndex := aLanguageIndex;
  FLineColorButton.LanguageIndex := aLanguageIndex;
  FLineThicknessButton.Hint := ppLoadStr(488);  {Line Thickness}
  FLineStyleButton.Hint     := ppLoadStr(489);  {Line Style}

end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TppDrawToolbar.LoadPreferences}

procedure TppDrawToolbar.LoadPreferences(aIniStorage: TppIniStorage);
var
  lColor: TColor;
  lbIsClear: Boolean;
begin

  inherited;

  lColor := aIniStorage.ReadInteger('Draw', 'LineColor', clWindowText);
  lbIsClear := aIniStorage.ReadBool('Draw', 'LineIsClear', False);

  LineColorButton.SetDefaultColor(lColor, lbIsClear);

  lColor := aIniStorage.ReadInteger('Draw', 'FillColor', clWhite);
  lbIsClear := aIniStorage.ReadBool('Draw', 'FillIsClear', True);

  FillColorButton.SetDefaultColor(lColor, lbIsClear);

end;

{------------------------------------------------------------------------------}
{ TppDrawToolbar.SavePreferences}

procedure TppDrawToolbar.SavePreferences(aIniStorage: TppIniStorage);
var
  lColor: TColor;
  lbIsClear: Boolean;
begin

  inherited;

  LineColorButton.GetDefaultColor(lColor, lbIsClear);

  aIniStorage.WriteInteger('Draw', 'LineColor', lColor);
  aIniStorage.WriteBool('Draw', 'LineIsClear', lbIsClear);

  FillColorButton.GetDefaultColor(lColor, lbIsClear);

  aIniStorage.WriteInteger('Draw', 'FillColor', lColor);
  aIniStorage.WriteBool('Draw', 'FillIsClear', lbIsClear);

end;


{******************************************************************************
 *
 **  E d i t T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppEditToolbar.Create}

constructor TppEditToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FEnabledControl := nil;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppEditToolbar.CreateControls}

procedure TppEditToolbar.CreateControls;
begin

  BeginUpdate;

  FPanel := TPanel.Create(Owner);
  FPanel.Width   := 200;
  FPanel.Visible := True;
  FPanel.BevelOuter := bvNone;
  AddControl(FPanel);

  FEditBox := TEdit.Create(Owner);
  FEditBox.Width   := 200;
  FEditBox.Color   := clBtnFace;
  FEditBox.Visible := True;
  FEditBox.Parent  := FPanel;
  FEditBox.Enabled := False;

  FPanel.Height  := FEditBox.Height;

  FComboBox2 := TComboBox.Create(Owner);
  FComboBox2.Left  := 0;
  FComboBox2.Width := 150;
  FComboBox2.DropDownCount := 10;
  FComboBox2.Style := csDropDownList;
  AddControl(FComboBox2);

  FComboBox2.Visible := False;

  FComboBox := TComboBox.Create(Owner);
  FComboBox.Width   := 200;
  FComboBox.DropDownCount := 10;
  FComboBox.Style := csDropDownList;
  FComboBox.Parent := FPanel;

  FComboBox.Visible := False;

  FPanel.Left := FComboBox2.Left + FComboBox2.Width;


  {this will load the hint strings}
  SetLanguageIndex(LanguageIndex);

  EndUpdate;


end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TppEditToolbar.EnableControl}

procedure TppEditToolbar.EnableControl(aControl: TControl);
begin

//  BeginUpdate;

  if (FEnabledControl = aControl) then Exit;

  FEnabledControl := aControl;

  if (aControl = nil) then
    begin
      FComboBox.Visible := False;
      FComboBox2.Visible := False;

      FEditBox.Clear;
      FEditBox.Enabled  := False;
      FEditBox.Color    := clBtnFace;
      FEditBox.Visible  := True;

    end
  else if (aControl = FEditBox) then
    begin
      FComboBox.Visible := False;
      FComboBox2.Visible := False;

      FEditBox.Enabled  := True;
      FEditBox.Color    := clWindow;
      FEditBox.Visible  := True;

    end
  else if (aControl = FComboBox) then
    begin
      FEditBox.Visible   := False;
      FComboBox.Visible  := True;
      FComboBox2.Visible := False;

    end
  else if (aControl = FComboBox2) then
    begin
      FEditBox.Visible   := False;
      FComboBox2.Visible := True;
      FComboBox.Visible  := True;

      FPanel.Left := FComboBox2.Left + FComboBox2.Width;

    end;


//  EndUpdate;

end; {procedure, EnableControl}


{------------------------------------------------------------------------------}
{ TppEditToolbar.SetLanguageIndex}

procedure TppEditToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption :=  ppLoadStr(264); {'Edit'}

end; {procedure, SetLanguageIndex}



{******************************************************************************
 *
 **  C u s t o m F o r m a t T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.Create}

constructor TppCustomFormatToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FFont := TFont.Create;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.Destroy}

destructor TppCustomFormatToolbar.Destroy;
begin

  FFont.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.CreateControls}

procedure TppCustomFormatToolbar.CreateControls;
var
  lSeparator: TppToolbarSeparator;
  liFontSize: Integer;

begin

  BeginUpdate;

  FFontComboBox := TppFontComboBox.Create(Owner);
  AddControl(FFontComboBox);
  FFontComboBox.Width := 148;
  FFontComboBox.FontName := 'Arial';

  FFontSizeComboBox := TComboBox.Create(Owner);
  AddControl(FFontSizeComboBox);
  FFontSizeComboBox.Width  := 51;
  FFontSizeComboBox.Style := csDropDown;
  FFontSizeComboBox.Text := '10';


  for liFontSize := 0 to High(cFontSizes) do
    FFontSizeComboBox.Items.Add(IntToStr(cFontSizes[liFontSize]));

  lSeparator := TppToolbarSeparator.Create(Owner);
  AddControl(lSeparator);

  FBoldButton := TppToolbarButton.Create(Owner);
  FBoldButton.Style := tbsCheck;
  FBoldButton.AllowAllUp := True;
  FBoldButton.ImageIndex := ToolImageList.AddTool('PPBOLD');
  AddControl(FBoldButton);

  FItalicButton := TppToolbarButton.Create(Owner);
  FItalicButton.Style := tbsCheck;
  FItalicButton.AllowAllUp := True;
  FItalicButton.ImageIndex := ToolImageList.AddTool('PPITALIC');
  AddControl(FItalicButton);

  FUnderlineButton := TppToolbarButton.Create(Owner);
  FUnderlineButton.Style := tbsCheck;
  FUnderlineButton.AllowAllUp := True;
  FUnderlineButton.ImageIndex := ToolImageList.AddTool('PPUNDERLINE');
  AddControl(FUnderlineButton);

  lSeparator := TppToolbarSeparator.Create(Owner);
  AddControl(lSeparator);

  FAlignLeftButton := TppToolbarButton.Create(Owner);
  FAlignLeftButton.Style := tbsCheck;
  FAlignLeftButton.Grouped := True;
  FAlignLeftButton.ImageIndex := ToolImageList.AddTool('PPALIGNLEFT');
  AddControl(FAlignLeftButton);

  FCenterButton := TppToolbarButton.Create(Owner);
  FCenterButton.Style := tbsCheck;
  FCenterButton.Grouped := True;
  FCenterButton.ImageIndex := ToolImageList.AddTool('PPALIGNCENTER');
  AddControl(FCenterButton);

  FAlignRightButton := TppToolbarButton.Create(Owner);
  FAlignRightButton.Style := tbsCheck;
  FAlignRightButton.Grouped := True;
  FAlignRightButton.ImageIndex := ToolImageList.AddTool('PPALIGNRIGHT');
  AddControl(FAlignRightButton);

  FFullJustifyButton := TppToolbarButton.Create(Owner);
  FFullJustifyButton.Style := tbsCheck;
  FFullJustifyButton.Grouped := True;
  FFullJustifyButton.ImageIndex := ToolImageList.AddTool('PPFULLJUSTIFY');
  AddControl(FFullJustifyButton);
  FFullJustifyButton.Enabled := False;

  lSeparator := TppToolbarSeparator.Create(Owner);
  AddControl(lSeparator);

  FFontColorButton := TppColorButton.Create(Owner);
  FFontColorButton.ColorType := ctFont;
  FFontColorButton.PaletteEnabled := False;
  AddControl(FFontColorButton);

  FHighlightColorButton := TppColorButton.Create(Owner);
  FHighlightColorButton.ColorType := ctHighlight;
  FHighlightColorButton.PaletteEnabled := False;
  AddControl(FHighlightColorButton);

  {this will load the hint strings}
  SetLanguageIndex(LanguageIndex);

  EndUpdate;

end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.GetAlignment}

function TppCustomFormatToolbar.GetAlignment: TAlignment;
begin

  if FAlignRightButton.Down then
    Result := taRightJustify

  else if FCenterButton.Down then
     Result := taCenter

  else
    Result := taLeftJustify;

end; {function, GetAlignment}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.GetFont}

function TppCustomFormatToolbar.GetFont: TFont;
var
  lbIsClear: Boolean;
  lColor: TColor;
  
begin

  {get name and size}
  FFont.Name := FFontComboBox.Text;
  FFont.Size := StrToInt(FFontSizeComboBox.Text);

  {get style}
  if FBoldButton.Down then
    FFont.Style := FFont.Style + [fsBold]
  else
    FFont.Style := FFont.Style - [fsBold];

  if FItalicButton.Down then
    FFont.Style := FFont.Style + [fsItalic]
  else
    FFont.Style := FFont.Style - [fsItalic];


  if FUnderlineButton.Down then
    FFont.Style := FFont.Style + [fsUnderline]
  else
    FFont.Style := FFont.Style - [fsUnderline];

  {get color}
  FFontColorButton.GetDefaultColor(lColor, lbIsClear);
  FFont.Color := lColor;

  Result := FFont;

end; {function, GetFont}

{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.GetTextAlignment}

function TppCustomFormatToolbar.GetTextAlignment: TppTextAlignment;
begin

  if FAlignRightButton.Down then
    Result := taRightJustified

  else if FCenterButton.Down then
    Result := taCentered

  else if FFullJustifyButton.Down then
    Result := taFullJustified

  else
    Result := taLeftJustified;

end; {function, GetTextAlignment}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.SetAlignment}

procedure TppCustomFormatToolbar.SetAlignment(aAlignment: TAlignment);
begin

  FAlignLeftButton.Down  := (aAlignment = taLeftJustify);
  FAlignRightButton.Down := (aAlignment = taRightJustify);
  FCenterButton.Down     := (aAlignment = taCenter);

end; {procedure, SetAlignment}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.SetFont}

procedure TppCustomFormatToolbar.SetFont(aFont: TFont);
begin

  {set name and size}
  FFontComboBox.FontName := aFont.Name;


  FFontSizeComboBox.Text := IntToStr(aFont.Size);

  {set style}
  FBoldButton.Down      := (fsBold      in  aFont.Style);
  FItalicButton.Down    := (fsItalic    in  aFont.Style);
  FUnderlineButton.Down := (fsUnderline in  aFont.Style);

  {set color}
  FFontColorButton.SetPaletteColor(aFont.Color, False);


end; {procedure, SetFont}

{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.SetTextAlignment}

procedure TppCustomFormatToolbar.SetTextAlignment(
  aTextAlignment: TppTextAlignment);
begin

  FAlignLeftButton.Down := (aTextAlignment = taLeftJustified);
  FAlignRightButton.Down := (aTextAlignment = taRightJustified);
  FCenterButton.Down := (aTextAlignment = taCentered);
  FFullJustifyButton.Down := (aTextAlignment = taFullJustified);

end; {procedure, SetTextAlignment}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.SetHighlightColor}

procedure TppCustomFormatToolbar.SetHighlightColor(aColor: TColor; aIsClear: Boolean);
begin

  {set color}
  FHighlightColorButton.SetPaletteColor(aColor, aIsClear);

end; {procedure, SetHighlightColor}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.SetLanguageIndex}

procedure TppCustomFormatToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption :=  ppLoadStr(200); {'Format'}

  FFontComboBox.Hint     := ppLoadStr(168);  {Font}
  FFontSizeComboBox.Hint := ppLoadStr(169);  {Font Size}

  if FFontNameButton <> nil then
    FFontNameButton.Hint   :=  ppLoadStr(168); {Font}

  if FFontSizeButton <> nil then
    FFontSizeButton.Hint   :=  ppLoadStr(169); {Font Size}

  FBoldButton.Hint       := ppLoadStr(160); {Bold}
  FItalicButton.Hint     := ppLoadStr(171); {Italic}
  FUnderlineButton.Hint  := ppLoadStr(179); {Underline}

  FAlignLeftButton.Hint  := ppLoadStr(173); {Left Justify}
  FCenterButton.Hint     := ppLoadStr(229); {Center}
  FAlignRightButton.Hint := ppLoadStr(176); {Right Justify}
  FFullJustifyButton.Hint := ppLoadStr(1125); {Full Justify}

  FFontColorButton.LanguageIndex      := aLanguageIndex;
  FHighlightColorButton.LanguageIndex := aLanguageIndex;

end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TppFormatToolbar.LoadPreferences}

procedure TppFormatToolbar.LoadPreferences(aIniStorage: TppIniStorage);
var
  lColor: TColor;
  lbIsClear: Boolean;
  lsFontName: String;
  liFontSize: Integer;
begin

  inherited;

  lColor    := aIniStorage.ReadInteger('Format', 'FontColor', clWindowText);
  lbIsClear := aIniStorage.ReadBool('Format', 'FontIsClear', False);

  FontColorButton.SetDefaultColor(lColor, lbIsClear);

  lColor    := aIniStorage.ReadInteger('Format', 'HighlightColor', clWhite);
  lbIsClear := aIniStorage.ReadBool('Format', 'HighlightIsClear', True);

  HighlightColorButton.SetDefaultColor(lColor, lbIsClear);

  lsFontName := aIniStorage.ReadString('Format', 'DefaultFontName', 'Arial');
  liFontSize := aIniStorage.ReadInteger('Format', 'DefaultFontSize', 10);

  FFontComboBox.FontName := lsFontName;
  FFontSizeComboBox.Text := IntToStr(liFontSize);

end;

{------------------------------------------------------------------------------}
{ TppFormatToolbar.SetLanguageIndex}

procedure TppFormatToolbar.SavePreferences(aIniStorage: TppIniStorage);
var
  lColor: TColor;
  lbIsClear: Boolean;
begin

  inherited;

  FontColorButton.GetDefaultColor(lColor, lbIsClear);

  aIniStorage.WriteInteger('Format', 'FontColor', lColor);
  aIniStorage.WriteBool('Format', 'FontIsClear', lbIsClear);

  HighlightColorButton.GetDefaultColor(lColor, lbIsClear);

  aIniStorage.WriteInteger('Format', 'HighlightColor', lColor);
  aIniStorage.WriteBool('Format', 'HighlightIsClear', lbIsClear);

end;

{******************************************************************************
 *
 **  F o r m a t T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFormatToolbar.Create}

constructor TppFormatToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);


end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppFormatToolbar.CreateControls}

procedure TppFormatToolbar.CreateControls;
var
  lSeparator: TppToolbarSeparator;

begin
  BeginUpdate;

  inherited CreateControls;

  lSeparator := TppToolbarSeparator.Create(Owner);
  AddControl(lSeparator);

  FAnchorsButton := TppAnchorsButton.Create(Owner);
  AddControl(FAnchorsButton);
  FAnchorsButton.PaletteEnabled := False;
  FAnchorsButton.ImageIndex := ToolImageList.AddTool('PPANCHORS');

  FBorderButton := TppBorderButton.Create(Owner);
  AddControl(FBorderButton);
  FBorderButton.PaletteEnabled := False;
  FBorderButton.ImageIndex := ToolImageList.AddTool('PPBORDER');

  lSeparator := TppToolbarSeparator.Create(Owner);
  AddControl(lSeparator);

  FBringToFrontButton := TppToolbarButton.Create(Owner);
  AddControl(FBringToFrontButton);
  FBringToFrontButton.ImageIndex := ToolImageList.AddTool('PPBRINGTOFRONT');

  FSendToBackButton := TppToolbarButton.Create(Owner);
  AddControl(FSendToBackButton);
  FSendToBackButton.ImageIndex := ToolImageList.AddTool('PPSENDTOBACK');

  {this will load the hint strings}
  SetLanguageIndex(LanguageIndex);

  EndUpdate;

end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppFormatToolbar.SetLanguageIndex}

procedure TppFormatToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin
  if (FBringToFrontButton) = nil then Exit;

  inherited SetLanguageIndex(aLanguageIndex);

  FBringToFrontButton.Hint   := ppLoadStr(161); {BringToFront};
  FSendToBackButton.Hint     := ppLoadStr(177); {SendToBack};
  FAnchorsButton.Hint        := ppLoadStr(1152); {Anchors}
  FBorderButton.Hint         := ppLoadStr(1153); {Border}

end; {procedure, SetLanguageIndex}




{******************************************************************************
 *
 **  S t a n d a r d T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppStandardToolbar.Create}

constructor TppStandardToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppStandardToolbar.CreateControls}

procedure TppStandardToolbar.CreateControls;
begin

  BeginUpdate;

  FFileNewButton := TppToolbarButton.Create(Owner);
  AddControl(FFileNewButton);
  FFileNewButton.ImageIndex := ToolImageList.AddTool('PPNEW');

  FFileOpenButton := TppToolbarButton.Create(Owner);
  AddControl(FFileOpenButton);
  FFileOpenButton.ImageIndex := ToolImageList.AddTool('PPOPEN');

  FFileSaveButton := TppToolbarButton.Create(Owner);
  AddControl(FFileSaveButton);
  FFileSaveButton.ImageIndex := ToolImageList.AddTool('PPSAVE');

  FSeparator1 := TppToolbarSeparator.Create(Owner);
  AddControl(FSeparator1);

  FPageSetupButton := TppToolbarButton.Create(Owner);
  AddControl(FPageSetupButton);
  FPageSetupButton.ImageIndex := ToolImageList.AddTool('PPPAGESETUP');

  FPrintButton := TppToolbarButton.Create(Owner);
  AddControl(FPrintButton);
  FPrintButton.ImageIndex := ToolImageList.AddTool('PPPRINT');

  FPrintPreviewButton := TppToolbarButton.Create(Owner);
  AddControl(FPrintPreviewButton);
  FPrintPreviewButton.ImageIndex := ToolImageList.AddTool('PPPRINTPREVIEW');

  FSeparator2 := TppToolbarSeparator.Create(Owner);
  AddControl(FSeparator2);

  FCutButton := TppToolbarButton.Create(Owner);
  AddControl(FCutButton);
  FCutButton.ImageIndex := ToolImageList.AddTool('PPCUT');

  FCopyButton := TppToolbarButton.Create(Owner);
  AddControl(FCopyButton);
  FCopyButton.ImageIndex := ToolImageList.AddTool('PPCOPY');

  FPasteButton := TppToolbarButton.Create(Owner);
  AddControl(FPasteButton);
  FPasteButton.ImageIndex := ToolImageList.AddTool('PPPASTE');

  {this will load the hint strings}
  SetLanguageIndex(LanguageIndex);

  EndUpdate;

end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppStandardToolbar.SetLanguageIndex}

procedure TppStandardToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption :=  ppLoadStr(490); {'Standard'}

  FFileNewButton.Hint      := ppLoadStr(156); {New}
  FFileOpenButton.Hint     := ppLoadStr(361); {Open}
  FFileSaveButton.Hint     := ppLoadStr(362); {Save}

  FPageSetupButton.Hint    := ppLoadStr(218); {Page Setup}
  FPrintButton.Hint        := ppLoadStr(022); {Print}
  FPrintPreviewButton.Hint := ppLoadStr(023); {Print Preview}

  FCutButton.Hint          := ppLoadStr(365); {Cut}
  FCopyButton.Hint         := ppLoadStr(366); {Copy}
  FPasteButton.Hint        := ppLoadStr(367); {Paste}

end; {procedure, SetLanguageIndex}


{******************************************************************************
 *
 **  T o o l b a r M a n a g e r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppToolbarManager.Create}

constructor TppToolbarManager.Create(aForm: TForm);
begin

  inherited Create;


  FForm := aForm;

  FComponentClasses := TStringList.Create;
  FComponentClasses.Assign(ppComponentClassList);

  ppComponentClassList.AddNotify(Self);

  FPopupMenu := TPopupMenu.Create(nil);

  FPopupMenu.OnPopup := MenuPopupEvent;

  FToolbars := TStringList.Create;

  FComponentBars        := TList.Create;
  FStandardBars         := TList.Create;
  FToolWindows          := TList.Create;
  FPaletteButtons       := TList.Create;
  FFloatingToolWindows  := TList.Create;
  FCaptionsList         := TList.Create;


  FLanguageIndex := 0;

  FPaletteButton      := nil;
  FSelectObjectButton := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppToolbarManager.Destroy}

destructor TppToolbarManager.Destroy;
begin

  ppComponentClassList.RemoveNotify(Self);

  FComponentClasses.Free;

  FreeMenuItems;

//  FreeToolbars(FStandardBars);
//  FreeToolbars(FComponentBars);
//  FreeToolbars(FToolWindows);

  FComponentBars.Free;
  FStandardBars.Free;
  FToolWindows.Free;
  FPaletteButtons.Free;
  FFloatingToolWindows.Free;
  FCaptionsList.Free;

  FPopupMenu.Free;
  FToolbars.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppToolbarManager.LoadToolPreferences}

procedure TppToolbarManager.LoadToolPreferences;
var
  lIniStorage: TppIniStorage;
begin

{$IFDEF CodeSite}
  gCodeSite.EnterMethod('TppToolbarManager.LoadToolPreferences');
{$ENDIF}

  lIniStorage := TppIniStoragePlugIn.CreateInstance;

  try
    LoadToolbarPreferences(lIniStorage);

    LoadToolWindowPreferences(lIniStorage);

    BuildFloatingToolWindowList(FFloatingToolWindows);

  finally
    lIniStorage.Free;

  end;


{$IFDEF CodeSite}
  gCodeSite.ExitMethod('TppToolbarManager.LoadToolPreferences');
{$ENDIF}

end;

{------------------------------------------------------------------------------}
{ TppToolbarManager.LoadToolbarPreferences}

procedure TppToolbarManager.LoadToolbarPreferences(aIniStorage: TppIniStorage);
var
  liIndex: Integer;
  lToolbar: TppToolbar;
  lDockSite: TWinControl;
  lsDockName: String;
  lFloatRect: TRect;
  lbVisible: Boolean;
begin

{$IFDEF CodeSite}
  gCodeSite.EnterMethod('TppToolbarManager.LoadToolbarPreferences');
{$ENDIF}

{$IFDEF CodeSite}
  gCodeSite.Send('load docking and visible info');
{$ENDIF}

  // load docking and visible info
  for liIndex := 0 to FToolbars.Count-1 do
    begin
      lToolbar := Toolbars[liIndex];

      {load whether toolbar is floating, visible}
      lsDockName := aIniStorage.ReadString(lToolbar.Name, 'DockName', lToolbar.HostDockSite.Name);
      lbVisible  := aIniStorage.ReadBool(lToolbar.Name, 'Visible', lToolbar.Visible);

      if (lsDockName = '') then
        begin
          lFloatRect.Left := aIniStorage.ReadInteger(lToolbar.Name, 'FloatLeft', 0);
          lFloatRect.Top := aIniStorage.ReadInteger(lToolbar.Name, 'FloatTop', 0);
          lFloatRect.Right := lFloatRect.Left + lToolbar.Width;
          lFloatRect.Bottom := lFloatRect.Top + lToolbar.Height;
//          lFloatRect.Right := aIniStorage.ReadInteger(lToolbar.Name, 'FloatRight', lToolbar.Width);
//          lFloatRect.Bottom := aIniStorage.ReadInteger(lToolbar.Name, 'FloatBottom', lToolbar.Height);

{$IFDEF CodeSite}
  gCodeSite.Send('manual float: ' + lToolbar.Name);
{$ENDIF}
          if lbVisible then
            lToolbar.ManualFloat(lFloatRect)
          else
            begin
              lToolbar.Visible := False;
              lToolbar.SetBounds(lFloatRect.Left, lFloatRect.Top, lFloatRect.Right - lFloatRect.Left,lFloatRect.Bottom - lFloatRect.Top);
            end;
        end
      else
        begin
{$IFDEF CodeSite}
  gCodeSite.Send('manual dock: ' + lToolbar.Name);
{$ENDIF}
          lDockSite := FindDock(lsDockName);
          if lDockSite <> nil then
            lToolbar.ManualDock(lDockSite);
        end;

      lToolbar.Visible := lbVisible;

    end;


{$IFDEF CodeSite}
  gCodeSite.Send('load toolbar preferences');
{$ENDIF}

  // do this twice, so it can try to arrange the toolbars properly
  for liIndex := 0 to FToolbars.Count-1 do
    Toolbars[liIndex].LoadPreferences(aIniStorage);
  for liIndex := 0 to FToolbars.Count-1 do
    Toolbars[liIndex].LoadPreferences(aIniStorage);


{$IFDEF CodeSite}
  gCodeSite.ExitMethod('TppToolbarManager.LoadToolbarPreferences');
{$ENDIF}

end;

{------------------------------------------------------------------------------}
{ TppToolbarManager.LoadToolWindowPreferences}

procedure TppToolbarManager.LoadToolWindowPreferences(aIniStorage: TppIniStorage);
var
  liIndex: Integer;
  lToolWindow: TppToolWindow;
  lsDockName: String;
  lbVisible: Boolean;
  lFloatRect: TRect;
  lDockSite: TWinControl;
begin

{$IFDEF CodeSite}
  gCodeSite.EnterMethod('TppToolbarManager.LoadToolWindowPreferences');
{$ENDIF}

{$IFDEF CodeSite}
  gCodeSite.Send('load tool window preferences');
{$ENDIF}

  for liIndex := 0 to FToolWindows.Count-1 do
    TppToolWindow(FToolWindows[liIndex]).LoadPreferences(aIniStorage);


//TODO  ExceptionUtils.IgnoreExceptions(True);

  try

  // load docking and visible info
  for liIndex := 0 to FToolWindows.Count-1 do
    begin
      lToolWindow := TppToolWindow(FToolWindows[liIndex]);

      {load whether toolbar is floating, visible}
      lsDockName := aIniStorage.ReadString(lToolWindow.Name, 'DockName', '');
      lbVisible  := aIniStorage.ReadBool(lToolWindow.Name, 'Visible', lToolWindow.Visible);

      if (lsDockName = '') then
        begin
          lFloatRect.Left := aIniStorage.ReadInteger(lToolWindow.Name, 'FloatLeft', 0);
          lFloatRect.Top := aIniStorage.ReadInteger(lToolWindow.Name, 'FloatTop', 0);
          lFloatRect.Right := aIniStorage.ReadInteger(lToolWindow.Name, 'FloatRight', lToolWindow.Width);
          lFloatRect.Bottom := aIniStorage.ReadInteger(lToolWindow.Name, 'FloatBottom', lToolWindow.Height);
{debug          lFloatRect.Left := 0;
          lFloatRect.Top := 0;
          lFloatRect.Right := 100;
          lFloatRect.Bottom := 100; }

{$IFDEF CodeSite}
  gCodeSite.Send('manual float: ' + lToolWindow.Name);
{$ENDIF}
          lToolWindow.ManualFloat(lFloatRect);

{$IFDEF CodeSite}
  gCodeSite.Send('set visibility: ' + lToolWindow.Name);
{$ENDIF}
          lToolWindow.Visible := lbVisible;
        end
      else
        begin
          // ManualDock method will not work correctly align a tool window
          // vertically unless it is visible. To prevent flashing, move
          // off screen prior to setting visible to true

          lToolWindow.Left := -60000;
          lToolWindow.Top := -60000;
          lToolWindow.Visible := True;

{$IFDEF CodeSite}
  gCodeSite.Send('manual dock: ' + lToolWindow.Name);
{$ENDIF}
          lDockSite := FindDock(lsDockName);

          if (lDockSite <> nil) then
            begin
              if lDockSite.DockClientCount = 0 then
                lToolWindow.ManualDock(lDockSite, nil, alNone)
              else
                lToolWindow.ManualDock(lDockSite, nil, alBottom);
           end;

{$IFDEF CodeSite}
  gCodeSite.Send('set visibility: ' + lToolWindow.Name);
{$ENDIF}
          lToolWindow.Visible := lbVisible;

        end;

    end;

  finally
//TODO    ExceptionUtils.IgnoreExceptions(False);

  end;

{$IFDEF CodeSite}
  gCodeSite.ExitMethod('TppToolbarManager.LoadToolWindowPreferences');
{$ENDIF}

end; {procedure, LoadToolWindowPreferences}

{------------------------------------------------------------------------------}
{ TppToolbarManager.SaveToolPreferences}

procedure TppToolbarManager.SaveToolPreferences;
var
  lIniStorage: TppIniStorage;
begin

  lIniStorage := TppIniStoragePlugIn.CreateInstance;

  try
    SaveToolbarPreferences(lIniStorage);

    SaveToolWindowPreferences(lIniStorage);

  finally
    lIniStorage.Free;

  end;

end;

{------------------------------------------------------------------------------}
{ TppToolbarManager.SaveToolbarPreferences}

procedure TppToolbarManager.SaveToolbarPreferences(aIniStorage: TppIniStorage);
var
  liIndex: Integer;
  lToolbar: TppToolbar;
  lDockSite: TWinControl;
begin

  for liIndex := 0 to FToolbars.Count-1 do
    Toolbars[liIndex].SavePreferences(aIniStorage);

  // save docking and visible info
  for liIndex := 0 to FToolbars.Count-1 do
    begin
      lToolbar := Toolbars[liIndex];

      if lToolbar.Floating then
        aIniStorage.WriteString(lToolbar.Name, 'DockName', '')
      else
        aIniStorage.WriteString(lToolbar.Name, 'DockName', lToolbar.HostDockSite.Name);

      aIniStorage.WriteBool(lToolbar.Name, 'Visible', lToolbar.Visible);

      if (lToolbar.Floating) then
        begin
          lDockSite := lToolbar.HostDockSite;
          aIniStorage.WriteInteger(lToolbar.Name, 'FloatLeft', lDockSite.Left);
          aIniStorage.WriteInteger(lToolbar.Name, 'FloatTop', lDockSite.Top);
          aIniStorage.WriteInteger(lToolbar.Name, 'FloatRight', lDockSite.Left + lDockSite.Width);
          aIniStorage.WriteInteger(lToolbar.Name, 'FloatBottom', lDockSite.Top + lDockSite.Height);
         end
      else
        begin
          aIniStorage.WriteInteger(lToolbar.Name, 'FloatLeft', lToolbar.Left);
          aIniStorage.WriteInteger(lToolbar.Name, 'FloatTop', lToolbar.Top);
          aIniStorage.WriteInteger(lToolbar.Name, 'FloatRight', lToolbar.Left + lToolbar.UnDockWidth);
          aIniStorage.WriteInteger(lToolbar.Name, 'FloatBottom', lToolbar.Top + lToolbar.UnDockHeight);
        end;

    end;

end;  {procedure, SaveToolbarPreferences}

{------------------------------------------------------------------------------}
{ TppToolbarManager.SaveToolWindowPreferences}

procedure TppToolbarManager.SaveToolWindowPreferences(aIniStorage: TppIniStorage);
var
  liIndex: Integer;
  lToolWindow: TppToolWindow;
begin

  for liIndex := 0 to FToolWindows.Count-1 do
    TppToolWindow(FToolWindows[liIndex]).SavePreferences(aIniStorage);

  // save docking and visible info
  for liIndex := 0 to FToolWindows.Count-1 do
    begin
      lToolWindow := TppToolWindow(FToolWindows[liIndex]);

      if lToolWindow.Floating then
        aIniStorage.WriteString(lToolWindow.Name, 'DockName', '')
      else
        aIniStorage.WriteString(lToolWindow.Name, 'DockName', lToolWindow.HostDockSite.Name);

      aIniStorage.WriteBool(lToolWindow.Name, 'Visible', lToolWindow.Visible);

      if (lToolWindow.Floating) then
        begin
          aIniStorage.WriteInteger(lToolWindow.Name, 'FloatLeft', lToolWindow.Left);
          aIniStorage.WriteInteger(lToolWindow.Name, 'FloatTop', lToolWindow.Top);
          aIniStorage.WriteInteger(lToolWindow.Name, 'FloatRight', lToolWindow.Left + lToolWindow.Width);
          aIniStorage.WriteInteger(lToolWindow.Name, 'FloatBottom', lToolWindow.Top + lToolWindow.Height);
         end;

    end;

end;  {procedure, SaveToolWindowPreferences}

{------------------------------------------------------------------------------}
{ TppToolbarManager.FreeToolbars}

procedure TppToolbarManager.FreeToolbars(aList: TList);
var
  liToolbar: Integer;

begin

  for liToolbar := aList.Count-1 downto 0 do
    TObject(aList[liToolbar]).Free;

  aList.Clear;

end; {procedure, FreeToolbars}



{------------------------------------------------------------------------------}
{ TppToolbarManager.FreeMenuItems}

procedure TppToolbarManager.FreeMenuItems;
var
  liItem: Integer;

begin
  for liItem := FPopupMenu.Items.Count-1 downto 0 do
    TObject(FPopupMenu.Items[liItem]).Free;

end; {procedure, FreeMenuItems}


{------------------------------------------------------------------------------}
{ TppToolbarManager.Initialize}

procedure TppToolbarManager.Initialize(aTopDock, aBottomDock, aLeftDock, aRightDock: TWinControl);
begin

{$IFDEF CodeSite}
  gCodeSite.EnterMethod('TppToolbarManager.Initialize');
{$ENDIF}

  FTopDock    := TppHorizontalDock(aTopDock);
  FBottomDock := TppHorizontalDock(aBottomDock);
  FLeftDock   := TppVerticalDock(aLeftDock);
  FRightDock  := TppVerticalDock(aRightDock);

{  FLeftToolBarDock := TppVerticalToolbarDock.Create(nil);
  FLeftToolBarDock.Parent :=FLeftDock.Parent;
  FLeftToolBarDock.Left := FLeftDock.Left + FLeftDock.Width + 1;
  FLeftToolBarDock.Width := 0;
  FLeftToolBarDock.Align := alLeft;   }

  FLeftDock.Caption := '';
  FRightDock.Caption := '';

  {assign the popup menu}
  FTopDock.PopupMenu     := FPopupMenu;
  FBottomDock.PopupMenu  := FPopupMenu;
  FLeftDock.PopupMenu    := FPopupMenu;
  FRightDock.PopupMenu   := FPopupMenu;

{$IFDEF CodeSite}
  gCodeSite.Send('build component palette');
{$ENDIF}

  {build the component palette}
  BuildComponentPalette;

{$IFDEF CodeSite}
  gCodeSite.Send('create standard toolbars');
{$ENDIF}

  {create standard toolbars}
  CreateStandardToolbars;

{$IFDEF CodeSite}
  gCodeSite.Send('build popup menu');
{$ENDIF}

  {build the popup menu}
  BuildPopupMenu;

{$IFDEF CodeSite}
  gCodeSite.ExitMethod('TppToolbarManager.Initialize');
{$ENDIF}


end; {procedure, Initialize}


{------------------------------------------------------------------------------}
{ TppToolbarManager.CreateStandardToolbars}

procedure TppToolbarManager.CreateStandardToolbars;
var
  lFormatBar: TppFormatToolbar;
  lDrawBar: TppDrawToolbar;
  lToolWindow: TppToolWindow;

begin

{$IFDEF CodeSite}
  gCodeSite.Send('***' + DefaultDockTreeClass.ClassName);
  gCodeSite.Send('***' + TypeOf(DefaultDockTreeClass).FullName);
{$ENDIF}

//  lToolWindow := TppToolWindow.Create(FForm);
//  lToolWindow.Name    := 'TestTppToolWindow';
//  lToolWindow.Caption := 'TppToolWindow';
//  lToolWindow.PopupParent := FForm;
//  lToolWindow.Visible  := True;

//  FToolWindows.Add(lToolWindow);


  lToolWindow := TppReportTreeWindow.Create(FForm);
  lToolWindow.Name    := 'ReportOutline';
  lToolWindow.Caption := 'ReportOutline';
  lToolWindow.Visible  := False;
//  lToolWindow.PopupParent := FForm;

  
  FToolWindows.Add(lToolWindow);

  lToolWindow := TppDataTreeWindow.Create(FForm);
  lToolWindow.Name     := 'DataTree';
  lToolWindow.Caption  := 'DataTree';
  lToolWindow.Visible  := False;
//  lToolWindow.PopupParent := FForm;

  FToolWindows.Add(lToolWindow);

  {create Standard toolbar}
  CreateToolBar(TppStandardToolbar, 'Standard', 1); //class, caption, row

  {create Format toolbar}
  lFormatBar := TppFormatToolbar(CreateToolBar(TppFormatToolbar, 'Format', 2));

  FPaletteButtons.Add(lFormatBar.FontColorButton);
  FPaletteButtons.Add(lFormatBar.HighlightColorButton);

  {create Edit toolbar}
  CreateToolBar(TppEditToolbar, 'Edit', 2);

  {create Size toolbar}
  CreateToolBar(TppSizeToolbar, 'Size', 3);

  {create Nudge toolbar}
  CreateToolBar(TppNudgeToolbar, 'Nudge', 3);

  {create Draw toolbar}
  lDrawbar := TppDrawToolbar(CreateToolBar(TppDrawToolbar, 'Draw', 3));

  FPaletteButtons.Add(lDrawbar.LineColorButton);
  FPaletteButtons.Add(lDrawbar.FillColorButton);

  {create Align toolbar}
  CreateToolBar(TppAlignToolbar, 'Align', 4);

end; {procedure, CreateStandardToolbars}

{------------------------------------------------------------------------------}
{ TppToolbarManager.CreateToolBar}

function TppToolbarManager.CreateToolBar(aToolbarClass: TppToolbarClass; const aToolbarName: String; aDockRow: Integer): TppToolbar;
//const
//  cDockRows: array [1..4 ] of integer = (28, 54, 80, 106);
var
  lToolBar: TppToolBar;
begin

  lToolbar := aToolbarClass.Create(FForm);
  lToolbar.ManualDock(FTopDock);
  lToolbar.Name := aToolbarName;
  lToolbar.DockRow := aDockRow;
  lToolbar.Visible := False;
  lToolbar.Top := ((aDockRow-1) * FTopDock.RowSize) + 1;

  FStandardBars.Add(lToolbar);

  AddToolbar(aToolbarName, lToolbar);

  Result := lToolbar;

end;

{------------------------------------------------------------------------------}
{ TppToolbarManager.BuildComponentPalette}

procedure TppToolbarManager.BuildComponentPalette;
var
  lButton:  TppToolbarButton;
  liComponent: Integer;
  liToolbar: Integer;
  liIndex: Integer;
  lFirstToolbar: TppToolbar;
  lSeparator: TppToolbarSeparator;


begin

  {remove component bars from list of toolbars}
  for liToolbar := 0 to FComponentBars.Count-1 do
    begin
      liIndex := FToolbars.IndexOfObject(FComponentBars[liToolbar]);

      if liIndex >= 0 then
        FToolbars.Delete(liIndex);
    end;

  {free the component bars}
  FreeToolbars(FComponentBars);


  lFirstToolbar := nil;

  for liComponent := 0 to FComponentClasses.Count-1 do
    begin

      AddComponentClass(FComponentClasses[liComponent]);

      {save reference to first component bar
         note: also make sure dock pos is correct }
      if (liComponent = 0) then
        begin
          lFirstToolbar := TppToolBar(FComponentBars[0]);
          lFirstToolbar.Left := 0;
        end;

    end;

  {if no toolbars created, create a standard components toolbar}
  if (FComponentClasses.Count = 0) then
    lFirstToolbar := NewToolbar('Standard Components');


  {add selection arrow button to first component bar}
  if (lFirstToolbar <> nil) then
    begin
      lFirstToolbar.BeginUpdate;

      {create the arrow button}
      lButton :=  TppToolbarButton.Create(nil);
      lButton.Style := tbsCheck;
      lButton.Grouped := True;
      lButton.AllowAllUp := True;
      lButton.Down := True;
      lButton.Parent := lFirstToolbar;

      lButton.OnClick := ComponentPaletteButtonClickEvent;
      lButton.Name := 'SelectObject';
      lButton.ImageIndex := ToolImageList.AddTool('PPSELECTOBJECT');
      lButton.Hint := ppLoadStr(273);
      lButton.Tag  := 273;

      lFirstToolbar.Left := 0;

      if (FComponentClasses.Count > 0) then
        begin
          {add a separator}
          lSeparator := TppToolbarSeparator.Create(nil);
          lSeparator.Parent := lFirstToolbar;

          lSeparator.Left := lButton.Left + lButton.Width;
        end;


      FSelectObjectButton := lButton;


     lFirstToolbar.EndUpdate;
     
   end;


end; {procedure, BuildComponentPalette}


{------------------------------------------------------------------------------}
{ TppToolbarManager.AddComponentClass }

procedure TppToolbarManager.AddComponentClass(aClassName: String);
var
  lsClassName: String;
  lButton:  TppToolbarButton;
  liClass: Integer;
  lToolbar: TppToolbar;
  lRegComponent: TppRegComponent;

begin

  liClass := FComponentClasses.IndexOf(aClassName);

  if liClass < 0 then Exit;

  lRegComponent := TppRegComponent(FComponentClasses.Objects[liClass]);

  if (lRegComponent = nil) then Exit;

  {try to find the toolbar}
  lToolbar := TppToolbar(FindToolbar(lRegComponent.ToolbarName));

  {create a new toolbar, if needed}
  if (lToolbar = nil) then
    begin
      lToolbar := NewToolbar(lRegComponent.ToolbarName);
      FComponentBars.Add(lToolbar);
    end;

  lToolbar.BeginUpdate;

//??  if lToolbar.Top <> 0 then
//    lToolbar.Top := 0;

  {add a toolbar button }
  lButton :=  TppToolbarButton.Create(lToolbar);
  lButton.Style := tbsCheck;
  lButton.Grouped := True;
  lButton.AllowAllUp := True;
  lButton.OnClick := ComponentPaletteButtonClickEvent;

  {assign parent after the seeting the above props}
  lToolBar.AddControl(lButton);

  {assign parent after the seeting the above props}
  lButton.Parent := lToolbar;

  {assign button position
    note: add 2 to position if SelectObject present}
  if (FSelectObjectButton <> nil) and (FSelectObjectButton.Parent = lToolbar) then
    lButton.Left := (lButton.Width * (lRegComponent.ToolBarPosition + 2)) + 1
  else
    lButton.Left := (lButton.Width * lRegComponent.ToolBarPosition) + 1;

  lsClassName := lRegComponent.ComponentClass.ClassName;

  lButton.Name  := lsClassName;

  lButton.ImageIndex := ToolImageList.AddTool(UpperCase(lsClassName));

  {assign button hint}
  if lRegComponent.HintIndex > 0 then
    begin
      lButton.Tag  := lRegComponent.HintIndex;
      lButton.Hint := ppLoadStr(lRegComponent.HintIndex)
    end
  else
    lButton.Hint := lRegComponent.Hint;

  if (lButton.Hint = '') then
    lButton.Hint := TppComponentClass(lRegComponent.ComponentClass).DefaultHint;

  lToolbar.EndUpdate;

end; {procedure, AddComponentClass}


{------------------------------------------------------------------------------}
{ TppToolbarManager.RemoveComponentClass }

procedure TppToolbarManager.RemoveComponentClass(aClassName: String);
var
  lButton:  TComponent;
  liToolbar: Integer;
  lToolbar: TppToolbar;

begin

  lButton   := nil;
  lToolbar  := nil;
  liToolbar := 0;

  {find component button}
  while (lButton = nil) and (liToolbar < FComponentBars.Count) do
    begin
      lToolbar := TppToolbar(FComponentBars[liToolbar]);

      lButton := lToolbar.FindComponent(aClassName);

      if lButton = nil then
        Inc(liToolbar);

    end;

  {destroy component button}
  lButton.Free;

  {if not more buttons then free the toolbar}
  if (lToolbar <> nil) and (lToolbar.ControlCount = 0) then
    begin
      FComponentBars.Delete(liToolbar);

      liToolbar := FToolbars.IndexOfObject(lToolbar);
      if liToolbar >= 0 then
         FToolbars.Delete(liToolbar);

      lToolbar.Free;


    end;

end; {procedure, RemoveComponentClass}



{------------------------------------------------------------------------------}
{ TppToolbarManager.BuildPopupMenu }

procedure TppToolbarManager.BuildPopupMenu;
var
  liIndex: Integer;
  lMenuItem: TMenuItem;
  lToolWindow: TppToolWindow;
  lToolbar: TppToolbar;
begin

  FreeMenuItems;

  {add one menu item for each toolwindow}
  for liIndex := 0 to FToolWindows.Count-1 do
    begin
      lMenuItem := TMenuItem.Create(FForm);

      lToolWindow := TppToolWindow(FToolWindows[liIndex]);

      lMenuItem.Caption := lToolWindow.Caption;
      lMenuItem.Tag     := Integer(lToolWindow);
      lMenuItem.OnClick := MenuItemClickEvent;
      FPopupMenu.Items.Add(lMenuItem);
    end;

  {add menu separator}
  lMenuItem := TMenuItem.Create(FForm);
  lMenuItem.Caption := '-';
  FPopupMenu.Items.Add(lMenuItem);

  {add one menu item for each toolbar}
  for liIndex := 0 to FToolbars.Count-1 do
    begin
      lMenuItem := TMenuItem.Create(FForm);

      lToolbar := TppToolBar(FToolbars.Objects[liIndex]);

      lMenuItem.Caption := lToolbar.Caption;
      lMenuItem.Tag     := Integer(lToolbar);
      lMenuItem.OnClick := MenuItemClickEvent;
      FPopupMenu.Items.Add(lMenuItem);
    end;

end; {procedure, BuildPopupMenu}


{------------------------------------------------------------------------------}
{ TppToolbarManager.MenuPopupEvent}


procedure TppToolbarManager.MenuPopupEvent(Sender: TObject);
var
  liItem: Integer;
  lMenuItem: TMenuItem;
  lObject: TObject;
begin

  {set menu items to checked for each toolbar that is visible}
  for liItem := 0 to FPopupMenu.Items.Count-1 do
    begin
      lMenuItem := FPopupMenu.Items[liItem];

      lObject := TObject(lMenuItem.Tag);

      if (lObject is TControl) then
        lMenuItem.Checked := TControl(lObject).Visible;
    end;

end; {procedure, MenuPopupEvent}

{------------------------------------------------------------------------------}
{ TppToolbarManager.MenuItemClickEvent}

procedure TppToolbarManager.MenuItemClickEvent(Sender: TObject);
var
  lObject: TObject;
  lTool: TControl;
begin

{$IFDEF CodeSite}
  gCodeSite.EnterMethod('MenuItemClickEvent');
{$ENDIF}

  {toggle toolbar visibility}
  if Sender is TMenuItem then
    begin
      lObject := TObject(TMenuItem(Sender).Tag);

      if (lObject is TControl) then
        begin
          lTool := TControl(lObject);
          lTool.Visible := not(lTool.Visible);
      end;
        
    end;

{$IFDEF CodeSite}
  gCodeSite.ExitMethod('MenuItemClickEvent');
{$ENDIF}

end; {procedure, MenuItemClickEvent}


{------------------------------------------------------------------------------}
{ TppToolbarManager.ComponentPaletteButtonClickEvent}

procedure TppToolbarManager.ComponentPaletteButtonClickEvent(Sender: TObject);
begin

  {make sure only palette button down at a time}
  if (FPaletteButton <> nil) and (Sender <> FPaletteButton) and FPaletteButton.Down then
    FPaletteButton.Down := False

  else if (FSelectObjectButton <> nil) and FSelectObjectButton.Down then
    FSelectObjectButton.Down := False;

  if (Sender = FSelectObjectButton) then
    FSelectObjectButton.Down := True
  else
    FPaletteButton := TppToolbarButton(Sender);

end; {procedure, ComponentPaletteButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppToolbarManager.EnableToolWindowCaptions}

procedure TppToolbarManager.EnableToolWindowCaptions(aValue: Boolean);
//var
//  liToolbar: Integer;
begin

//  BuildFloatingToolWindowList(FCaptionsList);

//TODO  for liToolbar := 0 to FCaptionsList.Count-1 do
//    TWinControl(FCaptionsList[liToolbar]).SetInactiveCaption(not aValue);

end;  {procedure, EnableToolWindowCaptions}

{------------------------------------------------------------------------------}
{ TppToolbarManager.BuildFloatingToolWindowList}

procedure TppToolbarManager.BuildFloatingToolWindowList(aList: TList);
var
  liIndex: Integer;
  lbVisible: Boolean;
  lToolbar: TppToolbar;
  lToolWindow: TppCustomToolWindow;
  lPaletteButton: TppCustomPaletteButton;

begin

  aList.Clear;

  {get visible floating toolbars}
  for liIndex := 0 to FToolbars.Count-1 do
    begin
      lToolbar := Toolbars[liIndex];

      lbVisible := (lToolbar.Floating) and (lToolbar.Visible);

      if lbVisible then
        aList.Add(lToolbar);

    end;

  {get visible floating tool windows}
  for liIndex := 0 to FToolWindows.Count-1 do
    begin
      lToolWindow := TppToolWindow(FToolWindows[liIndex]);

      lbVisible := (lToolWindow.Floating) and (lToolWindow.Visible);

      if lbVisible then
        aList.Add(lToolWindow);

    end;


  {get visible floating tool palettes}
  for liIndex := 0 to FPaletteButtons.Count-1 do
    begin
      lPaletteButton := TppCustomPaletteButton(FPaletteButtons[liIndex]);

      if (lPaletteButton.Palette <> nil) then
        lToolWindow := lPaletteButton.Palette.ToolWindow
      else
        lToolWindow := nil;

      if (lToolWindow <> nil) and lToolWindow.Visible then
          aList.Add(lToolWindow);

    end;

end;  {procedure, BuildFloatingToolWindowList}

{------------------------------------------------------------------------------}
{ TppToolbarManager.HideFloatingToolWindows}

procedure TppToolbarManager.HideFloatingToolWindows;
var
  liToolWindow: Integer;
begin

  BuildFloatingToolWindowList(FFloatingToolWindows);

  for liToolWindow := 0 to FFloatingToolWindows.Count-1 do
    TWinControl(FFloatingToolWindows[liToolWindow]).Hide;

end; {procedure, HideFloatingToolWindows}

{------------------------------------------------------------------------------}
{ TppToolbarManager.ShowFloatingToolWindows}

procedure TppToolbarManager.ShowFloatingToolWindows;
var
  liToolWindow: Integer;
begin
  for liToolWindow := 0 to FFloatingToolWindows.Count-1 do
    TWinControl(FFloatingToolWindows[liToolWindow]).Show;

  Application.RestoreTopMosts;


end; {procedure, ShowFloatingToolWindows}

{------------------------------------------------------------------------------}
{ TppToolbarManager.GetToolbar}

function TppToolbarManager.GetToolbar(aIndex: Integer): TppToolbar;
begin
   Result := TppToolbar(FToolbars.Objects[aIndex]);

end; {function, GetToolbar}

{------------------------------------------------------------------------------}
{ TppToolbarManager.GetToolWindow}

function TppToolbarManager.GetToolWindow(aIndex: Integer): TppToolWindow;
begin
   Result := TppToolWindow(FToolWindows[aIndex]);

end; {function, GetToolWindow}

{------------------------------------------------------------------------------}
{ TppToolbarManager.GetToolWindowCount}

function TppToolbarManager.GetToolWindowCount: Integer;
begin
   Result := FToolWindows.Count;

end; {function, GetToolWindowCount}



{------------------------------------------------------------------------------}
{ TppToolbarManager.FindToolbar}

function TppToolbarManager.FindToolbar(aToolbarName: String): TppToolbar;
var
  liIndex: Integer;

begin

  liIndex := FToolbars.IndexOf(aToolbarName);

  if liIndex >= 0 then
    Result := TppToolbar(FToolbars.Objects[liIndex])
  else
    Result := nil;

end; {function, FindToolbar}

{------------------------------------------------------------------------------}
{ TppToolbarManager.FindToolWindow}

function TppToolbarManager.FindToolWindow(aToolWindoName: String): TppToolWindow;
var
  liIndex: Integer;
  lToolWindow: TppToolWindow;
begin

  liIndex := 0;
  Result := nil;

  while (Result = nil) and (liIndex < FToolWindows.Count) do
    begin
      lToolWindow := TppToolWindow(FToolWindows[liIndex]);

      if (lToolWindow.Name = aToolWindoName) then
        Result := lToolWindow
      else
        Inc(liIndex);

    end;


end; {function, FindToolWindow}

{------------------------------------------------------------------------------}
{ TppToolbarManager.FindDock}

function TppToolbarManager.FindDock(aDockName: String): TWinControl;
begin

  if (FTopDock.Name = aDockName) then
    Result := FTopDock
  else if (FLeftDock.Name = aDockName) then
    Result := FLeftDock
  else if (FRightDock.Name = aDockName) then
    Result := FRightDock
  else if (FBottomDock.Name = aDockName) then
    Result := FBottomDock
  else
   Result := nil;

end;


{------------------------------------------------------------------------------}
{ TppToolbarManager.GetToolbarCount}

function TppToolbarManager.GetToolbarCount: Integer;
begin
  Result := FToolbars.Count;
end; {function, GetToolbarCount}


{------------------------------------------------------------------------------}
{ TppToolbarManager.AddToolbar}

procedure TppToolbarManager.AddToolbar(aToolbarName: String; aToolbar: TppToolbar);
begin
  if (FindToolbar(aToolbarName) <> nil) then Exit;

  FToolbars.AddObject(aToolbarName, aToolbar);

  BuildPopupMenu;

end; {procedure, AddToolbar}

{------------------------------------------------------------------------------}
{ TppToolbarManager.NewToolbar}

function TppToolbarManager.NewToolbar(aToolbarName: String): TppToolbar;
var
  liIndex: Integer;
begin

  Result := TppToolbar(FindToolbar(aToolbarName));

  if (Result <> nil) then Exit;

  Result := TppToolbar.Create(FForm);

  Result.BeginUpdate;

  Result.Name     := ppRemoveSpacesFromString(aToolbarName);
  Result.ManualDock(FTopDock);

  liIndex := FToolbars.AddObject(aToolbarName, Result);

  if liIndex = 0 then
    begin
      Result.Left := 0;
      Result.Top := 0;
    end
  else
    begin
      Result.Left := Toolbars[liIndex-1].Left + Toolbars[liIndex-1].Width + 1;
      Result.Top := Toolbars[liIndex-1].Top;
    end;


  Result.EndUpdate;

  Result.Caption  := TranslateToolbarCaption(Result.Name);

end; {procedure, NewToolbar}


{------------------------------------------------------------------------------}
{ TppToolbarManager.RemoveToolbar}

procedure TppToolbarManager.RemoveToolbar(aToolbarName: String);
var
  liIndex: Integer;

begin

  liIndex := FToolbars.IndexOf(aToolbarName);

  if liIndex < 0 then Exit;

  FToolbars.Delete(liIndex);

  BuildPopupMenu;

end; {procedure, RemoveToolbar}

{------------------------------------------------------------------------------}
{ TppToolbarManager.RegisterListChanged}

procedure TppToolbarManager.RegisterListChanged;
begin
  SetComponentClasses(ppComponentClassList);

end; {procedure, RegisterListChanged}

{------------------------------------------------------------------------------}
{ TppToolbarManager.SetComponentClasses}

procedure TppToolbarManager.SetComponentClasses(aComponentClasses: TStrings);
var
  lsClassName: String;
  liClass: Integer;
  lOldClasses: TStringList;
  
begin

  lOldClasses := TStringList.Create;

  lOldClasses.Assign(FComponentClasses);

  FComponentClasses.Assign(aComponentClasses);

  for liClass := 0 to aComponentClasses.Count-1 do
    begin
      lsClassName := aComponentClasses[liClass];

      if lOldClasses.IndexOf(lsClassName) < 0 then
        AddComponentClass(lsClassName);

    end;

  for liClass := 0 to lOldClasses.Count-1 do
    begin
      lsClassName := lOldClasses[liClass];

      if aComponentClasses.IndexOf(lsClassName) < 0 then
        RemoveComponentClass(lsClassName);

    end;


  lOldClasses.Free;

  BuildPopupMenu;

end; {procedure, SetComponentClasses}


{------------------------------------------------------------------------------}
{ TppToolbarManager.SetOnToolUnDock}

procedure TppToolbarManager.SetOnToolUnDock(const Value: TNotifyEvent);
var
  liIndex: Integer;
begin

  for liIndex := 0 to ToolBarCount-1 do
    Toolbars[liIndex].OnFloat := Value;

end;


{------------------------------------------------------------------------------}
{ TppToolbarManager.TranslateToolbarCaption}

function TppToolbarManager.TranslateToolbarCaption(const aToolbarCaption: String): String;
begin
  if aToolbarCaption = 'StandardComponents' then
    Result := ppLoadStr(464)

  else if aToolbarCaption = 'DataComponents' then
    Result := ppLoadStr(465)

  else if aToolbarCaption = 'AdvancedComponents' then
     Result := ppLoadStr(466)
  else
    Result  := aToolbarCaption;

end; {function, TranslateToolbarCaption}


{------------------------------------------------------------------------------}
{ TppToolbarManager.SetLanguageIndex}

procedure TppToolbarManager.SetLanguageIndex(aLanguageIndex: Longint);
var
  liToolbar: Integer;
  liControl: Integer;
  lComponentBar: TppToolbar;
  lButton: TppToolbarButton;

begin
  FLanguageIndex := aLanguageIndex;

  {for standard toolbars, set the toolbar's LanguageIndex prop }
  for liToolbar := 0 to  FToolWindows.Count-1 do
    TppToolWindow(FToolWindows[liToolbar]).LanguageIndex := FLanguageIndex;


  {for standard toolbars, set the toolbar's LanguageIndex prop }
  for liToolbar := 0 to  FStandardBars.Count-1 do
    TppToolbar(FStandardBars[liToolbar]).LanguageIndex := FLanguageIndex;

  {for component toolbars, use HintIndex stored in Button.Tag prop }
  for liToolbar := 0 to  FComponentBars.Count-1 do
    begin
      lComponentBar := TppToolbar(FComponentBars[liToolbar]);

      {translate the toolbar name into a caption}
      lComponentBar.Caption := TranslateToolbarCaption(lComponentBar.Caption);


      for liControl := 0 to  lComponentBar.ControlCount-1 do
        if lComponentBar.Controls[liControl] is TppToolbarButton then
          begin
            lButton := TppToolbarButton(lComponentBar.Controls[liControl]);

            if lButton.Tag > 0 then
              lButton.Hint := ppLoadStr(lButton.Tag);
          end;

    end;

  {rebuild the popup menu}
  BuildPopupMenu;

end; {procedure, SetLanguageIndex}


{******************************************************************************
 *
 **  B o r d e r   G r a p h i c
 *
{******************************************************************************}

procedure TppBorderGraphic.CMMouseEnter(var Message: TMessage);
begin
  MouseOver := True;
end;

procedure TppBorderGraphic.CMMouseLeave(var Message: TMessage);
begin
  MouseOver := False;
end;

constructor TppBorderGraphic.Create(AOwner: TComponent);
begin
  inherited;

  FMouseTimer := TTimer.Create(nil);
  FMouseTimer.OnTimer := MouseTimerEvent;
  FMouseTimer.Interval := 3000;
end;

destructor TppBorderGraphic.Destroy;
begin
  FMouseTimer.Free;

  inherited;
end;

procedure TppBorderGraphic.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  FMousePos := Point(X, Y);
  MouseOver := False;
end;

procedure TppBorderGraphic.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if not(X = FMousePos.X) or not(Y = FMousePos.Y) then
    begin
      MouseOver := True;
      FMouseTimer.Enabled := True;
    end;
end;

procedure TppBorderGraphic.MouseTimerEvent(Sender: TObject);
begin
  MouseOver := False;
end;

procedure TppBorderGraphic.Paint;
var
  liIndex: Integer;
  liOffset: Integer;
begin

  inherited;

  //liOffset := 0;

  {Set Border Graphic Style}
  if (MouseOver) and (Selected) then
    begin
      Canvas.Pen.Style := psDot;
      Canvas.Pen.Width := 1;
      Canvas.Pen.Color := clDkGray;
    end
  else if not(MouseOver) and (Selected) then
    begin
      Canvas.Pen.Style := psSolid;
      Canvas.Pen.Width := 1;
      Canvas.Pen.Color := clBlack;
    end
  else if (MouseOver) and not(Selected) then
    begin
      Canvas.Pen.Style := psSolid;
      Canvas.Pen.Width := 1;
      Canvas.Pen.Color := clDkGray;
    end
  else
    begin
      Canvas.Pen.Style := psDot;
      Canvas.Pen.Width := 1;
      Canvas.Pen.Color := clLtGray;
    end;

  {Draw border lines}
  for liIndex := 0 to 1 do
    begin
      if (Left = 5) or (Top = 45) then
        liOffset := liIndex + 12
      else
        liOffset := liIndex + 6;

      if Orientation = botVertical then
        begin
          Canvas.MoveTo(liOffset, 0);
          Canvas.LineTo(liOffset, 35);
        end
      else
        begin
          Canvas.MoveTo(0, liOffset);
          Canvas.LineTo(105, liOffset);
        end;
    end;

end;

procedure TppBorderGraphic.SetMouseOver(const Value: Boolean);
begin
  if FMouseOver <> Value then
    begin
      FMouseOver := Value;
      Invalidate;
    end;
end;

procedure TppBorderGraphic.SetSelected(const Value: Boolean);
begin
  if FSelected <> Value then
    begin
      FSelected := Value;
      Invalidate;
    end;
end;


{******************************************************************************
 *
 **  C o r n e r   G r a p h i c
 *
{******************************************************************************}

constructor TppCornerGraphic.Create(AOwner: TComponent);
begin
  inherited;

  Width := 15;
  Height := 15;

end;

procedure TppCornerGraphic.Paint;
begin
  inherited;

  Canvas.Pen.Color := clDKGray;

    if CornerType = ctLeftTop then
      begin
        Canvas.MoveTo(12, 4);
        Canvas.LineTo(12, 12);
        Canvas.LineTo(4, 12);
        Canvas.MoveTo(13, 3);
        Canvas.LineTo(13, 13);
        Canvas.LineTo(3, 13);
      end
    else if CornerType = ctRightTop then
      begin
        Canvas.MoveTo(2, 4);
        Canvas.LineTo(2, 12);
        Canvas.LineTo(10, 12);
        Canvas.MoveTo(1, 3);
        Canvas.LineTo(1, 13);
        Canvas.LineTo(11, 13);
      end
    else if CornerType = ctLeftBottom then
      begin
        Canvas.MoveTo(4, 2);
        Canvas.LineTo(12, 2);
        Canvas.LineTo(12, 10);
        Canvas.MoveTo(3, 1);
        Canvas.LineTo(13, 1);
        Canvas.LineTo(13, 11);
      end
    else
      begin
        Canvas.MoveTo(10, 2);
        Canvas.LineTo(2, 2);
        Canvas.LineTo(2, 10);
        Canvas.MoveTo(11, 1);
        Canvas.LineTo(1, 1);
        Canvas.LineTo(1, 11);
      end;

end;


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}


initialization

  RegisterClasses([TppColorPalette, TppColorButton, TppAnchorsPalette, TppAnchorsButton,
                   TppBorderButton, TppBorderPalette, TppLineStylePalette, TppLineStyleButton,
                   TppLineThicknessPalette, TppLineThicknessButton, TppFontButton]);

finalization

  UnRegisterClasses([TppColorPalette, TppColorButton, TppAnchorsPalette, TppAnchorsButton,
                     TppBorderButton, TppBorderPalette, TppLineStylePalette,
                     TppLineStyleButton, TppLineThicknessPalette, TppLineThicknessButton, TppFontButton]);

end.

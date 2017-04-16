{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2004                    BBBBB   }

unit ppRichTx;

interface

{$I ppIfDef.pas}

uses
  Windows,
  SysUtils,
  Classes,
  Graphics,
  ComCtrls,
  RichEdit,

  ppClass,
  ppTypes,
  ppUtils,
  ppCtrls,
  ppDB,
  ppDevice,
  ppPrintr,
  ppStrtch,
  ppDrwCmd,
  ppComm,
  ppRTTI,
  ppRichTxDrwCmd;

type

  TppMergeInfo = class;

  {@TppCustomRichText

    Ancestor from which all rich text components descend. The standard rich
    text components provided with ReportBuilder are:

            - TppDBRichText
            - TppRichText}

  {@TppCustomRichText.EndCharPos

    The EndChar property contains the position of the last char of text in the
    rich text control that will actually appear in the current band.  This
    property contains a valid value only after the band has printed (access it
    from the AfterPrint event of the band.)}

  {@TppCustomRichText.KeepTogether

    Defaults to False. The KeepTogether property controls the pagination of
    the richtext when the contents cannot fit on the current page.
    Normally the contents are printed to the bottom of the available page
    space and then continued on subsequents pages until complete.  If
    KeepTogether is True, the RichText component will advance to the next
    page when the contents do not fit.}

  {@TppCustomRichText.SelAttributes

    Runtime only. SelAttributes is a TTextAttributes object that describes
    the rich text characteristics of the selected text in the rich edit
    control.Please refer to Delphi Help for more info on TParaAttributes.

    Use SelAttributes to discover or set the font characteristics of the
    currently selected text. SelAttributes is a TTextAttributes object,
    which specifies characteristics such as font face, color, size, style,
    and pitch. To change a single attribute of the currently selected text,
    read SelAttributes, and set one of its properties. To change all of the
    attributes of the currently selected text, set SelAttributes to a
    TTextAttributes object that represents the desired configuration of
    attributes. If no text is selected, SelAttributes represents the
    attributes of the cursor position.

    When inserting new text, the font characteristics of the new text will match
    SelAttributes.}

  {@TppCustomRichText.SelLength

    Runtime only. SelLength is the number of characters that are selected

    Read SelLength to determine the length, in characters, of the selected
    text. Set SelLength to change the selection to consist of the first
    SelLength characters starting at SelStart.

    Note: Setting SelLength to a value greater than the number of
    characters from SelStart to the end of the text results in the
    selection of all characters from SelStart to the end of the text.
    Reading SelLength immediately after setting it to a value greater than
    the number of available characters returns the number of characters
    actually selected, not the value that was just set.}

 {@TppCustomRichText.SelStart

    Runtime only. SelStart is the position of the first selected character
    in the text.

    Read SelStart to determine the position of the first selected
    character, where 0 indicates the first character. To select a
    particular range of the text, first set SelStart to position the
    cursor, and then set SelLength to extend the selection.}

  {@TppCustomRichText.SelText

    Runtime only. SelText is the selected portion of the edit control's
    text.

    Read SelText to determine the value of the selected text. Set SelText
    to replace the selected text with a new string.}

  {@TppCustomRichText.StartCharPos

    The StartCharPos property contains the position of the first character
    that will actually appear in the current band.  This property contains
    a valid value only after the band has printed (access it from the
    AfterPrint event of the band.)}

  {@TppCustomRichText.Paragraph

    Read Paragraph to get the TParaAttributes object used by the rich text
    control to specify paragraph formatting information. Use the TParaAttributes
    object to read or write the paragraph formatting information for the current
    paragraph. Paragraph formatting information includes alignment, indentation,
    numbering, and tabs.

    Paragraph is a read-only property because a TCustomRichEdit object has only
    one TParaAttributes object, which cannot be changed. The attributes of the
    current paragraphs, however, can be changed by setting the properties of the
    TParaAttributes object. These attributes can be set one by one or all can be
    set to the value of an existing TParaAttributes object by using
    Paragraph.Assign.

    The current paragraphs are the paragraphs that contain the selected
    text. If no text is selected, the current paragraph is the one
    containing the cursor}

  {@TppCustomRichText.RichText

    The RichText property contains the rich text format (RTF) data.}

  {@TppCustomRichText.MailMerge

    When set to True, this property will cause the RichText component to scan
    the text, searching for occurrences of valid MailMerge tags. If these tags
    are found, the information defined using the format below will be used and
    they will be replaced with the field value.

    MailMerge Tag Format:

    \<dbtext datapipeline='DataPipeline Name' displayformat='Format String'\>Field Name\</dbtext\>

    Attribute Specifications:

     - datapipeline: DataPipeline reference.  This can be any datapipeline
                     created in Delphi or DADE.  If no DataPipeline is defined,
                     the Report.DataPipeline is used by default.

     - displayformat: Display Format String.  Controls the formatting of the
                      selected field.  See "DisplayFormat" in the Online Delphi
                      help for more information.

    Notes
    The MailMerge tags are not case sensitive and do not need to be all lower
    caps.  The values for the datapipeline and displayformat attributes need to
    be surrounded by single quotes, the Field Name does not.

    The RichText Editor contains a new attached control panel when MailMerge is
    enabled.  This control panel will display the available DataPipelines, Field
    Names for that pipeline, and recommended display formats for that field type.
    Simply double click on the field or select the field and click the Add Field
    button to automatically add a field to your richtext component. }

  TppCustomRichText = class(TppStretchable)
    private
      FEndCharPos: Integer;
      FMailMerge: Boolean;
      FMetaFile: TMetaFile;
      FReloadAfterPrinting : Boolean;
      FDrawRichEdit: TCustomRichEdit;
      FRichEdit: TCustomRichEdit;
      FRichTextStrings: TStrings;
      FRichTextStream: TMemoryStream;
      FStartCharPos: Integer;
      FSaveWidth: Longint;
      FSaveHeight: Longint;

      function  GetDrawRichEdit: TCustomRichEdit;
      function  GetMaxLength: Integer;
      function  GetPlainText: String;
      procedure MergeDBFields;
      procedure MergeTaggedDBFields;
      procedure ParseMergeCode(aCode: String; aMergeInfo: TppMergeInfo);
      function  RetrieveMergeData(aMergeInfo: TppMergeInfo): String;
      procedure SetMailMerge(aValue: Boolean);
      procedure SetMaxLength(aMaxLength: Integer);
      function  NextPos(aChar: Char; aString: String; aOffset: Integer): Integer;

    protected
      procedure BoundsChange; override;
      function  GetRichText: String;virtual;

      function  GetRichTextStream: TMemoryStream; virtual;
      procedure LoadDrawRichEdit; virtual;
      procedure LoadRichText; virtual;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;
      procedure SetColor(aColor: TColor); override;
      procedure SetRichText(Value: String); virtual;
      procedure SetRichTextStrings(Value: TStrings); virtual;

      procedure LinesChanged;

      {pass thru prop functions}
      function GetParaAttributes: TParaAttributes;
      function GetSelAttributes: TTextAttributes;
      function GetSelLength: Integer;
      function GetSelStart: Integer;
      function GetSelText: String;

      procedure SetSelLength(aValue: Integer);
      procedure SetSelStart(aValue: Integer);
      procedure SetSelText(aString: String);

      property DrawRichEdit: TCustomRichEdit read GetDrawRichEdit;
      property MailMerge: Boolean read FMailMerge write SetMailMerge default False;

    public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Notification(aComponent: TComponent; Operation: TOperation); override;
      procedure CalcSpaceUsed; override;
      function  HasFont: Boolean; override;

      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;

      procedure LoadFromFile(aFileName: String);
      procedure SaveToFile(aFileName: String);
      procedure LoadFromRTFStream(aStream: TStream);
      procedure SaveToRTFStream(aStream: TStream);

      {pass thru methods}
      procedure Clear; override;
      procedure ClearSelection;
      function  FindText(const SearchStr: string; StartPos, Length: Integer; Options: TSearchTypes):Integer;
      procedure SelectAll;

      property EndCharPos: Integer read FEndCharPos write FEndCharPos;
      property RichTextStream: TMemoryStream read GetRichTextStream;
      property RichTextStrings: TStrings read FRichTextStrings;
      property StartCharPos: Integer read FStartCharPos write FStartCharPos;

      {pass thru props}
      property MaxLength: Integer read GetMaxLength write SetMaxLength;
      property Paragraph: TParaAttributes read GetParaAttributes;
      property SelAttributes: TTextAttributes read GetSelAttributes;
      property SelLength: Integer read GetSelLength write SetSelLength;
      property SelStart: Integer read GetSelStart write SetSelStart;
      property SelText: String read GetSelText write SetSelText;

      property Height;
      property Left;
      property PlainText: String read GetPlainText;
      property RichText: String read GetRichText write SetRichText;
      property Stretch;
      property Top;
      property UserName;
      property Visible;
      property Width;

    published
      property KeepTogether;

  end; {class, TppCustomRichText}

  {@TppRichText


    The TppRichText component is a report control that prints multiple
    lines of rich text on a report.  Rich text controls are similar to
    memos but have additional built-in functionality to handle text that
    includes variation in font attributes and paragraph formatting
    information.

    The rich text format (RTF) data is the value of the RichText property.
    Use the LoadFromFile and SaveToFile methods to work with RTF data
    stored in files. Use the LoadFromRTFStream and SaveToRTFStream methods
    to access RTF data stored in Delphi <EXTLINK borland://TStream_object>
    TStream</EXTLINK> descendants such as
    <EXTLINK borland://TMemoryStream_object>TMemoryStream</EXTLINK>
    (see Delphi help on <EXTLINK borland://TStream_object>TStream</EXTLINK>).
 
    You can enable the height of the memo to stretch automatically by setting
    Stretch to True and the
    parent Band PrintHeight property to phDynamic.

    At design-time you can use the ReportBuilder's  built-in RTF Editor to load,
    modify, and save rich text data stored in files. To access the RTF Editor,
    launch the Report Designer and add a TppRichComponent to your report. Next,
    position your mouse pointer above the component and press the right mouse button
    to display the component's speed menu. Finally, Select the Edit...menu option to
    display the editor.

    At run-time you can programmatically edit and manipulate the formatted text by
    using the Paragraph, SelAttributes, SelStart, SelLength, and SelText properties
    and the ClearSelection, FindText, and SelectAll methods. These are the same
    properties and methods associated with Delphi's TRichEdit control.

    Notes:
    1. Most word processors such as MS WordPad and MS Word can edit and save RTF
    documents.
    2. TppRichText and TppDBRichText are 32-bit components only and therefore are
    not available when using Delphi 1.
    3. For ReportBuilder Professional and Enterprise, you can replace the built-in
    Rich Text Editor by creating a form that descends from TppCustomRTFEditor and
    registering it with ReportBuilder. For an example of creating a custom Rich Text
    Editor, check out the rpRichEd.pas unit of the EndUser project in the
    RBuilder\\Demos\\EndUser directory.}

  TppRichText = class(TppCustomRichText)
    private
      FMemStream: TMemoryStream;

    protected
      function  GetRichTextStream: TMemoryStream; override;
      procedure LoadRichText; override;
      procedure SetRichTextStrings(Value: TStrings); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;

    published
      property Anchors;
      property Border;
      property BottomOffset;
      property Caption;
      property Color;
      property Height;
      property Left;
      property MailMerge;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property OverFlowOffset;
      property RichText;
      property ReprintOnOverFlow;
      property ShiftRelativeTo;
      property Stretch;
      property Transparent;
      property Top;
      property UserName;
      property Visible;
      property Width;
   end; {class, TppRichText}

  {@TppDBRichText

    The TppDBRichText component is a data-aware report control that is used
    to print multiple lines of text from a database field, such as a BLOB
    field. Rich text controls are similar to memos but have additional
    built-in functionality to handle text that includes variation in font
    attributes and paragraph formatting information.

    The database field that is printed is the value of the DataField
    property. The rich text format (RTF) data is the value of the RichText
    property. Use the LoadFromFile and SaveToFile methods to work with RTF
    data stored in files. Use the LoadFromRTFStream and SaveToRTFStream 
    methods to access RTF data stored in Delphi TStream descendants such as
    TMemoryStream (see Delphi help on TStream).

    You can enable the height of the memo to stretch automatically by setting
    Stretch to True and the parent Band PrintHeight property to phDynamic.

    At run-time you can programmatically edit and manipulate the formatted text by
    using the Paragraph, SelAttributes, SelStart, SelLength, and SelText properties
    and the ClearSelection, FindText, and SelectAll methods. These are the same
    properties and methods associated with Delphi's TRichEdit control.

    Notes:
    1.  Most word processors such as MS WordPad and MS Word can edit and save RTF
    documents.
    2. TppRichText and TppDBRichText are 32-bit components only and therefore are
    not available when using Delphi 1.}

  {@TppDBRichText.AutoDisplay

    The value of the AutoDisplay property determines whether to
    automatically display the contents of a BLOB in a database field in a
    TppDBMemo or TppDBImage component.
    If AutoDisplay is True (the default value), the component automatically
    displays new data when the underlying BLOB field changes (such as when
    moving to a new record). If AutoDisplay is False, the control clears
    whenever the underlying BLOB field changes

    Note: You might want to change the value of AutoDisplay to False if the
    automatic loading of BLOB fields seems to take too long}

  {@TppDBRichText.OnGetRichText

    The OnGetRichText event fires before the data in the BLOB field is
    assigned to RichText property.  Use the OnGetRichText event when you
    want to manipulate the contents of the BLOB field and assign the
    resulting RichText manually.  This would allow you to decompress a BLOB
    field and then assign the result to RichText.  If you create an
    OnGetRichText event handler, the DBRichText component will not attempt
    to assign the BLOB field to the RichText property at run-time.  In
    order suppress this same behavior at design-time, set the AutoDisplay
    property to False.}

  TppDBRichText = class(TppCustomRichText)
    private
      FAutoDisplay: Boolean;
      FOnGetRichText: TppGetTextEvent;

      procedure SetAutoDisplay(aValue: Boolean);

    protected
      function  GetRichTextStream: TMemoryStream; override;
      procedure SetDataField(const Value: String); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      function  IsDataAware: Boolean; override;
      procedure LoadRichText; override;

    published
      property Anchors;
      property AutoDisplay: Boolean read FAutoDisplay write SetAutoDisplay default True;
      property Border;
      property BottomOffset;
      property Color;
      property DataField;
      property DataPipeline;
      property Height;
      property Left;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property OnGetRichText: TppGetTextEvent read FOnGetRichText write FOnGetRichText;
      property OverFlowOffset;
      property ParentDataPipeline;
      property ReprintOnOverFlow;
      property ShiftRelativeTo;
      property Stretch;
      property Top;
      property Transparent;
      property UserName;
      property Visible;
      property Width;

  end; {class, TppDBRichText}

  {@TppMergeInfo}
  TppMergeInfo = class
    private
      FDataPipeline: String;
      FDisplayFormat: String;
      FFieldName: String;

      procedure SetDataPipeline(const Value: String);
      procedure SetDisplayFormat(const Value: String);
      procedure SetFieldName(const Value: String);

    public
      constructor Create; virtual;

      property DataPipeline: String read FDataPipeline write SetDataPipeline;
      property DisplayFormat: String read FDisplayFormat write SetDisplayFormat;
      property FieldName: String read FFieldName write SetFieldName;

  end; {class, TppMergeInfo}


  { TppCustomRichTextSaveRec - page cache info }
  TppCustomRichTextSaveRec = record
    FDrawComponent: Boolean;
    FDrawShifter: Boolean;
    FKeptTogether: Boolean;
    FOverFlow: Boolean;
    FObjectIndex: Integer;
    FPartialGeneration: Boolean;

    FStartCharPos: Integer;
    FEndCharPos: Integer;
  end; {record, TppCustomRichTextSaveRec}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  {@TraTppCustomRichTextRTTI }
  TraTppCustomRichTextRTTI = class(TraTppStretchableRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomRichTextRTTI}

  {@TraTppDBRichTextRTTI }
  TraTppDBRichTextRTTI = class(TraTppCustomRichTextRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDBRichTextRTTI}

implementation

uses
  Variants,
  ppBands, ppRegion, ppPrnDev, ppDisplayFormat;


{******************************************************************************
 *
 ** C U S T O M R I C H T E X T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomRichText.Create }

constructor TppCustomRichText.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FDrawRichEdit := nil;
  FEndCharPos := -1;
  FMailMerge := False;
  FMetaFile := TMetaFile.Create;
  FStartCharPos := -1;
  FEndCharPos := -1;
  FReloadAfterPrinting := False;
  FSaveWidth  := 0;
  FSaveHeight := 0;

  FRichEdit := ppCreateRichEdit(Self);

  FRichTextStream  := TMemoryStream.Create;
  FRichTextStrings := ppGetRichEditLines(FRichEdit);

  {init inherited properties}
  AutoSize    := False;
  spHeight    := 89;
  WordWrap    := True;
  spWidth     := 185;

  CacheRecordSize  := SizeOf(TppCustomRichTextSaveRec);
  DrawCommandClass := TppDrawRichText;


  {note: this is critical, when the Owner sends free notification
         the richtext control must be destroyed to avoid a Delphi design-time AV}
  if (Owner <> nil) then
    Owner.FreeNotification(Self);


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomRichText.Destroy }

destructor TppCustomRichText.Destroy;
begin

 { Destroying;}

  FDrawRichEdit.Free;
  FRichEdit.Free;

  FMetaFile.Free;

  FRichTextStream.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomRichText.Notification }

procedure TppCustomRichText.Notification(aComponent: TComponent; Operation: TOperation);
begin

  inherited Notification(aComponent, Operation);

  if (Operation = opRemove) then
    begin
      if aComponent = FRichEdit then
        FRichEdit := nil;
      if aComponent = FRichEdit then
        FDrawRichEdit := nil;
    end;


  if (Operation = opRemove) and (aComponent = Owner) then
    begin
      FRichEdit := nil;
      FDrawRichEdit := nil;
    end;

end; {procedure, Notification}


{------------------------------------------------------------------------------}
{ TppCustomRichText.BoundsChange }

procedure TppCustomRichText.BoundsChange;
begin

  if not (pppcDesigning in DesignState) or (Printing) then Exit;

  if (Band = nil) then Exit;

  {note: if reading or loading and not pasting}
  if ((csReading in ComponentState) or (csLoading in ComponentState)) and not(pppcPasting in DesignState)  then Exit;

  
  if (FMetaFile <> nil) and (FSaveHeight <> mmHeight) or (FSaveWidth <> mmWidth) then
    begin
      FSaveWidth  := mmWidth;
      FSaveHeight := mmHeight;

      FMetaFile.Width  := Trunc(FromMMThousandths(mmWidth,  utPrinterPixels, pprtHorizontal));
      FMetaFile.Height := Trunc(FromMMThousandths(mmHeight, utPrinterPixels, pprtVertical));

    end;

  {note call this last because it may cause InvalidateDesignControl }
  inherited BoundsChange;

end; {procedure, BoundsChange}

{------------------------------------------------------------------------------}
{ TppCustomRichText.HasFont }

function  TppCustomRichText.HasFont: Boolean;
begin
  Result := False;
end; {function, HasFont}

{------------------------------------------------------------------------------}
{ TppCustomRichText.LinesChanged }

procedure TppCustomRichText.LinesChanged;
begin

  InvalidateDesignControl;

end; {procedure, LinesChanged}

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetRichText }

function TppCustomRichText.GetRichText: String;
var
  lBuf: PChar;
begin

  GetRichTextStream;

  if FRichTextStrings.Count = 0 then
    Result := ''

  else
    begin
      FRichTextStream.Position := 0;

      lBuf := StrAlloc(FRichTextStream.Size + 1);

      FRichTextStream.Read(lBuf^, FRichTextStream.Size);

      lBuf[FRichTextStream.Size] := #0;

      Result := String(lBuf);

      StrDispose(lBuf);

    end;

end; {function, GetRichText}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetRichText }

procedure TppCustomRichText.SetRichText(Value: String);
var
  lBuf: PChar;
  lStream: TMemoryStream;
begin
  // do not use FRichTextStream here, this is required to support Undo
  lStream := TMemoryStream.Create;

  try
    lBuf := PChar(Value);

    lStream.Write(lBuf^, StrLen(lBuf));
    lStream.Position := 0;

    LoadFromRTFStream(lStream);

  finally
    lStream.Free;

  end;

end; {procedure, SetRichText}

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetRichTextStream }

function TppCustomRichText.GetRichTextStream: TMemoryStream;
begin
  Result := FRichTextStream;
end; {function, GetRichTextStream}

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetPlainText }

function TppCustomRichText.GetPlainText: String;
begin
  SelectAll;

  Result := SelText;
end; {function, GetPlainText}

{------------------------------------------------------------------------------}
{ TppCustomRichText.LoadDrawRichEdit}

procedure TppCustomRichText.LoadDrawRichEdit;
var
  lStream: TStream;
begin

  if not(FMailMerge) then Exit;

  lStream := TMemoryStream.Create;

  try
    ppGetRichEditLines(FRichEdit).SaveToStream(lStream);
    lStream.Position := 0;

    {access property, this forces the creation of FDrawRichEdit}
    ppGetRichEditLines(GetDrawRichEdit).LoadFromStream(lStream);
    
  finally
    lStream.Free;
  end;

end; {procedure, LoadDrawRichEdit}

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetDrawRichEdit }

function TppCustomRichText.GetDrawRichEdit: TCustomRichEdit;
begin

  if not(FMailMerge) then
    Result := TCustomRichEdit(FRichEdit)
  else
    begin
      if (FDrawRichEdit = nil) then
        begin
          FDrawRichEdit := ppCreateRichEdit(Self);
          FDrawRichEdit.Visible := False;
        end;

      ppSetOrdPropValue(FDrawRichEdit, 'MaxLength', GetMaxLength);

      Result := FDrawRichEdit;
    end;

end; {function, GetDrawRichEdit}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetMailMerge }

procedure TppCustomRichText.SetMailMerge(aValue: Boolean);
begin

  FMailMerge := aValue;

  Reset;

end; {procedure, SetMailMerge}

{------------------------------------------------------------------------------}
{ TppCustomRichText.LoadRichText }

procedure TppCustomRichText.LoadRichText;
begin

end;  {procedure, LoadRichText}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetColor }

procedure TppCustomRichText.SetColor(aColor: TColor);
begin

{  FRichEdit.Color := aColor;}

  inherited SetColor(aColor);

end; {procedure, SetColor}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetRichTextStrings }

procedure TppCustomRichText.SetRichTextStrings(Value: TStrings);
begin

  if csReading in ComponentState then Exit;

  FRichTextStrings.Assign(Value);

  LoadRichText;

end; {procedure, SetRichTextStrings}

{------------------------------------------------------------------------------}
{ TppCustomRichText.RestoreFromCache }

procedure TppCustomRichText.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppCustomRichTextSaveRec;
begin

  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent     := lRec.FDrawComponent;
  DrawShifter       := lRec.FDrawShifter;
  KeptTogether      := lRec.FKeptTogether;
  ObjectIndex       := lRec.FObjectIndex;
  OverFlow          := lRec.FOverFlow;
  PartialGeneration := lRec.FPartialGeneration;

  FStartCharPos  := lRec.FStartCharPos;
  FEndCharPos    := lRec.FEndCharPos;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppCustomRichText.SaveToCache }

procedure TppCustomRichText.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppCustomRichTextSaveRec;
begin                 

  lRec.FDrawComponent     := DrawComponent;
  lRec.FDrawShifter       := DrawShifter;
  lRec.FKeptTogether      := KeptTogether;
  lRec.FObjectIndex       := ObjectIndex;
  lRec.FOverFlow          := OverFlow;
  lRec.FPartialGeneration := PartialGeneration;

  lRec.FStartCharPos  := FStartCharPos;
  lRec.FEndCharPos    := FEndCharPos;

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppCustomRichText.PropertiesToDrawCommand }

procedure TppCustomRichText.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawCommand: TppDrawRichText;

begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawRichText) then Exit;

  lDrawCommand := TppDrawRichText(aDrawCommand);

  lDrawCommand.Color      := Color;
  lDrawCommand.Left       := PrintPosRect.Left;
  lDrawCommand.Top        := PrintPosRect.Top;
  lDrawCommand.Height     := PrintPosRect.Bottom - PrintPosRect.Top;
  lDrawCommand.Width      := PrintPosRect.Right - PrintPosRect.Left;
  lDrawCommand.StartCharPos := FStartCharPos;
  lDrawCommand.EndCharPos   := FEndCharPos;
  lDrawCommand.Transparent  := Transparent;

  ppGetRichEditLines(DrawRichEdit).SaveToStream(lDrawCommand.RichTextStream);

  {used to indicate to the Paint method that it needs to call LoadRichText prior to painting}
  FReloadAfterPrinting := True;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppCustomRichText.CalcSpaceUsed }

procedure TppCustomRichText.CalcSpaceUsed;
var
  liSpaceUsed: Longint;
  liLastFittedChar: Longint;
  lCharRange: TCharRange;
  lDestRect: TRect;
  lPrinter: TppPrinter;
  lbRangeFit: Boolean;
  lDC: HDC;
begin

  lPrinter := GetPrinter;

  GetRichText;

  LoadDrawRichEdit;

  MergeDBFields;
  
  if ParentStretch and Stretch then
    begin

      {reduce height for any area already printed}
      if OverFlow then
        FStartCharPos := FEndCharPos + 1
      else
        FStartCharPos := 0;

      lbRangeFit  := True;
      liSpaceUsed := 0;

      DrawRichEdit.SelectAll;
      {char range is 0 based, therefore need to subtract one from SelLength}
      FEndCharPos := DrawRichEdit.SelLength-1;

      {check whether text fits within the space available }
      if (DrawRichEdit.SelLength > 0) and (DrawRichEdit.SelText <> '') then
        begin
          lCharRange.cpMin := FStartCharPos;
          lCharRange.cpMax := FEndCharPos;

          {convert print rect space available to printer pixels}
          lDestRect.Left   := Trunc(ppFromMMThousandths(PrintPosRect.Left, utPrinterPixels, pprtHorizontal, lPrinter));
          lDestRect.Top    := Trunc(ppFromMMThousandths(PrintPosRect.Top, utPrinterPixels, pprtVertical, lPrinter));
          lDestRect.Right  := Trunc(ppFromMMThousandths(PrintPosRect.Right, utPrinterPixels, pprtHorizontal, lPrinter));
          lDestRect.Bottom := Trunc(ppFromMMThousandths(PrintPosRect.Bottom, utPrinterPixels, pprtVertical, lPrinter));

          if (lPrinter <> nil) and (lPrinter.DC <> 0) then
            lDC := lPrinter.DC
          else
            lDC := GetDC(0);

          lbRangeFit := TppRTFEngine.CheckRangeFit(DrawRichEdit, lDC, lCharRange, lDestRect, liLastFittedChar, liSpaceUsed);

          if (lPrinter = nil) or (lPrinter.DC = 0) then
            ReleaseDC(0, lDC);
        end;


      {if range still does not fit then there is an overflow situation}
      if not lbRangeFit then
        begin

          {update EndCharPos, since it can't all fit on this page}
          FEndCharPos := liLastFittedChar;

          if FEndCharPos < 0 then
            begin
              FStartCharPos := -1;
              FEndCharPos := -1;
            end
          else
            begin
              OverFlow := True;
              SpaceUsed := ppToMMThousandths(liSpaceUsed, utPrinterPixels, pprtVertical, lPrinter);

              if ShouldKeepTogether then
                begin
                  SpaceUsed := 0;
                  KeptTogether := True;
                  FStartCharPos := -1;
                  FEndCharPos := -1;
                end;
            end;

        end

      else
        begin

          {memo is done printing, turn overflow off}
          OverFlow := False;

          if (FEndCharPos >= 0) then
            SpaceUsed := ppToMMThousandths(liSpaceUsed, utPrinterPixels, pprtVertical, lPrinter);

          if (KeptTogether) then
            KeptTogether := False;

        end; {if, need to calc StartCharPos, EndCharPos}

    end

  else  {static memo }
    begin

      FStartCharPos := 0;

      DrawRichEdit.SelectAll;
      FEndCharPos := DrawRichEdit.SelLength;

      SpaceUsed := mmHeight;

    end; {if, Stretch is true}

end; {function, CalcSpaceUsed}

{------------------------------------------------------------------------------}
{ TppCustomRichText.MergeDBFields }

procedure TppCustomRichText.MergeDBFields;
var
  liLength: Integer;
  liFullLength: Integer;
  lFields: TStrings;
  lFieldAliases: TStrings;
  lDataPipeline: TppDataPipeline;
  lsFieldName: String;
  lbFieldFound: Boolean;
  liStartPos: Integer;
  liEndPos: Integer;
  liCharPos: Integer;
  lbSymbolFound: Boolean;
  liIndex: Integer;
begin

  if not(FMailMerge) then Exit;

  lDataPipeline := Band.Report.DataPipeline;

  if (lDataPipeline = nil) then
    begin
      MergeTaggedDBFields;
      Exit;
    end;

  lFields := TStringList.Create;
  lFieldAliases := TStringList.Create;

  lDataPipeline.GetFieldNames(lFields);
  lDataPipeline.GetFieldAliases(lFieldAliases);

  FDrawRichEdit.SelectAll;
  liFullLength := FDrawRichEdit.SelLength;

  lbSymbolFound := True;

  liCharPos := 0;
  liLength := 0;

  while lbSymbolFound do
    begin

      {find the text}
      liStartPos := FDrawRichEdit.FindText('<', liCharPos, liFullLength, []);
      liEndPos := FDrawRichEdit.FindText('>', liCharPos, liFullLength, []);

      lbFieldFound := False;

      {replace the text with the data}
      if ((liStartPos > -1) and (liEndPos > -1)) and (liEndPos > liStartPos) then
        begin
          liLength := liEndPos - liStartPos;

          FDrawRichEdit.SelStart   := liStartPos;
          FDrawRichEdit.SelLength  := liLength + 1;

          lsFieldName := Copy(FDrawRichEdit.SelText, 2, liLength - 1);

          
          lbFieldFound := (lFields.IndexOf(lsFieldName) <> -1);

          if not(lbFieldFound) then
            begin
              liIndex := lFieldAliases.IndexOf(lsFieldName);

              lbFieldFound := (liIndex <> -1);

              if (lbFieldFound) then
                lsFieldName := lFields[liIndex];
            end;

          if lbFieldFound then
            begin
              FDrawRichEdit.SelText := lDataPipeline.GetFieldAsString(lsFieldName);

              liLength := Length(FDrawRichEdit.SelText);

              FDrawRichEdit.SelectAll;
              liFullLength := FDrawRichEdit.SelLength;
            end;

        end;

        if lbFieldFound then
          liCharPos := liStartPos + liLength

        else if (liEndPos > -1) and (liStartPos > -1) then
          begin
            if (liStartPos < liEndPos) then
              liCharPos := liStartPos + 1
            else
              liCharPos := liEndPos + 1;
          end

        else if (liEndPos > -1) then
          liCharPos := liEndPos + 1

        else if (liStartPos > -1) then
          liCharPos := liStartPos + 1

        else
          lbSymbolFound := False;

    end;

   lFields.Free;
   lFieldAliases.Free;

   MergeTaggedDBFields;

end; {procedure, MergeDBFields}

{------------------------------------------------------------------------------}
{ TppCustomRichText.MergeTaggedDBFields }

procedure TppCustomRichText.MergeTaggedDBFields;
var
  lbSymbolFound: Boolean;
  lsCode: String;
  lsData: String;
  liStartPos: Integer;
  liEndPos: Integer;
  liCharPos: Integer;
  liFullLength: Integer;
  liCodeLength: Integer;
  lMergeInfo: TppMergeInfo;
begin

  lbSymbolFound := True;

  FDrawRichEdit.SelectAll;
  liFullLength := FDrawRichEdit.SelLength;
  
  liCharPos := 0;

  while lbSymbolFound do
    begin
      liStartPos := FDrawRichEdit.FindText('<DBTEXT', liCharPos, liFullLength, []);
      liEndPos := FDrawRichEdit.FindText('</DBTEXT>', liCharPos, liFullLength, []);

      if (liStartPos = -1) or (liEndPos = -1) then
        lbSymbolFound := False
      else
        begin
          liCodeLength := liEndPos - liStartPos + 9;

          FDrawRichEdit.SelStart   := liStartPos;
          FDrawRichEdit.SelLength  := liCodeLength;

          lsCode := Copy(FDrawRichEdit.SelText, 1, liCodeLength);

          lMergeInfo := TppMergeInfo.Create;

          try
            ParseMergeCode(lsCode, lMergeInfo);

            lsData := RetrieveMergeData(lMergeInfo);

            FDrawRichEdit.SelText := lsData;

          finally
            lMergeInfo.Free;
          end;

          liCharPos := liStartPos + Length(lsData);

          FDrawRichEdit.SelectAll;
          liFullLength := FDrawRichEdit.SelLength;
          
        end;
    end;


end; {procedure, MergeTaggedDBFields}

{------------------------------------------------------------------------------}
{ TppCustomRichText.ParseMergeCode }

procedure TppCustomRichText.ParseMergeCode(aCode: String; aMergeInfo: TppMergeInfo);
var
  lsOriginalCode: String;
  lsCapsCode: String;
  liTempPos: Integer;
  liPipePos: Integer;
  liTagPos: Integer;
  liFormatPos: Integer;
  liFieldPos: Integer;
  liLength: Integer;
begin

  lsOriginalCode := aCode;
  lsCapsCode := UpperCase(aCode);

  {Find Datapipline Name}
  liTagPos := Pos('DATAPIPELINE', lsCapsCode);

  if liTagPos > 0 then
    begin
      liPipePos := NextPos('''', lsCapsCode, liTagPos) + 1;

      liTempPos := NextPos('''', lsCapsCode, liPipePos);
      liLength := liTempPos - liPipePos;

      aMergeInfo.DataPipeline := Copy(lsOriginalCode, liPipePos, liLength);
    end;

  {Find Display Format}
  liTagPos := Pos('DISPLAYFORMAT', lsCapsCode);

  if liTagPos > 0 then
    begin
      liFormatPos := NextPos('''', lsCapsCode, liTagPos) + 1;

      liTempPos := NextPos('''', lsCapsCode, liFormatPos);
      liLength := liTempPos - liFormatPos;

      aMergeInfo.DisplayFormat := Copy(lsOriginalCode, liFormatPos, liLength);
    end;

  {Find Field Name}
  liFieldPos := Pos('>', lsCapsCode) + 1;
  liTempPos := NextPos('<', lsCapsCode, liFieldPos);

  liLength := liTempPos - liFieldPos;

  aMergeInfo.FieldName := Copy(lsOriginalCode, liFieldPos, liLength);

end; {procedure, ParseMergeCode}

{------------------------------------------------------------------------------}
{ TppCustomRichText.NextPos }

function TppCustomRichText.NextPos(aChar: Char; aString: String; aOffset: Integer): Integer;
var
  liIndex: Integer;
begin

  Result := 0;
  liIndex := aOffset;

  if aOffset <= 1 then
    Result := Pos(aChar, aString)
  else
    begin
      while (Result = 0) and (liIndex <= Length(aString)) do
        begin
          if aString[liIndex] = aChar then
            Result := liIndex;

          Inc(liIndex);
        end;
    end;

end; {procedure, NextPos}

{------------------------------------------------------------------------------}
{ TppCustomRichText.RetrieveMergeData }

function TppCustomRichText.RetrieveMergeData(aMergeInfo: TppMergeInfo): String;
var
  liIndex: Integer;
  lPipelineList: TppDataPipelineList;
  lDataPipeline: TppDataPipeline;
  lbFieldFound: Boolean;
  lFields: TStrings;
  lFieldAliases: TStrings;
  lsFieldName: String;
  lsText: String;
  lDataType: TppDataType;
  lValue: Variant;
begin

  lPipelineList := TppDataPipelineList.Create(Band.Report);

  lDataPipeline := Band.Report.DataPipeline;

  for liIndex := 0 to lPipelineList.Count - 1 do
    begin
      if lPipelineList.GetPipeline(liIndex).Name = aMergeInfo.DataPipeline then
        lDataPipeline := lPipelineList.GetPipeline(liIndex);

    end;

  if lDataPipeline = nil then Exit;

  lsText := '';
  lsFieldName := aMergeInfo.FieldName;

  lFields := TStringList.Create;
  lFieldAliases := TStringList.Create;

  lDataPipeline.GetFieldNames(lFields);
  lDataPipeline.GetFieldAliases(lFieldAliases);

  {Check field names}
  lbFieldFound := (lFields.IndexOf(lsFieldName) <> -1);

  {Check field aliases}
  if not(lbFieldFound) then
    begin
      liIndex := lFieldAliases.IndexOf(lsFieldName);

      lbFieldFound := (liIndex <> -1);

      if (lbFieldFound) then
        lsFieldName := lFields[liIndex];
    end;

  {Get field value and datatype if it is a valid field}
  if lbFieldFound then
    begin
      lValue := lDataPipeline.GetFieldValue(lsFieldName);
      lDataType := lDataPipeline.GetFieldForName(lsFieldName).DataType;

      {Format the text if needed}
      if aMergeInfo.DisplayFormat <> '' then
        lsText := TppDisplayFormat.Format(aMergeInfo.DisplayFormat, lDataType, lValue)
      else if (lValue = Null) then
        lsText := ''
      else
        lsText := lValue;
    end;

  Result := lsText;

end; {procedure, RetrieveMergeData}

{------------------------------------------------------------------------------}
{ TppCustomRichText.Clear }

procedure TppCustomRichText.Clear;
begin

  FRichEdit.Clear;

end; {procedure, Clear}


{@TppCustomRichText.ClearSelection
 Use ClearSelection to delete the selected text from the control. If no text is
 selected, ClearSelection does nothing. If all of the text is selected,
 ClearSelection clears all text.}

procedure TppCustomRichText.ClearSelection;
begin
  FRichEdit.ClearSelection;
end;


{@TppCustomRichText.FindText
 FindText searches a given range in the text for a target string.

 Use FindText to search a range of text in a rich text control for a string. The
 search will start at the position StartPos, where 0 is the first character. Use
 Options to specify whether the search should match whole words only and whether
 the search should be case sensitive. Use FindText rather than programmatically
 searching through the text of the control, to keep from being thrown off by the
 encoding of rich text characteristics.}

function TppCustomRichText.FindText(const SearchStr: string; StartPos, Length: Integer; Options: TSearchTypes):Integer;
begin
  Result := FRichEdit.FindText(SearchStr, StartPos, Length, Options);
end;


{@TppCustomRichText.SelectAll
 Use the SelectAll method to select all of the text in the control.}

procedure TppCustomRichText.SelectAll;
begin
  FRichEdit.SelectAll;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetMaxLength }

function TppCustomRichText.GetMaxLength: Integer;
begin

  Result := ppGetOrdPropValue(FRichEdit, 'MaxLength');

end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetMaxLength }

procedure TppCustomRichText.SetMaxLength(aMaxLength: Integer);
begin
  ppSetOrdPropValue(FRichEdit, 'MaxLength', aMaxLength);

end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetParaAttributes }

function TppCustomRichText.GetParaAttributes: TParaAttributes;
begin
  Result := FRichEdit.Paragraph;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetSelAttributes }

function TppCustomRichText.GetSelAttributes: TTextAttributes;
begin
  Result := FRichEdit.SelAttributes;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetSelLength }

function TppCustomRichText.GetSelLength: Integer;
begin
  Result := FRichEdit.SelLength;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetSelStart }

function TppCustomRichText.GetSelStart: Integer;
begin
  Result := FRichEdit.SelStart;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.GetSelText }

function TppCustomRichText.GetSelText: String;
begin
  Result := FRichEdit.SelText;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetSelLength }

procedure TppCustomRichText.SetSelLength(aValue: Integer);
begin
  FRichEdit.SelLength := aValue;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetSelStart }

procedure TppCustomRichText.SetSelStart(aValue: Integer);
begin
  FRichEdit.SelStart := aValue;
end;

{------------------------------------------------------------------------------}
{ TppCustomRichText.SetSelText }

procedure TppCustomRichText.SetSelText(aString: String);
begin
  FRichEdit.SelText := aString;
end;


{@TppCustomRichText.LoadFromFile
 Use the LoadFromFile method to load .RTF files.}

procedure TppCustomRichText.LoadFromFile(aFileName: String);
var
  lFileStream: TFileStream;
begin
  lFileStream := TFileStream.Create(aFileName, fmOpenRead);

  try
    lFileStream.Position := 0;
    LoadFromRTFStream(lFileStream);
  finally
    lFileStream.Free;
  end;

end; {procedure, LoadFromFile}


{@TppCustomRichText.SaveToFile
 Use the SaveToFile method to save rich text data to .RTF files.}

procedure TppCustomRichText.SaveToFile(aFileName: String);
begin
  FRichTextStrings.SaveToFile(aFileName);
end; {procedure, SaveToFile}


{@TppCustomRichText.LoadFromRTFStream
 Use the LoadFromRTFStream method to load RTF data from streams.}

procedure TppCustomRichText.LoadFromRTFStream(aStream: TStream);
begin
  BeforePropertyChange('RichText');

  if (MaxLength > 0) and (MaxLength < aStream.Size) then
    SetMaxLength(aStream.Size);
  FRichTextStrings.LoadFromStream(aStream);

  InvalidateDesignControl;
  PropertyChange;   {ok to call this here}
  Reset;    {notify report engine}

end; {procedure, LoadFromStream}


{@TppCustomRichText.SaveToRTFStream
 Use the SaveToRTFStream method to save RTF data to streams.}

procedure TppCustomRichText.SaveToRTFStream(aStream: TStream);
begin
  FRichTextStrings.SaveToStream(aStream);
end; {procedure, SaveToRTFStream}


{******************************************************************************
 *
 ** R I C H T E X T
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppRichText.Create }

constructor TppRichText.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FMemStream    := TMemoryStream.Create;

  DefaultPropName     := 'Caption';
  DefaultPropEditType := etAutoEdit;

end; {constructor, Create }

{------------------------------------------------------------------------------}
{ TppRichText.Destroy }

destructor TppRichText.Destroy;
begin

  FMemStream.Free;

  inherited Destroy;

end; {destructor, Destroy }

{------------------------------------------------------------------------------}
{ TppRichText.SetRichTextStrings }

procedure TppRichText.SetRichTextStrings(Value: TStrings);

begin

  inherited SetRichTextStrings(Value);

  Reset;
  PropertyChange;
end; {procedure, GetRichTextStream }

{------------------------------------------------------------------------------}
{ TppRichText.GetRichTextStream }

function TppRichText.GetRichTextStream: TMemoryStream;
begin

  LoadRichText;

  Result := inherited GetRichTextStream;

end; {procedure, GetRichTextStream}


{------------------------------------------------------------------------------}
{ TppRichText.LoadRichText }

procedure TppRichText.LoadRichText;
begin

  FRichTextStream.Clear;

  FRichTextStrings.SaveToStream(FRichTextStream);
  FRichTextStream.Position := 0;

  InvalidateDesignControl;

end; {procedure, LoadRichText}


{******************************************************************************
 *
 ** D B R I C H T E X T
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppDBRichText.Create }

constructor TppDBRichText.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FAutoDisplay            := True;
  FOnGetRichText          := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDBRichText.Destroy }

destructor TppDBRichText.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDBRichText.SetAutoDisplay }

procedure TppDBRichText.SetAutoDisplay(aValue: Boolean);
begin

  FAutoDisplay := aValue;
  
  if FAutoDisplay then
    LoadRichText
  else
    begin
      FRichTextStream.Clear;
      FRichTextStrings.Clear;
    end;

  InvalidateDesignControl;

end; {procedure, SetAutoDisplay}

{------------------------------------------------------------------------------}
{ TppDBRichText.GetRichTextStream }

function TppDBRichText.GetRichTextStream: TMemoryStream;
var
  lsText: String;
  lParams: TraParamList;
begin

  lsText := '';

  if Assigned(FOnGetRichText) then
    begin
      FOnGetRichText(Self, lsText);

      SetRichText(lsText);
    end
  else
    begin

      lParams := TraTppDBRichTextRTTI.GetParams('OnGetRichText');
      lParams.CreateValuePointer(0, lsText);

      SendEventNotify(Self, ciComponentGetText, lParams);

      lParams.Free;

      if (lsText <> '') then
        SetRichText(lsText)
      else
        LoadRichText;

    end;

  Result := inherited GetRichTextStream;

end; {function, GetRichTextStream}

{------------------------------------------------------------------------------}
{ TppDBRichText.LoadRichText }

procedure TppDBRichText.LoadRichText;
begin

  if not(FAutoDisplay) then Exit;

  if not(CheckForPipelineData) then Exit;

  try
    SetRichText(DataPipeline.GetFieldAsString(DataField));
  except
    {'Error Loading RichText'}
    SetRichText(ppLoadStr(414));
  end; {try, except}

  InvalidateDesignControl;

end; {procedure, LoadRichText}

{------------------------------------------------------------------------------}
{ TppDBRichText.Notify }

procedure TppDBRichText.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (csDestroying in ComponentState) then Exit;

  if (aOperation in [ppopDataChange, ppopRemove]) and (pppcDesigning in DesignState) and not(Printing) then
    LoadRichText;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDBRichText.IsDataAware }

function TppDBRichText.IsDataAware: Boolean;
begin
  Result := True;

end; {function, IsDataAware}

{------------------------------------------------------------------------------}
{ TppDBRichText.SetDataField }

procedure TppDBRichText.SetDataField(const Value: string);
begin

  inherited SetDataField(Value);

  {display the text}
  LoadRichText;

  PropertyChange;

end; {procedure, SetDataField}

{******************************************************************************
 *
 ** M E R G E  C O D E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDBRichText.Create }

constructor TppMergeInfo.Create;
begin
  inherited Create;

  FDataPipeline := '';
  FDisplayFormat := '';
  FFieldName := '';

end; {procedure, Create}

{------------------------------------------------------------------------------}
{ TppDBRichText.SetDataPipeline }

procedure TppMergeInfo.SetDataPipeline(const Value: String);
begin
  FDataPipeline := Value;

end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppDBRichText.SetDisplayFormat }

procedure TppMergeInfo.SetDisplayFormat(const Value: String);
begin
  FDisplayFormat := Value;

end; {procedure, SetDisplayFormat}

{------------------------------------------------------------------------------}
{ TppDBRichText.SetFieldName }

procedure TppMergeInfo.SetFieldName(const Value: String);
begin
  FFieldName := Value;

end; {procedure, SetFieldName}



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
 ** C U S T O M   R I C H T E X T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.CallMethod }

class function TraTppCustomRichTextRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lRichText: TppCustomRichText;
  lString: String;
  liStartPos: Integer;
  liLength: Integer;
  lOptions: TSearchTypes;
  liResult: Integer;
  lStream: Integer;
  lbWholeWord: Boolean;
  lbMatchCase: Boolean;
begin

  Result := True;

  lRichText := TppCustomRichText(aObject);

  if ppEqual(aMethodName, 'FindText') then
    begin
      aParams.GetParamValue(0, lString);
      aParams.GetParamValue(1, liStartPos);
      aParams.GetParamValue(2, liLength);
      aParams.GetParamValue(3, lbWholeWord);
      aParams.GetParamValue(4, lbMatchCase);

      if lbWholeWord then
        Include(lOptions, stWholeWord);

      if lbMatchCase then
        Include(lOptions, stMatchCase);

      liResult := lRichText.FindText(lString, liStartPos, liLength, lOptions);

      aParams.SetParamValue(5, liResult);
    end

  else if ppEqual(aMethodName, 'LoadFromFile') then
    begin
      aParams.GetParamValue(0, lString);

      lRichText.LoadFromFile(lString);
    end

  else if ppEqual(aMethodName, 'LoadFromRTFStream') then
    begin
      aParams.GetParamValue(0, lStream);

      lRichText.LoadFromRTFStream(TStream(lStream));
    end

  else if ppEqual(aMethodName, 'SaveToFile') then
    begin
      aParams.GetParamValue(0, lString);

      lRichText.SaveToFile(lString);
    end

  else if ppEqual(aMethodName, 'SaveToRTFStream') then
    begin
      aParams.GetParamValue(0, lStream);

      lRichText.SaveToRTFStream(TStream(lStream));
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.GetParams }

class function TraTppCustomRichTextRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (ppEqual(aMethodName, 'OnGetRichText')) or (ppEqual(aMethodName, 'OnGetRichText')) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Text', daString, nil, '', False, True);
    end

  else if ppEqual(aMethodName, 'FindText') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('SearchStr', daString, nil, '', True, False);
      Result.AddParam('StartPos', daInteger, nil, '', False, False);
      Result.AddParam('Length', daInteger, nil, '', False, False);
      Result.AddParam('WholeWord', daBoolean, nil, '', False, False);
      Result.AddParam('MatchCase', daBoolean, nil, '', False, False);
      Result.AddParam('Result', daInteger, nil, '', False, False);
    end

  else if ppEqual(aMethodName, 'LoadFromFile') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aFileName', daString, nil, '', False, False);
    end

  else if ppEqual(aMethodName, 'LoadFromRTFStream') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aStream', daClass, TStream, '', False, False);
    end

  else if ppEqual(aMethodName, 'SaveToFile') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aFileName', daString, nil, '', False, False);
    end

  else if ppEqual(aMethodName, 'SaveToRTFStream') then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aStream', daClass, TStream, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function GetParams}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.RefClass }

class function TraTppCustomRichTextRTTI.RefClass: TClass;
begin
  Result := TppCustomRichText;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.GetPropList }

class procedure TraTppCustomRichTextRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddProp('PlainText');

  {add public methods}
  aPropList.AddMethod('FindText');
  aPropList.AddMethod('LoadFromFile');
  aPropList.AddMethod('LoadFromRTFStream');
  aPropList.AddMethod('SaveToFile');
  aPropList.AddMethod('SaveToRTFStream');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.GetPropRec }

class function TraTppCustomRichTextRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'OnGetRichText') = 0) then
    EventToRec(aPropName, ciComponentGetText, True, aPropRec)

  else if (CompareText(aPropName, 'EndCharPos') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'RichText') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'RichTextStream') = 0) then
    ClassPropToRec(aPropName, TMemoryStream, True, aPropRec)

  else if (CompareText(aPropName, 'RichTextStrings') = 0) then
    ClassPropToRec(aPropName, TStrings, True, aPropRec)

  else if (CompareText(aPropName, 'StartCharPos') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'Paragraph') = 0) then
    ClassPropToRec(aPropName, TParaAttributes, True, aPropRec)

  else if (CompareText(aPropName, 'PlainText') = 0) then
    PropToRec(aPropName, daString, True, aPropRec)

  else if (CompareText(aPropName, 'SelAttributes') = 0) then
    ClassPropToRec(aPropName, TTextAttributes, True, aPropRec)

  else if (CompareText(aPropName, 'SelLength') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'SelStart') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'SelText') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else  if (CompareText(aPropName, 'FindText') = 0) or
           (CompareText(aPropName, 'LoadFromFile') = 0) or
           (CompareText(aPropName, 'LoadFromRTFStream') = 0) or
           (CompareText(aPropName, 'SaveToFile') = 0) or
           (CompareText(aPropName, 'SaveToRTFStream') = 0) then

    MethodToRec(aPropName, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.GetPropValue }

class function TraTppCustomRichTextRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'EndCharPos') = 0) then
    Integer(aValue) := TppCustomRichText(aObject).EndCharPos

  else if (CompareText(aPropName, 'RichText') = 0) then
    String(aValue) := TppCustomRichText(aObject).RichText

  else if (CompareText(aPropName, 'RichTextStream') = 0) then
    Integer(aValue) := Integer(TppCustomRichText(aObject).RichTextStream)

  else if (CompareText(aPropName, 'RichTextStrings') = 0) then
    Integer(aValue) := Integer(TppCustomRichText(aObject).RichTextStrings)

  else if (CompareText(aPropName, 'StartCharPos') = 0) then
    Integer(aValue) := TppCustomRichText(aObject).StartCharPos

  else if (CompareText(aPropName, 'Paragraph') = 0) then
    Integer(aValue) := Integer(TppCustomRichText(aObject).Paragraph)

  else if (CompareText(aPropName, 'PlainText') = 0) then
    String(aValue) := TppCustomRichText(aObject).PlainText

  else if (CompareText(aPropName, 'SelAttributes') = 0) then
    Integer(aValue) := Integer(TppCustomRichText(aObject).SelAttributes)

  else if (CompareText(aPropName, 'SelLength') = 0) then
    Integer(aValue) := TppCustomRichText(aObject).SelLength

  else if (CompareText(aPropName, 'SelStart') = 0) then
    Integer(aValue) := TppCustomRichText(aObject).SelStart

  else if (CompareText(aPropName, 'SelText') = 0) then
    String(aValue) := TppCustomRichText(aObject).SelText

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomRichTextRTTI.SetPropValue }

class function TraTppCustomRichTextRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'RichText') = 0) then
    TppCustomRichText(aObject).RichText := String(aValue)

  else if (CompareText(aPropName, 'SelLength') = 0) then
    TppCustomRichText(aObject).SelLength := Integer(aValue)

  else if (CompareText(aPropName, 'SelStart') = 0) then
    TppCustomRichText(aObject).SelStart := Integer(aValue)

  else if (CompareText(aPropName, 'SelText') = 0) then
    TppCustomRichText(aObject).SelText := String(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** D B   R I C H T E X T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDBRichTextRTTI.RefClass }

class function TraTppDBRichTextRTTI.RefClass: TClass;
begin
  Result := TppDBRichText;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppDBRichTextRTTI.GetPropList }

class procedure TraTppDBRichTextRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppDBRichTextRTTI.GetPropRec }

class function TraTppDBRichTextRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'AutoDisplay') = 0 then
     PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDBRichTextRTTI.GetPropValue }

class function TraTppDBRichTextRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'AutoDisplay') = 0 then
    Boolean(aValue) := TppDBRichText(aObject).AutoDisplay

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppDBRichTextRTTI.SetPropValue }

class function TraTppDBRichTextRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'AutoDisplay') = 0 then
    TppDBRichText(aObject).AutoDisplay := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}



initialization

  raRegisterRTTI(TraTppCustomRichTextRTTI);
  raRegisterRTTI(TraTppDBRichTextRTTI);

finalization

  raUnRegisterRTTI(TraTppCustomRichTextRTTI);
  raUnRegisterRTTI(TraTppDBRichTextRTTI);

end.

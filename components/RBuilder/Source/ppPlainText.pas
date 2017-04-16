{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit ppPlainText;

interface

uses
  Windows, Graphics, Classes,
  ppTypes;

type

  TppCharSet = set of Char;


  TppPlainText = class
    private
      class function AddBreakCharsToSingleWord(aString: String; var aBreakCharCount, aStartCharCounter, aEndCharCounter: Integer): String;

    public
      class procedure ConvertTabStopPos(aUnits: TppUnitType; aTabList: TStrings; var aTabArray: TppTabStopPos; var aSize: Integer; aPrinter: TObject);
      class function GetTabbedTextWidth(aCanvas: TCanvas; const aString: String; aTabStopCount: Integer; aTabStopArray: TppTabStopPos): Integer;
      class function MaxLinesFit(aFont: TFont; aLeading: Longint; aSpaceAvailable: Longint; aPrinter: TObject; var aLineHeight: Longint): Integer;
      class procedure SetCanvasToJustify(aCanvas: TCanvas; aRect: TRect; var aString: String; aTabStopCount: Integer; aTabStopArray: TppTabStopPos);
      class function StringStrip(const aString, aStripString: String): String;
      class procedure WordWrap(const aText: String; aRect: TppRect; aTextAlignment: TppTextAlignment; aAutoSize: Boolean; aFont: TFont; aCharWrap: Boolean; aLeading: Integer; aTabStops: TStrings; aPrinter: TObject; var aCharPos: Integer; aWrappedText: TStrings);
      class function WordCount(const aString: String): Integer;
      class function WordCountByDelimeter(const aString: String; const aDelimeters: TppCharSet): Integer;
      class function WordByIndex(const aString: String; aIndex: Integer): String;
      class function WordByIndexByDelimeter(const aString: String; aIndex: Integer; const aDelimeters: TppCharSet): String;
      class function WordPosition(const aWordIndex: Integer; const aString: string; const aDelimeters: TppCharSet): Integer;
      class function RemoveExtraSpaces(const aString: string): String;
  end;

  TppTextMarkups = class
    public
      class function Tab: Char;
      class function CR: Char;
      class function LF: Char;
      class function CRLF: String;
      class function Null: Char;
      class function EOP: String;
      class function Space: Char;
  end;

implementation

uses
  SysUtils,
  ppPrintr, ppUtils;

{******************************************************************************
 *
 **  T E X T   M A R K U P S
 *
{******************************************************************************}

class function TppTextMarkups.Tab: Char;
begin
  Result := #9;
end;

class function TppTextMarkups.CR: Char;
begin
  Result := #13;
end;

class function TppTextMarkups.LF: Char;
begin
  Result := #10;
end;

class function TppTextMarkups.CRLF: String;
begin
  Result := #13#10;
end;

class function TppTextMarkups.Null: Char;
begin
  Result := #0;
end;

class function TppTextMarkups.EOP: String;
begin
  Result := #36#182;
end;

class function TppTextMarkups.Space: Char;
begin
  Result := #32;
end;

{******************************************************************************
 *
 **  P L A I N   T E X T   P A R S E R
 *
{******************************************************************************}

type

  TppPlainTextParser = class
    private
      FCharPos: Integer;
      FAllWordsParsed: Boolean;
      FText: String;
      FTextLength: Integer;

      function GetNextWord: String;
      procedure SetText(const aText: String);
      procedure SetCharPos(aCharPos: Integer);

    public
      constructor Create;
      destructor Destroy; override;

      property CharPos: Integer read FCharPos write SetCharPos;
      property NextWord: String read GetNextWord;
      property Text: String read FText write SetText;
      property TextLength: Integer read FTextLength;

  end;

{@TppPlainTextParser.Create}

constructor TppPlainTextParser.Create;
begin

  inherited Create;

  FCharPos := 0;
  FAllWordsParsed := False;
  FText := '';

end;

{@TppPlainTextParser.Destroy}

destructor TppPlainTextParser.Destroy;
begin
  inherited Destroy;
end;

{@TppPlainTextParser.SetText}

procedure TppPlainTextParser.SetText(const aText: String);
begin
  FText := aText;

  FTextLength := Length(FText);

  FCharPos := 0;

  FAllWordsParsed := False;
end;

{@TppPlainTextParser.SetCharPos}

procedure TppPlainTextParser.SetCharPos(aCharPos: Integer);
begin
  FCharPos := aCharPos;
  FAllWordsParsed := (FCharPos > FTextLength);
end;

{TppPlainTextParser.GetNextWord}

function TppPlainTextParser.GetNextWord: String;
var
  lbEndOfWord: Boolean;
  lCharacter: Char;
  lsWord: String;
begin

  lsWord := '';
  lbEndOfWord := False;

  while not(lbEndOfWord) and not(FAllWordsParsed) do
    begin
      {move to next position in the text}
      Inc(FCharPos);

      {reached end of the text}
      if (FCharPos > FTextLength) then
        FAllWordsParsed := True
      else
        begin

          lCharacter := FText[FCharPos];

          if (lCharacter = TppTextMarkups.Null) then
            FAllWordsParsed := True

          else if (lCharacter = TppTextMarkups.Space) then
            begin
              lbEndOfWord := True;

              if (lsWord = '') then
                lsWord := TppTextMarkups.Space
              else
                Dec(FCharPos);
            end

          else if (lCharacter = TppTextMarkups.CR) then
            begin
              lbEndOfWord := True;

              if (lsWord <> '') then
                Dec(FCharPos)

              else
                begin

                  if ((FCharPos + 1) <= FTextLength) and (FText[FCharPos + 1] = TppTextMarkups.LF) then
                    Inc(FCharPos);

                  {skip over the LF char since it was found immediately following CR}
                  if (FCharPos <= FTextLength) then
                    lsWord := TppTextMarkups.CRLF;

                end;

            end

          else if (lCharacter = TppTextMarkups.LF) then
            begin
              lbEndOfWord := True;

              if (lsWord <> '') then
                Dec(FCharPos)

              else if (FCharPos <= FTextLength) then
                lsWord := TppTextMarkups.CRLF;

            end

          else if (lCharacter = TppTextMarkups.Tab) then
            begin
              lbEndOfWord := True;

              if (lsWord = '') then
                lsWord := TppTextMarkups.Tab
              else
                Dec(FCharPos);
              end

          else if ((FCharPos + 1) <= FTextLength) and (lCharacter + FText[FCharPos + 1] = TppTextMarkups.EOP) then
            begin
              lbEndOfWord := True;

              if (lsWord <> '') then
                Dec(FCharPos)

              else
                begin
                  Inc(FCharPos);

                  lsWord := TppTextMarkups.CRLF;
                end;

            end

          else
            lsWord := lsWord + lCharacter;

        end;

    end;

  Result := lsWord;

end;


{******************************************************************************
 *
 **  T E X T   W R A P P E R
 *
{******************************************************************************}

type

  TppTextWrapper = class
    private
      FAlignment: TppTextAlignment;
      FAreaAvailable: TppRect;
      FAutoSize: Boolean;
      FCharPos: Integer;
      FCharWrap: Boolean;
      FFont: TFont;
      FLeading: Integer;
      FTabs: TStrings;
      FTabStopCount: Integer;
      FTabStopArray: TppTabStopPos;
      FText: String;
      FPrinter: TppPrinter;
      FWrappedText: TStrings;

      FCanvas: TCanvas;
      FLineHeight: Integer;
      FMaximumLineWidth: Integer;
      FTextParser: TppPlainTextParser;
      FTrimLeadingSpaces: Boolean;
      FWidthAvailable: Integer;

      procedure SetTabs(aTabs: TStrings);

      procedure AddLine(const aLine: String);
      procedure AddLastWordToLine(const aLine: String; var aRemainingChars, aNextWord: String);
      function CalcTextWidth(const aText: String): Integer;
      procedure ReadNextWord(var aLine, aRemainingChars, aNextWord: String);
      procedure WrapCharacters(const aLine: String; var aNextWord, aRemainingChars: String);
      procedure WrapText;

    public
      constructor Create;
      destructor Destroy; override;

      procedure Wrap;

      property Alignment: TppTextAlignment read FAlignment write FAlignment;
      property AreaAvailable: TppRect read FAreaAvailable write FAreaAvailable;
      property AutoSize: Boolean read FAutoSize write FAutoSize;
      property CharPos: Integer read FCharPos write FCharPos;
      property CharWrap: Boolean read FCharWrap write FCharWrap;
      property Font: TFont read FFont write FFont;
      property Leading: Integer read FLeading write FLeading;
      property Tabs: TStrings read FTabs write SetTabs;
      property Text: String read FText write FText;
      property Printer: TppPrinter read FPrinter write FPrinter;
      property WrappedText: TStrings read FWrappedText;

  end;

{ TppTextWrapper.Create }

constructor TppTextWrapper.Create;
begin

  inherited Create;

  FAlignment := taLeftJustified;
  FAreaAvailable := ppRect(0, 0, 0, 0);
  FAutoSize := False;
  FCharPos := 0;
  FCharWrap := False;
  FFont := nil;
  FLeading := 0;
  FTabs := nil;
  FTabStopCount := 0;
  FText := '';
  FPrinter := nil;
  FWrappedText := TStringList.Create;

  FTextParser := TppPlainTextParser.Create;
  FCanvas := nil;
  FLineHeight := 0;
  FMaximumLineWidth := 0;

end;

{ TppTextWrapper.Destroy }

destructor TppTextWrapper.Destroy;
begin

  FTabs.Free;
  FTextParser.Free;
  FWrappedText.Free;

  inherited Destroy;

end;

{ TppTextWrapper.SetTabs }

procedure TppTextWrapper.SetTabs(aTabs: TStrings);
begin

  if (FTabs = nil) and (aTabs <> nil) and (aTabs.Count > 0) then
    begin
      FTabs := TStringList.Create;

      FTabs.Assign(aTabs);
    end;

end;

{@TppTextWrapper.Wrap}

procedure TppTextWrapper.Wrap;
var
  lBitmap: TBitmap;
  liThreshold: Integer;
begin

  FWrappedText.Clear;

  if (FPrinter <> nil) then
    begin
      lBitmap := nil;

      FCanvas := FPrinter.Canvas;
      FCanvas.Font := FFont;

      FLineHeight := FCanvas.TextHeight('W');
      FLineHeight := ppToMMThousandths(FLineHeight, utPrinterPixels, pprtVertical, FPrinter) + FLeading;

      if (FTabs <> nil) then
        TppPlainText.ConvertTabStopPos(utPrinterPixels, FTabs, FTabStopArray, FTabStopCount, FPrinter);

      if FAutoSize then
        begin
          liThreshold := FCanvas.TextWidth(TppTextMarkups.Space);
          liThreshold := ppToMMThousandths(liThreshold, utPrinterPixels, pprtVertical, nil);
          liThreshold := Round(liThreshold * 0.3);
        end
      else
        liThreshold := 0;

    end
  else
    begin
      lBitmap := TBitmap.Create;

      FCanvas := lBitmap.Canvas;
      FCanvas.Font := FFont;

      FLineHeight := FCanvas.TextHeight('W');
      FLineHeight := ppToMMThousandths(FLineHeight, utScreenPixels, pprtVertical, nil) + FLeading;

      if (FTabs <> nil) then
        TppPlainText.ConvertTabStopPos(utScreenPixels, FTabs, FTabStopArray, FTabStopCount, FPrinter);

      if FAutoSize then
        begin
          liThreshold := FCanvas.TextWidth(TppTextMarkups.Space);
          liThreshold := ppToMMThousandths(liThreshold, utScreenPixels, pprtVertical, nil);
          liThreshold := Round(liThreshold * 0.3);
        end
      else
        liThreshold := 0;

    end;


  if ((FAreaAvailable.Top + FLineHeight) < FAreaAvailable.Bottom) then
    begin
      FTextParser.Text := FText;
      FTextParser.CharPos := FCharPos;

      if (FCharPos = 0) then
        FTrimLeadingSpaces := False
      else
        FTrimLeadingSpaces := True;

      FMaximumLineWidth := 0;
      FWidthAvailable := (FAreaAvailable.Right - FAreaAvailable.Left) + liThreshold;

      WrapText;
    end;

  lBitmap.Free;

end;

{ TppTextWrapper.CalcTextWidth }

function TppTextWrapper.CalcTextWidth(const aText: String): Integer;
begin

  if (Pos(TppTextMarkups.Tab, aText) <> 0) then
    Result := TppPlainText.GetTabbedTextWidth(FCanvas, aText, FTabStopCount, FTabStopArray)
  else
    Result := FCanvas.TextWidth(aText);

  if (FPrinter <> nil) then
    Result := ppToMMThousandths(Result, utPrinterPixels, pprtHorizontal, FPrinter)
  else
    Result := ppToMMThousandths(Result, utScreenPixels, pprtHorizontal, nil)

end;

{ TppTextWrapper.WrapText }

procedure TppTextWrapper.WrapText;
var
  lbLineAdded: Boolean;
  lbDone: Boolean;
  liLineWidth: Integer;
  lsNextWord: String;
  lsLine: String;
  lsRemainingChars: String;
  liVerticalSpaceNeeded: Integer;
  liLeadingSpaceCounter: Integer;
begin

  lbLineAdded := False;
  lsLine := '';
  lsNextWord := FTextParser.NextWord;
  lsRemainingChars := '';
  liLeadingSpaceCounter := 0;

  liVerticalSpaceNeeded := (FWrappedText.Count + 1) * FLineHeight;

  if ((FAreaAvailable.Top + liVerticalSpaceNeeded) <= FAreaAvailable.Bottom) then
    lbDone := False
  else
    lbDone := True;

  while (lsNextWord <> '') and not(lbDone) do
    begin

      if (lsNextWord = TppTextMarkups.CRLF) then
        begin
          AddLine(lsLine);

          if (FAlignment = taFullJustified) then
            FWrappedText[FWrappedText.Count - 1] := FWrappedText[FWrappedText.Count - 1] + TppTextMarkups.EOP;

          FCharPos := FTextParser.CharPos;

          lbLineAdded := True;

          lsLine := '';

          lsNextWord := '';

          FTrimLeadingSpaces := False;
          liLeadingSpaceCounter := 0;
        end

      else
        begin
          if (FTrimLeadingSpaces) then
            begin
              if (lsNextWord = TppTextMarkups.Space) then
                begin
                  Inc(liLeadingSpaceCounter);

                  if (liLeadingSpaceCounter > 2) then
                    begin
                      liLeadingSpaceCounter := 0;
                      FTrimLeadingSpaces := False;
                    end;
                end
              else
                begin
                  if (liLeadingSpaceCounter > 0) then
                    lsLine := Copy(lsLine, liLeadingSpaceCounter + 1, Length(lsLine));

                  liLeadingSpaceCounter := 0;
                  FTrimLeadingSpaces := False;
                end;
            end;

          liLineWidth := CalcTextWidth(lsLine + lsNextWord);

          {there is room to print next word on current line}
          if (liLineWidth <= FWidthAvailable) then
            begin
              lsLine := lsLine + lsNextWord;

              lsNextWord := '';
            end

          else
            begin
              AddLastWordToLine(lsLine, lsRemainingChars, lsNextWord);

              lsLine := '';

              lbLineAdded := True;
            end;

        end;

      if lbLineAdded then
        begin
          liVerticalSpaceNeeded := (FWrappedText.Count + 1) * FLineHeight;

          if ((FAreaAvailable.Top + liVerticalSpaceNeeded) > FAreaAvailable.Bottom) then
            begin
              lbDone := True;

              if (Length(lsNextWord) > 0) then
                begin

                  if (lsNextWord = TppTextMarkups.Space) then
                    FCharPos := FTextParser.CharPos - 1
                    
                  else
                    FCharPos := FTextParser.CharPos - Length(lsNextWord) - 1;

                end
            end;

        end;

      if not(lbDone) then
        ReadNextWord(lsLine, lsRemainingChars, lsNextWord);

    end;

  if (FWrappedText.Count = 0) then
    FCharPos := FTextParser.CharPos;

end;

{ TppTextWrapper.WrapCharacters

  This method breaks one word into two words.  The first word fits on the line,
  and the rest of the word that doesn't fit on the current line.}

procedure TppTextWrapper.WrapCharacters(const aLine: String; var aNextWord, aRemainingChars: String);
var
  lbFits: Boolean;
  liLineWidth: Integer;
  liIndex: Integer;
  lsCurrentLine: String;
  lsNextWord: String;
begin

  lsNextWord := aNextWord;
  lsCurrentLine := aLine;

  liIndex := 1;
  lbFits := True;
  aRemainingChars := '';

  while lbFits and (liIndex <= Length(lsNextWord)) do
    begin

      liLineWidth := CalcTextWidth(lsCurrentLine + lsNextWord[liIndex]);

      {there is room to print next word on current line}
      if (liLineWidth <= FWidthAvailable) then
        lsCurrentLine := lsCurrentLine + lsNextWord[liIndex]

      else
        begin
          lbFits := False;

          if (liIndex = 1) then
            begin

              if (aLine <> '') then
                begin
                  aNextWord := '';

                  aRemainingChars := lsNextWord;
                end

              else
                begin
                  aNextWord := lsNextWord[1];

                  aRemainingChars := Copy(lsNextWord, 2, Length(lsNextWord));
                end;

            end

          else
            begin
              aNextWord := Copy(lsNextWord, 1, liIndex - 1);

              aRemainingChars := Copy(lsNextWord, liIndex, Length(lsNextWord));
            end;

        end;

      Inc(liIndex);

    end;

end;

{ TppTextWrapper.AddLine }

procedure TppTextWrapper.AddLine(const aLine: String);
var
  lsLine: String;
  liLineWidth: Integer;
begin

  lsLine := aLine;

  if (Length(lsLine) > 0) and (lsLine[Length(lsLine)] = TppTextMarkups.Space) then
    lsLine := TrimRight(lsLine);

  liLineWidth := CalcTextWidth(lsLine);

  if (liLineWidth > FMaximumLineWidth) then
    FMaximumLineWidth := liLineWidth;

  FWrappedText.Add(lsLine);

  FTrimLeadingSpaces := True;

end;

{ TppTextWrapper.ReadNextWord }

procedure TppTextWrapper.ReadNextWord(var aLine, aRemainingChars, aNextWord: String);
begin

  if (aRemainingChars <> '') then
    begin
      aNextWord := aRemainingChars;

      aRemainingChars := '';
    end

  else
    begin
      {get next word}
      if (aNextWord = '') then
        aNextWord := FTextParser.NextWord;

      {determine if all words have been read}
      if (aNextWord = '') then
        begin
          if (aLine <> '') then
            begin
              AddLine(aLine);

              if (FAlignment = taFullJustified) then
                FWrappedText[FWrappedText.Count - 1] := FWrappedText[FWrappedText.Count - 1] + TppTextMarkups.EOP;
            end;

          FCharPos := FTextParser.CharPos;
        end;

    end;

end;

{ TppTextWrapper.AddLastWordToLine }

procedure TppTextWrapper.AddLastWordToLine(const aLine: String; var aRemainingChars, aNextWord: String);
var
  lbWrapCharacters: Boolean;
  liWordWidth: Integer;
  lsLine: String;
begin

  lsLine := aLine;

  if FCharWrap then
    lbWrapCharacters := True

  else
    begin

      if (lsLine <> '') then
        begin
          liWordWidth := CalcTextWidth(aNextWord);

          if (liWordWidth > FWidthAvailable) then
            lbWrapCharacters := True
          else
            lbWrapCharacters := False;

        end

      else
        lbWrapCharacters := True;

    end;

  if lbWrapCharacters then
    begin
      WrapCharacters(lsLine, aNextWord, aRemainingChars);

      lsLine := lsLine + aNextWord;

      aNextWord := '';

      FCharPos := FTextParser.CharPos - Length(aRemainingChars);

      if (FTextParser.CharPos > FTextParser.TextLength) then
        FCharPos := FCharPos - 1;

    end

  else
    FCharPos := FTextParser.CharPos;

  AddLine(lsLine);

end;

{******************************************************************************
 *
 **  P L A I N   T E X T
 *
{******************************************************************************}

class procedure TppPlainText.WordWrap(const aText: String; aRect: TppRect; aTextAlignment: TppTextAlignment; aAutoSize: Boolean; aFont: TFont; aCharWrap: Boolean; aLeading: Integer; aTabStops: TStrings; aPrinter: TObject; var aCharPos: Integer; aWrappedText: TStrings);
var
  lTextWrapper: TppTextWrapper;
begin

  lTextWrapper := TppTextWrapper.Create;

  lTextWrapper.AreaAvailable := aRect;
  lTextWrapper.Alignment := aTextAlignment;
  lTextWrapper.AutoSize := aAutoSize;
  lTextWrapper.CharWrap := aCharWrap;
  lTextWrapper.Font := aFont;
  lTextWrapper.Leading := aLeading;
  lTextWrapper.Printer := TppPrinter(aPrinter);
  lTextWrapper.Tabs := aTabStops;
  lTextWrapper.Text := aText;

  try
    {set the current character position}
    lTextWrapper.CharPos := aCharPos;

    {wrap the text}
    lTextWrapper.Wrap;

    {get the new character position}
    aCharPos := lTextWrapper.CharPos;

    {get the wrapped text}
    aWrappedText.Assign(lTextWrapper.WrappedText);

  finally
    lTextWrapper.Free;
  end;

end;

class function TppPlainText.AddBreakCharsToSingleWord(aString: String; var aBreakCharCount, aStartCharCounter, aEndCharCounter: Integer): String;
var
  liIndex: Integer;
begin

  aBreakCharCount := 0;

  for liIndex := 1 to Length(aString)- 1 do
    begin
      Result := Result + aString[liIndex] + ' ';

      Inc(aBreakCharCount);
    end;

  Result := Result + aString[length(aString)];

  aStartCharCounter := 1;
  aEndCharCounter := Length(Result);

  while Result[aStartCharCounter] = ' ' do
    Inc(aStartCharCounter);

  while Result[aEndCharCounter] = ' ' do
    Dec(aEndCharCounter);

end;

class function TppPlainText.GetTabbedTextWidth(aCanvas: TCanvas; const aString: String; aTabStopCount: Integer; aTabStopArray: TppTabStopPos): Integer;
var
  lDWord: DWord;
begin

  {StrPCopy(lCharArray, aString);}

  lDWord := GetTabbedTextExtent(aCanvas.Handle, PChar(aString), Length(aString), aTabStopCount, aTabStopArray);

  Result := LoWord(lDWord);

end;

class procedure TppPlainText.SetCanvasToJustify(aCanvas: TCanvas; aRect: TRect; var aString: String; aTabStopCount: Integer; aTabStopArray: TppTabStopPos);
var
  liBreakCharCount: Integer;
  liIndex: Integer;
  liStartCharCounter: Integer;
  liEndCharCounter: Integer;
  lOutputString: String;
  liWidth: Integer;
begin

  if aString <> '' then
    begin
      liBreakCharCount := 0;
      liStartCharCounter := 1;
      liEndCharCounter := Length(aString);

      while aString[liStartCharCounter] = ' ' do
        Inc(liStartCharCounter);

      for liIndex := liStartCharCounter to Length(aString) do
        if aString[liIndex] = ' ' then
          Inc(liBreakCharCount);

      while aString[liEndCharCounter] = ' ' do
        begin
          Dec(liEndCharCounter);
          Dec(liBreakCharCount);
        end;

      if liBreakCharCount = 0 then
        aString := AddBreakCharsToSingleWord(aString, liBreakCharCount, liStartCharCounter, liEndCharCounter);

      SetTextJustification(aCanvas.Handle, 0, 0);

      lOutputString := Copy(aString, liStartCharCounter, liEndCharCounter - liStartCharCounter + 1);

      liWidth := GetTabbedTextWidth(aCanvas, lOutputString, aTabStopCount, aTabStopArray);

      SetTextJustification(aCanvas.Handle, aRect.Right - aRect.Left - liWidth, liBreakCharCount);

      //Added 09/28/05 to strip the actual string of leading and ending spaces.
      aString := lOutputString;
    end
    
  else
    SetTextJustification(aCanvas.Handle, 0, 0);

end;

class function TppPlainText.MaxLinesFit(aFont: TFont; aLeading: Longint; aSpaceAvailable: Longint; aPrinter: TObject; var aLineHeight: Longint): Integer;
var
  lBitmap: TBitmap;
  lCanvas: TCanvas;
  llLineHeight: Longint;
  llSpaceAvailable: Longint;
  lTextMetric: TTextMetric;
begin

  {get a canvas}
  if (aPrinter <> nil) and (aPrinter is TppPrinter) and (TppPrinter(aPrinter).DC <> 0) then
    begin
      lCanvas := TppPrinter(aPrinter).Canvas;
      lBitmap := nil;
    end
  else
    begin
      lBitmap := TBitmap.Create;
      lCanvas := lBitmap.Canvas;
    end;

  lCanvas.Font := aFont;

  {calc the line height}
  GetTextMetrics(lCanvas.Handle, lTextMetric);

  llLineHeight := lTextMetric.tmHeight;

  {add leading to line height}
  if aLeading <> 0 then
    llLineHeight := llLineHeight + Trunc(ppFromMMThousandths(aLeading, utPrinterPixels, pprtVertical, aPrinter));

  {calculate the maximum lines which will fit in the space}
  llSpaceAvailable := Trunc(ppFromMMThousandths(aSpaceAvailable, utPrinterPixels, pprtVertical, aPrinter));

  Result := Trunc(llSpaceAvailable / llLineHeight);

  aLineHeight := ppToMMThousandths(llLineHeight, utPrinterPixels, pprtVertical, aPrinter);

  {free the canvas}
  if (lBitmap <> nil) then
    lBitmap.Free;

end;

class procedure TppPlainText.ConvertTabStopPos(aUnits: TppUnitType; aTabList: TStrings; var aTabArray: TppTabStopPos; var aSize: Integer; aPrinter: TObject);
var
  liItem: Integer;
  liTabPos: Integer;
  llTabPos: Longint;
begin

  if (aUnits <> utPrinterPixels) and (aUnits <> utScreenPixels) then Exit;

  aSize := 0;

  for liItem := 0 to aTabList.Count - 1 do
    begin
      try
        llTabPos := StrToInt(aTabList[liItem]);

        liTabPos := Trunc(ppFromMMThousandths(llTabPos, aUnits, pprtHorizontal, aPrinter));

        aTabArray[aSize] := liTabPos;

        Inc(aSize);

      except on EConvertError do
        {do nothing}
      end; {try}

    end;

end;

class function TppPlainText.StringStrip(const aString, aStripString: String): String;
var
  lsString: String;
  lsString1: String;
  lsString2: String;
  liPos: Integer;
  liStripLength: Integer;
begin

  lsString := aString;

  liPos := Pos(aStripString, aString);
  liStripLength := Length(aStripString);

  while (liPos <> 0) do
    begin
      lsString1 := Copy(lsString, 1, liPos - 1);
      lsString2 := Copy(lsString, liPos + liStripLength, Length(aString));

      lsString := lsString1 + lsString2;
      
      liPos := Pos(aStripString, lsString);
    end;

  Result := lsString;

end;


{------------------------------------------------------------------------------}
{ TppPlainText.WordCount }

class function TppPlainText.WordCount(const aString: String): Integer;
begin
  Result := WordCountByDelimeter(aString, [' ']);
end; {class function, WordCount}


{------------------------------------------------------------------------------}
{ TppPlainText.WordCountByDelimeter }

class function TppPlainText.WordCountByDelimeter(const aString: String; const aDelimeters: TppCharSet): Integer;
var
  liLength: Integer;
  liIndex: Integer;
begin

  Result := 0;
  liIndex := 1;

  liLength := Length(aString);

  while (liIndex <= liLength) do
    begin
      while ((liIndex <= liLength) and (aString[liIndex] in aDelimeters)) do
        Inc(liIndex);

      if (liIndex <= liLength) then
        Inc(Result);

      while ((liIndex <= liLength) and not(aString[liIndex] in aDelimeters)) do
        Inc(liIndex);
    end;

end; {class function, WordCountByDelimeter}


{------------------------------------------------------------------------------}
{ TppPlainText.WordByIndex }

class function TppPlainText.WordByIndex(const aString: String; aIndex: Integer): String;
begin
  Result := WordByIndexByDelimeter(aString, aIndex, [' ']);
end; {class function, WordByIndex}


{------------------------------------------------------------------------------}
{ TppPlainText.WordByIndexByDelimeter }

class function TppPlainText.WordByIndexByDelimeter(const aString: String; aIndex: Integer; const aDelimeters: TppCharSet): String;
var
  liIndex: Integer;
  liLength: Integer;
begin

  liLength := 0;

  liIndex := WordPosition(aIndex, aString, aDelimeters);

  if (liIndex <> 0) then
    while ((liIndex <= Length(aString)) and not(aString[liIndex] in aDelimeters)) do
      begin
        Inc(liLength);

        SetLength(Result, liLength);

        Result[liLength] := aString[liIndex];

        Inc(liIndex);
      end;

  SetLength(Result, liLength);

end; {class function, WordByIndexByDelimeter}


{------------------------------------------------------------------------------}
{ TppPlainText.WordPosition }

class function TppPlainText.WordPosition(const aWordIndex: Integer; const aString: string; const aDelimeters: TppCharSet): Integer;
var
  liCount: Integer;
  liIndex: Integer;
begin

  liCount := 0;
  liIndex := 1;
  Result := 0;

  while ((liIndex <= Length(aString)) and (liCount <> aWordIndex)) do
    begin

      while (liIndex <= Length(aString)) and (aString[liIndex] in aDelimeters) do
        Inc(liIndex);

      if (liIndex <= Length(aString)) then
        Inc(liCount);

      if (liCount <> aWordIndex) then
        while ((liIndex <= Length(aString)) and not (aString[liIndex] in aDelimeters)) do
          Inc(liIndex)
      else
        Result := liIndex;
    end;

end; {class function, WordPosition}


{------------------------------------------------------------------------------}
{ TppPlainText.RemoveExtraSpaces }

class function TppPlainText.RemoveExtraSpaces(const aString: string): String;
var
  liIndex: Integer;
begin

  Result := aString;

  for liIndex := Length(Result) downto 2 do
    if ((Result[liIndex] = ' ') and (Result[liIndex - 1] = ' ')) then
      Delete(Result, liIndex, 1);

end; {class function, RemoveExtraSpaces}




end.

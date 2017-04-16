{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                    BBBBB   }

unit ppSMTPMapi;

interface

{x$DEFINE DEBUG}              {Remove the x to display all Mapi error messages}

uses
  Classes,
  Windows,
  MAPI,
  ppSMTPCustom,
  ppEmailMessage;

type
  TppMailRecipients = class;

  {@TppSMTPMapi

    Plugin to allow emails to be sent directly using MAPI.  MAPI, short for
    Messaging Application Programming Interface, is a system built into Microsoft
    Windows that enables different e-mail applications to work together to
    distribute mail.

    Note: In order for this plugin to function, the default email software
    installed on the user's computer must be MAPI compatable. }

  {@SessionHandle

    Used to determine if the user is successfully logged on. }

  TppSMTPMapi = class(TppSMTPCustom)
  private
    FBodyText: String;
    FMapiMessage: TMapiMessage;
    FAttachArray: array of TMapiFileDesc;
    FBlindCarbonCopies: TppMailRecipients;
    FCarbonCopies: TppMailRecipients;
    FSessionHandle: THandle;
    FRecipArray: array of TMapiRecipDesc;
    FRecipients: TppMailRecipients;
    
    procedure CreateAttachments(aMessage: TppEmailMessage);
    procedure CreateRecipients(aMessage: TppEmailMessage);

    function ExtractFileNameEx(const aFileName: string): PChar;

  protected
    procedure FreeMapiMessage;

    function GetConnected: Boolean; override;
    function GetLoginRequired: Boolean; override;

  public
    constructor Create; override;
    destructor Destroy; override;

    procedure AssignMessageToSMTP(aMessage: TppEmailMessage);
    procedure ErrorMessage(aErrorCode: Cardinal);

    function Connect: Boolean; override;
    function Disconnect: Boolean; override;
    function SendMail(aMessage: TppEmailMessage): Boolean; override;

    property SessionHandle: THandle read FSessionHandle write FSessionHandle;

  end; {class, TppSMTPMapi}

  {TppMailRecipients}

  TppMailRecipients = class
  private
    FRecipientClass: DWORD;
    FRecipients: TStringList;
    function GetCount: Integer;
    function GetItems(Index: Integer): string;
    procedure SetItems(Index: Integer; const Value: string);

  public
    constructor Create(aRecipients: TStringList; aRecipientClass: DWORD);
    destructor Destroy; override;
    procedure Add(aAddress: string);
    procedure Clear;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: string read GetItems write SetItems; default;
    property RecipientClass: DWORD read FRecipientClass write FRecipientClass;

  end; {class, TppMailRecipients}

implementation

uses
  Forms,
  SysUtils;

{******************************************************************************
 *
 ** M A P I  S M T P
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.Create }

constructor TppSMTPMapi.Create;
begin
  inherited Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.Destroy }

destructor TppSMTPMapi.Destroy;
begin
  FreeMapiMessage;

  FRecipients.Free;
  FRecipients := nil;

  FCarbonCopies.Free;
  FCarbonCopies := nil;

  FBlindCarbonCopies.Free;
  FBlindCarbonCopies := nil;
  
  inherited;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.AssignMessageToSMTP }

procedure TppSMTPMapi.AssignMessageToSMTP(aMessage: TppEmailMessage);
begin

  FBodyText := aMessage.Body.Text;

  try
    CreateRecipients(aMessage);
    CreateAttachments(aMessage);

    {Initialize TMapiMessage Record}
    FillChar(FMapiMessage, SizeOf(FMapiMessage), #0);

    FMapiMessage.lpszSubject := PChar(aMessage.Subject);
    FMapiMessage.lpszNoteText := PChar(FBodyText);
    FMapiMessage.lpRecips := PMapiRecipDesc(FRecipArray);
    FMapiMessage.nRecipCount := Length(FRecipArray);
    FMapiMessage.lpFiles := PMapiFileDesc(FAttachArray);
    FMapiMessage.nFileCount := Length(FAttachArray);

  except
    FreeMapiMessage;
  end;

end;  {procedure, AssignMessageToSMTP}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.Connect }

function TppSMTPMapi.Connect: Boolean;
var
  lcLogon: Cardinal;
begin

  lcLogon := MapiLogon(Application.Handle, PChar(''), PChar(Password), MAPI_LOGON_UI or MAPI_NEW_SESSION, 0, @FSessionHandle);

  Result := (lcLogon = SUCCESS_SUCCESS);

end; {function, Connect}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.CreateAttachments }

procedure TppSMTPMapi.CreateAttachments(aMessage: TppEmailMessage);
var
  liIndex: Integer;
begin

  {Loop through each file in the Attachments list and add the correct information
   to a TMapiFileDesc record for each file. }
   if aMessage.Attachments.Count > 0 then
     begin
       SetLength(FAttachArray, aMessage.Attachments.Count);

       for liIndex := 0 to aMessage.Attachments.Count - 1 do
         begin
           if not FileExists(aMessage.Attachments[liIndex]) then Exit;

           {Initialize each TMapiFileDesc record. }
           FillChar(FAttachArray[liIndex], SizeOf(TMapiFileDesc), #0);

           FAttachArray[liIndex].nPosition := $FFFFFFFF;
           FAttachArray[liIndex].lpszFileName := ExtractFileNameEx(aMessage.Attachments[liIndex]);
           FAttachArray[liIndex].lpszPathName := PChar(aMessage.Attachments[liIndex]);
         end;

     end
   else
     FAttachArray := nil;
     

end; {procedure, CreateAttachments}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.CreateRecipients }

procedure TppSMTPMapi.CreateRecipients(aMessage: TppEmailMessage);
var
  lRecipientsList: TList;
  liListIndex: Integer;
  liIndex: Integer;
  liRecipIndex: Integer;
  lMailRecipients: TppMailRecipients;
begin

  {Create a TppMailRecipients object for each type of email recipient. }
  FRecipients := TppMailRecipients.Create(TStringList(aMessage.ToAddress), MAPI_TO);
  FCarbonCopies := TppMailRecipients.Create(TStringList(aMessage.ToCarbonCopy), MAPI_CC);
  FBlindCarbonCopies := TppMailRecipients.Create(TStringList(aMessage.ToBlindCarbonCopy), MAPI_BCC);

  lRecipientsList := TList.Create;

  try
    lRecipientsList.Add(TObject(FRecipients));
    lRecipientsList.Add(TObject(FCarbonCopies));
    lRecipientsList.Add(TObject(FBlindCarbonCopies));

    SetLength(FRecipArray, FBlindCarbonCopies.Count + FCarbonCopies.Count + FRecipients.Count);

    liRecipIndex := 0;

    {Once the TppRecipients have been created and defined, loop through each list
     and add a new TMapiRecipDesc record to the RecipArray for each recipient. }
    for liListIndex := 0 to lRecipientsList.Count - 1 do
      begin
        lMailRecipients := TppMailRecipients(lRecipientsList[liListIndex]);

        for liIndex := 0 to lMailRecipients.Count - 1 do
          begin
            {Initialize a new TMapiRecipDesc record. }
            FillChar(FRecipArray[liRecipIndex], SizeOf(TMapiRecipDesc), #0);

            FRecipArray[liRecipIndex].ulRecipClass := lMailRecipients.RecipientClass;
            FRecipArray[liRecipIndex].lpszName := PChar(lMailRecipients[liIndex]);
            FRecipArray[liRecipIndex].ulReserved := 0;
            FRecipArray[liRecipIndex].lpEntryID := nil;
            FRecipArray[liRecipIndex].ulEIDSize := 0;

            Inc(liRecipIndex);
          end;
      end;

  finally
    lRecipientsList.Free;
  end;

end; {procedure, CreateRecipients}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.Disconnect }

function TppSMTPMapi.Disconnect: Boolean;
var
  lcLogoff: Cardinal;
begin

  lcLogoff := MapiLogOff(FSessionHandle, Application.Handle, 0, 0);

  FSessionHandle := 0;

  Result := (lcLogoff = SUCCESS_SUCCESS);

end; {function, Disconnect}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.ErrorMessage }

procedure TppSMTPMapi.ErrorMessage(aErrorCode: Cardinal);
var
  lsError: String;
begin

  case aErrorCode of
    0:  lsError := 'Success';
    1:  lsError := 'User Abort';
    2:  lsError := 'Undefined Falure';
    3:  lsError := 'Login Failure';
    4:  lsError := 'Disk Full';
    5:  lsError := 'Insufficient Memory';
    6:  lsError := 'Access Denied';
    8:  lsError := 'Too Many Sessions';
    9:  lsError := 'Too Many Files';
    10: lsError := 'Too Many Recipients';
    11: lsError := 'Attachment Not Found';
    12: lsError := 'Attachment Open Failure';
    13: lsError := 'Attachment Write Failure';
    14: lsError := 'Unknown Recipient';
    15: lsError := 'Bad Recipient Type';
    16: lsError := 'No Messages';
    17: lsError := 'Invalid Message';
    18: lsError := 'Text To Large';
    19: lsError := 'Invalid Session';
    20: lsError := 'Type Not Supported';
    21: lsError := 'Ambiguous Recipient';
    22: lsError := 'Message In Use';
    23: lsError := 'Network Failure';
    24: lsError := 'Invalid Edit Fields';
    25: lsError := 'Invalid Recipient(s)';
    26: lsError := 'Not Supported';
  end;

  Application.MessageBox(PAnsiChar(lsError), 'MAPI Error Message', MB_OK);

end; {procedure, Disconnect}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.FreeMapiMessage

  Frees allocated memory for the MAPI email message. }

procedure TppSMTPMapi.FreeMapiMessage;
begin
  FAttachArray := nil;
  FRecipArray := nil;
  FBodyText := '';
  FillChar(FMapiMessage, SizeOf(FMapiMessage), #0);
  
end; {procedure, FreeMapiMessage}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.GetConnected }

function TppSMTPMapi.GetConnected: Boolean;
begin
  Result := FSessionHandle <> 0;

end; {function, GetConnected}

{------------------------------------------------------------------------------}
{TppSMTPMapi.ExtractFileNameEx

  Same as ExtractFileName, except it returns a pointer to a position in aFileName.}

function TppSMTPMapi.ExtractFileNameEx(const aFileName: string): PChar;
var
  liPos: Integer;
begin

  liPos := LastDelimiter(PathDelim + DriveDelim, aFileName);
  if liPos > 0 then
    Result := @aFileName[liPos + 1]
  else
    Result := PChar(aFileName);

end; {function, ExtractFileNameEx}

{------------------------------------------------------------------------------}
{ TppSMTPIndy.GetLoginRequired }

function TppSMTPMapi.GetLoginRequired: Boolean;
begin
  Result := False;

end; {procedure, GetLoginRequired}

{------------------------------------------------------------------------------}
{ TppSMTPMapi.SendMail }

function TppSMTPMapi.SendMail(aMessage: TppEmailMessage): Boolean;
var
  lcSendMail: Cardinal;
  liFlags: Integer;
begin

  {Connect to the email client}
  if not(Connected) then
    Connect;

  {Initialize flags}
  liFlags := 0;

  AssignMessageToSMTP(aMessage);

  {Determine whether the email should be viewed in the clients email composer. }
  if PreviewEmail then
    liFlags := MAPI_DIALOG;

  lcSendMail := MapiSendMail(FSessionHandle, Application.Handle, FMapiMessage, liFlags, 0);

  {$IFNDEF DEBUG}
    if (lcSendMail > 1) then
  {$ENDIF}
      ErrorMessage(lcSendMail);

  Result := (lcSendMail = SUCCESS_SUCCESS);

end; {function, SendMail}

{******************************************************************************
 *
 ** M A P I   R E C I P I E N T S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppMailRecipients.Create }

constructor TppMailRecipients.Create(aRecipients: TStringList; aRecipientClass: DWORD);
begin
  FRecipients := TStringList.Create;

  FRecipients.Assign(aRecipients);
  FRecipientClass := aRecipientClass;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppMailRecipients.Destroy }

destructor TppMailRecipients.Destroy;
begin
  FRecipients.Free;
  FRecipients := nil;
  
  inherited;
  
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppMailRecipients.Add }

procedure TppMailRecipients.Add(aAddress: string);
begin
  FRecipients.Add(aAddress);

end; {procedure, Add}

{------------------------------------------------------------------------------}
{ TppMailRecipients.Clear }

procedure TppMailRecipients.Clear;
begin
  FRecipients.Clear;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppMailRecipients.GetCount }

function TppMailRecipients.GetCount: Integer;
begin
  Result := FRecipients.Count;

end; {function, GetCount}

{------------------------------------------------------------------------------}
{ TppMailRecipients.GetItems }

function TppMailRecipients.GetItems(Index: Integer): string;
begin
  Result := FRecipients[Index];

end; {function, GetItems}

{------------------------------------------------------------------------------}
{ TppMailRecipients.SetItems }

procedure TppMailRecipients.SetItems(Index: Integer; const Value: string);
begin
  FRecipients[Index] := Value;

end; {procedure, SetItems}


initialization
  TppSMTPPlugIn.RegisterClass(TppSMTPMapi);

finalization
  TppSMTPPlugIn.UnRegisterClass(TppSMTPMapi);

end.

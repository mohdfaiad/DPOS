{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                    BBBBB   }

unit ppSMTPIndy;

{$I ppIfDef.pas}

interface

uses
  Classes,
  IdComponent,
  IdSMTP,
  IdMessage,
  Dialogs,
  ppSMTPCustom,
  ppEmailMessage;

type

  {@TppSMTPIndy

    Plugin to allow emails to be sent using Indy 9 components. }

  TppSMTPIndy = class(TppSMTPCustom)
    private
      FSMTP: TIdSMTP;
      FMessage: TIdMessage;

      procedure IdConnectEvent(Sender: TObject);
      procedure IdDisconnectEvent(Sender: TObject);
      procedure IdWorkEndEvent(Sender: TObject; AWorkMode: TWorkMode);

    protected
      function GetConnected: Boolean; override;
      function GetLoginRequired: Boolean; override;
    
    public
      constructor Create; override;
      destructor Destroy; override;

      procedure AssignMessageToSMTP(aMessage: TppEmailMessage);
      function Connect: Boolean; override;
      function Disconnect: Boolean; override;
      function SendMail(aMessage: TppEmailMessage): Boolean; override;

    end; {class, TppSMTPIndy}

implementation

{------------------------------------------------------------------------------}
{ TppSMTPIndy.Create }

constructor TppSMTPIndy.Create;
begin

  inherited Create;

  FSMTP := TIdSMTP.Create(nil);
  FSMTP.AuthenticationType := atLogin;
  FSMTP.OnConnected := IdConnectEvent;
  FSMTP.OnDisconnected := IdDisconnectEvent;
  FSMTP.OnWorkEnd := IdWorkEndEvent;

  FMessage := TIdMessage.Create(nil);

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppSMTPIndy.Destroy }

destructor TppSMTPIndy.Destroy;
begin
  Disconnect;
  FSMTP.Free;
  FMessage.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppSMTPIndy.IdConnectEvent }

procedure TppSMTPIndy.IdConnectEvent(Sender: TObject);
begin
  Status := 'Connected.';
end; {procedure, IdConnectEvent}

{------------------------------------------------------------------------------}
{ TppSMTPIndy.IdDisconnectEvent }

procedure TppSMTPIndy.IdDisconnectEvent(Sender: TObject);
begin
  Status := 'Disconnected.';
end; {procedure, IdDisconnectEvent}

procedure TppSMTPIndy.IdWorkEndEvent(Sender: TObject; AWorkMode: TWorkMode);
begin
  if (AWorkMode = wmWrite) then
    Status := 'Sent: ' + FMessage.Recipients.EmailAddresses;

end; {procedure, IdDisconnectEvent}


{------------------------------------------------------------------------------}
{ TppSMTPIndy.GetConnected }

function TppSMTPIndy.GetConnected: Boolean;
begin
  Result := FSMTP.Connected;
end;

{------------------------------------------------------------------------------}
{ TppSMTPIndy.GetLoginRequired }

function TppSMTPIndy.GetLoginRequired: Boolean;
begin
  Result := True;

end; {procedure, GetLoginRequired}

{------------------------------------------------------------------------------}
{ TppSMTPIndy.Connect }

function TppSMTPIndy.Connect: Boolean;
begin

  if not FSMTP.Connected then
    begin
      FSMTP.Host   := Host;

      {$IFDEF Delphi7}
      FSMTP.UserName := UserID;
      {$ELSE}
      FSMTP.UserId := UserID;
      {$ENDIF}

      FSMTP.Password := Password;
      FSMTP.Connect;
    end;

  Result := FSMTP.Connected and FSMTP.Authenticate;

end; {function, Connect}

{------------------------------------------------------------------------------}
{ TppSMTPIndy.Disconnect }

function TppSMTPIndy.Disconnect: Boolean;
begin
  if FSMTP.Connected then
    FSMTP.Disconnect;

  Result := FSMTP.Connected

end; {function, Disconnect}

{------------------------------------------------------------------------------}
{ TppSMTPIndy.SendMail }

function TppSMTPIndy.SendMail(aMessage: TppEmailMessage): Boolean;
begin

  Result := True;

  if not Connected then
    Connect;

  AssignMessageToSMTP(aMessage);

  FSMTP.Send(FMessage);

end; {function, SendMail}

{------------------------------------------------------------------------------}
{ TppSMTPIndy.AssignMessageToSMTP }

procedure TppSMTPIndy.AssignMessageToSMTP(aMessage: TppEmailMessage);
var
  liIndex: Integer;
begin

  FMessage.Recipients.EmailAddresses := aMessage.ToAddress.CommaText;

  FMessage.BccList.EmailAddresses := aMessage.ToBlindCarbonCopy.CommaText;
  FMessage.CCList.EmailAddresses := aMessage.ToCarbonCopy.CommaText;

  FMessage.Body.Assign(aMessage.Body);

  for liIndex := 0 to aMessage.Attachments.Count-1 do
    TIdAttachment.Create(FMessage.MessageParts, aMessage.Attachments[liIndex]);

  FMessage.From.Address := aMessage.FromAddress;
  FMessage.From.Name    := aMessage.FromName;
  FMessage.ReplyTo.EMailAddresses := aMessage.ReplyTo;
  FMessage.Subject := aMessage.Subject;

end; {procedure, AssignMessageToSMTP}


initialization
  TppSMTPPlugIn.RegisterClass(TppSMTPIndy);

finalization
  TppSMTPPlugIn.UnRegisterClass(TppSMTPIndy);


end.

{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2006                    BBBBB   }

unit ppEmailSettings;

interface

uses
  Classes;

type

  {@TppEmailSettings

    Contains information needed for a report to be successfully sent as an
    attachement to an email message.  Add recipient email addresses to the
    Recipients list.  Use the ReportFormat property to specify the file format
    of the report attachment. The Body property contains the email
    message to be sent along with the report file. }

  {@TppEmailSettings.ReportFormat

    File format the report will be exported to before it is attached to the
    email message.  This format must be a valid file device type. }

  {@TppEmailSettings.Attachments

    List of valid file names (in addition to the report file being sent) that
    should be attached to the email message. }

  {@TppEmailSettings.BlindCarbonCopy

    List of email addresses the email message will be sent to as a blind carbon
    copy (i.e. other recipients are not visible to this recipient). }

  {@TppEmailSettings.Body

    Text representing the message body of the email message to be sent. }

  {@TppEmailSettings.CarbonCopy

    List of email addresses the email message will be sent to as a carbon copy. }

  {@DeleteFile

    If this property is True, the attached report file will be deleted from the
    hard drive once the email message has been sent. }

  {@TppEmailSettings.Enabled

    Enables the email capability from the report preview window. }

  {@TppEmailSettings.ShowEmailDialog

    Displays the built-in email dialog either after the "Email" button is
    pressed in the Preview window or Report.SendMail is called. }

  {@TppEmailSettings.FileName

    File name of the report to be attached to the email message. }

  {@TppEmailSettings.FromAddress

    Address of the sender. }

  {@TppEmailSettings.FromName

    Name of the sender. }

  {@TppEmailSettings.HostAddress

    SMTP address of the email server. }

  {@TppEmailSettings.Password

    Password to access the email server. }

  {@TppEmailSettings.PreviewInEmailClient

    Certain applications such as those that are MAPI compatable allow the user
    to preview the email message inside the native viewer before sending.
    Setting this property to True enables this feature. }

  {@TppEmailSettings.Recipients

    List of email addresses the email message will be sent to as the main
    recipients. }

  {@TppEmailSettings.ReplyTo

    Address the sender would like the recipients of the email to reply to. }

  {@TppEmailSettings.Subject

    Subject of the email message. }

  {@TppEmailSettings.UserName

    User Name to log into the email server. }

  TppEmailSettings = class(TPersistent)
  private
    FReportFormat: string;
    FAttachments: TStrings;
    FBlindCarbonCopy: TStrings;
    FBody: TStrings;
    FCarbonCopy: TStrings;
    FDeleteFile: Boolean;
    FEnabled: Boolean;
    FShowEmailDialog: Boolean;
    FFileName: string;
    FFromAddress: string;
    FFromName: string;
    FHostAddress: string;
    FPassword: string;
    FPreviewInEmailClient: Boolean;
    FRecipients: TStrings;
    FReplyTo: string;
    FSubject: string;
    FUserName: string;

    procedure SetAttachments(const Value: TStrings);
    procedure SetBlindCarbonCopy(const Value: TStrings);
    procedure SetBody(const Value: TStrings);
    procedure SetCarbonCopy(const Value: TStrings);
    procedure SetRecipients(const Value: TStrings);
    
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear;

    property Attachments: TStrings read FAttachments write SetAttachments;
    property DeleteFile: Boolean read FDeleteFile write FDeleteFile default True;

  published
    property ReportFormat: string read FReportFormat write FReportFormat;
    property BlindCarbonCopy: TStrings read FBlindCarbonCopy write SetBlindCarbonCopy;
    property Body: TStrings read FBody write SetBody;
    property CarbonCopy: TStrings read FCarbonCopy write SetCarbonCopy;
    property Enabled: Boolean read FEnabled write FEnabled default False;
    property PreviewInEmailClient: Boolean read FPreviewInEmailClient write FPreviewInEmailClient default True;
    property ShowEmailDialog: Boolean read FShowEmailDialog write FShowEmailDialog default False;
    property FileName: string read FFileName write FFileName;
    property FromAddress: string read FFromAddress write FFromAddress;
    property FromName: string read FFromName write FFromName;
    property HostAddress: string read FHostAddress write FHostAddress;
    property Password: string read FPassword write FPassword;
    property Recipients: TStrings read FRecipients write SetRecipients;
    property ReplyTo: string read FReplyTo write FReplyTo;
    property Subject: string read FSubject write FSubject;
    property UserName: string read FUserName write FUserName;

  end;

implementation

{------------------------------------------------------------------------------}
{@TppEmailSettings.Create}

constructor TppEmailSettings.Create;
begin
  inherited Create;

  FBlindCarbonCopy := TStringList.Create;
  FBody := TStringList.Create;
  FCarbonCopy := TStringList.Create;
  FRecipients := TStringList.Create;
  FAttachments := TStringList.Create;

  FDeleteFile := True;
  FEnabled := False;
  FShowEmailDialog := False;
  FPreviewInEmailClient := True;

  FReportFormat := 'PDF';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{@TppEmailSettings.Destroy}

destructor TppEmailSettings.Destroy;
begin
  FAttachments.Free;
  FAttachments := nil;

  FRecipients.Free;
  FRecipients := nil;

  FCarbonCopy.Free;
  FCarbonCopy := nil;

  FBody.Free;
  FBody := nil;

  FBlindCarbonCopy.Free;
  FBlindCarbonCopy := nil;

  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{@TppEmailSettings.Assign

  Assigns all published properties to a TppEmailSettings object. }

procedure TppEmailSettings.Assign(Source: TPersistent);
var
  lSettings: TppEmailSettings;
begin

  lSettings := TppEmailSettings(Source);

  FReportFormat := lSettings.ReportFormat;
  FAttachments.Assign(lSettings.Attachments);
  FBlindCarbonCopy.Assign(lSettings.BlindCarbonCopy);
  FBody.Assign(lSettings.Body);
  FCarbonCopy.Assign(lSettings.CarbonCopy);
  FDeleteFile := lSettings.DeleteFile;
  FEnabled := lSettings.Enabled;
  FFileName := lSettings.FileName;
  FFromAddress := lSettings.FromAddress;
  FFromName := lSettings.FromName;
  FHostAddress := lSettings.HostAddress;
  FPassword := lSettings.Password;
  FPreviewInEmailClient := lSettings.PreviewInEmailClient;
  FRecipients.Assign(lSettings.Recipients);
  FReplyTo := lSettings.ReplyTo;
  FShowEmailDialog := lSettings.ShowEmailDialog;
  FSubject := lSettings.Subject;
  FUserName := lSettings.UserName;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{TppEmailSettings.Clear

  Resets the TppEmailSettings object. }

procedure TppEmailSettings.Clear;
begin
  FReportFormat := 'PDF';
  FAttachments.Clear;
  FBlindCarbonCopy.Clear;
  FBody.Clear;
  FCarbonCopy.Clear;
  FDeleteFile := True;
  FEnabled := False;
  FFileName := '';
  FFromAddress := '';
  FFromName := '';
  FHostAddress := '';
  FPassword := '';
  FPreviewInEmailClient := False;
  FRecipients.Clear;
  FReplyTo := '';
  FShowEmailDialog := True;
  FSubject := '';
  FUserName := '';
  
end; {procedure, Clear}

procedure TppEmailSettings.SetAttachments(const Value: TStrings);
begin
  FAttachments.Assign(Value);
end;

procedure TppEmailSettings.SetBlindCarbonCopy(const Value: TStrings);
begin
  FBlindCarbonCopy.Assign(Value);
end;

procedure TppEmailSettings.SetBody(const Value: TStrings);
begin
  FBody.Assign(Value);
end;

procedure TppEmailSettings.SetCarbonCopy(const Value: TStrings);
begin
  FCarbonCopy.Assign(Value);
end;

procedure TppEmailSettings.SetRecipients(const Value: TStrings);
begin
  FRecipients.Assign(Value);
end;

end.

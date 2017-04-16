{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2005                    BBBBB   }

unit ppEmail;

interface

uses
  Windows,
  Controls,
  Classes,
  ppProd,
  ppDevice,
  ppSMTPCustom,
  ppEmailMessage,
  ppEmailSettings,
  ppFilDev,
  ppPDFDevice;

type

  {@TppEmail

    Builds and sends emails containing the exported reports as attachement files.
    Create a TppEmail object and add the reports you would like to send by using
    the AddReport routine.  Typically the reports added have their EmailSettings
    property defined.  Once all report have been added, they can be sent by
    calling the Send routine. }

  TppEmail = class
  private
    FEmailSettings: TppEmailSettings;
    FReport: TppProducer;
    FReports: TList;
    FSMTP: TppSMTPCustom;

    procedure DisplayEmailDialog;
    procedure ProcessAndSend;

    function CreateFileDevice(aDeviceClass: TppDeviceClass; aReport: TppProducer):TppFileDevice;
    function GetScreenDevice(aReport: TppProducer): TppDevice;
    procedure ProcessFileName(aReport: TppProducer; aDevice: TppFileDevice);

  protected
    procedure UpdateSMTP; virtual;

    function CreateEmailMessage: TppEmailMessage; virtual;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AddReport(aReport: TppProducer);
    procedure Send;

    property SMTP: TppSMTPCustom read FSMTP;

  end;

implementation

uses
  ppEmailDlg,
  ppViewr,
  ppTypes,
  ppUtils,
  ppSMTPMapi,
  SysUtils;

{------------------------------------------------------------------------------}
{TppEmail.Create}

constructor TppEmail.Create;
begin
  inherited;

  FReports := TList.Create;
  FEmailSettings := TppEmailSettings.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{TppEmail.Destroy}

destructor TppEmail.Destroy;
begin

  FSMTP.Free;
  FSMTP := nil;

  FEmailSettings.Free;
  FEmailSettings := nil;

  FReports.Free;
  FReports := nil;
  
  inherited;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{@TppEmail.AddReport

  Adds a report to the list of reports to be exported, attached and sent with
  the email message.}

procedure TppEmail.AddReport(aReport: TppProducer);
begin

  {assign report(s)}
  FReports.Add(aReport);

end; {procedure, AddReport}

{------------------------------------------------------------------------------}
{@TppEmail.Send

  Begins the process of exporting all added reports to the defined file type,
  attaching them to the email message and sending the email using the chosen
  email plugin.}

procedure TppEmail.Send;
begin

  try

    if FReports.Count = 0 then
      raise EEmailError.Create('Report Not Found');

    {Static Email Settings are retrieved from the first report in the list}
    FReport := TppProducer(FReports[0]);

    FEmailSettings.Assign(FReport.EmailSettings);

    {create SMTP plugin object}
    FSMTP := TppSMTPPlugIn.CreateInstance;

    {Display email dialog or else send the email message.}
    if FEmailSettings.ShowEmailDialog then
      begin
        try
          DisplayEmailDialog;
        except
          DisplayEmailDialog;
        end;
      end
    else
      ProcessAndSend;

  except
  end;
    
end; {procedure, Send}

{------------------------------------------------------------------------------}
{TppEmail.CreateEmailMessage}

function TppEmail.CreateEmailMessage: TppEmailMessage;
begin

  Result := TppEmailMessage.Create;

  Result.ToAddress.Assign(FEmailSettings.Recipients);
  Result.ToCarbonCopy.Assign(FEmailSettings.CarbonCopy);
  Result.ToBlindCarbonCopy.Assign(FEmailSettings.BlindCarbonCopy);
  Result.Attachments.Assign(FEmailSettings.Attachments);
  Result.Body.Assign(FEmailSettings.Body);

  Result.Subject := FEmailSettings.Subject;
  Result.FromName := FEmailSettings.FromName;
  Result.FromAddress := FEmailSettings.FromAddress;
  Result.ReplyTo := FEmailSettings.ReplyTo;
  Result.Date := DateToStr(Now);

end; {function, CreateEmailMessage}

{------------------------------------------------------------------------------}
{TppEmail.CreateFileDevice}

function TppEmail.CreateFileDevice(aDeviceClass: TppDeviceClass; aReport: TppProducer): TppFileDevice;
begin
  if (aDeviceClass.InheritsFrom(TppFileDevice)) then
    begin
      Result := TppFileDevice(aDeviceClass.Create(FReport));

      if Result is TppPDFDevice then
        TppPDFDevice(Result).PDFSettings.Assign(aReport.PDFSettings);

      if Result is TppTextFileDevice then
        TppTextFileDevice(Result).TextFileType := aReport.TextFileType;

    end
  else
    Result := nil;

end; {function, CreateFileDevice}

{------------------------------------------------------------------------------}
{TppEmail.UpdateSMTP}

procedure TppEmail.UpdateSMTP;
begin
  FSMTP.Host := FEmailSettings.HostAddress;
  FSMTP.UserID := FEmailSettings.UserName;
  FSMTP.Password := FEmailSettings.Password;
  FSMTP.PreviewEmail := FEmailSettings.PreviewInEmailClient;

end; {procedure, UpdateSMTP}

{------------------------------------------------------------------------------}
{TppEmail.DisplayEmailDialog}

procedure TppEmail.DisplayEmailDialog;
var
  lEmailDialog: TppEmailDialog;
begin

  lEmailDialog := TppEmailDialog.Create(nil);

  try
    lEmailDialog.Menu.ConnectionMenu.Visible := FSMTP.LoginRequired;

    if FEmailSettings.FileName = '' then
      FEmailSettings.FileName := FReport.PrinterSetup.DocumentName;

    lEmailDialog.EmailSettings := FEmailSettings;

    {Display the email dialog}
    lEmailDialog.ShowModal;

    if lEmailDialog.ModalResult = Controls.mrOk then
      begin
        {Assign the new emailsettings to the email}
        FEmailSettings.Assign(lEmailDialog.EmailSettings);

        ProcessAndSend;
      end;

  finally
    lEmailDialog.Free;
    FEmailSettings.Clear;
  end;
      
end; {procedure, DisplayEmailDialog}

{------------------------------------------------------------------------------}
{TppEmail.GetScreenDevice}

function TppEmail.GetScreenDevice(aReport: TppProducer): TppDevice;
var
  liIndex: Integer;
  lDevice: TppDevice;
begin

  liIndex := 0;
  Result := nil;

  while (Result = nil) and (liIndex < aReport.Publisher.DeviceCount) do
    begin
      lDevice := aReport.Publisher.Devices[liIndex];

      if lDevice is TppScreenDevice then
        Result := lDevice
      else
        Inc(liIndex);
    end;

end;

{------------------------------------------------------------------------------}
{TppEmail.ProcessAndSend

  Generates and sends email after all settings have been defined either in code
  or inside the email dialog.}

procedure TppEmail.ProcessAndSend;
var
  lDeviceClass: TppDeviceClass;
  lFileDevice: TppFileDevice;
  lReport: TppProducer;
  lEmailMessage: TppEmailMessage;
  liIndex: Integer;
  lScreenDevice: TppDevice;
begin

  UpdateSMTP;

  {create email message object}
  lEmailMessage := CreateEmailMessage;

  try

    for liIndex := 0 to FReports.Count - 1 do
      begin
        lReport := TppProducer(FReports[liIndex]);

        {get device class}
        lDeviceClass := ppDeviceClassForName(lReport.EmailSettings.ReportFormat);

        {create device}
        lFileDevice := CreateFileDevice(lDeviceClass, lReport);

        lScreenDevice := GetScreenDevice(lReport);

        try

          {detatch screen device}
          if (lScreenDevice <> nil) then
            lScreenDevice.Publisher := nil;


          if not(lFileDevice = nil) then
            begin
              {assign publisher to device}
              lFileDevice.Publisher := lReport.Publisher;

              ProcessFileName(lReport, lFileDevice);
              lFileDevice.FileName := lReport.EmailSettings.FileName;

              {export report to file}
              lReport.PrintToDevices;
            end
          else
            raise EEmailError.Create('Invalid Device');

          {Add File to attachments}
          lEmailMessage.Attachments.Add(lReport.EmailSettings.FileName);

        finally
          lFileDevice.Free;

          {re-attach screen device}
          if (lScreenDevice <> nil) then
            lScreenDevice.Publisher := lReport.Publisher;

        end;
      end;

    {Send mail}
    FSMTP.SendMail(lEmailMessage);

  finally
    FSMTP.Disconnect;

    lEmailMessage.Free;

    {Clean up report files}
    for liIndex := 0 to FReports.Count - 1 do
      begin
        lReport := TppProducer(FReports[liIndex]);

        if (lReport <> nil) and (lReport.EmailSettings.DeleteFile) and
           (FileExists(lReport.EmailSettings.FileName)) then
          DeleteFile(lReport.EmailSettings.FileName);
      end;
  end;

end; {procedure, ProcessAndSend}

{------------------------------------------------------------------------------}
{TppEmail.ProcessFileName}

procedure TppEmail.ProcessFileName(aReport: TppProducer; aDevice: TppFileDevice);
begin
  {Check for empty file name}
  if aReport.EmailSettings.FileName = '' then
    aReport.EmailSettings.FileName := aReport.PrinterSetup.DocumentName;

  {Check for a path name}
  if (Pos('\', aReport.EmailSettings.FileName) = 0) then
    aReport.EmailSettings.FileName := ppGetTempPath + aReport.EmailSettings.FileName;

  {Check for file extension}
  if (Pos('.', aReport.EmailSettings.FileName) = 0) then
    aReport.EmailSettings.FileName := aReport.EmailSettings.FileName + '.' + aDevice.DefaultExt;

end; {procedure, ProcessFileName}

initialization
  TppSMTPPlugIn.RegisterClass(TppSMTPMapi);

finalization
  TppSMTPPlugIn.UnRegisterClass(TppSMTPMapi);

end.

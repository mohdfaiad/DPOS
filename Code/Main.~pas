unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, Menus, ComCtrls, ToolWin, DB, DBClient, ExtCtrls,
  DBXpress, SqlExpr, SimpleDS, FMTBcd,  Grids, DBGrids, ADODB, jpeg,
  IniFiles, Buttons, Registry, ActnMan, ActnList, ActnCtrls, IdBaseComponent,
  Provider,  IdComponent, IdTCPClient, IdTCPConnection,
  Activex, VrControls, VrButtons ,ComObj, VrDesign ;
     
type
  TfmMainForm = class(TForm)
    Panel1: TPanel;
    MainConnection: TSQLConnection;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    Panel2: TPanel;
    qry_Main: TSimpleDataSet;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label7: TLabel;
    Image3: TImage;
    GroupBox8: TGroupBox;
    imgBG: TImage;
    MainMenu: TMainMenu;
    mnSystem: TMenuItem;
    Panel4: TPanel;
    Panel5: TPanel;
    mnExit: TMenuItem;
    mn_CompanyDef: TMenuItem;
    mn_BranchesDef: TMenuItem;
    N7: TMenuItem;
    mn_BackUp: TMenuItem;
    mn_posMasters: TMenuItem;
    mn_PosTransactions: TMenuItem;
    mn_POS: TMenuItem;
    mn_DailyClose: TMenuItem;
    btn_POS: TVrDemoButton;
    btn_DailyClose: TVrDemoButton;
    btn_Close: TVrDemoButton;
    btn_Reports: TVrDemoButton;
    ADOConnection: TADOConnection;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnExitClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure mn_CompanyDefClick(Sender: TObject);
    procedure mn_BackUpClick(Sender: TObject);
  private
    { Private declarations }
    LastUserAccess , LicenseNo , BiosID : String;
    procedure  GetWin32_BIOSInfo;
  public
    { Public declarations }
  end;

var
  fmMainForm: TfmMainForm;

implementation

uses  Login, GVariable,
   License,  BackUp, lkp_Company;

{$R *.dfm}

procedure TfmMainForm.FormCreate(Sender: TObject);
Var
  strDBServerName, strDBUserID, strDBPassword, strDBName,  strDriverName  : string;
  vIni: TIniFile;
  l: DWORD;
begin
   Screen.MenuFont.Name := 'Times New Roman';
   Screen.MenuFont.Size := 11 ;
   Screen.MenuFont.Style := [fsBold];

  if FileExists('MainBG.jpg') Then Begin
     imgBG.Picture.LoadFromFile('MainBG.jpg');
     imgBG.Stretch := True ;
  end;

  // hide minimize and maximise buttons
  l := GetWindowLong(Self.Handle, GWL_STYLE);
  l := l and not(WS_MINIMIZEBOX);
  l := l and not(WS_MAXIMIZEBOX);
  l := l and not(WS_MAXIMIZEBOX);
  l := SetWindowLong(Self.Handle, GWL_STYLE, l);

  EnableMenuItem(GetSystemMenu( handle, False ),SC_CLOSE, MF_BYCOMMAND or MF_GRAYED );

  if FileExists('ERP.ini') Then Begin
     vIni := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
     With vIni do begin
         strDBServerName := ReadString('ERP_Option', 'DB_Server_Name', '');
         strDBUserID := ReadString('ERP_Option', 'DB_User_ID', '');
         strDBPassword := ReadString('ERP_Option', 'DB_Password', '');
         strDBName := ReadString('ERP_Option', 'DB_Name', '');
         strDriverName := ReadString('ERP_Option', 'DriverName', '');
         LastUserAccess := ReadString('ERP_Option', 'LastUserAccess', '');
         LicenseNo := ReadString('ERP_Option', 'LicenseNo', '');         
     end;
     vIni.Free;
     MainConnection.Connected := False;
     MainConnection.Params.Values['HostName'] := strDBServerName;
     MainConnection.Params.Values['Database'] := strDBName;
     MainConnection.Params.Values['User_Name']:= strDBUserID;
     MainConnection.Params.Values['Password'] := strDBPassword;
     MainConnection.Connected := True;
  end;

   ADOConnection.ConnectionString := 'Provider=SQLOLEDB.1';
   If strDBPassword <> ''
   then ADOConnection.ConnectionString := ADOConnection.ConnectionString + ';Password=' + strDBPassword;

   If strDBUserID <> ''
   then ADOConnection.ConnectionString := ADOConnection.ConnectionString + ';Persist Security Info=True;User ID=' + strDBUserID;

   If strDBName <> ''
   then ADOConnection.ConnectionString := ADOConnection.ConnectionString + ';Initial Catalog=' + strDBName;

   If strDBServerName <> ''
   then ADOConnection.ConnectionString  := ADOConnection.ConnectionString + ';Data Source=' + strDBServerName;

   gDBName := strDBName;

  try
     CoInitialize(nil);
     try
       GetWin32_BIOSInfo;

       If BiosID + 'ERPWMAERP' <> LicenseNo Then Begin

          Application.CreateForm(TfmLicense, fmLicense);
          fmLicense.edtLicenceCode.Text := BiosID;
          if fmLicense.ShowModal = mrOk
          then begin
              If gLicenseNo <> BiosID + 'ERPWMAERP' Then Begin
                  ShowMessage('⁄›Ê« —ﬁ„ «· —ŒÌ’ €Ì— ’ÕÌÕ');
                  Application.Terminate;
              end else
                  ShowMessage(' „  ⁄„·Ì… «· —ŒÌ’ »‰Ã«Õ');
          end;
          fmLicense.Free;
       end;

     finally
       CoUninitialize;
     end;
  except
     on E:EOleException do
         Writeln(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
     on E:Exception do
         Writeln(E.Classname, ':', E.Message);
  end;

  Application.CreateForm(TfmLogin, fmLogin);
  fmLogin.edt_UserName.Text := LastUserAccess;
  fmLogin.ShowModal;

  if fmLogin.ModalResult = mrAbort
  then Abort
  else if fmLogin.ModalResult = mrOk
  then fmLogin.Free
  else Application.Terminate;

end;

procedure TfmMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fmLogin.Close;
end;

procedure TfmMainForm.GetWin32_BIOSInfo;
const
  WbemUser            ='';
  WbemPassword        ='';
  WbemComputer        ='localhost';
  wbemFlagForwardOnly = $00000020;
var
  FSWbemLocator : OLEVariant;
  FWMIService   : OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject   : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
begin;
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService   := FSWbemLocator.ConnectServer(WbemComputer, 'root\CIMV2', WbemUser, WbemPassword);
  FWbemObjectSet:= FWMIService.ExecQuery('SELECT SerialNumber FROM Win32_BIOS','WQL',wbemFlagForwardOnly);
  oEnum         := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
  if oEnum.Next(1, FWbemObject, iValue) = 0 then
      BiosID := FWbemObject.SerialNumber;
end;

procedure TfmMainForm.mnExitClick(Sender: TObject);
begin
   btn_CloseClick(Sender);
end;

procedure TfmMainForm.btn_CloseClick(Sender: TObject);
Var
  buttonSelected : Integer;
begin
    // Show a confirmation dialog
    buttonSelected := MessageDlg('Â·  —Ìœ Õﬁ« «·Œ—ÊÃ „‰ «·‰Ÿ«„',mtInformation, mbOKCancel, 0);

    // Show the button type selected
    if buttonSelected = mrOK then Begin
       fmLogin.Free;
       //Close;
       Application.Terminate;
    end;
end;

procedure TfmMainForm.mn_CompanyDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmCompany, fmCompany);
  fmCompany.ShowModal;
end;

procedure TfmMainForm.mn_BackUpClick(Sender: TObject);
begin
  Application.CreateForm(TfmBackUp, fmBackUp);
  fmBackUp.ShowModal;
end;

end.

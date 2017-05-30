unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls ,IniFiles, jpeg, ExtCtrls ,ComObj , ActiveX,
  VrControls, VrButtons;

type
  TfmLogin = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    edt_Password: TEdit;
    edt_UserName: TEdit;
    Image1: TImage;
    btnAccess: TVrDemoButton;
    btnClose: TVrDemoButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAccessClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edt_PasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    vIni: TIniFile;
    LastUserAccess , LicenseNo , BiosID : String;
    procedure  GetWin32_BIOSInfo;
    function EncryptBiosNo(BiosNo : String) : String;

  public
    { Public declarations }
  end;

var
  fmLogin: TfmLogin;

implementation

uses Main, GFunctions, GVariable, License;

{$R *.dfm}

procedure TfmLogin.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   Application.Terminate;
end;

procedure TfmLogin.btnAccessClick(Sender: TObject);
Var ExistUser : String;
begin
   ExistUser :=  GetDBValue('IsNull(Count(*),0) As Cnt','tbl_Users',' And UserName=''' + edt_UserName.Text + ''' And Password=''' + edt_Password.Text + ''' ');
   If ExistUser <> '0' Then Begin
     gUserName := edt_UserName.Text;
     gUserID := GetDBValue('UserId','tbl_Users',' And UserName=''' + gUserName + ''' ');
      vIni := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
      With vIni do begin
          WriteString('ERP_Option', 'LastUserAccess', gUserName);
      end;
      vIni.Free;


    gCustomerCode := GetDBValue('settingValue','tbl_DefaultSetting',' And CompanyCode = ''' + DCompany + ''' And SettingDescription = ''CustomerCode'' ');
    gWarehouseCode := GetDBValue('settingValue','tbl_DefaultSetting',' And CompanyCode = ''' + DCompany + ''' And SettingDescription  = ''WarehouseCode'' ');
    gPOSCode := GetDBValue('settingValue','tbl_DefaultSetting',' And CompanyCode = ''' + DCompany + ''' And SettingDescription  = ''POSCode'' ');
    gCashCode := GetDBValue('CashCode','tbl_POS_Definition',' And CompanyCode = ''' + DCompany + ''' And POSCode  = ''' + gPOSCode + '''  ');
    gBankCode := GetDBValue('BankCode','tbl_POS_Definition',' And CompanyCode = ''' + DCompany + ''' And POSCode  = ''' + gPOSCode + '''  ');
    gEndingShift := GetDBValue('EndingShift','tbl_POS_Definition',' And CompanyCode = ''' + DCompany + ''' And POSCode  = ''' + gPOSCode + '''  ');
    gMainCash := GetDBValue('settingValue','tbl_DefaultSetting',' And CompanyCode = ''' + DCompany + ''' And SettingDescription  = ''MainCash'' ');
    gOperatorCode := GetDBValue('OperatorCode','tbl_operators',' And CompanyCode = ''' + DCompany + ''' And UserID = ''' + gUserID + '''  ');
    gPOSWorkByTouch := GetDBValue('settingValue','tbl_DefaultSetting',' And CompanyCode = ''' + DCompany + ''' And SettingDescription  = ''WorkByTouch'' ');
    gPOS_ReplacementDuring := GetDBValue('settingValue','tbl_DefaultSetting',' And CompanyCode = ''' + DCompany + ''' And SettingDescription  = ''ReplacmentDuring'' ');
    gInvoiceType := GetDBValue('settingValue','tbl_DefaultSetting',' And CompanyCode = ''' + DCompany + ''' And SettingDescription  = ''InvoiceType'' ');
    gCountOfInvPrint := GetDBValue('settingValue','tbl_DefaultSetting',' And CompanyCode = ''' + DCompany + ''' And SettingDescription  = ''CountOfInvPrint'' ');
     ModalResult := mrOk;
     If gLoginFrom_POS_Screen = False
     then fmMainForm.Show;
     // fmLogin.Free;
   end else begin
     ShowMessage('«”„ «·„” Œœ„ √Ê ﬂ·„… «·„—Ê— €Ì— ’ÕÌÕ…');
     edt_Password.SetFocus;
     ModalResult := mrAbort;
   end;
end;

procedure TfmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmLogin.FormShow(Sender: TObject);
begin
   edt_Password.SetFocus;
end;

procedure TfmLogin.edt_PasswordKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       btnAccessClick(Sender);
    end;

end;

procedure TfmLogin.GetWin32_BIOSInfo;
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
     //Writeln(Format('SerialNumber    %s',[String(FWbemObject.SerialNumber)]));// String
     //edt1.Text :=  FWbemObject.SerialNumber;
end;

function TfmLogin.EncryptBiosNo(BiosNo: String): String;
Var   k : Int64;
      i, n, r : integer;
begin
  k := 1;
  n := Length(BiosNo);
  r := 25 div n + 1;
  for i := 0 to n do begin
      k := r * (k + i * Ord(BiosNo[i]));
  end;

  Result := IntToStr(Abs(k));
end;

procedure TfmLogin.FormCreate(Sender: TObject);
begin
 if FileExists('ERP.ini') Then Begin
     vIni := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
     With vIni do begin
         LastUserAccess := ReadString('ERP_Option', 'LastUserAccess', '');
         LicenseNo := ReadString('ERP_Option', 'LicenseNo', '');
     end;
     vIni.Free;
  end;
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
                  ShowMessage('');
                  Application.Terminate;
              end else
                  ShowMessage('');
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


  edt_UserName.Text := LastUserAccess;
end;



end.

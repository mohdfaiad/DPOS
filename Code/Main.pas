unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, Menus, ComCtrls, ToolWin, DB, DBClient, ExtCtrls,
  DBXpress, SqlExpr, SimpleDS, FMTBcd,  Grids, DBGrids, ADODB, jpeg,
  IniFiles, Buttons, Registry, ActnMan, ActnList, ActnCtrls, IdBaseComponent,
  Provider,  IdComponent, IdTCPClient, IdTCPConnection,
  Activex, VrControls, VrButtons ,ComObj,  VrDesign  ;
     
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
    mn_CurrencyDef: TMenuItem;
    mn_CurrencyExchangeDef: TMenuItem;
    mn_CompanyDef: TMenuItem;
    N2: TMenuItem;
    mn_BranchesDef: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    mn_ItemCategoryDef: TMenuItem;
    mn_ItemColorDef: TMenuItem;
    mn_ItemGroupSectionDef: TMenuItem;
    mn_ItemSizeDef: TMenuItem;
    mn_ItemTypeDef: TMenuItem;
    mn_ItemUnitDef: TMenuItem;
    mn_WareHouseDef: TMenuItem;
    mn_ItemGroupsDef: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    mn_OperatorsDef: TMenuItem;
    mn_POSDef: TMenuItem;
    mn_CustomerGroupDef: TMenuItem;
    mn_CustomerDef: TMenuItem;
    N25: TMenuItem;
    mn_ItemPoliciesDef: TMenuItem;
    mn_VendorGroupDef: TMenuItem;
    mn_VendoersDef: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    mn_UserGroupsDef: TMenuItem;
    mn_UserDef: TMenuItem;
    mn_CashBankDef: TMenuItem;
    mn_ItemDef: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnExitClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure mn_CompanyDefClick(Sender: TObject);
    procedure mn_BackUpClick(Sender: TObject);
    procedure mn_BranchesDefClick(Sender: TObject);
    procedure mn_UserGroupsDefClick(Sender: TObject);
    procedure mn_UserDefClick(Sender: TObject);
    procedure mn_CurrencyDefClick(Sender: TObject);
    procedure mn_CurrencyExchangeDefClick(Sender: TObject);
    procedure mn_WareHouseDefClick(Sender: TObject);
    procedure mn_ItemCategoryDefClick(Sender: TObject);
    procedure mn_ItemColorDefClick(Sender: TObject);
    procedure mn_ItemTypeDefClick(Sender: TObject);
    procedure mn_ItemUnitDefClick(Sender: TObject);
    procedure mn_ItemSizeDefClick(Sender: TObject);
    procedure mn_ItemGroupsDefClick(Sender: TObject);
    procedure mn_ItemGroupSectionDefClick(Sender: TObject);
    procedure mn_VendoersDefClick(Sender: TObject);
    procedure mn_VendorGroupDefClick(Sender: TObject);
    procedure mn_CustomerGroupDefClick(Sender: TObject);
    procedure mn_CustomerDefClick(Sender: TObject);
    procedure mn_ItemPoliciesDefClick(Sender: TObject);
    procedure mn_OperatorsDefClick(Sender: TObject);
    procedure mn_POSDefClick(Sender: TObject);
    procedure mn_CashBankDefClick(Sender: TObject);
    procedure mn_ItemDefClick(Sender: TObject);
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
   License,  BackUp, lkp_Company, lkp_Branch, lkp_CustomerGroup,
  lkp_Currency, lkp_ItemCategory, lkp_ItemColor, lkp_ItemGroupSections,
  lkp_ItemPolicies, lkp_ItemSize, lkp_ItemType, lkp_ItemUnit,
  lkp_WareHouse, lkp_VendorGroup, lkp_UserGroups, lkp_Customers,
  lkp_CurrencyExchange, lkp_ItemGroups, lkp_Vendors, Lkp_Users,
  lkp_Operators, lkp_POSDefinition, lkp_CashBank, lkp_ItemDefinition;

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
         DCompany :=ReadString('ERP_Option', 'DCompany', '');
         DBranch := ReadString('ERP_Option', 'DBranch', '');
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
                  ShowMessage('���� ��� ������� ��� ����');
                  Application.Terminate;
              end else
                  ShowMessage('��� ����� ������� �����');
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
    buttonSelected := MessageDlg('�� ���� ��� ������ �� ������',mtInformation, mbOKCancel, 0);

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

procedure TfmMainForm.mn_BranchesDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmBranch, fmBranch);
  fmBranch.ShowModal;
end;

procedure TfmMainForm.mn_UserGroupsDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmUserGroups, fmUserGroups);
  fmUserGroups.ShowModal;
end;

procedure TfmMainForm.mn_UserDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmUsers, fmUsers);
  fmUsers.ShowModal;
end;

procedure TfmMainForm.mn_CurrencyDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmCurrency, fmCurrency);
  fmCurrency.ShowModal;
end;

procedure TfmMainForm.mn_CurrencyExchangeDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmCurrencyExchange, fmCurrencyExchange);
  fmCurrencyExchange.ShowModal;
end;

procedure TfmMainForm.mn_WareHouseDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmWareHouse, fmWareHouse);
  fmWareHouse.ShowModal;
end;

procedure TfmMainForm.mn_ItemCategoryDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemCategory, fmItemCategory);
  fmItemCategory.ShowModal;
end;

procedure TfmMainForm.mn_ItemColorDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemColor, fmItemColor);
  fmItemColor.ShowModal;
end;

procedure TfmMainForm.mn_ItemTypeDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemType, fmItemType);
  fmItemType.ShowModal;
end;

procedure TfmMainForm.mn_ItemUnitDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemUnit, fmItemUnit);
  fmItemUnit.ShowModal;
end;

procedure TfmMainForm.mn_ItemSizeDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemSize, fmItemSize);
  fmItemSize.ShowModal;
end;

procedure TfmMainForm.mn_ItemGroupsDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemGroups, fmItemGroups);
  fmItemGroups.ShowModal;
end;

procedure TfmMainForm.mn_ItemGroupSectionDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemGroupSections, fmItemGroupSections);
  fmItemGroupSections.ShowModal;
end;

procedure TfmMainForm.mn_VendoersDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmVendors, fmVendors);
  fmVendors.ShowModal;
end;

procedure TfmMainForm.mn_VendorGroupDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmVendorGroup, fmVendorGroup);
  fmVendorGroup.ShowModal;
end;

procedure TfmMainForm.mn_CustomerGroupDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmCustomerGroup, fmCustomerGroup);
  fmCustomerGroup.ShowModal;
end;

procedure TfmMainForm.mn_CustomerDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmCustomers, fmCustomers);
  fmCustomers.ShowModal;
end;

procedure TfmMainForm.mn_ItemPoliciesDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemPolicies, fmItemPolicies);
  fmItemPolicies.ShowModal;
end;

procedure TfmMainForm.mn_OperatorsDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmOperators, fmOperators);
  fmOperators.ShowModal;
end;

procedure TfmMainForm.mn_POSDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmPOSDefinition, fmPOSDefinition);
  fmPOSDefinition.ShowModal;

end;

procedure TfmMainForm.mn_CashBankDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmCashBank, fmCashBank);
  fmCashBank.ShowModal;

end;

procedure TfmMainForm.mn_ItemDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemDefinition, fmItemDefinition);
   fmItemDefinition.ShowModal;

end;

end.

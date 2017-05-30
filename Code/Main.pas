unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, Menus, ComCtrls, ToolWin, DB, DBClient, ExtCtrls,
  DBXpress, SqlExpr, SimpleDS, FMTBcd,  Grids, DBGrids, ADODB, jpeg,
  IniFiles, Buttons, Registry, ActnMan, ActnList, ActnCtrls, IdBaseComponent,
  Provider,  IdComponent, IdTCPClient, IdTCPConnection,
  Activex, VrControls, VrButtons ,ComObj,  VrDesign, ppParameter, ppModule,
  raCodMod, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe  ;
     
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
    qry_Main2: TSimpleDataSet;
    mn_PerchaseInvoice: TMenuItem;
    mn_BegBalDef: TMenuItem;
    mn_ivCounting: TMenuItem;
    mn_fmAdjustment: TMenuItem;
    grp_Allarms: TGroupBox;
    btn_ReOrderItems: TVrDemoButton;
    tm_Allarms: TTimer;
    qry_ItemCard: TSimpleDataSet;
    DS_ItemCard: TDataSource;
    PPL_ItemCard: TppDBPipeline;
    pp_ItemCard: TppReport;
    ppParameterList3: TppParameterList;
    qry_ItemCardCompanyCode: TStringField;
    qry_ItemCardItemCode: TStringField;
    qry_ItemCardItemService: TStringField;
    qry_ItemCardItemNameAr: TStringField;
    qry_ItemCardItemNameEn: TStringField;
    qry_ItemCardBalance: TFMTBCDField;
    qry_ItemCardReOrderQuantity: TFMTBCDField;
    ppHeaderBand2: TppHeaderBand;
    ppShape8: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel2: TppLabel;
    ppLabel6: TppLabel;
    ppLabel14: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine20: TppLine;
    ppLabel16: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine10: TppLine;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppDBText12: TppDBText;
    raCodeModule2: TraCodeModule;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    mn_BarcodePrinting: TMenuItem;
    mn_TablesDef: TMenuItem;
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
    procedure btn_DailyCloseClick(Sender: TObject);
    procedure btn_POSClick(Sender: TObject);
    procedure mn_POSClick(Sender: TObject);
    procedure mn_DailyCloseClick(Sender: TObject);
    procedure mn_PerchaseInvoiceClick(Sender: TObject);
    procedure mn_BegBalDefClick(Sender: TObject);
    procedure mn_ivCountingClick(Sender: TObject);
    procedure mn_fmAdjustmentClick(Sender: TObject);
    procedure btn_ReportsClick(Sender: TObject);
    procedure tm_AllarmsTimer(Sender: TObject);
    procedure btn_ReOrderItemsMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_ReOrderItemsClick(Sender: TObject);
    procedure mn_BarcodePrintingClick(Sender: TObject);
    procedure mn_TablesDefClick(Sender: TObject);
  private
    { Private declarations }
    LastUserAccess , LicenseNo , BiosID : String;
    procedure  GetWin32_BIOSInfo;
  public
    { Public declarations }
     Rep: TppReport;
     RepParam : TppParameterList;
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
  lkp_Operators, lkp_POSDefinition, lkp_CashBank, lkp_ItemDefinition,
  PosClose, PointOfSale,

  PrTrxBaseForm, PrBegBalForm, BaseReport, lkp_BarcodePrinting, lkp_Tables;

{$R *.dfm}

procedure TfmMainForm.FormCreate(Sender: TObject);
Var
  strDBServerName, strDBUserID, strDBPassword, strDBName,  strDriverName  : string;
  vIni: TIniFile;
  l: DWORD;
begin
   gLoginFrom_POS_Screen := False;
   Screen.MenuFont.Name := 'Times New Roman';
   Screen.MenuFont.Size := 11 ;
   Screen.MenuFont.Style := [fsBold];

   RepParam := TppParameterList.Create(Self);

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
                  ShowMessage('ÚÝæÇ ÑÞã ÇáÊÑÎíÕ ÛíÑ ÕÍíÍ');
                  Application.Terminate;
              end else
                  ShowMessage('ÊãÊ ÚãáíÉ ÇáÊÑÎíÕ ÈäÌÇÍ');
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
    buttonSelected := MessageDlg('åá ÊÑíÏ ÍÞÇ ÇáÎÑæÌ ãä ÇáäÙÇã',mtInformation, mbOKCancel, 0);

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

procedure TfmMainForm.btn_DailyCloseClick(Sender: TObject);
begin
  Application.CreateForm(TfmPosClose, fmPosClose);
  fmPosClose.ShowModal;
end;

procedure TfmMainForm.btn_POSClick(Sender: TObject);
begin
  Application.CreateForm(TfmPointOfSale, fmPointOfSale);
  fmPointOfSale.Show;
end;

procedure TfmMainForm.mn_POSClick(Sender: TObject);
begin
  Application.CreateForm(TfmPointOfSale, fmPointOfSale);
  fmPointOfSale.Show;
end;

procedure TfmMainForm.mn_DailyCloseClick(Sender: TObject);
begin
  Application.CreateForm(TfmPosClose, fmPosClose);
  fmPosClose.ShowModal;
end;

procedure TfmMainForm.mn_PerchaseInvoiceClick(Sender: TObject);
begin
  Application.CreateForm(TfmPrTrxBaseForm, fmPrTrxBaseForm);
   fmPrTrxBaseForm.ShowModal;

end;

procedure TfmMainForm.mn_BegBalDefClick(Sender: TObject);
begin
  gIV_TrxType :='IVBB';
  Application.CreateForm(TfmBegBalForm, fmBegBalForm);
  fmBegBalForm.ShowModal;

end;

procedure TfmMainForm.mn_ivCountingClick(Sender: TObject);
begin
    gIV_TrxType :='IVCT';
  Application.CreateForm(TfmBegBalForm, fmBegBalForm);
  fmBegBalForm.ShowModal;
end;

procedure TfmMainForm.mn_fmAdjustmentClick(Sender: TObject);
begin
  gIV_TrxType :='IVAD';
  Application.CreateForm(TfmBegBalForm, fmBegBalForm);
  fmBegBalForm.ShowModal;
end;

procedure TfmMainForm.btn_ReportsClick(Sender: TObject);
begin
  Application.CreateForm(TfmBaseReports, fmBaseReports);
  fmBaseReports.ShowModal;
end;

procedure TfmMainForm.tm_AllarmsTimer(Sender: TObject);
Var STRLST : TStringList;
begin
    STRLST := TStringList.Create;

    qry_ItemCard.Close;
    qry_ItemCard.DataSet.Close;
    qry_ItemCard.DataSet.CommandText := ''
      + ' SELECT     CompanyCode, ItemCode, ItemService, ItemNameAr, ItemNameEn, SUM(InQty) - SUM(OutQty) AS Balance, ISNULL(ReOrderQuantity, 0)  AS ReOrderQuantity   '
      + ' FROM         (   '

       {-- ÇáãÈíÚÇÊ }

      + '                         SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescA, H.TrxDescE, H.TrxAmount, D.Barcode, D.ItemCode, '
      + '                                               D.ItemService, I.ItemNameAr, I.ItemNameEn, CASE WHEN H.TrxType = ''SART'' THEN D .Quantity ELSE 0 END AS InQty, '
      + '                                               CASE WHEN H.TrxType = ''SAIV'' THEN D .Quantity ELSE 0 END AS OutQty, D.ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, '
      + '                                               CASE WHEN H.TrxType = ''SART'' THEN 0 ELSE 1 END AS TrxOrder, I.ReOrderQuantity  '
      + '                         FROM         sa_POS_TrxHeader AS H INNER JOIN  '
      + '                                               sa_POS_TrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND  '
      + '                                               H.TrxType = D.TrxType AND H.YearID = D.YearID AND H.PeriodID = D.PeriodID LEFT OUTER JOIN  '
      + '                                               tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnitCode = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                               tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND D.ItemCode = I.ItemCode '
      + '                         WHERE     (H.TrxType IN (''SAIV'', ''SART'')) '

      {-- ãßæäÇÊ ÇáÇáÕäÇÝ}
      + '                         UNION ALL '
      + '                         SELECT  H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, ''ãäÕÑÝ ãä ãßæäÇÊ ÇÍÏì ÇáÇÕäÇÝ'' As TrxDescA, H.TrxDescE, H.TrxAmount, D.Barcode, DD.DetailsItemCode, D.ItemService, '
      + '                                            		I.ItemNameAr, I.ItemNameEn, CASE WHEN H.TrxType = ''SART'' THEN DD.Quantity ELSE 0 END AS InQty, '
      + '                                            		CASE WHEN H.TrxType = ''SAIV'' THEN DD.Quantity ELSE 0 END AS OutQty, DD.ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, '
      + '                                            		CASE WHEN H.TrxType = ''SART'' THEN 0 ELSE 1 END AS TrxOrder , I.ReOrderQuantity '
      + '                         FROM   sa_POS_TrxHeader AS H INNER JOIN '
      + '                                            		sa_POS_TrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND H.TrxType = D.TrxType AND '
      + '                                            		H.YearID = D.YearID AND H.PeriodID = D.PeriodID INNER JOIN '
      + '                                            		sa_POS_TrxItemSpecification AS DD ON D.CompanyCode = DD.CompanyCode AND D.BranchCode = DD.BranchCode AND D.TrxNo = DD.TrxNo AND '
      + '                                            		D.TrxType = DD.TrxType AND D.YearID = DD.YearID AND D.PeriodID = DD.PeriodID AND D.ItemCode = DD.ItemCode AND '
      + '                                            		D.ItemService = DD.ItemService LEFT OUTER JOIN '
      + '                                            		tbl_ItemUnit AS U ON DD.CompanyCode = U.CompanyCode AND DD.ItemUnitCode = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                            		tbl_ItemDefinition AS I ON DD.CompanyCode = I.CompanyCode AND DD.ItemService = I.ItemService AND DD.DetailsItemCode = I.ItemCode '
      + '                         WHERE     (H.TrxType IN (''SAIV'', ''SART'')) '
      {-- ÇáãÔÊÑíÇÊ æÇáÑÕíÏ ÇáÇÝÊÊÇÍí æÇáÌÑÏ ÇáãÎÒäí }
      + '                         UNION ALL '
      + '                         SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescAr, H.TrxDescEn, H.TrxAmount, D.BarCode, D.ItemCode, '
      + '                                               D.ItemService, I.ItemNameAr, I.ItemNameEn, CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') THEN D .Quantity When (H.TrxType =  ''IVAD'' And D.DiffQty > 0) Then D.DiffQty ELSE 0 END AS InQty, '
      + '                                               CASE WHEN H.TrxType = ''PRRT'' THEN D .Quantity When (H.TrxType =  ''IVAD'' And D.DiffQty < 0) Then Abs(D.DiffQty) ELSE 0 END AS OutQty, D.ItemUnit, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, '
      + '                                               CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') THEN 0 When (H.TrxType =  ''IVAD'' And D.DiffQty > 0) Then 0 ELSE 1 END AS TrxOrder, I.ReOrderQuantity '
      + '                         FROM         tbl_PrTrxHeader AS H INNER JOIN '
      + '                                               tbl_PrTrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
      + '                                               H.TrxType = D.TrxType LEFT OUTER JOIN '
      + '                                               tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnit = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                               tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND D.ItemCode = I.ItemCode'
      + '                         WHERE     (H.TrxType IN (''IVBB'', ''PRIV'', ''PRRT'' , ''IVAD''))) AS RD '
      + ' WHERE     (CompanyCode = ''' + DCompany + ''')   '
      + ' GROUP BY CompanyCode, ItemCode, ItemService, ItemNameAr, ItemNameEn, ReOrderQuantity '
      + ' Having (SUM(InQty) - SUM(OutQty)) <= IsNull(ReOrderQuantity,0) '
      + ' ORDER BY CompanyCode , ItemCode ';

    StrLst.Add(qry_ItemCard.DataSet.CommandText ) ;
    StrLst.SaveToFile('AllarmQuery.txt');

    qry_ItemCard.Open;

    If qry_ItemCard.RecordCount > 0 Then Begin
      grp_Allarms.Visible := True;
      If btn_ReOrderItems.Visible  Then
         btn_ReOrderItems.Visible := False
      else
         btn_ReOrderItems.Visible := True;
    end else
        grp_Allarms.Visible := False;

end;

procedure TfmMainForm.btn_ReOrderItemsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  btn_ReOrderItems.Visible := True;
end;

procedure TfmMainForm.btn_ReOrderItemsClick(Sender: TObject);
Var
   RepFileName : String ;
begin
    RepParam.Clear;
    pp_ItemCard.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\sa_Item_ReorderQuantity.rtm' ;

    pp_ItemCard.Parameters.Clear;
    pp_ItemCard.Template.LoadFromFile;
    pp_ItemCard.Parameters := RepParam;
    pp_ItemCard.OutlineSettings.CreateNode := false;
    pp_ItemCard.OutlineSettings.CreatePageNodes := false;
    pp_ItemCard.OutlineSettings.Visible := false;
    pp_ItemCard.PreviewFormSettings.WindowState := wsMaximized;
    pp_ItemCard.PreviewFormSettings.ZoomPercentage := 100;
    pp_ItemCard.AllowPrintToFile := True;
    pp_ItemCard.ShowPrintDialog := True;
    pp_ItemCard.Print;
end;

procedure TfmMainForm.mn_BarcodePrintingClick(Sender: TObject);
begin
  Application.CreateForm(TfmBarcodePrinting, fmBarcodePrinting);
  fmBarcodePrinting.ShowModal;
end;

procedure TfmMainForm.mn_TablesDefClick(Sender: TObject);
begin
  Application.CreateForm(TfmTables, fmTables);
  fmTables.ShowModal;
end;

end.

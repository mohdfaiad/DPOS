program ERP;

uses
  Forms,
  Main in 'Main.pas' {fmMainForm},
  lkp_ItemCategory in 'Masters\lkp_ItemCategory.pas' {fmItemCategory},
  MainDataSet in 'SystemManager\MainDataSet.pas' {fmMainDataSet},
  GFunctions in 'SystemManager\GFunctions.pas',
  GVariable in 'SystemManager\GVariable.pas',
  License in 'SystemManager\License.pas' {fmLicense},
  Login in 'SystemManager\Login.pas' {fmLogin},
  lkp_VendorGroup in 'Masters\lkp_VendorGroup.pas' {fmVendorGroup},
  lkp_CurrencyExchange in 'Masters\lkp_CurrencyExchange.pas' {fmCurrencyExchange},
  lkp_Users in 'Masters\lkp_Users.pas' {fmUsers},
  lkp_ItemColor in 'Masters\lkp_ItemColor.pas' {fmItemColor},
  lkp_ItemGroupSections in 'Masters\lkp_ItemGroupSections.pas' {fmItemGroupSections},
  lkp_ItemPolicies in 'Masters\lkp_ItemPolicies.pas' {fmItemPolicies},
  lkp_ItemSize in 'Masters\lkp_ItemSize.pas' {fmItemSize},
  lkp_ItemType in 'Masters\lkp_ItemType.pas' {fmItemType},
  lkp_ItemUnit in 'Masters\lkp_ItemUnit.pas' {fmItemUnit},
  lkp_WareHouse in 'Masters\lkp_WareHouse.pas' {fmWareHouse},
  lkp_CashBank in 'Masters\lkp_CashBank.pas' {fmCashBank},
  lkp_ItemGroups in 'Masters\lkp_ItemGroups.pas' {fmItemGroups},
  lkp_Company in 'Masters\lkp_Company.pas' {fmCompany},
  BackUp in 'SystemManager\BackUp.pas' {fmBackUp},
  lkp_CustomerGroup in 'Masters\lkp_CustomerGroup.pas' {fmCustomerGroup},
  LookUp in 'SystemManager\LookUp.pas' {Lkp},
  PosClose in 'Transactions\PosClose.pas' {fmPosClose},
  lkp_Branch in 'Masters\lkp_Branch.pas' {fmBranch},
  lkp_Currency in 'Masters\lkp_Currency.pas' {fmCurrency},
  lkp_Vendors in 'Masters\lkp_Vendors.pas' {fmVendors},
  lkp_Operators in 'Masters\lkp_Operators.pas' {fmOperators},
  lkp_UserGroups in 'Masters\lkp_UserGroups.pas' {fmUserGroups},
  lkp_Customers in 'Masters\lkp_Customers.pas' {fmCustomers},
  PointOfSale in 'Transactions\PointOfSale.pas' {fmPointOfSale},
  posPayType in 'Transactions\posPayType.pas',
  lkp_POSDefinition in 'Masters\lkp_POSDefinition.pas' {fmPOSDefinition},
  lkp_ItemDefinition in 'Masters\lkp_ItemDefinition.pas' {fmItemDefinition},
  PrBegBalForm in 'Pr\PrBegBalForm.pas' {fmBegBalForm},
  PrTrxBaseForm in 'Pr\PrTrxBaseForm.pas' {fmPrTrxBaseForm},
  BaseReport in 'SystemManager\BaseReport.pas' {fmBaseReports};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMainForm, fmMainForm);
  Application.CreateForm(TfmLicense, fmLicense);
  Application.CreateForm(TfmLogin, fmLogin);
  Application.Run;
end.

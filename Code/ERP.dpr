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
  lkp_Currency in 'Masters\lkp_Currency.pas' {fmCurrency},
  lkp_UserGroups in 'Masters\lkp_UserGroups.pas' {fmUserGroups},
  lkp_ItemColor in 'Masters\lkp_ItemColor.pas' {fmItemColor},
  lkp_ItemGroupSections in 'Masters\lkp_ItemGroupSections.pas' {fmItemGroupSections},
  lkp_ItemPolicies in 'Masters\lkp_ItemPolicies.pas' {fmItemPolicies},
  lkp_ItemSize in 'Masters\lkp_ItemSize.pas' {fmItemSize},
  lkp_ItemType in 'Masters\lkp_ItemType.pas' {fmItemType},
  lkp_ItemUnit in 'Masters\lkp_ItemUnit.pas' {fmItemUnit},
  lkp_WareHouse in 'Masters\lkp_WareHouse.pas' {fmWareHouse},
  lkp_Branch in 'Masters\lkp_Branch.pas' {fmBranch},
  lkp_Customers in 'Masters\lkp_Customers.pas' {fmCustomers},
  lkp_Company in 'Masters\lkp_Company.pas' {fmCompany},
  BackUp in 'SystemManager\BackUp.pas' {fmBackUp},
  lkp_CustomerGroup in 'Masters\lkp_CustomerGroup.pas' {fmCustomerGroup};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMainForm, fmMainForm);
  Application.CreateForm(TfmLicense, fmLicense);
  Application.CreateForm(TfmLogin, fmLogin);
  Application.CreateForm(TfmVendorGroup, fmVendorGroup);
  Application.CreateForm(TfmCurrency, fmCurrency);
  Application.CreateForm(TfmUserGroups, fmUserGroups);
  Application.CreateForm(TfmItemColor, fmItemColor);
  Application.CreateForm(TfmItemGroupSections, fmItemGroupSections);
  Application.CreateForm(TfmItemPolicies, fmItemPolicies);
  Application.CreateForm(TfmItemSize, fmItemSize);
  Application.CreateForm(TfmItemType, fmItemType);
  Application.CreateForm(TfmItemUnit, fmItemUnit);
  Application.CreateForm(TfmWareHouse, fmWareHouse);
  Application.CreateForm(TfmBranch, fmBranch);
  Application.CreateForm(TfmCustomers, fmCustomers);
  Application.CreateForm(TfmCompany, fmCompany);
  Application.CreateForm(TfmBackUp, fmBackUp);
  Application.CreateForm(TfmCustomerGroup, fmCustomerGroup);
  Application.Run;
end.

unit MainDataSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls , IniFiles, jpeg, ExtCtrls, DB, ADODB, ComCtrls,
  DBClient, SimpleDS;

type
  TfmMainDataSet = class(TForm)
    QryBranch: TSimpleDataSet;
    QryItemDefinition: TSimpleDataSet;
    QryItemUnit: TSimpleDataSet;
    QryItemSize: TSimpleDataSet;
    QryItemColor: TSimpleDataSet;
    QryItemType: TSimpleDataSet;
    QryItemCategory: TSimpleDataSet;
    QryItemGroup: TSimpleDataSet;
    QryCompany: TSimpleDataSet;
    QryCurrency: TSimpleDataSet;
    QryItemGroupSection: TSimpleDataSet;
    QryCustomers: TSimpleDataSet;
    QryItemPolicies: TSimpleDataSet;
    QryCustomerGroup: TSimpleDataSet;
    QryVendors: TSimpleDataSet;
    QryVendorGroup: TSimpleDataSet;
    QryUsers: TSimpleDataSet;
    QryUserGroup: TSimpleDataSet;
    QryWareHouse: TSimpleDataSet;
    QryBranchBranchCode: TStringField;
    QryBranchBranchNameAr: TStringField;
    QryBranchBranchNameEn: TStringField;
    QryCompanyCompanyCode: TStringField;
    QryCompanyCompanyNameAr: TStringField;
    QryCompanyCompanyNameEn: TStringField;
    QryCurrencyCurrencyCode: TStringField;
    QryCurrencyCurrencyNameA: TStringField;
    QryCurrencyCurrencyNameE: TStringField;
    QryCustomerGroupCustomerGroupCode: TStringField;
    QryCustomerGroupCustomerGroupNameAr: TStringField;
    QryCustomerGroupCustomerGroupNameEn: TStringField;
    QryCustomersCustomerCode: TStringField;
    QryCustomersCustomerGroupCode: TStringField;
    QryCustomersCustomerGroupNameAr: TStringField;
    QryCustomersCustomerGroupNameEn: TStringField;
    QryItemCategoryItemCategoryCode: TStringField;
    QryItemCategoryItemCategoryNameAr: TStringField;
    QryItemCategoryItemCategoryNameEn: TStringField;
    QryItemColorItemColorCode: TStringField;
    QryItemColorItemColorNameAr: TStringField;
    QryItemColorItemColorNameEn: TStringField;
    QryItemDefinitionItemCode: TStringField;
    QryItemDefinitionItemNameAr: TStringField;
    QryItemDefinitionItemNameEn: TStringField;
    QryItemGroupItemGroupCode: TStringField;
    QryItemGroupItemGroupNameAr: TStringField;
    QryItemGroupItemGroupNameEn: TStringField;
    QryItemGroupSectionSectionCode: TStringField;
    QryItemGroupSectionSectionNameA: TStringField;
    QryItemGroupSectionSectionNameE: TStringField;
    QryItemPoliciesPolicyCode: TStringField;
    QryItemPoliciesPolicyNameAr: TStringField;
    QryItemPoliciesPolicyNameEn: TStringField;
    QryItemTypeItemTypeCode: TStringField;
    QryItemTypeItemTypeNameAr: TStringField;
    QryItemTypeItemTypeNameEn: TStringField;
    QryItemSizeItemSizeCode: TStringField;
    QryItemSizeItemSizeNameAr: TStringField;
    QryItemSizeItemSizeNameEn: TStringField;
    QryItemUnitItemUnitCode: TStringField;
    QryItemUnitItemUnitDescA: TStringField;
    QryItemUnitItemUnitDescE: TStringField;
    QryUserGroupGroupCode: TStringField;
    QryUserGroupGroupNameA: TStringField;
    QryUserGroupGroupNameE: TStringField;
    QryUsersUserID: TStringField;
    QryUsersFullNameA: TStringField;
    QryUsersFullNameE: TStringField;
    QryVendorGroupVendorGroupCode: TStringField;
    QryVendorGroupVendoreNameAr: TStringField;
    QryVendorGroupVendoreNameEn: TStringField;
    QryVendorsVendoreCode: TStringField;
    QryVendorsVendoreNameAr: TStringField;
    QryVendorsVendoreNameEn: TStringField;
    QryWareHouseWareHouseCode: TStringField;
    QryWareHouseWareHouseNameAr: TStringField;
    QryWareHouseWareHouseNameEn: TStringField;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    vIni: TIniFile;
  public
    { Public declarations }
    CopyNo : String;
  end;

var
  fmMainDataSet: TfmMainDataSet;

implementation

uses GVariable, Main;

{$R *.dfm}

procedure TfmMainDataSet.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.

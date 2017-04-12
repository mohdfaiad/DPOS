object fmMainDataSet: TfmMainDataSet
  Left = 394
  Top = 207
  BorderStyle = bsDialog
  Caption = 'MainDataSet'
  ClientHeight = 399
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object QryBranch: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Branch'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    object QryBranchBranchCode: TStringField
      FieldName = 'BranchCode'
      Required = True
      Size = 4
    end
    object QryBranchBranchNameAr: TStringField
      FieldName = 'BranchNameAr'
      Size = 250
    end
    object QryBranchBranchNameEn: TStringField
      FieldName = 'BranchNameEn'
      Size = 250
    end
  end
  object QryItemDefinition: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemDefinition'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 280
    object QryItemDefinitionItemCode: TStringField
      FieldName = 'ItemCode'
      Required = True
      Size = 25
    end
    object QryItemDefinitionItemNameAr: TStringField
      FieldName = 'ItemNameAr'
      Size = 255
    end
    object QryItemDefinitionItemNameEn: TStringField
      FieldName = 'ItemNameEn'
      Size = 255
    end
  end
  object QryItemUnit: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemUnit'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 520
    object QryItemUnitItemUnitCode: TStringField
      FieldName = 'ItemUnitCode'
      Required = True
      Size = 6
    end
    object QryItemUnitItemUnitDescA: TStringField
      FieldName = 'ItemUnitDescA'
      Size = 75
    end
    object QryItemUnitItemUnitDescE: TStringField
      FieldName = 'ItemUnitDescE'
      Size = 75
    end
  end
  object QryItemSize: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemSize'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 480
    object QryItemSizeItemSizeCode: TStringField
      FieldName = 'ItemSizeCode'
      Required = True
      Size = 6
    end
    object QryItemSizeItemSizeNameAr: TStringField
      FieldName = 'ItemSizeNameAr'
      Size = 255
    end
    object QryItemSizeItemSizeNameEn: TStringField
      FieldName = 'ItemSizeNameEn'
      Size = 255
    end
  end
  object QryItemColor: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemColor'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 240
    object QryItemColorItemColorCode: TStringField
      FieldName = 'ItemColorCode'
      Required = True
      Size = 6
    end
    object QryItemColorItemColorNameAr: TStringField
      FieldName = 'ItemColorNameAr'
      Size = 255
    end
    object QryItemColorItemColorNameEn: TStringField
      FieldName = 'ItemColorNameEn'
      Size = 255
    end
  end
  object QryItemType: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemType'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 440
    object QryItemTypeItemTypeCode: TStringField
      FieldName = 'ItemTypeCode'
      Required = True
      Size = 6
    end
    object QryItemTypeItemTypeNameAr: TStringField
      FieldName = 'ItemTypeNameAr'
      Size = 255
    end
    object QryItemTypeItemTypeNameEn: TStringField
      FieldName = 'ItemTypeNameEn'
      Size = 255
    end
  end
  object QryItemCategory: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemCategory'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 200
    object QryItemCategoryItemCategoryCode: TStringField
      FieldName = 'ItemCategoryCode'
      Required = True
      Size = 6
    end
    object QryItemCategoryItemCategoryNameAr: TStringField
      FieldName = 'ItemCategoryNameAr'
      Size = 255
    end
    object QryItemCategoryItemCategoryNameEn: TStringField
      FieldName = 'ItemCategoryNameEn'
      Size = 255
    end
  end
  object QryItemGroup: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemGroup'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 320
    object QryItemGroupItemGroupCode: TStringField
      FieldName = 'ItemGroupCode'
      Required = True
      Size = 6
    end
    object QryItemGroupItemGroupNameAr: TStringField
      FieldName = 'ItemGroupNameAr'
      Size = 255
    end
    object QryItemGroupItemGroupNameEn: TStringField
      FieldName = 'ItemGroupNameEn'
      Size = 255
    end
  end
  object QryCompany: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Company'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 40
    object QryCompanyCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object QryCompanyCompanyNameAr: TStringField
      FieldName = 'CompanyNameAr'
      Size = 250
    end
    object QryCompanyCompanyNameEn: TStringField
      FieldName = 'CompanyNameEn'
      Size = 250
    end
  end
  object QryCurrency: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Currency'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 80
    object QryCurrencyCurrencyCode: TStringField
      FieldName = 'CurrencyCode'
      Required = True
      Size = 3
    end
    object QryCurrencyCurrencyNameA: TStringField
      FieldName = 'CurrencyNameA'
      Size = 25
    end
    object QryCurrencyCurrencyNameE: TStringField
      FieldName = 'CurrencyNameE'
      Size = 25
    end
  end
  object QryItemGroupSection: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemGroupSections'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 360
    object QryItemGroupSectionSectionCode: TStringField
      FieldName = 'SectionCode'
      Required = True
      Size = 6
    end
    object QryItemGroupSectionSectionNameA: TStringField
      FieldName = 'SectionNameA'
      Size = 75
    end
    object QryItemGroupSectionSectionNameE: TStringField
      FieldName = 'SectionNameE'
      Size = 75
    end
  end
  object QryCustomers: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Cutomers'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 160
    object QryCustomersCustomerCode: TStringField
      FieldName = 'CustomerCode'
      Required = True
      Size = 6
    end
    object QryCustomersCustomerGroupCode: TStringField
      FieldName = 'CustomerGroupCode'
      Size = 6
    end
    object QryCustomersCustomerGroupNameAr: TStringField
      FieldName = 'CustomerGroupNameAr'
      Size = 255
    end
    object QryCustomersCustomerGroupNameEn: TStringField
      FieldName = 'CustomerGroupNameEn'
      Size = 255
    end
  end
  object QryItemPolicies: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemPolicies'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 400
    object QryItemPoliciesPolicyCode: TStringField
      FieldName = 'PolicyCode'
      Required = True
      Size = 4
    end
    object QryItemPoliciesPolicyNameAr: TStringField
      FieldName = 'PolicyNameAr'
    end
    object QryItemPoliciesPolicyNameEn: TStringField
      FieldName = 'PolicyNameEn'
    end
  end
  object QryCustomerGroup: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_CustomerGroup'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 120
    object QryCustomerGroupCustomerGroupCode: TStringField
      FieldName = 'CustomerGroupCode'
      Required = True
      Size = 6
    end
    object QryCustomerGroupCustomerGroupNameAr: TStringField
      FieldName = 'CustomerGroupNameAr'
      Size = 255
    end
    object QryCustomerGroupCustomerGroupNameEn: TStringField
      FieldName = 'CustomerGroupNameEn'
      Size = 255
    end
  end
  object QryVendors: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Vendors'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 120
    Top = 40
    object QryVendorsVendoreCode: TStringField
      FieldName = 'VendoreCode'
      Required = True
      Size = 6
    end
    object QryVendorsVendoreNameAr: TStringField
      FieldName = 'VendoreNameAr'
      Size = 250
    end
    object QryVendorsVendoreNameEn: TStringField
      FieldName = 'VendoreNameEn'
      Size = 250
    end
  end
  object QryVendorGroup: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_VendorGroup'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 80
    Top = 40
    object QryVendorGroupVendorGroupCode: TStringField
      FieldName = 'VendorGroupCode'
      Required = True
      Size = 6
    end
    object QryVendorGroupVendoreNameAr: TStringField
      FieldName = 'VendoreNameAr'
      Size = 255
    end
    object QryVendorGroupVendoreNameEn: TStringField
      FieldName = 'VendoreNameEn'
      Size = 255
    end
  end
  object QryUsers: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Users'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 40
    Top = 40
    object QryUsersUserID: TStringField
      FieldName = 'UserID'
      Required = True
      Size = 75
    end
    object QryUsersFullNameA: TStringField
      FieldName = 'FullNameA'
      Size = 250
    end
    object QryUsersFullNameE: TStringField
      FieldName = 'FullNameE'
      Size = 250
    end
  end
  object QryUserGroup: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_UserGroup'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Top = 40
    object QryUserGroupGroupCode: TStringField
      FieldName = 'GroupCode'
      Required = True
      Size = 10
    end
    object QryUserGroupGroupNameA: TStringField
      FieldName = 'GroupNameA'
      Size = 75
    end
    object QryUserGroupGroupNameE: TStringField
      FieldName = 'GroupNameE'
      Size = 75
    end
  end
  object QryWareHouse: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_WareHouse'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 160
    Top = 40
    object QryWareHouseWareHouseCode: TStringField
      FieldName = 'WareHouseCode'
      Required = True
      Size = 6
    end
    object QryWareHouseWareHouseNameAr: TStringField
      FieldName = 'WareHouseNameAr'
      Size = 250
    end
    object QryWareHouseWareHouseNameEn: TStringField
      FieldName = 'WareHouseNameEn'
      Size = 250
    end
  end
end

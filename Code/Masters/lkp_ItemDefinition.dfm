object fmItemDefinition: TfmItemDefinition
  Left = 316
  Top = 6
  BorderStyle = bsDialog
  Caption = #1575#1604#1571#1589#1606#1575#1601' '#1575#1604#1605#1582#1586#1606#1610#1577
  ClientHeight = 592
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object grp_Content: TGroupBox
    Left = 64
    Top = 102
    Width = 921
    Height = 477
    BiDiMode = bdRightToLeft
    Caption = #1575#1604#1571#1589#1606#1575#1601' '#1575#1604#1605#1582#1586#1606#1610#1577
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      921
      477)
    object grpData: TGroupBox
      Left = 11
      Top = 22
      Width = 902
      Height = 441
      Anchors = []
      TabOrder = 0
      DesignSize = (
        902
        441)
      object Label2: TLabel
        Left = 822
        Top = 61
        Width = 65
        Height = 19
        Anchors = []
        Caption = #1575#1604#1575#1587#1605' '#1593#1585#1576#1610' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 858
        Top = 29
        Width = 29
        Height = 19
        Anchors = []
        Caption = #1575#1604#1585#1605#1586
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 397
        Top = 61
        Width = 73
        Height = 19
        Anchors = []
        Caption = #1575#1604#1575#1587#1605' '#1575#1606#1580#1604#1610#1586#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 379
        Top = 157
        Width = 89
        Height = 19
        Anchors = []
        Caption = #1571#1602#1589#1610' '#1606#1587#1576#1577' '#1582#1589#1605
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 197
        Top = 157
        Width = 47
        Height = 19
        Anchors = []
        Caption = #1581#1583' '#1575#1604#1591#1604#1576
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 426
        Top = 123
        Width = 44
        Height = 19
        Anchors = []
        Caption = #1571#1602#1604' '#1603#1605#1610#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 186
        Top = 123
        Width = 58
        Height = 19
        Anchors = []
        Caption = #1571#1602#1589#1610' '#1603#1605#1610#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 374
        Top = 91
        Width = 96
        Height = 19
        Anchors = []
        Caption = #1603#1608#1583' '#1575#1604#1589#1606#1601' '#1604#1604#1605#1608#1585#1583
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 145
        Top = 91
        Width = 99
        Height = 19
        Anchors = []
        Caption = #1603#1608#1583' '#1575#1604#1589#1606#1601' '#1575#1604#1571#1589#1604#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCode: TDBEdit
        Left = 679
        Top = 25
        Width = 121
        Height = 27
        Anchors = []
        DataField = 'ItemCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 57
        Width = 356
        Height = 27
        Anchors = []
        DataField = 'ItemNameEn'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 481
        Top = 81
        Width = 404
        Height = 149
        TabOrder = 2
        DesignSize = (
          404
          149)
        object Label4: TLabel
          Left = 345
          Top = 19
          Width = 53
          Height = 19
          Anchors = []
          Caption = #1575#1604#1605#1580#1605#1608#1593#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 369
          Top = 49
          Width = 28
          Height = 19
          Anchors = []
          Caption = #1575#1604#1606#1608#1593
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 364
          Top = 80
          Width = 33
          Height = 19
          Anchors = []
          Caption = #1575#1604#1608#1581#1583#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 373
          Top = 117
          Width = 24
          Height = 19
          Anchors = []
          Caption = #1575#1604#1601#1574#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Co_ItemGroup: TDBLookupComboBox
          Left = 4
          Top = 17
          Width = 321
          Height = 27
          DataField = 'ItemGroupCode'
          DataSource = DS_Header
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          KeyField = 'ItemGroupCode'
          ListField = 'ItemGroupNameAr'
          ListSource = DS_ItemGroup
          ParentFont = False
          TabOrder = 0
        end
        object Co_ItemType: TDBLookupComboBox
          Left = 4
          Top = 49
          Width = 321
          Height = 27
          DataField = 'ItemTypeCode'
          DataSource = DS_Header
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          KeyField = 'ItemTypeCode'
          ListField = 'ItemTypeNameAr'
          ListSource = DS_ItemType
          ParentFont = False
          TabOrder = 1
        end
        object Co_ItemUnit: TDBLookupComboBox
          Left = 4
          Top = 81
          Width = 321
          Height = 27
          DataField = 'ItemUnitCode'
          DataSource = DS_Header
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          KeyField = 'ItemUnitCode'
          ListField = 'ItemUnitDescA'
          ListSource = DS_ItemUnit
          ParentFont = False
          TabOrder = 2
        end
        object Co_ItemCategory: TDBLookupComboBox
          Left = 4
          Top = 113
          Width = 321
          Height = 27
          DataField = 'ItemCategoryCode'
          DataSource = DS_Header
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          KeyField = 'ItemCategoryCode'
          ListField = 'ItemCategoryNameAr'
          ListSource = DS_ItemCategory
          ParentFont = False
          TabOrder = 3
        end
      end
      object DBEdit2: TDBEdit
        Left = 248
        Top = 87
        Width = 124
        Height = 27
        Anchors = []
        DataField = 'ItemVendorCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 18
        Top = 87
        Width = 124
        Height = 27
        Anchors = []
        DataField = 'OriginalItemCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 248
        Top = 119
        Width = 124
        Height = 27
        Anchors = []
        DataField = 'MinQuantity'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit5: TDBEdit
        Left = 18
        Top = 119
        Width = 124
        Height = 27
        Anchors = []
        DataField = 'MaxQuantity'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 480
        Top = 57
        Width = 320
        Height = 27
        Anchors = []
        DataField = 'ItemNameAr'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit7: TDBEdit
        Left = 248
        Top = 153
        Width = 124
        Height = 27
        Anchors = []
        DataField = 'MaxDiscountRatio'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit8: TDBEdit
        Left = 18
        Top = 153
        Width = 124
        Height = 27
        Anchors = []
        DataField = 'ReOrderQuantity'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object PG1: TPageControl
        Left = 2
        Top = 240
        Width = 898
        Height = 199
        ActivePage = TabSheet1
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        object TabSheet1: TTabSheet
          Caption = #1575#1604#1576#1575#1585#1603#1608#1583
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          object GroupBox3: TGroupBox
            Left = 0
            Top = 32
            Width = 890
            Height = 133
            Align = alBottom
            TabOrder = 0
            object grd_Brcodes: TDBGrid
              Left = 2
              Top = 21
              Width = 886
              Height = 105
              Align = alTop
              DataSource = DS_Barcodes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -19
              Font.Name = 'Times New Roman'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clNavy
              TitleFont.Height = -21
              TitleFont.Name = 'Times New Roman'
              TitleFont.Style = []
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1605#1603#1608#1606#1575#1578' '#1575#1604#1589#1606#1601
          ImageIndex = 1
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 88
    Top = 32
    Width = 873
    Height = 57
    TabOrder = 1
    object BtnOpen: TButton
      Left = 626
      Top = 13
      Width = 115
      Height = 35
      Caption = #1601#1578#1581
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnOpenClick
    end
    object btnAdd: TButton
      Left = 503
      Top = 13
      Width = 115
      Height = 35
      Caption = #1573#1590#1575#1601#1577
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnEdit: TButton
      Left = 379
      Top = 13
      Width = 115
      Height = 35
      Caption = #1578#1593#1583#1610#1600#1600#1604
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 11
      Top = 13
      Width = 115
      Height = 35
      Caption = #1581#1584#1601
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 5
      OnClick = btnDeleteClick
    end
    object btnSave: TButton
      Left = 254
      Top = 13
      Width = 115
      Height = 35
      Caption = #1581#1601#1600#1600#1600#1600#1600#1592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 3
      OnClick = btnSaveClick
    end
    object BtnCancel: TButton
      Left = 132
      Top = 13
      Width = 115
      Height = 35
      Caption = #1573#1604#1594#1575#1569
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 4
      OnClick = BtnCancelClick
    end
    object BtnShow: TButton
      Left = 750
      Top = 13
      Width = 115
      Height = 35
      Caption = #1593#1585#1590
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 6
      OnClick = BtnShowClick
    end
  end
  object SDS_Header: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemDefinition'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnNewRecord = SDS_HeaderNewRecord
    Left = 24
    Top = 16
    object SDS_HeaderCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Visible = False
      Size = 4
    end
    object SDS_HeaderItemCode: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      DisplayWidth = 10
      FieldName = 'ItemCode'
      Required = True
      Size = 25
    end
    object SDS_HeaderItemService: TStringField
      FieldName = 'ItemService'
      Required = True
      Visible = False
      Size = 3
    end
    object SDS_HeaderItemNameAr: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610
      DisplayWidth = 20
      FieldName = 'ItemNameAr'
      Size = 255
    end
    object SDS_HeaderItemNameEn: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1573#1606#1580#1604#1610#1586#1610
      DisplayWidth = 20
      FieldName = 'ItemNameEn'
      Size = 255
    end
    object SDS_HeaderItemGroupCode: TStringField
      FieldName = 'ItemGroupCode'
      Visible = False
      Size = 6
    end
    object SDS_HeaderItemTypeCode: TStringField
      FieldName = 'ItemTypeCode'
      Visible = False
      Size = 6
    end
    object SDS_HeaderItemCategoryCode: TStringField
      FieldName = 'ItemCategoryCode'
      Visible = False
      Size = 6
    end
    object SDS_HeaderItemUnitCode: TStringField
      FieldName = 'ItemUnitCode'
      Visible = False
      Size = 6
    end
    object SDS_HeaderMaxDiscountRatio: TFMTBCDField
      FieldName = 'MaxDiscountRatio'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_HeaderMinQuantity: TFMTBCDField
      FieldName = 'MinQuantity'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_HeaderMaxQuantity: TFMTBCDField
      FieldName = 'MaxQuantity'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_HeaderReOrderQuantity: TFMTBCDField
      FieldName = 'ReOrderQuantity'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_HeaderItemVendorCode: TStringField
      FieldName = 'ItemVendorCode'
      Visible = False
      Size = 50
    end
    object SDS_HeaderOriginalItemCode: TStringField
      FieldName = 'OriginalItemCode'
      Visible = False
    end
  end
  object DS_Header: TDataSource
    DataSet = SDS_Header
    Left = 64
    Top = 16
  end
  object SDS_ItemGroup: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemGroup'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 16
    Top = 80
    object SDS_ItemGroupItemGroupCode: TStringField
      FieldName = 'ItemGroupCode'
      Required = True
      Size = 6
    end
    object SDS_ItemGroupItemGroupNameAr: TStringField
      FieldName = 'ItemGroupNameAr'
      Size = 255
    end
    object SDS_ItemGroupItemGroupNameEn: TStringField
      FieldName = 'ItemGroupNameEn'
      Size = 255
    end
  end
  object DS_ItemGroup: TDataSource
    DataSet = SDS_ItemGroup
    Left = 56
    Top = 80
  end
  object SDS_ItemType: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemType'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 16
    Top = 112
    object SDS_ItemTypeItemTypeCode: TStringField
      FieldName = 'ItemTypeCode'
      Required = True
      Size = 6
    end
    object SDS_ItemTypeItemTypeNameAr: TStringField
      FieldName = 'ItemTypeNameAr'
      Size = 255
    end
    object SDS_ItemTypeItemTypeNameEn: TStringField
      FieldName = 'ItemTypeNameEn'
      Size = 255
    end
  end
  object DS_ItemType: TDataSource
    DataSet = SDS_ItemType
    Left = 56
    Top = 112
  end
  object SDS_Itemunit: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemUnit'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 16
    Top = 160
    object SDS_ItemunitItemUnitCode: TStringField
      FieldName = 'ItemUnitCode'
      Required = True
      Size = 6
    end
    object SDS_ItemunitItemUnitDescA: TStringField
      FieldName = 'ItemUnitDescA'
      Size = 75
    end
    object SDS_ItemunitItemUnitDescE: TStringField
      FieldName = 'ItemUnitDescE'
      Size = 75
    end
  end
  object DS_ItemUnit: TDataSource
    DataSet = SDS_Itemunit
    Left = 56
    Top = 160
  end
  object SDS_ItemCategory: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemCategory'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 16
    Top = 208
    object SDS_ItemCategoryItemCategoryCode: TStringField
      FieldName = 'ItemCategoryCode'
      Required = True
      Size = 6
    end
    object SDS_ItemCategoryItemCategoryNameAr: TStringField
      FieldName = 'ItemCategoryNameAr'
      Size = 255
    end
    object SDS_ItemCategoryItemCategoryNameEn: TStringField
      FieldName = 'ItemCategoryNameEn'
      Size = 255
    end
  end
  object DS_ItemCategory: TDataSource
    DataSet = SDS_ItemCategory
    Left = 56
    Top = 208
  end
  object SDS_Barcodes: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Barcodes'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnNewRecord = SDS_BarcodesNewRecord
    Left = 96
    Top = 480
    object SDS_BarcodesCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Visible = False
      Size = 4
    end
    object SDS_BarcodesItemCode: TStringField
      FieldName = 'ItemCode'
      Required = True
      Visible = False
      Size = 25
    end
    object SDS_BarcodesItemService: TStringField
      FieldName = 'ItemService'
      Required = True
      Visible = False
      Size = 3
    end
    object SDS_BarcodesBarcode: TStringField
      DisplayLabel = #1575#1604#1576#1575#1585#1603#1608#1583
      DisplayWidth = 10
      FieldName = 'Barcode'
      Required = True
      Size = 30
    end
    object SDS_BarcodesStatus: TStringField
      FieldName = 'Status'
      Visible = False
      Size = 1
    end
    object SDS_BarcodesItemUnit: TStringField
      DisplayLabel = #1608#1581#1583#1577' '#1575#1604#1589#1606#1601
      FieldKind = fkLookup
      FieldName = 'ItemUnit'
      LookupDataSet = SDS_Itemunit
      LookupKeyFields = 'ItemUnitCode'
      LookupResultField = 'ItemUnitDescA'
      KeyFields = 'ItemUnit'
      Size = 6
      Lookup = True
    end
    object SDS_BarcodesUnitTransValue: TFMTBCDField
      DisplayLabel = #1605#1593#1575#1605#1604' '#1575#1604#1608#1581#1583#1607
      DisplayWidth = 6
      FieldName = 'UnitTransValue'
      Precision = 18
      Size = 8
    end
    object SDS_BarcodesPrice: TFMTBCDField
      DisplayLabel = #1575#1604#1587#1593#1585
      DisplayWidth = 6
      FieldName = 'Price'
      Precision = 18
      Size = 8
    end
    object SDS_BarcodesItemColorCode: TStringField
      DisplayLabel = #1575#1604#1604#1608#1606
      FieldKind = fkLookup
      FieldName = 'ItemColorCode'
      LookupDataSet = SDS_ItemColor
      LookupKeyFields = 'ItemColorNameAr'
      LookupResultField = 'ItemColorCode'
      KeyFields = 'ItemColorCode'
      Size = 6
      Lookup = True
    end
    object SDS_BarcodesItemSizeCode: TStringField
      DisplayLabel = #1575#1604#1605#1602#1575#1587
      FieldKind = fkLookup
      FieldName = 'ItemSizeCode'
      LookupDataSet = SDS_ItemSize
      LookupKeyFields = 'ItemSizeNameAr'
      LookupResultField = 'ItemSizeCode'
      KeyFields = 'ItemSizeCode'
      Size = 6
      Lookup = True
    end
    object SDS_BarcodesDiscountRatio: TFMTBCDField
      DisplayLabel = #1606#1587#1576#1577' '#1575#1604#1582#1589#1605
      DisplayWidth = 6
      FieldName = 'DiscountRatio'
      Precision = 18
      Size = 8
    end
    object SDS_BarcodesDiscountValue: TFMTBCDField
      DisplayLabel = #1602#1610#1605#1577' '#1575#1604#1582#1589#1605
      DisplayWidth = 6
      FieldName = 'DiscountValue'
      Precision = 18
      Size = 8
    end
  end
  object DS_Barcodes: TDataSource
    DataSet = SDS_Barcodes
    Left = 136
    Top = 480
  end
  object SDS_ItemSize: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemSize'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 312
    Top = 496
    object SDS_ItemSizeItemSizeCode: TStringField
      FieldName = 'ItemSizeCode'
      Required = True
      Size = 6
    end
    object SDS_ItemSizeItemSizeNameAr: TStringField
      FieldName = 'ItemSizeNameAr'
      Size = 255
    end
    object SDS_ItemSizeItemSizeNameEn: TStringField
      FieldName = 'ItemSizeNameEn'
      Size = 255
    end
  end
  object DS_ItemSize: TDataSource
    DataSet = SDS_ItemSize
    Left = 352
    Top = 496
  end
  object SDS_ItemColor: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemColor'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 496
    object SDS_ItemColorItemColorCode: TStringField
      FieldName = 'ItemColorCode'
      Required = True
      Size = 6
    end
    object SDS_ItemColorItemColorNameAr: TStringField
      FieldName = 'ItemColorNameAr'
      Size = 255
    end
    object SDS_ItemColorItemColorNameEn: TStringField
      FieldName = 'ItemColorNameEn'
      Size = 255
    end
  end
  object DS_ItemColor: TDataSource
    DataSet = SDS_ItemColor
    Left = 232
    Top = 496
  end
end

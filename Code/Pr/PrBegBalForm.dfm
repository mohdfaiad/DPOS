object fmBegBalForm: TfmBegBalForm
  Left = 0
  Top = 6
  BorderStyle = bsDialog
  Caption = #1575#1604#1571#1585#1589#1583#1577' '#1575#1604#1573#1601#1578#1578#1575#1581#1610#1577' '#1604#1604#1605#1582#1575#1586#1606
  ClientHeight = 592
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
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
    Caption = #1575#1604#1571#1585#1589#1583#1577' '#1575#1604#1573#1601#1578#1578#1575#1581#1610#1577' '#1604#1604#1605#1582#1575#1586#1606
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
      Top = 32
      Width = 902
      Height = 148
      Anchors = []
      TabOrder = 0
      DesignSize = (
        902
        148)
      object Label12: TLabel
        Left = 428
        Top = 105
        Width = 38
        Height = 19
        Anchors = []
        Caption = #1575#1604#1605#1585#1580#1593
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 844
        Top = 105
        Width = 50
        Height = 19
        Anchors = []
        Caption = #1575#1604#1605#1587#1578#1608#1583#1593
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 865
        Top = 22
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
      object Label14: TLabel
        Left = 647
        Top = 22
        Width = 36
        Height = 19
        Anchors = []
        Caption = #1575#1604#1578#1575#1585#1610#1582
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 435
        Top = 22
        Width = 31
        Height = 19
        Anchors = []
        Caption = #1575#1604#1581#1575#1604#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 382
        Top = 67
        Width = 84
        Height = 19
        Anchors = []
        Caption = #1575#1604#1608#1589#1601' '#1573#1606#1580#1604#1610#1586#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 822
        Top = 67
        Width = 72
        Height = 19
        Anchors = []
        Caption = #1575#1604#1608#1589#1601' '#1593#1585#1576#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit2: TDBEdit
        Left = 30
        Top = 101
        Width = 320
        Height = 27
        Anchors = []
        DataField = 'IntRefrence'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Co_WareHouse: TDBLookupComboBox
        Left = 490
        Top = 102
        Width = 320
        Height = 27
        DataField = 'WareHouseCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'WareHouseCode'
        ListField = 'WareHouseNameAr'
        ListSource = DS_WareHouse
        ParentFont = False
        TabOrder = 1
      end
      object edtCode: TDBEdit
        Left = 689
        Top = 18
        Width = 121
        Height = 27
        Anchors = []
        DataField = 'TrxNo'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object trxDate: TDateTimePicker
        Left = 490
        Top = 18
        Width = 151
        Height = 31
        Date = 42846.017996770830000000
        Time = 42846.017996770830000000
        TabOrder = 3
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 185
        Top = 19
        Width = 165
        Height = 27
        DataField = 'TrxStatus'
        DataSource = DS_Header
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'Value'
        ListField = 'NameA'
        ListSource = DS_Type
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit1: TDBEdit
        Left = 30
        Top = 63
        Width = 320
        Height = 27
        Anchors = []
        DataField = 'TrxDescEn'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 490
        Top = 63
        Width = 320
        Height = 27
        Anchors = []
        DataField = 'TrxDescAr'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
    object PG1: TPageControl
      Left = 2
      Top = 180
      Width = 917
      Height = 262
      ActivePage = TabSheet1
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = #1575#1604#1578#1601#1575#1589#1610#1604
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        object GroupBox3: TGroupBox
          Left = 0
          Top = 10
          Width = 909
          Height = 218
          Align = alBottom
          TabOrder = 0
          object grd_Details: TDBGrid
            Left = 2
            Top = 21
            Width = 905
            Height = 195
            Align = alClient
            DataSource = DS_Details
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
    end
    object Navigator: TDBNavigator
      Left = 2
      Top = 442
      Width = 917
      Height = 33
      DataSource = DS_Header
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alBottom
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 17
    Top = 32
    Width = 983
    Height = 57
    TabOrder = 1
    object BtnOpen: TButton
      Left = 739
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
      Left = 616
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
      Left = 492
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
      Left = 124
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
      Left = 367
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
      Left = 245
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
      Left = 863
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
    object btnPost: TButton
      Left = 5
      Top = 13
      Width = 115
      Height = 35
      Caption = #1578#1585#1581#1610#1604
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 7
      OnClick = btnPostClick
    end
  end
  object SDS_Header: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_PrTrxHeader Where TrxType = '#39'IVBB'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterScroll = SDS_HeaderAfterScroll
    OnNewRecord = SDS_HeaderNewRecord
    object SDS_HeaderCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object SDS_HeaderBranchCode: TStringField
      FieldName = 'BranchCode'
      Required = True
      Size = 4
    end
    object SDS_HeaderTrxDate: TSQLTimeStampField
      FieldName = 'TrxDate'
      Required = True
    end
    object SDS_HeaderTrxNo: TStringField
      FieldName = 'TrxNo'
      Required = True
      Size = 10
    end
    object SDS_HeaderTrxStatus: TStringField
      FieldName = 'TrxStatus'
      Required = True
      FixedChar = True
      Size = 1
    end
    object SDS_HeaderTrxType: TStringField
      FieldName = 'TrxType'
      Required = True
      Size = 4
    end
    object SDS_HeaderWareHouseCode: TStringField
      FieldName = 'WareHouseCode'
      Size = 6
    end
    object SDS_HeaderVendoreCode: TStringField
      FieldName = 'VendoreCode'
      Size = 6
    end
    object SDS_HeaderTrxAmount: TFMTBCDField
      FieldName = 'TrxAmount'
      Precision = 18
      Size = 8
    end
    object SDS_HeaderTrxBalance: TFMTBCDField
      FieldName = 'TrxBalance'
      Precision = 18
      Size = 8
    end
    object SDS_HeaderIntRefrence: TStringField
      FieldName = 'IntRefrence'
    end
    object SDS_HeaderTotalDiscount: TStringField
      FieldName = 'TotalDiscount'
    end
    object SDS_HeaderVendoreInvoiceNumber: TStringField
      FieldName = 'VendoreInvoiceNumber'
    end
    object SDS_HeaderTrxDescAr: TStringField
      FieldName = 'TrxDescAr'
      Size = 75
    end
    object SDS_HeaderTrxDescEn: TStringField
      FieldName = 'TrxDescEn'
      Size = 75
    end
  end
  object DS_Header: TDataSource
    DataSet = SDS_Header
    Left = 24
  end
  object SDS_Details: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_PrTrxDetails '
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnNewRecord = SDS_DetailsNewRecord
    Top = 32
    object SDS_DetailsCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Visible = False
      Size = 4
    end
    object SDS_DetailsBranchCode: TStringField
      FieldName = 'BranchCode'
      Required = True
      Visible = False
      Size = 4
    end
    object SDS_DetailsTrxNo: TStringField
      FieldName = 'TrxNo'
      Required = True
      Visible = False
      Size = 10
    end
    object SDS_DetailsTrxType: TStringField
      FieldName = 'TrxType'
      Required = True
      Visible = False
      Size = 4
    end
    object SDS_DetailsTraLineNo: TStringField
      FieldName = 'TraLineNo'
      Required = True
      Visible = False
      Size = 10
    end
    object SDS_DetailsItemService: TStringField
      FieldName = 'ItemService'
      Visible = False
      Size = 4
    end
    object SDS_DetailsBarCode: TStringField
      DisplayLabel = #1575#1604#1576#1575#1585#1603#1608#1583
      FieldName = 'BarCode'
      Size = 10
    end
    object SDS_DetailsItemCode: TStringField
      DisplayLabel = #1603#1608#1583' '#1575#1604#1589#1606#1601
      DisplayWidth = 10
      FieldName = 'ItemCode'
      OnChange = SDS_DetailsItemCodeChange
      Size = 25
    end
    object SDS_DetailsItemNameAr2: TStringField
      DisplayLabel = #1573#1587#1605' '#1575#1604#1589#1606#1601
      FieldKind = fkLookup
      FieldName = 'ItemNameAr'
      LookupDataSet = SDS_ItemDef
      LookupKeyFields = 'ItemCode'
      LookupResultField = 'ItemNameAr'
      KeyFields = 'ItemCode'
      Lookup = True
    end
    object SDS_DetailsQuantity: TFMTBCDField
      DisplayLabel = #1575#1604#1603#1605#1610#1577
      DisplayWidth = 6
      FieldName = 'Quantity'
      Precision = 18
      Size = 8
    end
    object SDS_DetailsCostPrice: TFMTBCDField
      DisplayLabel = #1575#1604#1578#1603#1604#1601#1577
      DisplayWidth = 6
      FieldName = 'CostPrice'
      Precision = 18
      Size = 8
    end
    object SDS_DetailsDiscount: TFMTBCDField
      DisplayLabel = #1575#1604#1582#1589#1605
      DisplayWidth = 6
      FieldName = 'Discount'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_DetailsNetPrice: TFMTBCDField
      DisplayLabel = #1573#1580#1605#1575#1604#1610' '#1575#1604#1587#1593#1585
      DisplayWidth = 6
      FieldName = 'NetPrice'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_DetailsItemUnit: TStringField
      DisplayLabel = #1603#1608#1583' '#1575#1604#1608#1581#1583#1577
      FieldName = 'ItemUnit'
      OnChange = SDS_DetailsItemUnitChange
      Size = 6
    end
    object SDS_DetailsItemUnitDescAr: TStringField
      DisplayLabel = #1575#1604#1608#1581#1583#1577
      FieldKind = fkLookup
      FieldName = 'ItemUnitDescAr'
      LookupDataSet = SDS_Itemunit
      LookupKeyFields = 'ItemUnitCode'
      LookupResultField = 'ItemUnitDescA'
      KeyFields = 'ItemUnit'
      Lookup = True
    end
    object SDS_DetailsUnitTransValue: TFMTBCDField
      FieldName = 'UnitTransValue'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_DetailsWareHouseCode: TStringField
      FieldName = 'WareHouseCode'
      Visible = False
      Size = 6
    end
    object SDS_DetailsItemCost: TFMTBCDField
      FieldName = 'ItemCost'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_DetailsVendoreCode: TStringField
      FieldName = 'VendoreCode'
      Visible = False
      Size = 6
    end
  end
  object DS_Details: TDataSource
    DataSet = SDS_Details
    Left = 24
    Top = 32
  end
  object SDS_WareHouse: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_WareHouse'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 592
    Top = 208
    object SDS_WareHouseWareHouseCode: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      FieldName = 'WareHouseCode'
      Required = True
      Size = 6
    end
    object SDS_WareHouseWareHouseNameAr: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610
      DisplayWidth = 20
      FieldName = 'WareHouseNameAr'
      Size = 250
    end
    object SDS_WareHouseWareHouseNameEn: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1573#1606#1580#1604#1610#1586#1610
      DisplayWidth = 20
      FieldName = 'WareHouseNameEn'
      Size = 250
    end
  end
  object DS_WareHouse: TDataSource
    DataSet = SDS_WareHouse
    Left = 632
    Top = 208
  end
  object SDS_Vendors: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Vendors'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 144
    Top = 208
    object SDS_VendorsVendoreCode: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      FieldName = 'VendoreCode'
      Required = True
      Size = 6
    end
    object SDS_VendorsVendoreNameAr: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610
      DisplayWidth = 20
      FieldName = 'VendoreNameAr'
      Size = 250
    end
    object SDS_VendorsVendoreNameEn: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1573#1606#1580#1604#1610#1586#1610
      DisplayWidth = 20
      FieldName = 'VendoreNameEn'
      Size = 250
    end
  end
  object DS_Vendors: TDataSource
    DataSet = SDS_Vendors
    Left = 184
    Top = 208
  end
  object qry_Type: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 
      'Select Distinct Cast('#39'A'#39' As CHar(1)) As Value,  Cast('#39#1606#1588#1591#39' As Va' +
      'rChar(15)) As NameA , Cast('#39'Active'#39' As VarChar(15)) As NameE Fro' +
      'm tbl_Company'#13#10' Union'#13#10' Select Distinct Cast('#39'P'#39' As CHar(1)),  C' +
      'ast('#39#1605#1585#1581#1604#39' As VarChar(15)) , Cast('#39'Posted'#39' As VarChar(15)) As Na' +
      'meE From tbl_Company'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 176
    Top = 168
    object qry_TypeValue: TStringField
      FieldName = 'Value'
      FixedChar = True
      Size = 1
    end
    object qry_TypeNameA: TStringField
      FieldName = 'NameA'
      FixedChar = True
      Size = 15
    end
    object qry_TypeNameE: TStringField
      FieldName = 'NameE'
      FixedChar = True
      Size = 15
    end
  end
  object DS_Type: TDataSource
    DataSet = qry_Type
    Left = 216
    Top = 168
  end
  object SDS_Itemunit: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemUnit'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 8
    Top = 432
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
    Left = 32
    Top = 432
  end
  object SDS_ItemDef: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemDefinition'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 8
    Top = 464
    object SDS_ItemDefItemCode: TStringField
      FieldName = 'ItemCode'
      Required = True
      Size = 25
    end
    object SDS_ItemDefItemNameAr: TStringField
      FieldName = 'ItemNameAr'
      Size = 255
    end
    object SDS_ItemDefItemNameEn: TStringField
      FieldName = 'ItemNameEn'
      Size = 255
    end
  end
  object DS_ItemDEf: TDataSource
    DataSet = SDS_ItemDef
    Left = 32
    Top = 464
  end
end

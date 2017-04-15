object fmItemPolicies: TfmItemPolicies
  Left = 400
  Top = 147
  BorderStyle = bsDialog
  Caption = #1587#1610#1575#1587#1575#1578' '#1575#1604#1578#1587#1593#1610#1585
  ClientHeight = 499
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object grp_Content: TGroupBox
    Left = 88
    Top = 102
    Width = 873
    Height = 382
    BiDiMode = bdRightToLeft
    Caption = #1587#1610#1575#1587#1575#1578' '#1575#1604#1578#1587#1593#1610#1585
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      873
      382)
    object grpData: TGroupBox
      Left = 16
      Top = 26
      Width = 849
      Height = 335
      Anchors = []
      TabOrder = 0
      DesignSize = (
        849
        335)
      object Label2: TLabel
        Left = 739
        Top = 56
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
        Left = 775
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
      object Label3: TLabel
        Left = 331
        Top = 56
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
      object edtName: TDBEdit
        Left = 415
        Top = 52
        Width = 315
        Height = 27
        Anchors = []
        DataField = 'PolicyNameAr'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtCode: TDBEdit
        Left = 609
        Top = 18
        Width = 121
        Height = 27
        Anchors = []
        DataField = 'PolicyCode'
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
        Left = 9
        Top = 54
        Width = 315
        Height = 27
        Anchors = []
        DataField = 'PolicyNameEn'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object grd_Brcodes: TDBGrid
        Left = 2
        Top = 112
        Width = 845
        Height = 221
        Align = alBottom
        DataSource = DS_ItemPrices
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -21
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = []
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
      Left = 734
      Top = 12
      Width = 127
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
      Left = 590
      Top = 12
      Width = 127
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
      Left = 447
      Top = 13
      Width = 127
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
      Width = 127
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
      Left = 305
      Top = 13
      Width = 127
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
      Left = 158
      Top = 13
      Width = 127
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
  end
  object SDS_Header: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemPolicies'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnNewRecord = SDS_HeaderNewRecord
    Left = 24
    Top = 16
    object SDS_HeaderPolicyCode: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      FieldName = 'PolicyCode'
      Required = True
      Size = 4
    end
    object SDS_HeaderPolicyNameAr: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610
      FieldName = 'PolicyNameAr'
    end
    object SDS_HeaderPolicyNameEn: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1573#1606#1580#1604#1610#1586#1610
      FieldName = 'PolicyNameEn'
    end
    object SDS_HeaderCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
  end
  object DS_Header: TDataSource
    DataSet = SDS_Header
    Left = 64
    Top = 16
  end
  object SDS_ItemPrices: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_ItemPrices'#13#10
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnNewRecord = SDS_ItemPricesNewRecord
    Left = 48
    Top = 272
    object SDS_ItemPricesCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Visible = False
      Size = 4
    end
    object SDS_ItemPricesItemService: TStringField
      FieldName = 'ItemService'
      Required = True
      Visible = False
      Size = 3
    end
    object SDS_ItemPricesItemCode: TStringField
      DisplayLabel = #1603#1608#1583' '#1575#1604#1589#1606#1601
      DisplayWidth = 10
      FieldName = 'ItemCode'
      Required = True
    end
    object SDS_ItemPricesPolicyCode: TStringField
      FieldName = 'PolicyCode'
      Required = True
      Visible = False
      Size = 4
    end
    object SDS_ItemPricesItemUnit: TStringField
      DisplayLabel = #1608#1581#1583#1577' '#1575#1604#1589#1606#1601
      FieldName = 'ItemUnit'
      Required = True
      Size = 6
    end
    object SDS_ItemPricesPriceValue: TFMTBCDField
      DisplayLabel = #1575#1604#1587#1593#1585
      DisplayWidth = 6
      FieldName = 'PriceValue'
      Precision = 18
    end
    object SDS_ItemPricesPriceRatio: TFMTBCDField
      DisplayLabel = #1606#1587#1576#1577' '#1575#1604#1587#1593#1585
      DisplayWidth = 6
      FieldName = 'PriceRatio'
      Precision = 18
    end
    object SDS_ItemPricesDiscountRatio: TFMTBCDField
      DisplayLabel = #1606#1587#1576#1577' '#1575#1604#1582#1589#1605
      DisplayWidth = 6
      FieldName = 'DiscountRatio'
      Precision = 18
    end
  end
  object DS_ItemPrices: TDataSource
    DataSet = SDS_ItemPrices
    Left = 88
    Top = 272
  end
end

object fmCurrencyExchange: TfmCurrencyExchange
  Left = 192
  Top = 124
  BorderStyle = bsDialog
  Caption = #1571#1587#1593#1575#1585' '#1575#1604#1593#1605#1604#1575#1578
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
  OnClose = FormClose
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
    Caption = #1571#1587#1593#1575#1585' '#1575#1604#1593#1605#1604#1575#1578
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
      Left = 424
      Top = 26
      Width = 441
      Height = 335
      Anchors = []
      TabOrder = 0
      DesignSize = (
        441
        335)
      object Label2: TLabel
        Left = 345
        Top = 81
        Width = 83
        Height = 19
        Anchors = []
        Caption = #1575#1604#1593#1605#1604#1577' '#1575#1604#1571#1587#1575#1587#1610#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 393
        Top = 36
        Width = 32
        Height = 19
        Anchors = []
        Caption = #1575#1604#1593#1605#1604#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 365
        Top = 130
        Width = 65
        Height = 19
        Anchors = []
        Caption = #1587#1593#1585' '#1575#1604#1578#1581#1608#1610#1604
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtPrice: TDBEdit
        Left = 152
        Top = 128
        Width = 188
        Height = 27
        Anchors = []
        DataField = 'ExchangeRate'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Co_Currency: TDBLookupComboBox
        Left = 152
        Top = 32
        Width = 188
        Height = 27
        DataField = 'CurrencyCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'CurrencyCode'
        ListField = 'CurrencyNameA'
        ListSource = DS_Currency1
        ParentFont = False
        TabOrder = 1
      end
      object Co_BaseCurrency: TDBLookupComboBox
        Left = 152
        Top = 80
        Width = 188
        Height = 27
        DataField = 'BaseCurrencyCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'CurrencyCode'
        ListField = 'CurrencyNameA'
        ListSource = DS_Currency2
        ParentFont = False
        TabOrder = 2
      end
    end
    object DBGrid1: TDBGrid
      Left = 9
      Top = 33
      Width = 407
      Height = 327
      DataSource = DS_Header
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -21
      TitleFont.Name = 'Times New Roman'
      TitleFont.Style = []
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
    DataSet.CommandText = 'Select * From tbl_CurrencyExch'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforePost = SDS_HeaderBeforePost
    Left = 24
    Top = 16
    object SDS_HeaderCurrencyCode: TStringField
      DisplayLabel = #1603#1608#1583' '#1575#1604#1593#1605#1604#1577
      FieldName = 'CurrencyCode'
      Required = True
      Size = 3
    end
    object SDS_HeaderBaseCurrencyCode: TStringField
      DisplayLabel = #1575#1604#1593#1605#1604#1577' '#1575#1604#1571#1587#1575#1587#1610#1577
      FieldName = 'BaseCurrencyCode'
      Required = True
      Size = 3
    end
    object SDS_HeaderExchangeRate: TFMTBCDField
      DisplayLabel = #1587#1593#1585' '#1575#1604#1578#1581#1608#1610#1604
      FieldName = 'ExchangeRate'
      Precision = 18
      Size = 6
    end
    object SDS_HeaderCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Visible = False
      Size = 4
    end
  end
  object DS_Header: TDataSource
    DataSet = SDS_Header
    Left = 64
    Top = 16
  end
  object SDS_Currency2: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Currency'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforePost = SDS_HeaderBeforePost
    Left = 536
    Top = 224
    object StringField1: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      FieldName = 'CurrencyCode'
      Required = True
      Size = 3
    end
    object SDS_HeaderCurrencyNameA: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610
      DisplayWidth = 20
      FieldName = 'CurrencyNameA'
      Size = 25
    end
    object SDS_HeaderCurrencyNameE: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1573#1606#1580#1604#1610#1586#1610
      DisplayWidth = 20
      FieldName = 'CurrencyNameE'
      Size = 25
    end
    object StringField2: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
  end
  object DS_Currency2: TDataSource
    DataSet = SDS_Currency2
    Left = 576
    Top = 216
  end
  object SDS_Currency1: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Currency'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforePost = SDS_HeaderBeforePost
    Left = 552
    Top = 168
    object StringField3: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      FieldName = 'CurrencyCode'
      Required = True
      Size = 3
    end
    object StringField4: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610
      DisplayWidth = 20
      FieldName = 'CurrencyNameA'
      Size = 25
    end
    object StringField5: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1573#1606#1580#1604#1610#1586#1610
      DisplayWidth = 20
      FieldName = 'CurrencyNameE'
      Size = 25
    end
    object StringField6: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
  end
  object DS_Currency1: TDataSource
    DataSet = SDS_Currency1
    Left = 592
    Top = 168
  end
end

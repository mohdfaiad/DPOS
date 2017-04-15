object fmPOSDefinition: TfmPOSDefinition
  Left = 255
  Top = 60
  BorderStyle = bsDialog
  Caption = #1578#1593#1585#1610#1601' '#1606#1602#1591#1577' '#1575#1604#1576#1610#1593
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
    Caption = #1578#1593#1585#1610#1601' '#1606#1602#1591#1577' '#1575#1604#1576#1610#1593
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
        Left = 360
        Top = 84
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
        Left = 396
        Top = 36
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
        Left = 352
        Top = 135
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
      object Label4: TLabel
        Left = 379
        Top = 183
        Width = 46
        Height = 19
        Anchors = []
        Caption = #1575#1604#1589#1606#1583#1608#1602
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 400
        Top = 228
        Width = 25
        Height = 19
        Anchors = []
        Caption = #1575#1604#1576#1606#1603
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 339
        Top = 274
        Width = 86
        Height = 19
        Anchors = []
        Caption = #1575#1604#1585#1589#1610#1583' '#1575#1604#1573#1601#1578#1578#1575#1581#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtName: TDBEdit
        Left = 21
        Top = 80
        Width = 315
        Height = 27
        Anchors = []
        DataField = 'POSNameAr'
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
        Left = 215
        Top = 32
        Width = 121
        Height = 27
        Anchors = []
        DataField = 'POSCode'
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
        Left = 21
        Top = 131
        Width = 315
        Height = 27
        Anchors = []
        DataField = 'POSNameEn'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Co_Cash: TDBLookupComboBox
        Left = 21
        Top = 179
        Width = 315
        Height = 27
        DataField = 'CashCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'CB_Code'
        ListField = 'CB_NameA'
        ListSource = DS_Cash
        ParentFont = False
        TabOrder = 3
      end
      object CO_Bank: TDBLookupComboBox
        Left = 21
        Top = 224
        Width = 315
        Height = 27
        DataField = 'BankCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'CB_Code'
        ListField = 'CB_NameA'
        ListSource = DS_Bank
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit2: TDBEdit
        Left = 144
        Top = 270
        Width = 192
        Height = 27
        Anchors = []
        DataField = 'OpenBalance'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
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
    DataSet.CommandText = 'Select * From tbl_POS_Definition'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforePost = SDS_HeaderBeforePost
    Left = 24
    Top = 16
    object SDS_HeaderCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Visible = False
      Size = 4
    end
    object SDS_HeaderPOSCode: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      FieldName = 'POSCode'
      Required = True
      Size = 4
    end
    object SDS_HeaderPOSNameAr: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610' '
      DisplayWidth = 20
      FieldName = 'POSNameAr'
      Size = 75
    end
    object SDS_HeaderPOSNameEn: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1573#1606#1580#1604#1610#1586#1610
      DisplayWidth = 20
      FieldName = 'POSNameEn'
      Size = 75
    end
    object SDS_HeaderCashCode: TStringField
      DisplayLabel = #1575#1604#1589#1606#1583#1608#1602
      FieldName = 'CashCode'
      Size = 4
    end
    object SDS_HeaderBankCode: TStringField
      DisplayLabel = #1575#1604#1576#1606#1603
      FieldName = 'BankCode'
      Size = 4
    end
    object SDS_HeaderOpenBalance: TFMTBCDField
      DisplayLabel = #1575#1604#1585#1589#1610#1583' '#1575#1604#1573#1601#1578#1578#1575#1581#1610
      FieldName = 'OpenBalance'
      Precision = 18
      Size = 8
    end
  end
  object DS_Header: TDataSource
    DataSet = SDS_Header
    Left = 64
    Top = 16
  end
  object SDS_Cash: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_CashBank Where CB_Type ='#39'C'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforePost = SDS_HeaderBeforePost
    Left = 528
    Top = 291
    object SDS_CashCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Visible = False
      Size = 4
    end
    object SDS_CashCB_Code: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      FieldName = 'CB_Code'
      Required = True
      Size = 4
    end
    object SDS_CashCB_Type: TStringField
      FieldName = 'CB_Type'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SDS_CashCB_NameA: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610
      FieldName = 'CB_NameA'
      Size = 100
    end
    object SDS_CashCB_NameE: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1604#1575#1578#1610#1606#1610
      FieldName = 'CB_NameE'
      Size = 100
    end
  end
  object DS_Cash: TDataSource
    DataSet = SDS_Cash
    Left = 568
    Top = 291
  end
  object SDS_Bank: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_CashBank Where CB_Type ='#39'B'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforePost = SDS_HeaderBeforePost
    Left = 536
    Top = 339
    object SDS_BankCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Visible = False
      Size = 4
    end
    object SDS_BankCB_Code: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      FieldName = 'CB_Code'
      Required = True
      Size = 4
    end
    object SDS_BankCB_Type: TStringField
      FieldName = 'CB_Type'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SDS_BankCB_NameA: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610
      FieldName = 'CB_NameA'
      Size = 100
    end
    object SDS_BankCB_NameE: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1604#1575#1578#1610#1606#1610
      FieldName = 'CB_NameE'
      Size = 100
    end
  end
  object DS_Bank: TDataSource
    DataSet = SDS_Bank
    Left = 576
    Top = 339
  end
end

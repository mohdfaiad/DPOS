object fmCashBank: TfmCashBank
  Left = 192
  Top = 124
  BorderStyle = bsDialog
  Caption = #1575#1604#1589#1606#1575#1583#1610#1602' '#1608#1575#1604#1576#1606#1608#1603
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
    Caption = #1575#1604#1589#1606#1575#1583#1610#1602' '#1608#1575#1604#1576#1606#1608#1603
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
        Left = 363
        Top = 94
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
        Left = 357
        Top = 152
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
        Left = 167
        Top = 39
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
      object edtName: TDBEdit
        Left = 40
        Top = 92
        Width = 315
        Height = 27
        Anchors = []
        DataField = 'CB_NameA'
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
        Left = 226
        Top = 34
        Width = 121
        Height = 27
        Anchors = []
        DataField = 'CB_Code'
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
        Left = 42
        Top = 150
        Width = 315
        Height = 27
        Anchors = []
        DataField = 'CB_NameE'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Cb_Type: TDBLookupComboBox
        Left = 40
        Top = 34
        Width = 113
        Height = 27
        DataField = 'CB_Type'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'Value'
        ListField = 'NameA'
        ListSource = DS_Type
        ParentFont = False
        TabOrder = 3
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
      Left = 614
      Top = 12
      Width = 112
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
      Left = 495
      Top = 12
      Width = 112
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
      Left = 376
      Top = 13
      Width = 112
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
      Left = 20
      Top = 13
      Width = 112
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
      Left = 259
      Top = 13
      Width = 112
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
      Left = 138
      Top = 13
      Width = 112
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
    object Button1: TButton
      Left = 733
      Top = 13
      Width = 133
      Height = 32
      Caption = #1593#1600#1600#1600#1585#1590
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 6
      OnClick = Button1Click
    end
  end
  object SDS_Header: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_CashBank'
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
    object SDS_HeaderCB_Code: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      FieldName = 'CB_Code'
      Required = True
      Size = 4
    end
    object SDS_HeaderCB_Type: TStringField
      FieldName = 'CB_Type'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SDS_HeaderCB_NameA: TStringField
      DisplayLabel = #1575#1604#1575#1587#1605' '#1593#1585#1576#1610
      DisplayWidth = 20
      FieldName = 'CB_NameA'
      Size = 100
    end
    object SDS_HeaderCB_NameE: TStringField
      DisplayLabel = #1575#1604#1575#1587#1605' '#1575#1606#1580#1604#1610#1586#1610
      DisplayWidth = 15
      FieldName = 'CB_NameE'
      Size = 100
    end
  end
  object DS_Header: TDataSource
    DataSet = SDS_Header
    Left = 64
    Top = 16
  end
  object qry_Type: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 
      'Select Distinct Cast('#39'C'#39' As CHar(1)) As Value,  Cast('#39#1589#1606#1583#1608#1602#39' As ' +
      'VarChar(15)) As NameA , Cast('#39'Cash'#39' As VarChar(15)) As NameE Fro' +
      'm tbl_Company'#13#10' Union'#13#10' Select Distinct Cast('#39'B'#39' As CHar(1)),  C' +
      'ast('#39#1576#1606#1603#39' As VarChar(15)) , Cast('#39'Bank'#39' As VarChar(15)) As NameE' +
      ' From tbl_Company'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforePost = SDS_HeaderBeforePost
    Left = 24
    Top = 56
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
    Left = 64
    Top = 56
  end
end

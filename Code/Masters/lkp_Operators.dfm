object fmOperators: TfmOperators
  Left = 223
  Top = 121
  BorderStyle = bsDialog
  Caption = #1575#1604#1605#1588#1594#1604#1610#1606
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
    Caption = #1575#1604#1605#1588#1594#1604#1610#1606
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
        Left = 377
        Top = 184
        Width = 48
        Height = 19
        Anchors = []
        Caption = #1575#1604#1605#1587#1578#1582#1583#1605
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtName: TDBEdit
        Left = 32
        Top = 80
        Width = 315
        Height = 27
        Anchors = []
        DataField = 'OperatorNameAr'
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
        Top = 32
        Width = 121
        Height = 27
        Anchors = []
        DataField = 'OperatorCode'
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
        Left = 32
        Top = 131
        Width = 315
        Height = 27
        Anchors = []
        DataField = 'OperatorNameEn'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Co_Users: TDBLookupComboBox
        Left = 32
        Top = 180
        Width = 315
        Height = 27
        DataField = 'UserID'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'UserID'
        ListField = 'FullNameA'
        ListSource = DS_Users
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
    DataSet.CommandText = 'Select * From tbl_operators'
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
    object SDS_HeaderOperatorCode: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      FieldName = 'OperatorCode'
      Required = True
      Size = 6
    end
    object SDS_HeaderOperatorNameAr: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610
      DisplayWidth = 20
      FieldName = 'OperatorNameAr'
      Size = 255
    end
    object SDS_HeaderOperatorNameEn: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1573#1606#1580#1604#1610#1586#1610
      DisplayWidth = 20
      FieldName = 'OperatorNameEn'
      Size = 255
    end
    object SDS_HeaderUserID: TStringField
      DisplayLabel = #1575#1604#1605#1587#1578#1582#1583#1605
      DisplayWidth = 10
      FieldName = 'UserID'
      Size = 75
    end
  end
  object DS_Header: TDataSource
    DataSet = SDS_Header
    Left = 64
    Top = 16
  end
  object SDS_Users: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_Users'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforePost = SDS_HeaderBeforePost
    Left = 592
    Top = 360
    object SDS_UsersUserID: TStringField
      DisplayLabel = #1575#1604#1585#1605#1586
      DisplayWidth = 10
      FieldName = 'UserID'
      Required = True
      Size = 75
    end
    object SDS_UsersFullNameA: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1593#1585#1576#1610
      DisplayWidth = 20
      FieldName = 'FullNameA'
      Size = 250
    end
    object SDS_UsersFullNameE: TStringField
      DisplayLabel = #1575#1604#1573#1587#1605' '#1573#1606#1580#1604#1610#1586#1610
      DisplayWidth = 20
      FieldName = 'FullNameE'
      Size = 250
    end
  end
  object DS_Users: TDataSource
    DataSet = SDS_Users
    Left = 632
    Top = 360
  end
end

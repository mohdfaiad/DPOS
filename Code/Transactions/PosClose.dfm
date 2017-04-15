object fmPosClose: TfmPosClose
  Left = 177
  Top = 0
  BorderStyle = bsDialog
  Caption = #1573#1594#1600#1600#1604#1575#1602' '#1606#1602#1600#1600#1600#1600#1591#1577' '#1575#1604#1576#1610#1600#1600#1600#1600#1593
  ClientHeight = 689
  ClientWidth = 1007
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
  object grp_Type: TGroupBox
    Left = 88
    Top = 127
    Width = 875
    Height = 544
    BiDiMode = bdRightToLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    object grpData: TGroupBox
      Left = 2
      Top = 25
      Width = 871
      Height = 239
      Align = alTop
      Caption = #1576#1610#1575#1606#1575#1578' '#1575#1604#1605#1593#1575#1605#1604#1577
      TabOrder = 0
      DesignSize = (
        871
        239)
      object Label3: TLabel
        Left = 248
        Top = 24
        Width = 42
        Height = 19
        Anchors = []
        Caption = #1575#1604#1578#1575#1585#1610#1600#1600#1582
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 827
        Top = 24
        Width = 32
        Height = 19
        Anchors = []
        Caption = #1575#1604#1585#1602#1600#1600#1605
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 258
        Top = 206
        Width = 45
        Height = 19
        Anchors = []
        Caption = #1575#1604#1603#1575#1588#1610#1600#1600#1585
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 807
        Top = 113
        Width = 52
        Height = 19
        Anchors = []
        Caption = #1606#1602#1591#1577' '#1575#1604#1576#1610#1593
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 808
        Top = 66
        Width = 51
        Height = 19
        Anchors = []
        Caption = #1575#1604#1608#1589#1600#1600#1600#1600#1601
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 252
        Top = 108
        Width = 47
        Height = 19
        Anchors = []
        Caption = #1575#1604#1608#1585#1583#1610#1600#1600#1600#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 778
        Top = 156
        Width = 81
        Height = 19
        Anchors = []
        Caption = #1589#1606#1583#1608#1602' '#1575#1604#1603#1575#1588#1610#1585
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 253
        Top = 163
        Width = 46
        Height = 19
        Anchors = []
        Caption = #1575#1604#1576#1606#1600#1600#1600#1600#1600#1600#1600#1603
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 770
        Top = 204
        Width = 92
        Height = 19
        Anchors = []
        Caption = #1575#1604#1589#1606#1583#1608#1602' '#1575#1604#1585#1574#1610#1587#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_TrxNo: TDBEdit
        Left = 644
        Top = 21
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
        TabOrder = 0
      end
      object edt_Subject: TDBMemo
        Left = 31
        Top = 58
        Width = 733
        Height = 33
        Anchors = []
        DataField = 'TrxDescA'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edt_TrxDate: TDBEdit
        Left = 31
        Top = 20
        Width = 160
        Height = 27
        Anchors = []
        DataField = 'TrxDate'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cb_Operator: TDBLookupComboBox
        Left = 37
        Top = 198
        Width = 157
        Height = 27
        DataField = 'OperatorCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'OperatorCode'
        ListField = 'OperatorNameAr'
        ListSource = DS_Operators
        ParentFont = False
        TabOrder = 8
      end
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 568
        Top = 107
        Width = 195
        Height = 27
        DataField = 'POSCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'POSCode'
        ListField = 'POSNameAr'
        ListSource = DS_POS
        ParentFont = False
        TabOrder = 3
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 571
        Top = 151
        Width = 195
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
        TabOrder = 5
      end
      object cb_Shift: TDBComboBox
        Left = 33
        Top = 107
        Width = 158
        Height = 31
        DataField = 'POSShift'
        DataSource = DS_Header
        ItemHeight = 23
        Items.Strings = (
          '1'
          '2'
          '3')
        TabOrder = 4
      end
      object DBLookupComboBox7: TDBLookupComboBox
        Left = 571
        Top = 199
        Width = 195
        Height = 27
        DataField = 'MainCashCode'
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
        TabOrder = 7
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 35
        Top = 155
        Width = 158
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
        TabOrder = 6
      end
    end
    object grp_Total: TGroupBox
      Left = 444
      Top = 264
      Width = 429
      Height = 202
      Align = alRight
      Caption = #1575#1604#1575#1580#1605#1575#1604#1610#1575#1578' '#1581#1587#1576' '#1605#1593#1575#1605#1604#1575#1578' '#1575#1604#1576#1610#1593
      TabOrder = 1
      object Label9: TLabel
        Left = 252
        Top = 27
        Width = 37
        Height = 19
        Caption = #1606#1602#1600#1600#1600#1583#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 253
        Top = 60
        Width = 36
        Height = 19
        Caption = #1588#1576#1603#1600#1600#1600#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 260
        Top = 91
        Width = 29
        Height = 19
        Caption = #1601#1610#1600#1600#1600#1586#1575
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 254
        Top = 123
        Width = 35
        Height = 19
        Caption = #1588#1610#1600#1600#1600#1600#1603
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 258
        Top = 155
        Width = 31
        Height = 19
        Caption = #1570#1580#1600#1600#1600#1600#1604
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit6: TDBEdit
        Left = 111
        Top = 25
        Width = 108
        Height = 27
        DataField = 'Cash'
        DataSource = DS_Header
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 111
        Top = 58
        Width = 108
        Height = 27
        DataField = 'ATM'
        DataSource = DS_Header
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 111
        Top = 89
        Width = 108
        Height = 27
        DataField = 'CreditCard'
        DataSource = DS_Header
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 111
        Top = 121
        Width = 108
        Height = 27
        DataField = 'Checks'
        DataSource = DS_Header
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 111
        Top = 153
        Width = 108
        Height = 27
        DataField = 'Credit'
        DataSource = DS_Header
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
    object Navigator: TDBNavigator
      Left = 2
      Top = 509
      Width = 871
      Height = 33
      DataSource = DS_Header
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alBottom
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 466
      Width = 871
      Height = 43
      Align = alBottom
      TabOrder = 3
      object btnPrintDailySales: TVrDemoButton
        Left = 1
        Top = 5
        Width = 866
        Height = 35
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clRed
        FontEnter.Height = -16
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -16
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        BevelWidth = 3
        Caption = #1591#1576#1600#1600#1575#1593#1577' '#1605#1576#1610#1593#1600#1600#1600#1575#1578' '#1575#1604#1610#1608#1605#1610#1600#1600#1600#1600#1577
        TabOrder = 0
        OnClick = btnPrintDailySalesClick
      end
    end
    object grp_RealTotal: TGroupBox
      Left = 7
      Top = 264
      Width = 437
      Height = 202
      Align = alRight
      Caption = #1576#1610#1575#1606#1575#1578' '#1575#1604#1578#1608#1585#1610#1600#1600#1600#1583' '#1575#1604#1601#1593#1604#1610
      TabOrder = 4
      object Label14: TLabel
        Left = 241
        Top = 83
        Width = 89
        Height = 19
        Caption = #1575#1604#1575#1580#1605#1575#1604#1610' '#1575#1604#1606#1602#1600#1600#1600#1583#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 263
        Top = 115
        Width = 51
        Height = 19
        Caption = #1575#1604#1601#1600#1600#1600#1600#1600#1600#1600#1585#1602
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 221
        Top = 147
        Width = 149
        Height = 19
        Caption = #1585#1589#1600#1600#1600#1610#1583' '#1601#1610' '#1589#1606#1583#1608#1602' '#1575#1604#1605#1581#1575#1587#1576#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 219
        Top = 51
        Width = 150
        Height = 19
        Caption = #1575#1601#1578#1578#1575#1581#1610' '#1601#1610' '#1589#1606#1583#1608#1602' '#1575#1604#1605#1581#1575#1587#1576#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit5: TDBEdit
        Left = 104
        Top = 49
        Width = 108
        Height = 27
        DataField = 'OldOpenBalance'
        DataSource = DS_Header
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit7: TDBEdit
        Left = 104
        Top = 81
        Width = 108
        Height = 27
        DataField = 'ActualCash'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit8: TDBEdit
        Left = 104
        Top = 113
        Width = 108
        Height = 27
        DataField = 'CashDifference'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit9: TDBEdit
        Left = 104
        Top = 145
        Width = 108
        Height = 27
        DataField = 'NewOpenBalance'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 88
    Top = 16
    Width = 873
    Height = 57
    TabOrder = 1
    object BtnOpen: TVrDemoButton
      Left = 746
      Top = 12
      Width = 118
      Height = 35
      FontEnter.Charset = DEFAULT_CHARSET
      FontEnter.Color = clRed
      FontEnter.Height = -16
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = DEFAULT_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -16
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      BevelWidth = 3
      Caption = #1601#1578#1581
      TabOrder = 0
      OnClick = BtnOpenClick
    end
    object btnAdd: TVrDemoButton
      Left = 622
      Top = 12
      Width = 118
      Height = 35
      FontEnter.Charset = DEFAULT_CHARSET
      FontEnter.Color = clRed
      FontEnter.Height = -16
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = DEFAULT_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -16
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      BevelWidth = 3
      Caption = #1573#1590#1575#1601#1577
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnEdit: TVrDemoButton
      Left = 499
      Top = 13
      Width = 118
      Height = 35
      FontEnter.Charset = DEFAULT_CHARSET
      FontEnter.Color = clRed
      FontEnter.Height = -16
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = DEFAULT_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -16
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      BevelWidth = 3
      Caption = #1578#1593#1583#1610#1600#1600#1604
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TVrDemoButton
      Left = 129
      Top = 13
      Width = 118
      Height = 35
      FontEnter.Charset = DEFAULT_CHARSET
      FontEnter.Color = clRed
      FontEnter.Height = -16
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = DEFAULT_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -16
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      BevelWidth = 3
      Caption = #1581#1584#1601
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object btnSave: TVrDemoButton
      Left = 376
      Top = 13
      Width = 118
      Height = 35
      FontEnter.Charset = DEFAULT_CHARSET
      FontEnter.Color = clRed
      FontEnter.Height = -16
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = DEFAULT_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -16
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      BevelWidth = 3
      Caption = #1581#1601#1600#1600#1600#1600#1600#1592
      TabOrder = 4
      OnClick = btnSaveClick
    end
    object BtnCancel: TVrDemoButton
      Left = 253
      Top = 13
      Width = 118
      Height = 35
      FontEnter.Charset = DEFAULT_CHARSET
      FontEnter.Color = clRed
      FontEnter.Height = -16
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = DEFAULT_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -16
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      BevelWidth = 3
      Caption = #1573#1604#1594#1575#1569
      TabOrder = 5
      OnClick = BtnCancelClick
    end
    object btnSearch: TVrDemoButton
      Left = 6
      Top = 14
      Width = 118
      Height = 35
      FontEnter.Charset = DEFAULT_CHARSET
      FontEnter.Color = clRed
      FontEnter.Height = -16
      FontEnter.Name = 'Arial'
      FontEnter.Style = [fsBold]
      FontLeave.Charset = DEFAULT_CHARSET
      FontLeave.Color = clBlack
      FontLeave.Height = -16
      FontLeave.Name = 'Arial'
      FontLeave.Style = [fsBold]
      BevelWidth = 3
      Caption = #1576#1581#1600#1600#1579
      TabOrder = 6
      OnClick = btnSearchClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 88
    Top = 77
    Width = 873
    Height = 44
    Color = clBtnFace
    ParentColor = False
    TabOrder = 2
    object lbl_Title: TVrLabel
      Left = 5
      Top = 8
      Width = 864
      Height = 33
      Color = clBtnFace
      Caption = #1573#1594#1600#1600#1604#1575#1602' '#1606#1602#1600#1600#1600#1600#1591#1577' '#1575#1604#1576#1610#1600#1600#1600#1600#1593
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object SDS_Header: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'select * from tbl_PosClose'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    OnCalcFields = SDS_HeaderCalcFields
    Left = 24
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
    object SDS_HeaderTrxNo: TStringField
      FieldName = 'TrxNo'
      Required = True
      Size = 8
    end
    object SDS_HeaderTrxDate: TSQLTimeStampField
      FieldName = 'TrxDate'
    end
    object SDS_HeaderTrxStatus: TStringField
      FieldName = 'TrxStatus'
      FixedChar = True
      Size = 1
    end
    object SDS_HeaderTrxDescA: TStringField
      FieldName = 'TrxDescA'
      Size = 100
    end
    object SDS_HeaderTrxDescE: TStringField
      FieldName = 'TrxDescE'
      Size = 100
    end
    object SDS_HeaderPOSCode: TStringField
      FieldName = 'POSCode'
      Size = 4
    end
    object SDS_HeaderCashCode: TStringField
      FieldName = 'CashCode'
      Size = 4
    end
    object SDS_HeaderBankCode: TStringField
      FieldName = 'BankCode'
      Size = 4
    end
    object SDS_HeaderCash: TFMTBCDField
      FieldName = 'Cash'
      Precision = 18
    end
    object SDS_HeaderCreditCard: TFMTBCDField
      FieldName = 'CreditCard'
      Precision = 18
    end
    object SDS_HeaderATM: TFMTBCDField
      FieldName = 'ATM'
      Precision = 18
    end
    object SDS_HeaderCredit: TFMTBCDField
      FieldName = 'Credit'
      Precision = 18
    end
    object SDS_HeaderChecks: TFMTBCDField
      FieldName = 'Checks'
      Precision = 18
    end
    object SDS_HeaderDiscount: TFMTBCDField
      FieldName = 'Discount'
      Precision = 18
    end
    object SDS_HeaderPOSShift: TStringField
      FieldName = 'POSShift'
      FixedChar = True
      Size = 1
    end
    object SDS_HeaderOperatorCode: TStringField
      FieldName = 'OperatorCode'
      OnChange = SDS_HeaderOperatorCodeChange
      Size = 6
    end
    object SDS_HeaderActualCash: TFMTBCDField
      FieldName = 'ActualCash'
      Precision = 18
    end
    object SDS_HeaderOldOpenBalance: TFMTBCDField
      FieldName = 'OldOpenBalance'
      Precision = 18
    end
    object SDS_HeaderNewOpenBalance: TFMTBCDField
      FieldName = 'NewOpenBalance'
      Precision = 18
    end
    object SDS_HeaderMainCashCode: TStringField
      FieldName = 'MainCashCode'
      FixedChar = True
      Size = 4
    end
    object SDS_HeaderCashDifference: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'CashDifference'
      Size = 8
      Calculated = True
    end
  end
  object DS_Header: TDataSource
    DataSet = SDS_Header
    Left = 64
  end
  object qry_Cash: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'SELECT     *'#13#10'FROM    tbl_CashBank '#13#10'Where CB_Type = '#39'C'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 24
    Top = 40
    object qry_CashCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_CashCB_Code: TStringField
      FieldName = 'CB_Code'
      Required = True
      Size = 4
    end
    object qry_CashCB_Type: TStringField
      FieldName = 'CB_Type'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qry_CashCB_NameA: TStringField
      FieldName = 'CB_NameA'
      Size = 100
    end
    object qry_CashCB_NameE: TStringField
      FieldName = 'CB_NameE'
      Size = 100
    end
  end
  object qry_Bank: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'SELECT     *'#13#10'FROM    tbl_CashBank '#13#10'Where CB_Type = '#39'B'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 24
    Top = 72
    object qry_BankCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_BankCB_Code: TStringField
      FieldName = 'CB_Code'
      Required = True
      Size = 4
    end
    object qry_BankCB_Type: TStringField
      FieldName = 'CB_Type'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qry_BankCB_NameA: TStringField
      FieldName = 'CB_NameA'
      Size = 100
    end
    object qry_BankCB_NameE: TStringField
      FieldName = 'CB_NameE'
      Size = 100
    end
  end
  object qry_POS: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_POS_Definition'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 24
    Top = 112
    object qry_POSCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_POSPOSCode: TStringField
      FieldName = 'POSCode'
      Required = True
      Size = 4
    end
    object qry_POSPOSNameAr: TStringField
      FieldName = 'POSNameAr'
      Size = 75
    end
    object qry_POSPOSNameEn: TStringField
      FieldName = 'POSNameEn'
      Size = 75
    end
    object qry_POSCashCode: TStringField
      FieldName = 'CashCode'
      Size = 4
    end
    object qry_POSBankCode: TStringField
      FieldName = 'BankCode'
      Size = 4
    end
    object qry_POSOpenBalance: TFMTBCDField
      FieldName = 'OpenBalance'
      Precision = 18
    end
    object qry_POSCreateDate: TSQLTimeStampField
      FieldName = 'CreateDate'
    end
    object qry_POSLastUpdateDate: TSQLTimeStampField
      FieldName = 'LastUpdateDate'
    end
  end
  object DS_Cash: TDataSource
    DataSet = qry_Cash
    Left = 56
    Top = 40
  end
  object DS_Bank: TDataSource
    DataSet = qry_Bank
    Left = 56
    Top = 72
  end
  object DS_POS: TDataSource
    DataSet = qry_POS
    Left = 56
    Top = 112
  end
  object PPL_Header: TppDBPipeline
    DataSource = DS_Header
    UserName = 'PPL_Header'
    Left = 94
    Top = 1
    object PPL_HeaderppField1: TppField
      FieldAlias = 'TrxNo'
      FieldName = 'TrxNo'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object PPL_HeaderppField2: TppField
      FieldAlias = 'TrxType'
      FieldName = 'TrxType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object PPL_HeaderppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'YearId'
      FieldName = 'YearId'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 6
      Position = 2
    end
    object PPL_HeaderppField4: TppField
      FieldAlias = 'TrxDate_hijri'
      FieldName = 'TrxDate_hijri'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object PPL_HeaderppField5: TppField
      FieldAlias = 'Subject'
      FieldName = 'Subject'
      FieldLength = 4000
      DisplayWidth = 40
      Position = 4
    end
    object PPL_HeaderppField6: TppField
      FieldAlias = 'Notes'
      FieldName = 'Notes'
      FieldLength = 4000
      DisplayWidth = 4000
      Position = 5
    end
    object PPL_HeaderppField7: TppField
      FieldAlias = 'AttachementCode'
      FieldName = 'AttachementCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 6
    end
    object PPL_HeaderppField8: TppField
      FieldAlias = 'AttachementDesc'
      FieldName = 'AttachementDesc'
      FieldLength = 20
      DisplayWidth = 40
      Position = 7
    end
    object PPL_HeaderppField9: TppField
      FieldAlias = 'NoOfAttachement'
      FieldName = 'NoOfAttachement'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object PPL_HeaderppField10: TppField
      FieldAlias = 'AttachementDetails'
      FieldName = 'AttachementDetails'
      FieldLength = 200
      DisplayWidth = 200
      Position = 9
    end
    object PPL_HeaderppField11: TppField
      FieldAlias = 'DirectionCode'
      FieldName = 'DirectionCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 10
    end
    object PPL_HeaderppField12: TppField
      FieldAlias = 'DirectionType'
      FieldName = 'DirectionType'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object PPL_HeaderppField13: TppField
      FieldAlias = 'DirectionDesc'
      FieldName = 'DirectionDesc'
      FieldLength = 80
      DisplayWidth = 80
      Position = 12
    end
    object PPL_HeaderppField14: TppField
      FieldAlias = 'SendingCode'
      FieldName = 'SendingCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 13
    end
    object PPL_HeaderppField15: TppField
      FieldAlias = 'SendingDesc'
      FieldName = 'SendingDesc'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object PPL_HeaderppField16: TppField
      FieldAlias = 'SenderName'
      FieldName = 'SenderName'
      FieldLength = 150
      DisplayWidth = 150
      Position = 15
    end
  end
  object qry_Operators: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 'Select * From tbl_operators'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 24
    Top = 152
    object qry_OperatorsCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_OperatorsOperatorCode: TStringField
      FieldName = 'OperatorCode'
      Required = True
      Size = 6
    end
    object qry_OperatorsOperatorNameAr: TStringField
      FieldName = 'OperatorNameAr'
      Size = 255
    end
    object qry_OperatorsOperatorNameEn: TStringField
      FieldName = 'OperatorNameEn'
      Size = 255
    end
    object qry_OperatorsUserID: TStringField
      FieldName = 'UserID'
      Size = 75
    end
    object qry_OperatorsCreateDate: TSQLTimeStampField
      FieldName = 'CreateDate'
    end
    object qry_OperatorsLastUpdateDate: TSQLTimeStampField
      FieldName = 'LastUpdateDate'
    end
  end
  object DS_Operators: TDataSource
    DataSet = qry_Operators
    Left = 56
    Top = 152
  end
  object ppDailySales: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 56
    Top = 215
    Version = '10.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
end

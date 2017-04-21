object pos_fmPayType: Tpos_fmPayType
  Left = 107
  Top = 149
  Hint = #1591#1585#1610#1602#1577' '#1575#1604#1583#1601#1593
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pay Type'
  ClientHeight = 353
  ClientWidth = 738
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ArEnLabel2: TLabel
    Left = 619
    Top = 73
    Width = 98
    Height = 25
    AutoSize = False
    Caption = ' Cash / '#1606#1602#1600#1600#1583#1610
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object ArEnLabel3: TLabel
    Left = 242
    Top = 120
    Width = 114
    Height = 16
    AutoSize = False
    Caption = 'Check / '#1588#1610#1600#1600#1600#1603
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object ArEnLabel4: TLabel
    Left = 619
    Top = 120
    Width = 83
    Height = 16
    AutoSize = False
    Caption = 'Visa / '#1601#1610#1600#1600#1586#1575
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object ArEnLabel5: TLabel
    Left = 235
    Top = 76
    Width = 135
    Height = 16
    AutoSize = False
    Caption = 'ATM / '#1588#1576#1603#1600#1577' '#1587#1593#1608#1583#1610#1577
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object ArEnLabel6: TLabel
    Left = 619
    Top = 163
    Width = 83
    Height = 16
    AutoSize = False
    Caption = 'Credit / '#1570#1580#1604
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Bevel1: TBevel
    Left = 13
    Top = 196
    Width = 684
    Height = 8
  end
  object QLabel13: TLabel
    Left = 520
    Top = 219
    Width = 161
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = 'Paid  /  '#1575#1604#1605#1583#1601#1600#1600#1600#1608#1593
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object vrmPayed: TVrMatrix
    Left = 495
    Top = 247
    Width = 213
    Height = 37
    Threaded = True
    Leds = 9
    Spacing = 4
    Palette.Low = clBlack
    Palette.High = clMenu
    LedStyle = ls19x27
    Bevel.InnerShadow = clBtnShadow
    Bevel.InnerHighlight = clBtnHighlight
    Bevel.InnerWidth = 2
    Bevel.InnerStyle = bsLowered
    Bevel.InnerSpace = 1
    Bevel.InnerColor = clBlack
    Bevel.OuterShadow = clBtnShadow
    Bevel.OuterHighlight = clBtnHighlight
    Bevel.OuterStyle = bsRaised
    Bevel.OuterOutline = osOuter
    Color = clBlack
    ParentColor = False
    Text = '0.00'
  end
  object vrmRemainder: TVrMatrix
    Left = 32
    Top = 246
    Width = 213
    Height = 37
    Threaded = True
    Leds = 9
    Spacing = 4
    Palette.Low = clBlack
    Palette.High = clMenu
    LedStyle = ls19x27
    Bevel.InnerShadow = clBtnShadow
    Bevel.InnerHighlight = clBtnHighlight
    Bevel.InnerWidth = 2
    Bevel.InnerStyle = bsLowered
    Bevel.InnerSpace = 1
    Bevel.InnerColor = clBlack
    Bevel.OuterShadow = clBtnShadow
    Bevel.OuterHighlight = clBtnHighlight
    Bevel.OuterStyle = bsRaised
    Bevel.OuterOutline = osOuter
    Color = clBlack
    ParentColor = False
    Text = '0.00'
  end
  object ArEnLabel7: TLabel
    Left = 73
    Top = 222
    Width = 125
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Caption = 'Remain / '#1575#1604#1576#1575#1602#1600#1600#1600#1600#1610
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object ArEnLabel8: TLabel
    Left = 317
    Top = 221
    Width = 132
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Caption = 'Total  /  '#1575#1604#1575#1580#1605#1575#1604#1600#1600#1600#1610
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object vrmTotal: TVrMatrix
    Left = 272
    Top = 247
    Width = 213
    Height = 37
    Threaded = True
    Leds = 9
    Spacing = 4
    Palette.Low = clBlack
    Palette.High = clMenu
    LedStyle = ls19x27
    Bevel.InnerShadow = clBtnShadow
    Bevel.InnerHighlight = clBtnHighlight
    Bevel.InnerWidth = 2
    Bevel.InnerStyle = bsLowered
    Bevel.InnerSpace = 1
    Bevel.InnerColor = clBlack
    Bevel.OuterShadow = clBtnShadow
    Bevel.OuterHighlight = clBtnHighlight
    Bevel.OuterStyle = bsRaised
    Bevel.OuterOutline = osOuter
    Color = clBlack
    ParentColor = False
    Text = '0.00'
  end
  object Label1: TLabel
    Left = 282
    Top = 5
    Width = 158
    Height = 32
    Alignment = taCenter
    AutoSize = False
    Caption = #1591#1600#1600#1600#1600#1600#1585#1610#1602#1600#1600#1600#1577' '#1575#1604#1583#1601#1600#1600#1600#1600#1600#1600#1593
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -20
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 279
    Top = 33
    Width = 158
    Height = 32
    Alignment = taCenter
    AutoSize = False
    Caption = 'Payment Method'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -20
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object lcbPayType: TDBLookupComboBox
    Left = 85
    Top = 8
    Width = 92
    Height = 24
    DataField = 'PaymentType'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    KeyField = 'Value'
    ListField = 'ResultE'
    ParentFont = False
    TabOrder = 8
    Visible = False
    OnClick = lcbPayTypeClick
  end
  object edtAmount: TEdit
    Left = -10
    Top = 8
    Width = 89
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Visible = False
    OnKeyPress = edtAmountKeyPress
  end
  object edtCash: TEdit
    Left = 393
    Top = 75
    Width = 204
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = edtCashChange
    OnKeyPress = edtAmountKeyPress
  end
  object edtCheck: TEdit
    Left = 17
    Top = 119
    Width = 204
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnChange = edtCashChange
    OnKeyPress = edtAmountKeyPress
  end
  object edtCreditCard: TEdit
    Left = 393
    Top = 118
    Width = 204
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnChange = edtCashChange
    OnKeyPress = edtAmountKeyPress
  end
  object edtATM: TEdit
    Left = 17
    Top = 74
    Width = 204
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = edtCashChange
    OnKeyPress = edtAmountKeyPress
  end
  object edtCredit: TEdit
    Left = 393
    Top = 162
    Width = 204
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnChange = edtCashChange
    OnKeyPress = edtAmountKeyPress
  end
  object Btn_Cancel: TButton
    Left = 83
    Top = 310
    Width = 262
    Height = 30
    Hint = 'Alt + N  (F 6)'
    Caption = 'Cancel  /  '#1573#1604#1594#1600#1600#1600#1600#1600#1600#1575#1569
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -20
    Font.Name = 'Traditional Arabic'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Btn_CancelClick
  end
  object Btn_Ok: TButton
    Left = 384
    Top = 310
    Width = 255
    Height = 30
    Hint = 'Alt + N  (F 6)'
    Caption = 'OK  /  '#1605#1608#1575#1601#1600#1600#1600#1600#1600#1600#1600#1600#1600#1602
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -20
    Font.Name = 'Traditional Arabic'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Btn_OkClick
  end
end

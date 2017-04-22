object fmPointOfSale: TfmPointOfSale
  Left = 0
  Top = 2
  Hint = #1606#1602#1591#1577' '#1575#1604#1576#1610#1593
  BorderStyle = bsDialog
  Caption = 'Point Of Sale'
  ClientHeight = 688
  ClientWidth = 1006
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 852
    Top = 37
    Width = 149
    Height = 541
    Align = alRight
    TabOrder = 0
    object paButtons: TPanel
      Left = 1
      Top = 1
      Width = 147
      Height = 539
      Align = alClient
      Color = clSilver
      TabOrder = 0
      object btn_Cancel: TVrDemoButton
        Left = 0
        Top = 143
        Width = 146
        Height = 61
        Hint = 'Alt + C  (F 10)'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clRed
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -13
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'Cancel '#1578#1600#1600#1600#1585#1575#1580#1600#1593' F10'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btn_CancelClick
      end
      object btn_SaveAndPrint: TVrDemoButton
        Left = 0
        Top = 74
        Width = 146
        Height = 61
        Hint = 'Alt + P  (F 11)'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clRed
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -13
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'Save  '#1581#1601#1600#1600#1592'  F11'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btn_SaveAndPrintClick
      end
      object btn_Add: TVrDemoButton
        Left = 0
        Top = 5
        Width = 146
        Height = 61
        Hint = 'Alt + N  (F 6)'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clRed
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -13
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = ' Add '#1573#1590#1600#1600#1575#1601#1600#1600#1600#1577'  F6'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btn_AddClick
      end
      object btnPrint: TVrDemoButton
        Left = 0
        Top = 213
        Width = 146
        Height = 61
        Hint = 'Ctrl + P'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clRed
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -13
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'Print '#1591#1576#1575#1593#1577'  Ctrl + P'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnPrintClick
      end
      object btn_Close: TVrDemoButton
        Left = 0
        Top = 353
        Width = 146
        Height = 61
        Hint = 'Alt + L'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clRed
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -13
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'Close '#1573#1594#1604#1575#1602'  Alt + L'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btn_CloseClick
      end
      object btnShow: TVrDemoButton
        Left = 0
        Top = 282
        Width = 146
        Height = 61
        Hint = 'Alt + V'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clRed
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -13
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'Show '#1593#1600#1585#1590'  Alt + V'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnShowClick
      end
      object btn_DeleteItem: TVrDemoButton
        Left = 0
        Top = 422
        Width = 146
        Height = 61
        Hint = 'Alt + N  (F 6)'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clRed
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -13
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'Delete Item '#1581#1600#1600#1584#1601' '#1589#1606#1600#1600#1601
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = btn_DeleteItemClick
      end
      object Btn_LogOut: TVrDemoButton
        Left = 1
        Top = 491
        Width = 146
        Height = 61
        Hint = 'Alt + F2'
        FontEnter.Charset = DEFAULT_CHARSET
        FontEnter.Color = clRed
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = DEFAULT_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -13
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        Caption = 'Log Out '#1578#1587#1580#1610#1604' '#1582#1585#1608#1580
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = Btn_LogOutClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 578
    Width = 1006
    Height = 110
    Align = alBottom
    Color = 16762566
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Panel7: TPanel
      Left = 1
      Top = -1
      Width = 1004
      Height = 110
      Align = alBottom
      Color = 13750737
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object ArEnPanel1: TPanel
        Left = 1
        Top = 1
        Width = 1002
        Height = 108
        Align = alClient
        Color = clSilver
        TabOrder = 0
        DesignSize = (
          1002
          108)
        object QLabel10: TLabel
          Left = 387
          Top = 19
          Width = 136
          Height = 29
          Anchors = []
          AutoSize = False
          Caption = 'Net Price/'#1575#1604#1589#1600#1600#1575#1601#1610
          Font.Charset = ARABIC_CHARSET
          Font.Color = clTeal
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object vrmAmount: TVrMatrix
          Left = 217
          Top = 17
          Width = 168
          Height = 30
          Threaded = True
          Leds = 9
          Spacing = 4
          Palette.Low = clBlack
          Palette.High = clLime
          Alignment = vaRightJustify
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
          Anchors = []
          Color = clBlack
          ParentColor = False
          Text = '0.00'
        end
        object QLabel7: TLabel
          Left = 745
          Top = 65
          Width = 93
          Height = 27
          Anchors = []
          AutoSize = False
          Caption = 'Disc / '#1575#1604#1582#1589#1605
          Font.Charset = ARABIC_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object vrmTotalDiscount: TVrMatrix
          Left = 568
          Top = 65
          Width = 168
          Height = 30
          Threaded = True
          Leds = 9
          Spacing = 4
          Palette.Low = clBlack
          Palette.High = clRed
          Alignment = vaRightJustify
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
          Anchors = []
          Color = clBlack
          ParentColor = False
          Text = '0.00'
        end
        object vrmTotal: TVrMatrix
          Left = 568
          Top = 17
          Width = 168
          Height = 30
          Threaded = True
          Leds = 9
          Spacing = 4
          Palette.Low = clBlack
          Palette.High = clLime
          Alignment = vaRightJustify
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
          Anchors = []
          Color = clBlack
          ParentColor = False
          Text = '0.00'
        end
        object QLabel13: TLabel
          Left = 739
          Top = 20
          Width = 109
          Height = 22
          Anchors = []
          AutoSize = False
          Caption = 'Total /'#1575#1604#1575#1580#1605#1575#1604#1610
          Font.Charset = ARABIC_CHARSET
          Font.Color = clTeal
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object vrmChange: TVrMatrix
          Left = 217
          Top = 66
          Width = 168
          Height = 30
          Threaded = True
          Leds = 9
          Spacing = 4
          Palette.Low = clBlack
          Palette.High = clRed
          Alignment = vaRightJustify
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
          Anchors = []
          Color = clBlack
          ParentColor = False
          Text = '0.00'
        end
        object ArEnLabel1: TLabel
          Left = 388
          Top = 66
          Width = 137
          Height = 26
          Anchors = []
          AutoSize = False
          Caption = 'Remain / '#1575#1604#1576#1575#1602#1600#1600#1600#1600#1600#1610
          Font.Charset = ARABIC_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object VrBlotter2: TVrBlotter
          Left = 850
          Top = 1
          Width = 151
          Height = 106
          Align = alRight
          Bevel.InnerShadow = clGreen
          Bevel.InnerHighlight = clWhite
          Bevel.InnerWidth = 1
          Bevel.InnerStyle = bsLowered
          Bevel.InnerSpace = 1
          Bevel.InnerColor = clBlack
          Bevel.OuterShadow = clGreen
          Bevel.OuterHighlight = clWhite
          Bevel.OuterStyle = bsRaised
          Bevel.OuterOutline = osOuter
          TabOrder = 0
          object VrClock1: TVrClock
            Left = 4
            Top = 4
            Width = 143
            Height = 98
            Threaded = True
            Palette.Low = clBlack
            Palette.High = clWhite
            Align = alClient
            Color = clBlack
            ParentColor = False
          end
        end
        object VrBlotter1: TVrBlotter
          Left = 1
          Top = 1
          Width = 211
          Height = 106
          Align = alLeft
          Bevel.InnerShadow = clWhite
          Bevel.InnerHighlight = clWhite
          Bevel.InnerWidth = 1
          Bevel.InnerStyle = bsLowered
          Bevel.InnerSpace = 1
          Bevel.InnerColor = clBlack
          Bevel.OuterShadow = clGreen
          Bevel.OuterHighlight = clWhite
          Bevel.OuterStyle = bsRaised
          Bevel.OuterOutline = osOuter
          TabOrder = 1
          object vrdgAmount: TVrDigitGroup
            Left = 4
            Top = 4
            Width = 203
            Height = 98
            Decimals = 2
            Digits = 7
            Palette.Low = clBlack
            Palette.High = clWhite
            LeadingZero = False
            Align = alClient
          end
        end
      end
    end
  end
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 1006
    Height = 37
    Align = alTop
    Caption = #1606#1602#1591#1600#1600#1600#1577' '#1576#1610#1600#1600#1600#1600#1593
    Font.Charset = ARABIC_CHARSET
    Font.Color = clHotLight
    Font.Height = -32
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 1001
    Top = 37
    Width = 5
    Height = 541
    Align = alRight
    Color = 13750737
    TabOrder = 3
  end
  object grp_Container: TGroupBox
    Left = 0
    Top = 37
    Width = 852
    Height = 541
    Align = alClient
    Color = clSilver
    ParentColor = False
    TabOrder = 4
    object pnlKeyPad: TPanel
      Left = 2
      Top = 130
      Width = 205
      Height = 409
      Align = alLeft
      TabOrder = 0
      object ArEnPanel3: TPanel
        Left = 1
        Top = 1
        Width = 203
        Height = 407
        Align = alClient
        Color = clSilver
        TabOrder = 0
        object Bevel1: TBevel
          Left = 3
          Top = 188
          Width = 187
          Height = 4
        end
        object ArEnLabel7: TLabel
          Left = 138
          Top = 246
          Width = 69
          Height = 16
          AutoSize = False
          Caption = #1575#1604#1605#1583#1601#1608#1593
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object vrmPayed: TVrMatrix
          Left = 33
          Top = 242
          Width = 85
          Height = 23
          Threaded = True
          Leds = 7
          Palette.Low = clBlack
          Palette.High = clLime
          LedStyle = ls9x13
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
          Visible = False
        end
        object ArEnLabel8: TLabel
          Left = 136
          Top = 271
          Width = 81
          Height = 16
          AutoSize = False
          Caption = #1575#1604#1576#1575#1602#1600#1600#1610
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object vrmRemainder: TVrMatrix
          Left = 33
          Top = 267
          Width = 85
          Height = 23
          Threaded = True
          Leds = 7
          Palette.Low = clBlack
          Palette.High = clLime
          LedStyle = ls9x13
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
          Visible = False
        end
        object Bevel2: TBevel
          Left = 10
          Top = 7
          Width = 183
          Height = 4
        end
        object VrDigitGroup1: TVrDigitGroup
          Left = 10
          Top = 196
          Width = 177
          Height = 33
          Decimals = 2
          Digits = 5
          Palette.Low = clBlack
          Palette.High = clMenu
          LeadingZero = False
        end
        object VrKeyPad1: TVrKeyPad
          Left = 5
          Top = 13
          Width = 190
          Height = 172
          ExtraKey1.Caption = '1/4'
          ExtraKey1.Color = clBackground
          ExtraKey1.Visible = True
          ExtraKey1.Width = 40
          ExtraKey2.Caption = '1/2'
          ExtraKey2.Color = clBackground
          ExtraKey2.Visible = True
          ExtraKey2.Width = 40
          ExtraKey3.Caption = '3/4'
          ExtraKey3.Color = clBackground
          ExtraKey3.Visible = True
          ExtraKey3.Width = 40
          ExtraKey4.Color = clBackground
          ExtraKey4.Visible = True
          ExtraKey4.Width = 40
          Look.ButtonWidth = 60
          Look.ButtonHeight = 40
          Look.Color = clBackground
          Look.Flat = False
          Look.Font.Charset = DEFAULT_CHARSET
          Look.Font.Color = clWindow
          Look.Font.Height = -19
          Look.Font.Name = 'MS Sans Serif'
          Look.Font.Style = [fsBold]
          Look.Style = vsCellPhone
          OnNumericKeyClick = VrKeyPad1NumericKeyClick
          OnSharpClick = VrKeyPad1SharpClick
          OnExtra1Click = VrKeyPad1Extra1Click
          OnExtra2Click = VrKeyPad1Extra2Click
          OnExtra3Click = VrKeyPad1Extra3Click
        end
      end
    end
    object pnlDetails: TPanel
      Left = 207
      Top = 130
      Width = 643
      Height = 409
      Align = alClient
      TabOrder = 1
      object grdDetails: TDBGrid
        Left = 335
        Top = 1
        Width = 307
        Height = 407
        Align = alClient
        BiDiMode = bdLeftToRight
        DataSource = DS_Details
        Font.Charset = ARABIC_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnExit = grdDetailsExit
      end
      object PageControlDetails: TPageControl
        Left = 1
        Top = 1
        Width = 334
        Height = 407
        Align = alLeft
        MultiLine = True
        TabHeight = 25
        TabOrder = 1
        TabWidth = 75
      end
    end
    object pnl_Header: TPanel
      Left = 2
      Top = 15
      Width = 848
      Height = 80
      Align = alTop
      Caption = 'pnl_Header'
      TabOrder = 2
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 846
        Height = 79
        Align = alTop
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          846
          79)
        object ArEnLabel10: TLabel
          Left = 1220
          Top = 10
          Width = 35
          Height = 13
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'Policy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object Label1: TLabel
          Left = 796
          Top = 44
          Width = 50
          Height = 16
          AutoSize = False
          Caption = #1575#1604#1608#1585#1583#1610#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object Label2: TLabel
          Left = 793
          Top = 13
          Width = 50
          Height = 16
          AutoSize = False
          Caption = #1575#1604#1585#1602#1600#1600#1605
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object Label3: TLabel
          Left = 522
          Top = 46
          Width = 50
          Height = 16
          AutoSize = False
          Caption = #1575#1604#1603#1575#1588#1610#1585
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object Label4: TLabel
          Left = 521
          Top = 13
          Width = 50
          Height = 16
          AutoSize = False
          Caption = #1575#1604#1578#1575#1585#1610#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object Label5: TLabel
          Left = 205
          Top = 14
          Width = 50
          Height = 16
          AutoSize = False
          Caption = #1575#1604#1593#1605#1610#1604
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object Label6: TLabel
          Left = 205
          Top = 46
          Width = 50
          Height = 16
          AutoSize = False
          Caption = #1575#1604#1605#1587#1578#1608#1583#1593
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DBComboBox1: TDBComboBox
          Left = 646
          Top = 41
          Width = 136
          Height = 21
          Style = csDropDownList
          DataField = 'POSShift'
          DataSource = DS_Header
          ItemHeight = 13
          Items.Strings = (
            '1'
            '2'
            '3')
          TabOrder = 0
        end
        object qdbeCode: TDBEdit
          Left = 645
          Top = 9
          Width = 135
          Height = 21
          AutoSize = False
          DataField = 'TrxNo'
          DataSource = DS_Header
          Enabled = False
          TabOrder = 2
        end
        object lcbPolicy: TDBLookupComboBox
          Left = 1079
          Top = 7
          Width = 111
          Height = 21
          Anchors = [akTop, akRight]
          KeyField = 'PolicyCode'
          ListField = 'PolicyNameE'
          ListSource = DS_Policy
          TabOrder = 1
          Visible = False
        end
        object cbo_Operators: TDBLookupComboBox
          Left = 341
          Top = 42
          Width = 173
          Height = 23
          DataField = 'OperatorCode'
          DataSource = DS_Header
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          KeyField = 'OperatorCode'
          ListField = 'OperatorNameAr'
          ListSource = DS_Operators
          ParentFont = False
          TabOrder = 3
        end
        object dt_TrxDate: TDateTimePicker
          Left = 341
          Top = 9
          Width = 172
          Height = 21
          Date = 42842.910706111110000000
          Time = 42842.910706111110000000
          TabOrder = 4
        end
        object cbo_Customers: TDBLookupComboBox
          Left = 12
          Top = 10
          Width = 184
          Height = 23
          DataField = 'CustomerCode'
          DataSource = DS_Header
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          KeyField = 'CustomerCode'
          ListField = 'CustomerNameAr'
          ListSource = DS_Customers
          ParentFont = False
          TabOrder = 5
        end
        object cbo_Warehouse: TDBLookupComboBox
          Left = 12
          Top = 42
          Width = 184
          Height = 23
          DataField = 'WarehouseCode'
          DataSource = DS_Header
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          KeyField = 'WareHouseCode'
          ListField = 'WareHouseNameAr'
          ListSource = DS_Warehouse
          ParentFont = False
          TabOrder = 6
        end
      end
    end
    object pnl_InsertBarcode: TPanel
      Left = 2
      Top = 95
      Width = 848
      Height = 35
      Align = alTop
      TabOrder = 3
      object ArEnLabel11: TLabel
        Left = 800
        Top = 9
        Width = 72
        Height = 16
        AutoSize = False
        Caption = #1575#1604#1576#1575#1585#1603#1600#1600#1600#1608#1583
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ArEnLabel12: TLabel
        Left = 255
        Top = 8
        Width = 74
        Height = 16
        AutoSize = False
        Caption = 'Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        Visible = False
      end
      object edtQuantity: TDBEdit
        Left = 333
        Top = 6
        Width = 85
        Height = 21
        AutoSize = False
        DataField = 'Quantity'
        DataSource = DS_Details
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object edtBarcode: TEdit
        Left = 501
        Top = 5
        Width = 284
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnKeyPress = edtBarcodeKeyPress
      end
      object pnl_PaymentType: TPanel
        Left = 7
        Top = -28
        Width = 92
        Height = 25
        TabOrder = 2
        Visible = False
        object ArEnLabel9: TLabel
          Left = -2
          Top = 7
          Width = 89
          Height = 16
          AutoSize = False
          Caption = 'Cash Paid'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object ArEnLabel2: TLabel
          Left = 6
          Top = 26
          Width = 89
          Height = 16
          AutoSize = False
          Caption = 'Cash'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object ArEnLabel3: TLabel
          Left = 6
          Top = 45
          Width = 89
          Height = 16
          AutoSize = False
          Caption = 'Check'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object ArEnLabel4: TLabel
          Left = 6
          Top = 65
          Width = 89
          Height = 16
          AutoSize = False
          Caption = 'Credit Card'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object ArEnLabel5: TLabel
          Left = 6
          Top = 83
          Width = 89
          Height = 16
          AutoSize = False
          Caption = 'ATM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object ArEnLabel6: TLabel
          Left = 6
          Top = 104
          Width = 89
          Height = 16
          AutoSize = False
          Caption = 'Credit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object ArEnLabel13: TLabel
          Left = 6
          Top = 123
          Width = 89
          Height = 16
          AutoSize = False
          Caption = 'Points'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object edtCashPaid: TEdit
          Left = 102
          Top = 5
          Width = 104
          Height = 17
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnChange = edtCashChange
          OnKeyPress = edtCashKeyPress
        end
        object edtCash: TEdit
          Left = 102
          Top = 24
          Width = 104
          Height = 17
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnChange = edtCashChange
          OnKeyPress = edtCashKeyPress
        end
        object edtCheck: TEdit
          Left = 102
          Top = 43
          Width = 104
          Height = 17
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnChange = edtCashChange
          OnKeyPress = edtCashKeyPress
        end
        object edtCreditCard: TEdit
          Left = 102
          Top = 62
          Width = 104
          Height = 17
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnChange = edtCashChange
          OnKeyPress = edtCashKeyPress
        end
        object edtATM: TEdit
          Left = 102
          Top = 81
          Width = 104
          Height = 17
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnChange = edtCashChange
          OnKeyPress = edtCashKeyPress
        end
        object edtCredit: TEdit
          Left = 102
          Top = 103
          Width = 104
          Height = 17
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnChange = edtCashChange
          OnKeyPress = edtCashKeyPress
        end
      end
    end
  end
  object SDS_Items: TSimpleDataSet
    Tag = 1
    Active = True
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 
      'Select ItemCode, ItemService, ItemNameAr, ItemNameEn, ItemUnitCo' +
      'de'#13#10'From   tbl_ItemDefinition'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 434
    Top = 380
    object SDS_ItemsItemService: TStringField
      FieldName = 'ItemService'
      Required = True
      FixedChar = True
      Size = 3
    end
    object SDS_ItemsItemCode: TStringField
      Tag = 1
      DisplayLabel = 'Code'
      FieldName = 'ItemCode'
      Origin = #1575#1604#1585#1605#1586
      Required = True
    end
    object SDS_ItemsItemNameAr: TStringField
      FieldName = 'ItemNameAr'
      Size = 255
    end
    object SDS_ItemsItemNameEn: TStringField
      FieldName = 'ItemNameEn'
      Size = 255
    end
    object SDS_ItemsItemUnitCode: TStringField
      FieldName = 'ItemUnitCode'
      Size = 6
    end
  end
  object qryBarcodeVio: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'Select * from Barcode_Vio '
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 491
    Top = 380
    object qryBarcodeVioCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qryBarcodeVioItemCode: TStringField
      FieldName = 'ItemCode'
      Size = 25
    end
    object qryBarcodeVioItemService: TStringField
      FieldName = 'ItemService'
      Size = 3
    end
    object qryBarcodeVioBarcode: TStringField
      FieldName = 'Barcode'
      Required = True
      Size = 30
    end
    object qryBarcodeVioStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object qryBarcodeVioPrice: TFMTBCDField
      FieldName = 'Price'
      Precision = 18
      Size = 8
    end
    object qryBarcodeVioItemUnitDescA: TStringField
      FieldName = 'ItemUnitDescA'
      Size = 75
    end
    object qryBarcodeVioItemUnit: TStringField
      FieldName = 'ItemUnit'
      Size = 6
    end
    object qryBarcodeVioBaseUnit: TStringField
      FieldName = 'BaseUnit'
      Size = 6
    end
    object qryBarcodeVioUnitTransValue: TFMTBCDField
      FieldName = 'UnitTransValue'
      Precision = 18
      Size = 8
    end
    object qryBarcodeVioItemUnitDescE: TStringField
      FieldName = 'ItemUnitDescE'
      Size = 75
    end
    object qryBarcodeVioItemTypeCode: TStringField
      FieldName = 'ItemTypeCode'
      Size = 6
    end
    object qryBarcodeVioItemGroupCode: TStringField
      FieldName = 'ItemGroupCode'
      Size = 6
    end
    object qryBarcodeVioItemNameAr: TStringField
      FieldName = 'ItemNameAr'
      Size = 255
    end
    object qryBarcodeVioItemNameEn: TStringField
      FieldName = 'ItemNameEn'
      Size = 255
    end
    object qryBarcodeVioItemCategoryCode: TStringField
      FieldName = 'ItemCategoryCode'
      Size = 6
    end
    object qryBarcodeVioDiscountRatio: TFMTBCDField
      FieldName = 'DiscountRatio'
      Precision = 18
      Size = 8
    end
    object qryBarcodeVioDiscountValue: TFMTBCDField
      FieldName = 'DiscountValue'
      Precision = 18
      Size = 8
    end
    object qryBarcodeVioItemColorCode: TStringField
      FieldName = 'ItemColorCode'
      Size = 6
    end
    object qryBarcodeVioItemSizeCode: TStringField
      FieldName = 'ItemSizeCode'
      Size = 6
    end
  end
  object SDS_AllUnits: TSimpleDataSet
    Tag = 1
    Active = True
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'Select * From tbl_ItemUnit '
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 566
    Top = 380
    object SDS_AllUnitsCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object SDS_AllUnitsItemUnitCode: TStringField
      FieldName = 'ItemUnitCode'
      Required = True
      Size = 6
    end
    object SDS_AllUnitsItemUnitDescA: TStringField
      FieldName = 'ItemUnitDescA'
      Size = 75
    end
    object SDS_AllUnitsItemUnitDescE: TStringField
      FieldName = 'ItemUnitDescE'
      Size = 75
    end
    object SDS_AllUnitsUnitTransCode: TStringField
      FieldName = 'UnitTransCode'
      Size = 6
    end
    object SDS_AllUnitsUnitTransValue: TFMTBCDField
      FieldName = 'UnitTransValue'
      Precision = 18
      Size = 8
    end
    object SDS_AllUnitsCreateDate: TSQLTimeStampField
      FieldName = 'CreateDate'
    end
    object SDS_AllUnitsLastUpdateDate: TSQLTimeStampField
      FieldName = 'LastUpdateDate'
    end
  end
  object SDS_Header: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'SELECT *'#13#10'FROM sa_POS_TrxHeader '#13#10'Where  1=2 '#13#10
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterScroll = SDS_HeaderAfterScroll
    OnCalcFields = SDS_HeaderCalcFields
    OnNewRecord = SDS_HeaderNewRecord
    Left = 333
    Top = 317
    object SDS_HeaderBranchCode: TStringField
      FieldName = 'BranchCode'
      Required = True
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SDS_HeaderCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SDS_HeaderYearID: TStringField
      FieldName = 'YearID'
      Required = True
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SDS_HeaderPeriodID: TStringField
      FieldName = 'PeriodID'
      Required = True
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SDS_HeaderTrxType: TStringField
      FieldName = 'TrxType'
      Required = True
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SDS_HeaderTrxNo: TStringField
      Tag = 2
      DisplayLabel = 'Number'
      FieldName = 'TrxNo'
      Origin = #1575#1604#1585#1602#1605
      Required = True
      FixedChar = True
      Size = 8
    end
    object SDS_HeaderTrxDate: TSQLTimeStampField
      Tag = 2
      DisplayLabel = 'Date'
      FieldName = 'TrxDate'
      Origin = #1575#1604#1578#1575#1585#1610#1582
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99-99-0000;1;_'
    end
    object SDS_HeaderTrxDescA: TStringField
      DisplayLabel = #1575#1604#1608#1589#1601
      FieldName = 'TrxDescA'
      Visible = False
      Size = 50
    end
    object SDS_HeaderTrxDescE: TStringField
      Tag = 4
      DisplayLabel = 'Description'
      FieldName = 'TrxDescE'
      Visible = False
      Size = 50
    end
    object SDS_HeaderTrxStatus: TStringField
      FieldName = 'TrxStatus'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SDS_HeaderCustomerCode: TStringField
      FieldName = 'CustomerCode'
      Visible = False
      Size = 10
    end
    object SDS_HeaderWarehouseCode: TStringField
      FieldName = 'WarehouseCode'
      Visible = False
    end
    object SDS_HeaderTotalDiscount: TFMTBCDField
      DefaultExpression = '0'
      DisplayWidth = 12
      FieldName = 'TotalDiscount'
      Visible = False
      OnChange = SDS_HeaderTotalDiscountChange
      Precision = 18
      Size = 8
    end
    object SDS_HeaderTrxAmount: TFMTBCDField
      Tag = 2
      DefaultExpression = '0'
      DisplayLabel = 'Amount'
      DisplayWidth = 12
      FieldName = 'TrxAmount'
      Origin = #1575#1604#1573#1580#1605#1575#1604#1610
      Visible = False
      OnChange = SDS_HeaderTrxAmountChange
      Precision = 18
      Size = 8
    end
    object SDS_HeaderTrxBalance: TFMTBCDField
      Tag = 2
      DefaultExpression = '0'
      DisplayLabel = 'Balance'
      DisplayWidth = 12
      FieldName = 'TrxBalance'
      Origin = #1575#1604#1585#1589#1610#1583
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_HeaderPOSShift: TStringField
      FieldName = 'POSShift'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SDS_HeaderPOSCode: TStringField
      FieldName = 'POSCode'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SDS_HeaderTrxTime: TSQLTimeStampField
      FieldName = 'TrxTime'
      Visible = False
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99-99-0000;1;_'
    end
    object SDS_HeaderOperatorCode: TStringField
      FieldName = 'OperatorCode'
      Visible = False
      Size = 4
    end
    object SDS_HeaderIntRefrence: TStringField
      FieldName = 'IntRefrence'
      Size = 15
    end
    object SDS_HeaderSourceDocNo: TStringField
      FieldName = 'SourceDocNo'
      Size = 8
    end
    object SDS_HeaderSourceDocType: TStringField
      FieldName = 'SourceDocType'
      Size = 4
    end
    object SDS_HeaderSourceDocYearId: TStringField
      FieldName = 'SourceDocYearId'
      Size = 4
    end
    object SDS_HeaderSourceDocPeriodId: TStringField
      FieldName = 'SourceDocPeriodId'
      Size = 2
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
      Size = 8
    end
    object SDS_HeaderATM: TFMTBCDField
      FieldName = 'ATM'
      Precision = 18
      Size = 8
    end
    object SDS_HeaderVisa: TFMTBCDField
      FieldName = 'Visa'
      Precision = 18
      Size = 8
    end
    object SDS_HeaderChecks: TFMTBCDField
      FieldName = 'Checks'
      Precision = 18
      Size = 8
    end
    object SDS_HeaderCredit: TFMTBCDField
      FieldName = 'Credit'
      Precision = 18
      Size = 8
    end
    object SDS_HeaderCreateDate: TSQLTimeStampField
      FieldName = 'CreateDate'
    end
    object SDS_HeaderLastUpdateDate: TSQLTimeStampField
      FieldName = 'LastUpdateDate'
    end
    object SDS_HeaderPayedValue: TFMTBCDField
      FieldName = 'PayedValue'
      Precision = 18
      Size = 8
    end
    object SDS_HeaderRemainderValue: TFMTBCDField
      FieldName = 'RemainderValue'
      Precision = 18
      Size = 8
    end
    object SDS_HeaderTotal: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Total'
      OnChange = SDS_HeaderTotalChange
      Size = 8
      Calculated = True
    end
  end
  object DS_Header: TDataSource
    DataSet = SDS_Header
    Left = 359
    Top = 317
  end
  object DPL_Header: TppDBPipeline
    DataSource = DS_Header
    UserName = 'DPL_Header'
    Left = 387
    Top = 317
    object DPL_Header_EppField1: TppField
      FieldAlias = 'BranchCode'
      FieldName = 'BranchCode'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object DPL_Header_EppField2: TppField
      FieldAlias = 'CompanyCode'
      FieldName = 'CompanyCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object DPL_Header_EppField3: TppField
      FieldAlias = 'YearID'
      FieldName = 'YearID'
      FieldLength = 9
      DisplayWidth = 9
      Position = 2
    end
    object DPL_Header_EppField4: TppField
      FieldAlias = 'PeriodID'
      FieldName = 'PeriodID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object DPL_Header_EppField5: TppField
      FieldAlias = 'TrxType'
      FieldName = 'TrxType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 4
    end
    object DPL_Header_EppField6: TppField
      FieldAlias = 'TrxNo'
      FieldName = 'TrxNo'
      FieldLength = 8
      DisplayWidth = 8
      Position = 5
    end
    object DPL_Header_EppField7: TppField
      FieldAlias = 'TrxDate'
      FieldName = 'TrxDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 6
    end
    object DPL_Header_EppField8: TppField
      FieldAlias = 'TrxDescA'
      FieldName = 'TrxDescA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object DPL_Header_EppField9: TppField
      FieldAlias = 'TrxDescE'
      FieldName = 'TrxDescE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object DPL_Header_EppField10: TppField
      FieldAlias = 'TrxStatus'
      FieldName = 'TrxStatus'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object DPL_Header_EppField11: TppField
      FieldAlias = 'CustomerCode'
      FieldName = 'CustomerCode'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object DPL_Header_EppField12: TppField
      FieldAlias = 'WarehouseCode'
      FieldName = 'WarehouseCode'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object DPL_Header_EppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalDiscount'
      FieldName = 'TotalDiscount'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 12
      Position = 12
    end
    object DPL_Header_EppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrxAmount'
      FieldName = 'TrxAmount'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 12
      Position = 13
    end
    object DPL_Header_EppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrxBalance'
      FieldName = 'TrxBalance'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 12
      Position = 14
    end
    object DPL_Header_EppField16: TppField
      FieldAlias = 'POSShift'
      FieldName = 'POSShift'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object DPL_Header_EppField17: TppField
      FieldAlias = 'POSCode'
      FieldName = 'POSCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 16
    end
    object DPL_Header_EppField18: TppField
      FieldAlias = 'TrxTime'
      FieldName = 'TrxTime'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 17
    end
    object DPL_Header_EppField19: TppField
      FieldAlias = 'OperatorCode'
      FieldName = 'OperatorCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 18
    end
    object DPL_Header_EppField20: TppField
      FieldAlias = 'IntRefrence'
      FieldName = 'IntRefrence'
      FieldLength = 15
      DisplayWidth = 15
      Position = 19
    end
    object DPL_Header_EppField21: TppField
      FieldAlias = 'SourceDocNo'
      FieldName = 'SourceDocNo'
      FieldLength = 8
      DisplayWidth = 8
      Position = 20
    end
    object DPL_Header_EppField22: TppField
      FieldAlias = 'SourceDocType'
      FieldName = 'SourceDocType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 21
    end
    object DPL_Header_EppField23: TppField
      FieldAlias = 'SourceDocYearId'
      FieldName = 'SourceDocYearId'
      FieldLength = 4
      DisplayWidth = 4
      Position = 22
    end
    object DPL_Header_EppField24: TppField
      FieldAlias = 'SourceDocPeriodId'
      FieldName = 'SourceDocPeriodId'
      FieldLength = 2
      DisplayWidth = 2
      Position = 23
    end
    object DPL_Header_EppField25: TppField
      FieldAlias = 'CashCode'
      FieldName = 'CashCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 24
    end
    object DPL_Header_EppField26: TppField
      FieldAlias = 'BankCode'
      FieldName = 'BankCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 25
    end
    object DPL_Header_EppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'Cash'
      FieldName = 'Cash'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 26
    end
    object DPL_Header_EppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'ATM'
      FieldName = 'ATM'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 27
    end
    object DPL_Header_EppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'Visa'
      FieldName = 'Visa'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 28
    end
    object DPL_Header_EppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'Checks'
      FieldName = 'Checks'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 29
    end
    object DPL_Header_EppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'Credit'
      FieldName = 'Credit'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 30
    end
    object DPL_Header_EppField32: TppField
      FieldAlias = 'CreateDate'
      FieldName = 'CreateDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 31
    end
    object DPL_Header_EppField33: TppField
      FieldAlias = 'LastUpdateDate'
      FieldName = 'LastUpdateDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 32
    end
    object DPL_Header_EppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'PayedValue'
      FieldName = 'PayedValue'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 33
    end
    object DPL_Header_EppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'RemainderValue'
      FieldName = 'RemainderValue'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 34
    end
    object DPL_Header_EppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'Total'
      FieldName = 'Total'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
  end
  object ppSales: TppDBPipeline
    DataSource = DS_Details
    UserName = 'Details'
    Left = 387
    Top = 345
    object ppSalesppField1: TppField
      FieldAlias = 'CompanyCode'
      FieldName = 'CompanyCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 0
    end
    object ppSalesppField2: TppField
      FieldAlias = 'BranchCode'
      FieldName = 'BranchCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object ppSalesppField3: TppField
      FieldAlias = 'YearID'
      FieldName = 'YearID'
      FieldLength = 9
      DisplayWidth = 9
      Position = 2
    end
    object ppSalesppField4: TppField
      FieldAlias = 'PeriodID'
      FieldName = 'PeriodID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppSalesppField5: TppField
      FieldAlias = 'TrxType'
      FieldName = 'TrxType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 4
    end
    object ppSalesppField6: TppField
      FieldAlias = 'TrxNo'
      FieldName = 'TrxNo'
      FieldLength = 8
      DisplayWidth = 8
      Position = 5
    end
    object ppSalesppField7: TppField
      FieldAlias = 'Barcode'
      FieldName = 'Barcode'
      FieldLength = 30
      DisplayWidth = 15
      Position = 6
    end
    object ppSalesppField8: TppField
      FieldAlias = 'ItemService'
      FieldName = 'ItemService'
      FieldLength = 3
      DisplayWidth = 8
      Position = 7
    end
    object ppSalesppField9: TppField
      FieldAlias = 'ItemCode'
      FieldName = 'ItemCode'
      FieldLength = 20
      DisplayWidth = 15
      Position = 8
    end
    object ppSalesppField10: TppField
      FieldAlias = 'ItemUnitCode'
      FieldName = 'ItemUnitCode'
      FieldLength = 6
      DisplayWidth = 6
      Position = 9
    end
    object ppSalesppField11: TppField
      FieldAlias = 'ItemUnitDescA'
      FieldName = 'ItemUnitDescA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
    object ppSalesppField12: TppField
      FieldAlias = 'ItemNameAr'
      FieldName = 'ItemNameAr'
      FieldLength = 30
      DisplayWidth = 20
      Position = 11
    end
    object ppSalesppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'Quantity'
      FieldName = 'Quantity'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 6
      Position = 12
    end
    object ppSalesppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'CostPrice'
      FieldName = 'CostPrice'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 8
      Position = 13
    end
    object ppSalesppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ItemPrice'
      FieldName = 'ItemPrice'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 6
      Position = 14
    end
    object ppSalesppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'Discount'
      FieldName = 'Discount'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 8
      Position = 15
    end
    object ppSalesppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DiscountRatio'
      FieldName = 'DiscountRatio'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 8
      Position = 16
    end
    object ppSalesppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'NetPrice'
      FieldName = 'NetPrice'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 6
      Position = 17
    end
    object ppSalesppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'UnitTransValue'
      FieldName = 'UnitTransValue'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 12
      Position = 18
    end
    object ppSalesppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalPrice'
      FieldName = 'TotalPrice'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 12
      Position = 19
    end
    object ppSalesppField21: TppField
      FieldAlias = 'TrxDetailDescA'
      FieldName = 'TrxDetailDescA'
      FieldLength = 240
      DisplayWidth = 240
      Position = 20
    end
    object ppSalesppField22: TppField
      FieldAlias = 'TrxDetailDescE'
      FieldName = 'TrxDetailDescE'
      FieldLength = 240
      DisplayWidth = 240
      Position = 21
    end
    object ppSalesppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrxLineNo'
      FieldName = 'TrxLineNo'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 22
    end
    object ppSalesppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'SourceDocLineNo'
      FieldName = 'SourceDocLineNo'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 23
    end
  end
  object SDS_Details: TSimpleDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'Select*'#13#10'FROM sa_POS_TrxDetails'#13#10'Where '#9'1=2 '#13#10
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterScroll = SDS_DetailsAfterScroll
    OnCalcFields = SDS_DetailsCalcFields
    OnNewRecord = SDS_DetailsNewRecord
    Left = 331
    Top = 345
    object SDS_DetailsCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SDS_DetailsBranchCode: TStringField
      FieldName = 'BranchCode'
      Required = True
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SDS_DetailsYearID: TStringField
      FieldName = 'YearID'
      Required = True
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SDS_DetailsPeriodID: TStringField
      FieldName = 'PeriodID'
      Required = True
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SDS_DetailsTrxType: TStringField
      FieldName = 'TrxType'
      Required = True
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SDS_DetailsTrxNo: TStringField
      FieldName = 'TrxNo'
      Required = True
      Visible = False
      FixedChar = True
      Size = 8
    end
    object SDS_DetailsBarcode: TStringField
      Tag = 2
      DisplayWidth = 15
      FieldName = 'Barcode'
      Origin = #1575#1604#1576#1575#1585#1603#1608#1583
      Visible = False
      Size = 30
    end
    object SDS_DetailsItemService: TStringField
      DefaultExpression = #39'IVI'#39
      DisplayLabel = 'Type'
      DisplayWidth = 8
      FieldName = 'ItemService'
      Origin = #1575#1604#1606#1608#1593
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SDS_DetailsItemCode: TStringField
      Tag = 5
      DisplayLabel = 'Item Code'
      DisplayWidth = 15
      FieldName = 'ItemCode'
      Origin = #1585#1605#1586' '#1575#1604#1589#1606#1601
      Visible = False
    end
    object SDS_DetailsItemUnitCode: TStringField
      FieldName = 'ItemUnitCode'
      Visible = False
      Size = 6
    end
    object SDS_DetailsItemUnitDescA: TStringField
      FieldKind = fkLookup
      FieldName = 'ItemUnitDescA'
      LookupDataSet = SDS_AllUnits
      LookupKeyFields = 'ItemUnitCode'
      LookupResultField = 'ItemUnitDescA'
      KeyFields = 'ItemUnitCode'
      Visible = False
      Size = 30
      Lookup = True
    end
    object SDS_DetailsItemNameAr: TStringField
      DisplayLabel = 'Item Name / '#1575#1604#1589#1606#1600#1600#1600#1601
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ItemNameAr'
      LookupDataSet = SDS_Items
      LookupKeyFields = 'ItemCode'
      LookupResultField = 'ItemNameAr'
      KeyFields = 'ItemCode'
      Size = 30
      Lookup = True
    end
    object SDS_DetailsQuantity: TFMTBCDField
      Tag = 2
      DisplayLabel = #1575#1604#1603#1605#1610#1577
      DisplayWidth = 6
      FieldName = 'Quantity'
      Origin = #1575#1604#1603#1605#1610#1577
      OnChange = SDS_DetailsDiscountChange
      Precision = 18
      Size = 8
    end
    object SDS_DetailsCostPrice: TFMTBCDField
      DisplayWidth = 8
      FieldName = 'CostPrice'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_DetailsItemPrice: TFMTBCDField
      Tag = 2
      DefaultExpression = '0'
      DisplayLabel = #1575#1604#1587#1593#1600#1585
      DisplayWidth = 6
      FieldName = 'ItemPrice'
      Origin = #1575#1604#1587#1593#1585
      OnChange = SDS_DetailsDiscountChange
      Precision = 18
      Size = 8
    end
    object SDS_DetailsDiscount: TFMTBCDField
      Tag = 2
      DefaultExpression = '0'
      DisplayWidth = 8
      FieldName = 'Discount'
      Origin = #1575#1604#1582#1589#1605
      Visible = False
      OnChange = SDS_DetailsDiscountChange
      Precision = 18
      Size = 8
    end
    object SDS_DetailsDiscountRatio: TFMTBCDField
      Tag = 2
      DisplayLabel = 'Discount Ratio %'
      DisplayWidth = 8
      FieldName = 'DiscountRatio'
      Origin = #1606#1587#1576#1577' '#1575#1604#1582#1589#1605' %'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_DetailsNetPrice: TFMTBCDField
      Tag = 2
      DefaultExpression = '0'
      DisplayLabel = #1575#1604#1575#1580#1605#1575#1604#1610
      DisplayWidth = 6
      FieldName = 'NetPrice'
      Origin = #1575#1604#1573#1580#1605#1575#1604#1610
      Precision = 18
      Size = 8
    end
    object SDS_DetailsUnitTransValue: TFMTBCDField
      DisplayWidth = 12
      FieldName = 'UnitTransValue'
      Visible = False
      Precision = 18
      Size = 8
    end
    object SDS_DetailsTotalPrice: TFMTBCDField
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'TotalPrice'
      Visible = False
      Precision = 18
      Size = 8
      Calculated = True
    end
    object SDS_DetailsTrxDetailDescA: TStringField
      FieldName = 'TrxDetailDescA'
      Visible = False
      Size = 240
    end
    object SDS_DetailsTrxDetailDescE: TStringField
      FieldName = 'TrxDetailDescE'
      Visible = False
      Size = 240
    end
    object SDS_DetailsTrxLineNo: TFMTBCDField
      FieldName = 'TrxLineNo'
      Required = True
      Visible = False
      Precision = 18
      Size = 0
    end
    object SDS_DetailsSourceDocLineNo: TFMTBCDField
      FieldName = 'SourceDocLineNo'
      Visible = False
      Precision = 18
      Size = 0
    end
    object SDS_DetailsTotalAmount: TAggregateField
      FieldName = 'TotalAmount'
      Active = True
      Expression = 'Sum(NetPrice)'
    end
    object SDS_DetailsTotalDiscount: TAggregateField
      FieldName = 'TotalDiscount'
      Active = True
      Expression = 'Sum(Discount)'
    end
  end
  object DS_Details: TDataSource
    DataSet = SDS_Details
    Left = 359
    Top = 345
  end
  object qry_SorceDocItems: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'Select * from sa_POS_TrxDetails'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 153
    Top = 500
    object qry_SorceDocItemsCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_SorceDocItemsBranchCode: TStringField
      FieldName = 'BranchCode'
      Required = True
      Size = 4
    end
    object qry_SorceDocItemsTrxNo: TStringField
      FieldName = 'TrxNo'
      Required = True
      Size = 8
    end
    object qry_SorceDocItemsTrxType: TStringField
      FieldName = 'TrxType'
      Required = True
      Size = 4
    end
    object qry_SorceDocItemsYearID: TStringField
      FieldName = 'YearID'
      Required = True
      Size = 4
    end
    object qry_SorceDocItemsPeriodID: TStringField
      FieldName = 'PeriodID'
      Required = True
      Size = 2
    end
    object qry_SorceDocItemsTrxLineNo: TFMTBCDField
      FieldName = 'TrxLineNo'
      Required = True
      Precision = 18
      Size = 0
    end
    object qry_SorceDocItemsBarcode: TStringField
      FieldName = 'Barcode'
      Size = 30
    end
    object qry_SorceDocItemsItemCode: TStringField
      FieldName = 'ItemCode'
      Size = 25
    end
    object qry_SorceDocItemsItemService: TStringField
      FieldName = 'ItemService'
      Size = 3
    end
    object qry_SorceDocItemsQuantity: TFMTBCDField
      FieldName = 'Quantity'
      Precision = 18
      Size = 8
    end
    object qry_SorceDocItemsItemPrice: TFMTBCDField
      FieldName = 'ItemPrice'
      Precision = 18
      Size = 8
    end
    object qry_SorceDocItemsDiscount: TFMTBCDField
      FieldName = 'Discount'
      Precision = 18
      Size = 8
    end
    object qry_SorceDocItemsDiscountRatio: TFMTBCDField
      FieldName = 'DiscountRatio'
      Precision = 18
      Size = 8
    end
    object qry_SorceDocItemsNetPrice: TFMTBCDField
      FieldName = 'NetPrice'
      Precision = 18
      Size = 8
    end
    object qry_SorceDocItemsCostPrice: TFMTBCDField
      FieldName = 'CostPrice'
      Precision = 18
      Size = 8
    end
    object qry_SorceDocItemsItemUnitCode: TStringField
      FieldName = 'ItemUnitCode'
      Size = 6
    end
    object qry_SorceDocItemsUnitTransValue: TFMTBCDField
      FieldName = 'UnitTransValue'
      Precision = 18
      Size = 8
    end
    object qry_SorceDocItemsTrxDetailDescA: TStringField
      FieldName = 'TrxDetailDescA'
      Size = 4000
    end
    object qry_SorceDocItemsTrxDetailDescE: TStringField
      FieldName = 'TrxDetailDescE'
      Size = 4000
    end
    object qry_SorceDocItemsSourceDocLineNo: TFMTBCDField
      FieldName = 'SourceDocLineNo'
      Precision = 18
      Size = 0
    end
  end
  object DS_Policy: TDataSource
    Left = 659
    Top = 212
  end
  object SDS_SourceDoc: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 
      'Select  H.TrxNo, H.TrxDate, H.TrxDescA, H.TrxDescE'#13#10'From   sa_PO' +
      'S_TrxHeader H '#13#10'Where  TrxStatus Not In ('#39'A'#39','#39'O'#39','#39'R'#39')  And 1=2'#13#10
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 124
    Top = 501
    object SDS_SourceDocTrxNo: TStringField
      FieldName = 'TrxNo'
      Required = True
      Size = 8
    end
    object SDS_SourceDocTrxDate: TSQLTimeStampField
      FieldName = 'TrxDate'
    end
    object SDS_SourceDocTrxDescA: TStringField
      FieldName = 'TrxDescA'
      Size = 4000
    end
    object SDS_SourceDocTrxDescE: TStringField
      FieldName = 'TrxDescE'
      Size = 4000
    end
  end
  object SDSBranches: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 
      'Select BranchCode, BranchNameAr , BranchNameEn'#13#10'From  tbl_Branch' +
      ' Where CompanyCode='#39'XX'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 95
    Top = 503
    object SDSBranchesBranchCode: TStringField
      Tag = 1
      Alignment = taRightJustify
      DisplayLabel = 'Code'
      DisplayWidth = 6
      FieldName = 'BranchCode'
      Origin = #1575#1604#1585#1605#1586
      Required = True
      FixedChar = True
      Size = 4
    end
    object SDSBranchesBranchNameAr: TStringField
      FieldName = 'BranchNameAr'
      Size = 250
    end
    object SDSBranchesBranchNameEn: TStringField
      FieldName = 'BranchNameEn'
      Size = 250
    end
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 1081
    Top = 541
  end
  object qryItemPrices: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 
      'SELECT     P.CompanyCode, P.ItemService, P.ItemCode, P.PolicyCod' +
      'e, P.ItemUnit, P.PriceValue, P.PriceRatio, P.DiscountRatio, P.Cr' +
      'eateDate, P.LastUpdateDate, '#13#10'                      U.UnitTransV' +
      'alue'#13#10'FROM         tbl_ItemDefinition AS I LEFT OUTER JOIN'#13#10'    ' +
      '                  tbl_ItemPrices AS P ON I.CompanyCode = P.Compa' +
      'nyCode AND I.ItemService = P.ItemService AND I.ItemCode = P.Item' +
      'Code LEFT OUTER JOIN'#13#10'                      tbl_ItemUnit AS U ON' +
      ' P.ItemUnit = U.ItemUnitCode AND P.CompanyCode = U.CompanyCode A' +
      'ND I.CompanyCode = U.CompanyCode AND '#13#10'                      I.I' +
      'temUnitCode = U.UnitTransCode'#13#10'WHERE     (P.PolicyCode = '#39'001'#39') ' +
      '  '
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 563
    Top = 428
    object qryItemPricesCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qryItemPricesItemService: TStringField
      FieldName = 'ItemService'
      Required = True
      Size = 3
    end
    object qryItemPricesItemCode: TStringField
      FieldName = 'ItemCode'
      Required = True
    end
    object qryItemPricesPolicyCode: TStringField
      FieldName = 'PolicyCode'
      Required = True
      Size = 4
    end
    object qryItemPricesItemUnit: TStringField
      FieldName = 'ItemUnit'
      Required = True
      Size = 6
    end
    object qryItemPricesPriceValue: TFMTBCDField
      FieldName = 'PriceValue'
      Precision = 18
      Size = 8
    end
    object qryItemPricesPriceRatio: TFMTBCDField
      FieldName = 'PriceRatio'
      Precision = 18
      Size = 8
    end
    object qryItemPricesDiscountRatio: TFMTBCDField
      FieldName = 'DiscountRatio'
      Precision = 18
      Size = 8
    end
    object qryItemPricesUnitTransValue: TFMTBCDField
      FieldName = 'UnitTransValue'
      Precision = 18
      Size = 8
    end
    object qryItemPricesCreateDate: TSQLTimeStampField
      FieldName = 'CreateDate'
    end
    object qryItemPricesLastUpdateDate: TSQLTimeStampField
      FieldName = 'LastUpdateDate'
    end
  end
  object qry_Operators: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'Select * from tbl_operators'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 723
    Top = 372
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
    Left = 723
    Top = 396
  end
  object qry_Customers: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'Select * from tbl_Cutomers'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 683
    Top = 372
    object qry_CustomersCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_CustomersCustomerCode: TStringField
      FieldName = 'CustomerCode'
      Required = True
      Size = 6
    end
    object qry_CustomersCustomerGroupCode: TStringField
      FieldName = 'CustomerGroupCode'
      Size = 6
    end
    object qry_CustomersCustomerNameAr: TStringField
      FieldName = 'CustomerNameAr'
      Size = 255
    end
    object qry_CustomersCustomerNameEn: TStringField
      FieldName = 'CustomerNameEn'
      Size = 255
    end
    object qry_CustomersCreateDate: TSQLTimeStampField
      FieldName = 'CreateDate'
    end
    object qry_CustomersLastUpdateDate: TSQLTimeStampField
      FieldName = 'LastUpdateDate'
    end
  end
  object DS_Customers: TDataSource
    DataSet = qry_Customers
    Left = 683
    Top = 396
  end
  object qry_Warehouse: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'Select * from tbl_WareHouse'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 643
    Top = 372
    object qry_WarehouseCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_WarehouseWareHouseCode: TStringField
      FieldName = 'WareHouseCode'
      Required = True
      Size = 6
    end
    object qry_WarehouseWareHouseNameAr: TStringField
      FieldName = 'WareHouseNameAr'
      Size = 250
    end
    object qry_WarehouseWareHouseNameEn: TStringField
      FieldName = 'WareHouseNameEn'
      Size = 250
    end
    object qry_WarehouseCreateDate: TSQLTimeStampField
      FieldName = 'CreateDate'
    end
    object qry_WarehouseLastUpdateDate: TSQLTimeStampField
      FieldName = 'LastUpdateDate'
    end
  end
  object DS_Warehouse: TDataSource
    DataSet = qry_Warehouse
    Left = 643
    Top = 396
  end
  object ppPrintSales: TppReport
    AutoStop = False
    DataPipeline = ppSales
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 2000
    PrinterSetup.mmMarginLeft = 2000
    PrinterSetup.mmMarginRight = 2000
    PrinterSetup.mmMarginTop = 2000
    PrinterSetup.mmPaperHeight = 130000
    PrinterSetup.mmPaperWidth = 70000
    PrinterSetup.PaperSize = 119
    Template.FileName = 'E:\Work\SVN\DelphiPOS\trunk\Code\Reports\POS_SalesForm.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 300
    Top = 240
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppSales'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'lTitle1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1601#1575#1578#1608#1585#1577' '#1605#1576#1610#1593#1575#1578
        Color = clWindowText
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Traditional Arabic'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 6350
        mmLeft = 11113
        mmTop = 10583
        mmWidth = 45773
        BandType = 1
      end
      object pplTitle: TppLabel
        UserName = 'lTitle'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1601#1575#1578#1608#1585#1577' '#1605#1576#1610#1593#1575#1578
        Color = clSilver
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Traditional Arabic'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 6350
        mmLeft = 9790
        mmTop = 8996
        mmWidth = 45773
        BandType = 1
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 42598
        mmTop = 3440
        mmWidth = 17463
        BandType = 1
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        VarType = vtTime
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8996
        mmTop = 3704
        mmWidth = 19050
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Style = psDashDot
        Pen.Width = 2
        mmHeight = 12435
        mmLeft = 6615
        mmTop = 264
        mmWidth = 54769
        BandType = 0
      end
      object pplTrxNo: TppLabel
        UserName = 'lTrxNo'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1585#1602#1605
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 51594
        mmTop = 2117
        mmWidth = 8731
        BandType = 0
      end
      object pplTrxDate: TppLabel
        UserName = 'lTrxDate'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1578#1575#1585#1610#1582
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 25929
        mmTop = 2117
        mmWidth = 9525
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxNo'
        DataPipeline = DPL_Header
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DPL_Header'
        mmHeight = 3440
        mmLeft = 36248
        mmTop = 2117
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxDate'
        DataPipeline = DPL_Header
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DPL_Header'
        mmHeight = 3440
        mmLeft = 8467
        mmTop = 2117
        mmWidth = 16404
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxTime'
        DataPipeline = DPL_Header
        DisplayFormat = 'h:nn:ss AM/PM'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DPL_Header'
        mmHeight = 3440
        mmLeft = 7673
        mmTop = 6879
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'lNet1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1608#1602#1578' '
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 26194
        mmTop = 7144
        mmWidth = 8467
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppDBQty: TppDBText
        UserName = 'DBQty'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Quantity'
        DataPipeline = ppSales
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSales'
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 5556
        mmWidth = 15875
        BandType = 4
      end
      object ppDBItemName: TppDBText
        UserName = 'DBItemName'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemNameAr'
        DataPipeline = ppSales
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSales'
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 1058
        mmWidth = 30956
        BandType = 4
      end
      object ppDBUnit: TppDBText
        UserName = 'DBUnit'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemUnitDescA'
        DataPipeline = ppSales
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSales'
        mmHeight = 3440
        mmLeft = 36777
        mmTop = 5556
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemPrice'
        DataPipeline = ppSales
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSales'
        mmHeight = 3440
        mmLeft = 36777
        mmTop = 10319
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemCode'
        DataPipeline = ppSales
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSales'
        mmHeight = 3440
        mmLeft = 38365
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Discount'
        DataPipeline = ppSales
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSales'
        mmHeight = 3440
        mmLeft = 37306
        mmTop = 14817
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'NetPrice'
        DataPipeline = ppSales
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSales'
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 14552
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TotalPrice'
        DataPipeline = ppSales
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSales'
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 10319
        mmWidth = 15875
        BandType = 4
      end
      object pplItemName: TppLabel
        UserName = 'lItemName'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1589#1606#1601
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 51065
        mmTop = 1058
        mmWidth = 9260
        BandType = 4
      end
      object pplUnit: TppLabel
        UserName = 'lUnit'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1608#1581#1583#1577
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 51065
        mmTop = 5556
        mmWidth = 9260
        BandType = 4
      end
      object pplQty: TppLabel
        UserName = 'lQty'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1603#1605#1610#1577
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 5556
        mmWidth = 10848
        BandType = 4
      end
      object pplPrice: TppLabel
        UserName = 'lPrice'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1587#1593#1585
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 51065
        mmTop = 10319
        mmWidth = 9260
        BandType = 4
      end
      object pplTotalPrice: TppLabel
        UserName = 'lTotalPrice'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1575#1580#1605#1575#1604#1610
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 10319
        mmWidth = 10848
        BandType = 4
      end
      object pplDiscount: TppLabel
        UserName = 'lDiscount'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1582#1589#1605
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 14817
        mmWidth = 9260
        BandType = 4
      end
      object pplNet: TppLabel
        UserName = 'lNet'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1589#1575#1601#1609
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23019
        mmTop = 14552
        mmWidth = 8731
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Pen.Style = psDot
        Pen.Width = 2
        Position = lpBottom
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 529
        mmLeft = 8996
        mmTop = 24342
        mmWidth = 50271
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'lDiscount1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1605#1604#1575#1581#1592#1575#1578
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 20108
        mmWidth = 10054
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        CharWrap = False
        DataField = 'TrxDetailDescA'
        DataPipeline = ppSales
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Stretch = True
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppSales'
        mmHeight = 5027
        mmLeft = 6879
        mmTop = 18785
        mmWidth = 41804
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object pplTotal: TppLabel
        UserName = 'lTotal'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1589#1575#1601#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 5027
        mmWidth = 12171
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'lNet2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1605#1583#1601#1608#1593
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 51065
        mmTop = 9790
        mmWidth = 8731
        BandType = 7
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'PayedValue'
        DataPipeline = DPL_Header
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DPL_Header'
        mmHeight = 3440
        mmLeft = 36513
        mmTop = 9790
        mmWidth = 12171
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1576#1575#1602#1609
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 9790
        mmWidth = 9790
        BandType = 7
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'RemainderValue'
        DataPipeline = DPL_Header
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DPL_Header'
        mmHeight = 3440
        mmLeft = 7408
        mmTop = 9790
        mmWidth = 12171
        BandType = 7
      end
      object ppDBText16: TppDBText
        UserName = 'DBText101'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxAmount'
        DataPipeline = DPL_Header
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DPL_Header'
        mmHeight = 3440
        mmLeft = 7408
        mmTop = 5027
        mmWidth = 12171
        BandType = 7
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1582#1589#1605
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 51065
        mmTop = 5027
        mmWidth = 8731
        BandType = 7
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TotalDiscount'
        DataPipeline = DPL_Header
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DPL_Header'
        mmHeight = 3440
        mmLeft = 37306
        mmTop = 5292
        mmWidth = 11377
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1575#1580#1605#1575#1604#1610
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 51065
        mmTop = 794
        mmWidth = 8731
        BandType = 7
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Total'
        DataPipeline = DPL_Header
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DPL_Header'
        mmHeight = 3440
        mmLeft = 36513
        mmTop = 794
        mmWidth = 12171
        BandType = 7
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060A54726150726F6772616D094368696C645479706502150E497346756E63
        74696F6E54797065090B50726F6772616D4E616D6506084E756D546F5374720B
        50726F6772616D54797065070A747446756E6374696F6E06536F757263651428
        0F000066756E6374696F6E204E756D546F537472284E203A20496E7465676572
        293A20537472696E673B0D0A5661722068756E64726564732C2074656E732C20
        6F6E6573203A20496E74656765723B0D0A20202020732C2073732C207373732C
        20416E64537472203A20537472696E673B0D0A626567696E0D0A202069662052
        65706F72742E506172616D65746572735B274C616E67275D203D202741272074
        68656E20416E64537472203A3D2027D988270D0A2020656C736520416E645374
        72203A3D2027416E64273B0D0A20200D0A202068756E6472656473203A3D204E
        20646976203130303B0D0A202074656E73203A3D20284E206D6F642031303029
        206469762031303B0D0A20206F6E6573203A3D204E206D6F642031303B0D0A20
        200D0A20206966205265706F72742E506172616D65746572735B274C616E6727
        5D203D20274127207468656E20200D0A2020626567696E0D0A20202020636173
        65206F6E6573206F660D0A202020202020303A2073203A3D2027273B0D0A2020
        20202020313A2073203A3D2027D988D8A7D8ADD8AF273B0D0A20202020202032
        3A2073203A3D2027D8A7D8ABD986D8A7D986273B0D0A202020202020333A2073
        203A3D2027D8ABD984D8A7D8ABD8A9273B0D0A202020202020343A2073203A3D
        2027D8A7D8B1D8A8D8B9D8A9273B0D0A202020202020353A2073203A3D2027D8
        AED985D8B3D8A9273B0D0A202020202020363A2073203A3D2027D8B3D8AAD8A9
        273B0D0A202020202020373A2073203A3D2027D8B3D8A8D8B9D8A9273B0D0A20
        2020202020383A2073203A3D2027D8ABD985D8A7D986D98AD8A9273B0D0A2020
        20202020393A2073203A3D2027D8AAD8B3D8B9D8A9273B0D0A20202020656E64
        3B0D0A20200D0A20202020636173652074656E73206F66202020200D0A202020
        202020303A207373203A3D2027273B202020200D0A202020202020313A207373
        203A3D2027D8B9D8B4D8B1D8A9273B0D0A202020202020323A207373203A3D20
        27D8B9D8B4D8B1D988D986273B0D0A202020202020333A207373203A3D2027D8
        ABD984D8A7D8ABD988D986273B0D0A202020202020343A207373203A3D2027D8
        A3D8B1D8A8D8B9D988D986273B0D0A202020202020353A207373203A3D2027D8
        AED985D8B3D988D986273B0D0A202020202020363A207373203A3D2027D8B3D8
        AAD988D986273B0D0A202020202020373A207373203A3D2027D8B3D8A8D8B9D9
        88D986273B0D0A202020202020383A207373203A3D2027D8ABD985D8A7D986D9
        88D986273B0D0A202020202020393A207373203A3D2027D8AAD8B3D8B9D988D9
        86273B0D0A20202020656E643B20200D0A0D0A20202020636173652068756E64
        72656473206F660D0A202020202020303A20737373203A3D2027273B0D0A2020
        20202020313A20737373203A3D2027D985D8A6D8A9273B0D0A20202020202032
        3A20737373203A3D2027D985D8A6D8AAD8A7D986273B0D0A202020202020333A
        20737373203A3D2027D8ABD984D8A7D8ABD985D8A7D8A6D8A9273B0D0A202020
        202020343A20737373203A3D2027D8A7D8B1D8A8D8B9D985D8A7D8A6D8A9273B
        0D0A202020202020353A20737373203A3D2027D8AED985D8B3D985D8A7D8A6D8
        A9273B0D0A202020202020363A20737373203A3D2027D8B3D8AAD985D8A7D8A6
        D8A9273B0D0A202020202020373A20737373203A3D2027D8B3D8A8D8B9D985D8
        A7D8A6D8A9273B0D0A202020202020383A20737373203A3D2027D8ABD985D8A7
        D986D985D8A7D8A6D8A9273B0D0A202020202020393A20737373203A3D2027D8
        AAD8B3D8B9D985D8A7D8A6D8A9273B0D0A20202020656E643B202020200D0A20
        2020200D0A2020202069662074656E73203D2031207468656E0D0A2020202062
        6567696E0D0A20202020202073203A3D2027273B0D0A20202020202063617365
        206F6E6573206F66202020200D0A2020202020202020303A207373203A3D2027
        D8B9D8B4D8B1D8A9273B202020200D0A2020202020202020313A207373203A3D
        2027D8A7D8ADD8AFD98920D8B9D8B4D8B1273B0D0A2020202020202020323A20
        7373203A3D2027D8A7D8ABD986D8A720D8B9D8B4D8B1273B0D0A202020202020
        2020333A207373203A3D2027D8ABD984D8A7D8ABD8A920D8B9D8B4D8B1273B0D
        0A2020202020202020343A207373203A3D2027D8A3D8B1D8A8D8B9D8A920D8B9
        D8B4D8B1273B0D0A2020202020202020353A207373203A3D2027D8AED985D8B3
        D8A920D8B9D8B4D8B1273B0D0A2020202020202020363A207373203A3D2027D8
        B3D8AAD8A920D8B9D8B4D8B1273B0D0A2020202020202020373A207373203A3D
        2027D8B3D8A8D8B9D8A920D8B9D8B4D8B1273B0D0A2020202020202020383A20
        7373203A3D2027D8ABD985D8A7D986D98AD8A920D8B9D8B4D8B1273B0D0A2020
        202020202020393A207373203A3D2027D8AAD8B3D8B9D8A920D8B9D8B4D8B127
        3B0D0A202020202020656E643B0D0A20202020656E643B200D0A0D0A20202020
        726573756C74203A3D2027273B0D0A20202020696620737373203C3E20272720
        7468656E0D0A20202020202020726573756C74203A3D20726573756C74202B20
        7373733B0D0A20202020696620282873203C3E202727292920616E6420287373
        73203C3E20272729207468656E0D0A20202020202020726573756C74203A3D20
        726573756C74202B20272027202B2020416E64537472202B202720273B20200D
        0A2020202069662073203C3E202727207468656E0D0A20202020202020726573
        756C74203A3D20726573756C74202B20733B0D0A20202020696620287373203C
        3E2027272920616E6420282853203C3E20272729206F722028737373203C3E20
        27272929207468656E0D0A20202020202020726573756C74203A3D2072657375
        6C74202B20272027202B20416E64535472202B202720273B2020200D0A202020
        2069662074656E73203E2030207468656E0D0A20202020202020726573756C74
        203A3D20726573756C74202B2073733B202020200D0A2020656E643B200D0A0D
        0A20206966205265706F72742E506172616D65746572735B274C616E67275D20
        3D20274527207468656E20200D0A2020626567696E0D0A202020206361736520
        6F6E6573206F660D0A202020202020303A2073203A3D2027273B0D0A20202020
        2020313A2073203A3D20274F6E65273B0D0A202020202020323A2073203A3D20
        2754776F273B0D0A202020202020333A2073203A3D20275468726565273B0D0A
        202020202020343A2073203A3D2027466F7572273B0D0A202020202020353A20
        73203A3D202746697665273B0D0A202020202020363A2073203A3D2027536978
        273B0D0A202020202020373A2073203A3D2027536576656E273B0D0A20202020
        2020383A2073203A3D20274569676874273B0D0A202020202020393A2073203A
        3D20274E696E65273B0D0A20202020656E643B0D0A20200D0A20202020636173
        652074656E73206F66202020200D0A202020202020303A207373203A3D202727
        3B202020200D0A202020202020313A207373203A3D202754656E273B0D0A2020
        20202020323A207373203A3D20275477656E7479273B0D0A202020202020333A
        207373203A3D2027546869727479273B0D0A202020202020343A207373203A3D
        2027466F727479273B0D0A202020202020353A207373203A3D20274669667479
        273B0D0A202020202020363A207373203A3D20275369787479273B0D0A202020
        202020373A207373203A3D2027536576656E7479273B0D0A202020202020383A
        207373203A3D2027456967687479273B0D0A202020202020393A207373203A3D
        20274E696E657479273B0D0A20202020656E643B202020200D0A202020200D0A
        20202020636173652068756E6472656473206F660D0A202020202020303A2073
        7373203A3D2027273B0D0A202020202020313A20737373203A3D20274F6E6520
        48756E64726564273B0D0A202020202020323A20737373203A3D202754776F20
        48756E64726564273B0D0A202020202020333A20737373203A3D202754687265
        652048756E64726564273B0D0A202020202020343A20737373203A3D2027466F
        75722048756E64726564273B0D0A202020202020353A20737373203A3D202746
        6976652048756E64726564273B0D0A202020202020363A20737373203A3D2027
        5369782048756E64726564273B0D0A202020202020373A20737373203A3D2027
        536576656E2048756E64726564273B0D0A202020202020383A20737373203A3D
        202745696768742048756E64726564273B0D0A202020202020393A2073737320
        3A3D20274E696E652048756E64726564273B0D0A20202020656E643B20202020
        0D0A202020200D0A2020202069662074656E73203D2031207468656E0D0A2020
        2020626567696E0D0A20202020202073203A3D2027273B0D0A20202020202063
        617365206F6E6573206F66202020200D0A2020202020202020303A207373203A
        3D202754656E273B202020200D0A2020202020202020313A207373203A3D2027
        456C6576656E273B0D0A2020202020202020323A207373203A3D20275477656C
        66273B0D0A2020202020202020333A207373203A3D2027546869727465656E27
        3B0D0A2020202020202020343A207373203A3D2027466F727465656E273B0D0A
        2020202020202020353A207373203A3D20274669667465656E273B0D0A202020
        2020202020363A207373203A3D20275369787465656E273B0D0A202020202020
        2020373A207373203A3D2027536576656E7465656E273B0D0A20202020202020
        20383A207373203A3D2027456967687465656E273B0D0A202020202020202039
        3A207373203A3D20274E696E657465656E273B0D0A202020202020656E643B20
        202020200D0A20202020656E643B20200D0A0D0A20202020726573756C74203A
        3D2027273B0D0A20202020696620737373203C3E202727207468656E0D0A2020
        2020202020726573756C74203A3D20726573756C74202B207373733B0D0A2020
        202069662028287373203C3E20272729206F72202873203C3E20272729292061
        6E642028737373203C3E20272729207468656E0D0A2020202020202072657375
        6C74203A3D20726573756C74202B20272027202B2020416E64537472202B2027
        20273B20200D0A0D0A202020206966207373203C3E202727207468656E0D0A20
        202020202020726573756C74203A3D20726573756C74202B2073733B0D0A2020
        202069662073203C3E202727207468656E0D0A20202020202020726573756C74
        203A3D20726573756C74202B20272027202B20733B0D0A2020656E643B202020
        2020200D0A656E643B0D0A0001060A54726150726F6772616D094368696C6454
        79706502150E497346756E6374696F6E54797065090B50726F6772616D4E616D
        65060E4E756D626572546F537472696E670B50726F6772616D54797065070A74
        7446756E6374696F6E06536F75726365142606000066756E6374696F6E204E75
        6D626572546F537472696E67284E756D203A20646F75626C653B20446F6C6C61
        725374722C2043656E74537472202C205072656669782C205375666669782C20
        4C616E67203A20537472696E67293A20537472696E673B0D0A56617220206D69
        6C6C696F6E732C2074686F7573616E64732C20756E6974732C20646F6C6C6172
        732C2063656E7473203A20696E74656765723B0D0A20202020204D696C6C696F
        6E5374722C2054686F7573616E645374722C20416E64537472203A2053747269
        6E673B0D0A626567696E0D0A2020646F6C6C617273203A3D206E756D20646976
        20313B0D0A202063656E7473203A3D20726F756E642866726163286E756D2920
        2A20313030293B0D0A2020202020200D0A20206D696C6C696F6E73203A3D2064
        6F6C6C6172732064697620313030303030303B0D0A202074686F7573616E6473
        203A3D2028646F6C6C617273206D6F6420313030303030302920646976203130
        30303B200D0A2020756E697473203A3D20646F6C6C617273206D6F6420313030
        303B0D0A2020526573756C74203A3D2027273B0D0A0D0A20206966205265706F
        72742E506172616D65746572735B274C616E67275D203D20274127207468656E
        20416E64537472203A3D2027D988270D0A2020656C736520416E64537472203A
        3D2027416E64273B0D0A20206966205265706F72742E506172616D6574657273
        5B274C616E67275D203D20274127207468656E20204D696C6C696F6E53747220
        3A3D20272027202B2027D985D984D98AD988D986270D0A2020656C7365204D69
        6C6C696F6E537472203A3D2027204D696C6C696F6E273B0D0A20206966205265
        706F72742E506172616D65746572735B274C616E67275D203D20274127207468
        656E202054686F7573616E64537472203A3D20272027202B2027D8A3D984D981
        270D0A2020656C73652054686F7573616E64537472203A3D20272054686F7573
        616E64273B20200D0A20206966206D696C6C696F6E73203E2030207468656E0D
        0A2020626567696E0D0A20202020526573756C74203A3D20526573756C74202B
        204E756D546F537472286D696C6C696F6E7329202B204D696C6C696F6E537472
        3B0D0A2020656E643B0D0A20200D0A2020696620286D696C6C696F6E73203E20
        302920616E64202874686F7573616E6473203E203029207468656E0D0A202020
        2020726573756C74203A3D20726573756C74202B20272027202B20416E645374
        72202B202720273B0D0A20200D0A202069662074686F7573616E6473203E2030
        207468656E0D0A2020626567696E0D0A20202020526573756C74203A3D205265
        73756C74202B204E756D546F5374722874686F7573616E647329202B2054686F
        7573616E645374723B20200D0A2020656E643B2020200D0A20200D0A20206966
        2028756E697473203E20302920616E642028726573756C74203C3E2027272920
        7468656E0D0A2020202020726573756C74203A3D20726573756C74202B202720
        27202B20416E64537472202B202720273B20200D0A0D0A2020696620756E6974
        73203E2030207468656E0D0A2020626567696E202020200D0A20202020526573
        756C74203A3D20526573756C74202B206E756D746F53747228756E697473293B
        2020202020200D0A2020656E643B0D0A20200D0A2020696620726573756C7420
        3C3E202727207468656E0D0A2020202020726573756C74203A3D20726573756C
        74202B20272027202B20446F6C6C6172537472202B202720273B0D0A20202020
        200D0A20206966202863656E7473203E20302920616E642028726573756C7420
        3C3E20272729207468656E0D0A2020202020726573756C74203A3D2072657375
        6C74202B20272027202B20416E64537472202B202720273B200D0A20200D0A20
        2069662063656E7473203E2030207468656E0D0A2020626567696E0D0A202020
        20526573756C74203A3D20526573756C74202B204E756D546F5374722863656E
        7473293B0D0A20202020726573756C74203A3D20726573756C74202B20272027
        202B2043656E74537472202B202720273B2020200D0A2020656E643B20200D0A
        2020726573756C74203A3D20507265666978202B20272027202B20726573756C
        74202B20272027202B205375666669783B20200D0A656E643B0D0A0001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65060E6C556E69
        744F6E476574546578740B50726F6772616D54797065070B747450726F636564
        75726506536F75726365067870726F636564757265206C556E69744F6E476574
        546578742876617220546578743A20537472696E67293B0D0A626567696E0D0A
        20206966205265706F72742E506172616D65746572735B274C616E67275D203D
        20274527207468656E0D0A202054657874203A3D2027556E6974273B0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D6506056C556E6974094576656E744E
        616D6506094F6E47657454657874074576656E74494402350001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D6506116C547278446174
        654F6E476574546578740B50726F6772616D54797065070B747450726F636564
        75726506536F75726365067D70726F636564757265206C547278446174654F6E
        476574546578742876617220546578743A20537472696E67293B0D0A62656769
        6E0D0A20206966205265706F72742E506172616D65746572735B274C616E6727
        5D203D20274527207468656E0D0A202054657874203A3D202744617465203A27
        3B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506086C547278446174
        65094576656E744E616D6506094F6E47657454657874074576656E7449440235
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        0F6C5472784E6F4F6E476574546578740B50726F6772616D54797065070B7474
        50726F63656475726506536F75726365067D70726F636564757265206C547278
        4E6F4F6E476574546578742876617220546578743A20537472696E67293B0D0A
        626567696E0D0A20206966205265706F72742E506172616D65746572735B274C
        616E67275D203D20274527207468656E0D0A202054657874203A3D2027547278
        204E6F203A273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506066C
        5472784E6F094576656E744E616D6506094F6E47657454657874074576656E74
        494402350001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65060D6C4E65744F6E476574546578740B50726F6772616D54797065070B
        747450726F63656475726506536F75726365067670726F636564757265206C4E
        65744F6E476574546578742876617220546578743A20537472696E67293B0D0A
        626567696E0D0A20206966205265706F72742E506172616D65746572735B274C
        616E67275D203D20274527207468656E0D0A202054657874203A3D20274E6574
        273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506046C4E65740945
        76656E744E616D6506094F6E47657454657874074576656E7449440235000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506126C44
        6973636F756E744F6E476574546578740B50726F6772616D54797065070B7474
        50726F63656475726506536F75726365068070726F636564757265206C446973
        636F756E744F6E476574546578742876617220546578743A20537472696E6729
        3B0D0A626567696E0D0A20206966205265706F72742E506172616D6574657273
        5B274C616E67275D203D20274527207468656E0D0A202054657874203A3D2027
        446973636F756E74273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        06096C446973636F756E74094576656E744E616D6506094F6E47657454657874
        074576656E74494402350001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65060F6C50726963654F6E476574546578740B50726F6772
        616D54797065070B747450726F63656475726506536F75726365067A70726F63
        6564757265206C50726963654F6E476574546578742876617220546578743A20
        537472696E67293B0D0A626567696E0D0A20206966205265706F72742E506172
        616D65746572735B274C616E67275D203D20274527207468656E0D0A20205465
        7874203A3D20275072696365273B0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D6506066C5072696365094576656E744E616D6506094F6E476574546578
        74074576656E74494402350001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65060D6C5174794F6E476574546578740B50726F677261
        6D54797065070B747450726F63656475726506536F75726365067B70726F6365
        64757265206C5174794F6E476574546578742876617220546578743A20537472
        696E67293B0D0A626567696E0D0A20206966205265706F72742E506172616D65
        746572735B274C616E67275D203D20274527207468656E0D0A20205465787420
        3A3D20275175616E74697479273B0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D6506046C517479094576656E744E616D6506094F6E4765745465787407
        4576656E74494402350001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D6506126C4974656D4E616D654F6E476574546578740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506817072
        6F636564757265206C4974656D4E616D654F6E47657454657874287661722054
        6578743A20537472696E67293B0D0A626567696E0D0A20206966205265706F72
        742E506172616D65746572735B274C616E67275D203D20274527207468656E0D
        0A202054657874203A3D20274974656D204E616D65273B0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D6506096C4974656D4E616D65094576656E744E61
        6D6506094F6E47657454657874074576656E74494402350001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D6506146C546F74616C5072
        6963654F6E476574546578740B50726F6772616D54797065070B747450726F63
        656475726506536F75726365068070726F636564757265206C546F74616C5072
        6963654F6E476574546578742876617220546578743A20537472696E67293B0D
        0A626567696E0D0A20206966205265706F72742E506172616D65746572735B27
        4C616E67275D203D20274527207468656E0D0A202054657874203A3D2027416D
        6F756E74273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B6C54
        6F74616C5072696365094576656E744E616D6506094F6E476574546578740745
        76656E74494402350001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65060F6C546F74616C4F6E476574546578740B50726F6772616D
        54797065070B747450726F63656475726506536F75726365067C70726F636564
        757265206C546F74616C4F6E476574546578742876617220546578743A205374
        72696E67293B0D0A626567696E0D0A20206966205265706F72742E506172616D
        65746572735B274C616E67275D203D20274527207468656E0D0A202054657874
        203A3D2027546F74616C203A273B0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D6506066C546F74616C094576656E744E616D6506094F6E476574546578
        74074576656E74494402350001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65061144424974656D4E616D654F6E5072696E740B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365069270
        726F6365647572652044424974656D4E616D654F6E5072696E743B0D0A626567
        696E0D0A20206966205265706F72742E506172616D65746572735B274C616E67
        275D203D20274527207468656E0D0A202044424974656D4E616D652E44617461
        4669656C64203A3D20274974656D4E6D616545273B0D0A656E643B2020202020
        2020202020202020202020202020200D0A0D436F6D706F6E656E744E616D6506
        0A44424974656D4E616D65094576656E744E616D6506074F6E5072696E740745
        76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65060D4442556E69744F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F75726365067A70726F6365647572
        65204442556E69744F6E5072696E743B0D0A626567696E0D0A20206966205265
        706F72742E506172616D65746572735B274C616E67275D203D20274527207468
        656E0D0A20204442556E69742E446174614669656C64203A3D20274974656D55
        6E69744465736345273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        06064442556E6974094576656E744E616D6506074F6E5072696E74074576656E
        74494402200001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060F6C5469746C654F6E476574546578740B50726F6772616D547970
        65070B747450726F63656475726506536F75726365069270726F636564757265
        206C5469746C654F6E476574546578742876617220546578743A20537472696E
        67293B0D0A626567696E0D0A20206966205265706F72742E506172616D657465
        72735B274C616E67275D203D20274527207468656E20626567696E0D0A202020
        202054657874203A3D202753616C657320496E766F696365270D0A2020656E64
        3B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506066C5469746C6509
        4576656E744E616D6506094F6E47657454657874074576656E74494402350001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E6C
        4E6574314F6E476574546578740B50726F6772616D54797065070B747450726F
        63656475726506536F75726365068870726F636564757265206C4E6574314F6E
        476574546578742876617220546578743A20537472696E67293B0D0A62656769
        6E0D0A0D0A20206966205265706F72742E506172616D65746572735B274C616E
        67275D203D20274527207468656E0D0A202054657874203A3D2027457374696D
        617465642054696D65203A273B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506056C4E657431094576656E744E616D6506094F6E476574546578
        74074576656E74494402350000}
    end
    object ppParameterList2: TppParameterList
      object ppParamTrxType: TppParameter
        DataType = dtString
        Value = ''
      end
    end
  end
end

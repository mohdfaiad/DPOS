object fmPointOfSale: TfmPointOfSale
  Left = 1
  Top = 1
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
    Left = 858
    Top = 37
    Width = 143
    Height = 541
    Align = alRight
    TabOrder = 0
    object paButtons: TPanel
      Left = 1
      Top = 1
      Width = 141
      Height = 539
      Align = alClient
      Color = clWhite
      TabOrder = 0
      object btn_Cancel: TVrDemoButton
        Left = 0
        Top = 143
        Width = 140
        Height = 62
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
        Width = 140
        Height = 62
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
        Width = 140
        Height = 62
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
        Width = 140
        Height = 62
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
        Width = 140
        Height = 62
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
        Width = 140
        Height = 62
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
        Width = 141
        Height = 62
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
        Width = 140
        Height = 62
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
        Color = clWhite
        TabOrder = 0
        DesignSize = (
          1002
          108)
        object QLabel10: TLabel
          Left = 394
          Top = 19
          Width = 136
          Height = 29
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
          Left = 222
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
          Color = clBlack
          ParentColor = False
          Text = '0.00'
        end
        object QLabel7: TLabel
          Left = 743
          Top = 65
          Width = 96
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
          Left = 566
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
          Left = 566
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
          Left = 741
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
          Left = 222
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
          Color = clBlack
          ParentColor = False
          Text = '0.00'
        end
        object ArEnLabel1: TLabel
          Left = 397
          Top = 66
          Width = 137
          Height = 26
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
          Left = 857
          Top = 1
          Width = 144
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
            Width = 136
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
          Width = 204
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
            Width = 196
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
    Width = 858
    Height = 541
    Align = alClient
    Color = clWhite
    ParentColor = False
    TabOrder = 4
    object pnlKeyPad: TPanel
      Left = 2
      Top = 193
      Width = 200
      Height = 346
      Align = alLeft
      TabOrder = 0
      object ArEnPanel3: TPanel
        Left = 1
        Top = 1
        Width = 198
        Height = 344
        Align = alClient
        Color = clWhite
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
      Left = 202
      Top = 193
      Width = 654
      Height = 346
      Align = alClient
      TabOrder = 1
      object grdDetails: TDBGrid
        Left = 361
        Top = 1
        Width = 292
        Height = 344
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
        Width = 360
        Height = 344
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabHeight = 25
        TabOrder = 1
        TabWidth = 75
      end
    end
    object pnl_Header: TPanel
      Left = 2
      Top = 15
      Width = 854
      Height = 80
      Align = alTop
      Caption = 'pnl_Header'
      TabOrder = 2
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 852
        Height = 78
        Align = alTop
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          852
          78)
        object ArEnLabel10: TLabel
          Left = 1918
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
          Left = 784
          Top = 50
          Width = 50
          Height = 16
          Anchors = []
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
          Left = 785
          Top = 5
          Width = 50
          Height = 16
          Anchors = []
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
          Left = 605
          Top = 51
          Width = 56
          Height = 16
          Anchors = []
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
          Left = 606
          Top = 8
          Width = 56
          Height = 16
          Anchors = []
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
          Left = 382
          Top = 6
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
          Left = 382
          Top = 51
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
          Left = 675
          Top = 47
          Width = 104
          Height = 21
          Style = csDropDownList
          Anchors = []
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
          Left = 677
          Top = 3
          Width = 100
          Height = 21
          Anchors = []
          AutoSize = False
          DataField = 'TrxNo'
          DataSource = DS_Header
          Enabled = False
          TabOrder = 2
        end
        object lcbPolicy: TDBLookupComboBox
          Left = 1777
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
          Left = 470
          Top = 47
          Width = 129
          Height = 23
          Anchors = []
          DataField = 'OperatorCode'
          DataSource = DS_Header
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          KeyField = 'OperatorCode'
          ListField = 'OperatorNameAr'
          ListSource = DS_Operators
          ParentFont = False
          TabOrder = 3
        end
        object dt_TrxDate: TDateTimePicker
          Left = 471
          Top = 4
          Width = 128
          Height = 21
          Anchors = []
          Date = 42842.910706111110000000
          Time = 42842.910706111110000000
          Enabled = False
          TabOrder = 4
        end
        object cbo_Customers: TDBLookupComboBox
          Left = 236
          Top = 2
          Width = 135
          Height = 23
          DataField = 'CustomerCode'
          DataSource = DS_Header
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          KeyField = 'CustomerCode'
          ListField = 'CustomerNameAr'
          ListSource = DS_Customers
          ParentFont = False
          TabOrder = 5
        end
        object cbo_Warehouse: TDBLookupComboBox
          Left = 236
          Top = 47
          Width = 135
          Height = 23
          DataField = 'WarehouseCode'
          DataSource = DS_Header
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          KeyField = 'WareHouseCode'
          ListField = 'WareHouseNameAr'
          ListSource = DS_Warehouse
          ParentFont = False
          TabOrder = 6
        end
        object grp_Return: TGroupBox
          Left = 3
          Top = -2
          Width = 202
          Height = 77
          BiDiMode = bdRightToLeft
          Caption = #1575#1604#1573#1585#1580#1600#1600#1575#1593
          ParentBiDiMode = False
          TabOrder = 7
          object Label7: TLabel
            Left = 149
            Top = 18
            Width = 46
            Height = 16
            AutoSize = False
            Caption = #1575#1604#1601#1585#1593
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object Label8: TLabel
            Left = 148
            Top = 52
            Width = 50
            Height = 16
            AutoSize = False
            Caption = #1575#1604#1601#1575#1578#1608#1585#1577
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object cbo_SourceBranchCode: TDBLookupComboBox
            Left = 4
            Top = 14
            Width = 134
            Height = 23
            DataField = 'SourceBranchCode'
            DataSource = DS_Header
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            KeyField = 'BranchCode'
            ListField = 'BranchNameAr'
            ListSource = DS_Branch
            ParentFont = False
            TabOrder = 0
          end
          object cbo_SourceDocNo: TDBLookupComboBox
            Left = 4
            Top = 48
            Width = 135
            Height = 23
            BiDiMode = bdLeftToRight
            DataField = 'SourceDocNo'
            DataSource = DS_Header
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            KeyField = 'TrxNo'
            ListField = 'TrxNo'
            ListSource = DS_SourceDoc
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
    object pnl_InsertBarcode: TPanel
      Left = 2
      Top = 158
      Width = 854
      Height = 35
      Align = alTop
      TabOrder = 3
      DesignSize = (
        854
        35)
      object ArEnLabel11: TLabel
        Left = 786
        Top = 9
        Width = 65
        Height = 16
        Anchors = []
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
        Left = 444
        Top = 5
        Width = 314
        Height = 24
        Anchors = [akTop, akRight]
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
    object pnl_InvoiceType: TPanel
      Left = 2
      Top = 95
      Width = 854
      Height = 63
      Align = alTop
      TabOrder = 4
      DesignSize = (
        854
        63)
      object Label9: TLabel
        Left = 787
        Top = 23
        Width = 70
        Height = 16
        Anchors = []
        AutoSize = False
        Caption = #1606#1608#1593' '#1575#1604#1591#1604#1576
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object lbl_Table: TLabel
        Left = 381
        Top = 24
        Width = 65
        Height = 16
        Anchors = []
        AutoSize = False
        Caption = #1575#1604#1591#1575#1608#1604#1600#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object Panel5: TPanel
        Left = 7
        Top = -28
        Width = 92
        Height = 25
        TabOrder = 0
        Visible = False
        object Label11: TLabel
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
        object Label12: TLabel
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
        object Label13: TLabel
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
        object Label14: TLabel
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
        object Label15: TLabel
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
        object Label16: TLabel
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
        object Label17: TLabel
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
        object Edit2: TEdit
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
        object Edit3: TEdit
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
        object Edit4: TEdit
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
        object Edit5: TEdit
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
        object Edit6: TEdit
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
        object Edit7: TEdit
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
      object rg_InvoiceType: TDBRadioGroup
        Left = 462
        Top = -7
        Width = 310
        Height = 69
        BiDiMode = bdRightToLeft
        DataField = 'InvoiceType'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Items.Strings = (
          #1578#1610#1603' '#1571#1608#1575#1610'    Take Away'
          #1605#1581#1604#1610'          Hall')
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 1
        Values.Strings = (
          'T'
          'H')
        OnChange = rg_InvoiceTypeChange
      end
      object cbo_Table: TDBLookupComboBox
        Left = 9
        Top = 12
        Width = 363
        Height = 39
        BiDiMode = bdLeftToRight
        DataField = 'TableCode'
        DataSource = DS_Header
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        KeyField = 'TableCode'
        ListField = 'TableNameAr'
        ListSource = DS_Tables
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
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
      DisplayWidth = 6
      FieldName = 'OperatorCode'
      Visible = False
      Size = 6
    end
    object SDS_HeaderIntRefrence: TStringField
      FieldName = 'IntRefrence'
      Size = 15
    end
    object SDS_HeaderSourceDocNo: TStringField
      FieldName = 'SourceDocNo'
      OnChange = SDS_HeaderSourceDocNoChange
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
    object SDS_HeaderSourceBranchCode: TStringField
      FieldName = 'SourceBranchCode'
      OnChange = SDS_HeaderSourceBranchCodeChange
      Size = 4
    end
    object SDS_HeaderInvoiceType: TStringField
      FieldName = 'InvoiceType'
      Size = 1
    end
    object SDS_HeaderTableCode: TStringField
      FieldName = 'TableCode'
      Size = 6
    end
    object SDS_HeaderTableNameAr: TStringField
      FieldKind = fkLookup
      FieldName = 'TableNameAr'
      LookupDataSet = qry_Tables
      LookupKeyFields = 'TableCode'
      LookupResultField = 'TableNameAr'
      KeyFields = 'TableCode'
      Lookup = True
    end
    object SDS_HeaderTotalTaxes: TFMTBCDField
      FieldName = 'TotalTaxes'
      Precision = 18
      Size = 8
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
    object DPL_HeaderppField1: TppField
      FieldAlias = 'BranchCode'
      FieldName = 'BranchCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 0
    end
    object DPL_HeaderppField2: TppField
      FieldAlias = 'CompanyCode'
      FieldName = 'CompanyCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object DPL_HeaderppField3: TppField
      FieldAlias = 'YearID'
      FieldName = 'YearID'
      FieldLength = 9
      DisplayWidth = 9
      Position = 2
    end
    object DPL_HeaderppField4: TppField
      FieldAlias = 'PeriodID'
      FieldName = 'PeriodID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object DPL_HeaderppField5: TppField
      FieldAlias = 'TrxType'
      FieldName = 'TrxType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 4
    end
    object DPL_HeaderppField6: TppField
      FieldAlias = 'TrxNo'
      FieldName = 'TrxNo'
      FieldLength = 8
      DisplayWidth = 8
      Position = 5
    end
    object DPL_HeaderppField7: TppField
      FieldAlias = 'TrxDate'
      FieldName = 'TrxDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 6
    end
    object DPL_HeaderppField8: TppField
      FieldAlias = 'TrxDescA'
      FieldName = 'TrxDescA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object DPL_HeaderppField9: TppField
      FieldAlias = 'TrxDescE'
      FieldName = 'TrxDescE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object DPL_HeaderppField10: TppField
      FieldAlias = 'TrxStatus'
      FieldName = 'TrxStatus'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object DPL_HeaderppField11: TppField
      FieldAlias = 'CustomerCode'
      FieldName = 'CustomerCode'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object DPL_HeaderppField12: TppField
      FieldAlias = 'WarehouseCode'
      FieldName = 'WarehouseCode'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object DPL_HeaderppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalDiscount'
      FieldName = 'TotalDiscount'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 12
      Position = 12
    end
    object DPL_HeaderppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrxAmount'
      FieldName = 'TrxAmount'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 12
      Position = 13
    end
    object DPL_HeaderppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrxBalance'
      FieldName = 'TrxBalance'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 12
      Position = 14
    end
    object DPL_HeaderppField16: TppField
      FieldAlias = 'POSShift'
      FieldName = 'POSShift'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object DPL_HeaderppField17: TppField
      FieldAlias = 'POSCode'
      FieldName = 'POSCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 16
    end
    object DPL_HeaderppField18: TppField
      FieldAlias = 'TrxTime'
      FieldName = 'TrxTime'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 17
    end
    object DPL_HeaderppField19: TppField
      FieldAlias = 'OperatorCode'
      FieldName = 'OperatorCode'
      FieldLength = 6
      DisplayWidth = 6
      Position = 18
    end
    object DPL_HeaderppField20: TppField
      FieldAlias = 'IntRefrence'
      FieldName = 'IntRefrence'
      FieldLength = 15
      DisplayWidth = 15
      Position = 19
    end
    object DPL_HeaderppField21: TppField
      FieldAlias = 'SourceDocNo'
      FieldName = 'SourceDocNo'
      FieldLength = 8
      DisplayWidth = 8
      Position = 20
    end
    object DPL_HeaderppField22: TppField
      FieldAlias = 'SourceDocType'
      FieldName = 'SourceDocType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 21
    end
    object DPL_HeaderppField23: TppField
      FieldAlias = 'SourceDocYearId'
      FieldName = 'SourceDocYearId'
      FieldLength = 4
      DisplayWidth = 4
      Position = 22
    end
    object DPL_HeaderppField24: TppField
      FieldAlias = 'SourceDocPeriodId'
      FieldName = 'SourceDocPeriodId'
      FieldLength = 2
      DisplayWidth = 2
      Position = 23
    end
    object DPL_HeaderppField25: TppField
      FieldAlias = 'CashCode'
      FieldName = 'CashCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 24
    end
    object DPL_HeaderppField26: TppField
      FieldAlias = 'BankCode'
      FieldName = 'BankCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 25
    end
    object DPL_HeaderppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'Cash'
      FieldName = 'Cash'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 26
    end
    object DPL_HeaderppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'ATM'
      FieldName = 'ATM'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 27
    end
    object DPL_HeaderppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'Visa'
      FieldName = 'Visa'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 28
    end
    object DPL_HeaderppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'Checks'
      FieldName = 'Checks'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 29
    end
    object DPL_HeaderppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'Credit'
      FieldName = 'Credit'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 30
    end
    object DPL_HeaderppField32: TppField
      FieldAlias = 'CreateDate'
      FieldName = 'CreateDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 31
    end
    object DPL_HeaderppField33: TppField
      FieldAlias = 'LastUpdateDate'
      FieldName = 'LastUpdateDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 32
    end
    object DPL_HeaderppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'PayedValue'
      FieldName = 'PayedValue'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 33
    end
    object DPL_HeaderppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'RemainderValue'
      FieldName = 'RemainderValue'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 34
    end
    object DPL_HeaderppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'Total'
      FieldName = 'Total'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object DPL_HeaderppField37: TppField
      FieldAlias = 'SourceBranchCode'
      FieldName = 'SourceBranchCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 36
    end
    object DPL_HeaderppField38: TppField
      FieldAlias = 'InvoiceType'
      FieldName = 'InvoiceType'
      FieldLength = 1
      DisplayWidth = 1
      Position = 37
    end
    object DPL_HeaderppField39: TppField
      FieldAlias = 'TableCode'
      FieldName = 'TableCode'
      FieldLength = 6
      DisplayWidth = 6
      Position = 38
    end
    object DPL_HeaderppField40: TppField
      FieldAlias = 'TableNameAr'
      FieldName = 'TableNameAr'
      FieldLength = 20
      DisplayWidth = 20
      Position = 39
    end
    object DPL_HeaderppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTaxes'
      FieldName = 'TotalTaxes'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 40
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
      FieldLength = 0
      DisplayWidth = 0
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
      FieldAlias = 'TaxPercent'
      FieldName = 'TaxPercent'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 6
      Position = 17
    end
    object ppSalesppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'TaxValue'
      FieldName = 'TaxValue'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 6
      Position = 18
    end
    object ppSalesppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'NetPrice'
      FieldName = 'NetPrice'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 6
      Position = 19
    end
    object ppSalesppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'UnitTransValue'
      FieldName = 'UnitTransValue'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 12
      Position = 20
    end
    object ppSalesppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalPrice'
      FieldName = 'TotalPrice'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 12
      Position = 21
    end
    object ppSalesppField23: TppField
      FieldAlias = 'TrxDetailDescA'
      FieldName = 'TrxDetailDescA'
      FieldLength = 240
      DisplayWidth = 240
      Position = 22
    end
    object ppSalesppField24: TppField
      FieldAlias = 'TrxDetailDescE'
      FieldName = 'TrxDetailDescE'
      FieldLength = 240
      DisplayWidth = 240
      Position = 23
    end
    object ppSalesppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrxLineNo'
      FieldName = 'TrxLineNo'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 24
    end
    object ppSalesppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'SourceDocLineNo'
      FieldName = 'SourceDocLineNo'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 25
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
      DisplayLabel = 'Barcode / '#1576#1575#1585#1603#1608#1583
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
      DisplayLabel = 'Code / '#1575#1604#1585#1605#1586
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
    object SDS_DetailsTaxPercent: TFMTBCDField
      DisplayLabel = '% '#1575#1604#1590#1585#1610#1576#1577
      DisplayWidth = 6
      FieldName = 'TaxPercent'
      OnChange = SDS_DetailsTaxPercentChange
      Precision = 18
      Size = 8
    end
    object SDS_DetailsTaxValue: TFMTBCDField
      DisplayLabel = #1575#1604#1590#1585#1610#1576#1577
      DisplayWidth = 6
      FieldName = 'TaxValue'
      ReadOnly = True
      OnChange = SDS_DetailsDiscountChange
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
    object SDS_DetailsTotalTaxes: TAggregateField
      FieldName = 'TotalTaxes'
      Active = True
      Expression = 'Sum(TaxValue)'
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
    object qry_SorceDocItemsTaxPercent: TFMTBCDField
      FieldName = 'TaxPercent'
      Precision = 18
      Size = 8
    end
    object qry_SorceDocItemsTaxValue: TFMTBCDField
      FieldName = 'TaxValue'
      Precision = 18
      Size = 8
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
      mmHeight = 46038
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
        mmTop = 26194
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
        mmTop = 24606
        mmWidth = 45773
        BandType = 1
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Style = psDashDot
        Pen.Width = 2
        mmHeight = 12435
        mmLeft = 5292
        mmTop = 33338
        mmWidth = 54769
        BandType = 1
      end
      object pplTrxNo: TppLabel
        UserName = 'lTrxNo'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ' '#1575#1604#1585#1602#1605' - NO'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4657
        mmLeft = 33338
        mmTop = 2117
        mmWidth = 28575
        BandType = 1
      end
      object pplTrxDate: TppLabel
        UserName = 'lTrxDate'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1578#1575#1585#1610#1582' - Date'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 39952
        mmTop = 35454
        mmWidth = 19315
        BandType = 1
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
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DPL_Header'
        mmHeight = 6085
        mmLeft = 31221
        mmTop = 8202
        mmWidth = 32015
        BandType = 1
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
        mmLeft = 22490
        mmTop = 35454
        mmWidth = 16404
        BandType = 1
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
        mmLeft = 21696
        mmTop = 40481
        mmWidth = 16669
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'lNet1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1608#1602#1578' - Time'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 40217
        mmTop = 40746
        mmWidth = 18256
        BandType = 1
      end
      object ppImage4: TppImage
        UserName = 'Image4'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Picture.Data = {
          0A544A504547496D61676549530000FFD8FFE000104A46494600010100004800
          480000FFE100584578696600004D4D002A000000080002011200030000000100
          010000876900040000000100000026000000000003A001000300000001000100
          00A00200040000000100000280A0030004000000010000016400000000FFED00
          3850686F746F73686F7020332E30003842494D04040000000000003842494D04
          25000000000010D41D8CD98F00B204E9800998ECF8427EFFC000110801640280
          03012200021101031101FFC4001F000001050101010101010000000000000000
          0102030405060708090A0BFFC400B5100002010303020403050504040000017D
          01020300041105122131410613516107227114328191A1082342B1C11552D1F0
          2433627282090A161718191A25262728292A3435363738393A43444546474849
          4A535455565758595A636465666768696A737475767778797A83848586878889
          8A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5
          C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8
          F9FAFFC4001F0100030101010101010101010000000000000102030405060708
          090A0BFFC400B511000201020404030407050404000102770001020311040521
          31061241510761711322328108144291A1B1C109233352F0156272D10A162434
          E125F11718191A262728292A35363738393A434445464748494A535455565758
          595A636465666768696A737475767778797A82838485868788898A9293949596
          9798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2
          D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDB00430006
          06060606060A06060A0E0A0A0A0E120E0E0E0E12171212121212171C17171717
          17171C1C1C1C1C1C1C1C22222222222227272727272C2C2C2C2C2C2C2C2C2CFF
          DB0043010707070B0A0B130A0A132E1F1A1F2E2E2E2E2E2E2E2E2E2E2E2E2E2E
          2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
          2E2E2E2EFFDD00040028FFDA000C03010002110311003F00F79B6FF90D41FF00
          02FF00D04D7615C7DB7FC86A0FF817FE826BB0A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028AAD757B67631F
          9B7B3C7027F7A46083F324572379F127C0B62489F57B76C7FCF2265FFD161A95
          C6937B1DBD15E4D71F1AFC0509C477134FEE90B0FF00D0F6D663FC7AF0629C0B
          7BE6F711C7FD6414B9D772BD9CBB1ED945788AFC7BF06B1C1B6BF5F731C5FD25
          35A507C6EF024DFEB25B887FDF849FFD00B51CEBB87B39763D728AE12CFE26F8
          0EF8810EAF02E7FE7AEE8BFF004605AEBECF51D3F514F334FB98AE17D627571F
          9A934D344B8B5B9728A28A620A28A2800A28A2800A28A2800A28A2800A28A280
          0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800AF13F8D9A16B1AE
          E95A7C3A3DA4B74F1CECCE225DC402B8C9AF6CA29357562A32E5773E07FF0085
          79E37FFA03DDFF00DFB347FC2BCF1BFF00D01EEFFEFD9AFBE28ACFD9236FAC3E
          C50D2637874BB48A552AE9046AC0F504280455FA28AD4E70A28A2800A28A2800
          AE2747FB82BB6AE2747FB82803FFD0F79B6FF90D41FF0002FF00D04D7615C7DB
          7FC86A0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28A0028A28A002
          8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
          8A28A0028A2B8CF1578F7C37E108C8D52E375C1195B78BE695BD38E8A3DD8814
          3761A4DE88ECEB9BD7BC5FE1BF0D26ED6AF6381B1911E77487E88B96FC718AF9
          6BC51F1A3C4FAD97B7D28FF665B1E3111CCC47BC9C11FF000103EA6BC8649249
          A4696662EEC72CCC72493DC93593ABD8DE3877F68FA675CF8FF02168BC39A799
          0F696E8ED1FF007C21C91FF0215E4DABFC54F1CEB04AC9A8BDBC67F82D80880F
          F812FCFF009B1AF3CA2B3736CDE34E2B644D3DC5C5D4866BA91E573D59D8B13F
          89E6A1A28A92C28A28A0028A28A002A48A5960712C2EC8EBD1949047E22A3A28
          03BBD27E25F8DF472A2DB5396541FC139132E3D3E7C903E8457AB689FB404A0A
          C7E22D3830EF2DA9C1FF00BF6E79FF00BE857CDD45529B444A9C5EE8FBEFC3FE
          3CF0A789B6A6957C8D337FCB193F772FE0AD827F0C8AEBEBF35812A410704743
          5EA3E17F8B9E2CF0E9582797FB46D578F2AE092C07FB327DE1ED9C81E95A2ABD
          CC6587FE53ED8A2BCFBC25F12FC33E2EDB05B4BF66BC3D6DA6C2B13FEC1E8FF8
          73EA057A0D689DF639DA6B461451453105145140051451400514514005145140
          0514514005145140051451400514514005794FC56D42FF004FD3AC9EC2E25B76
          69583189D9091B7A1DA457AB578F7C61FF00906587FD766FFD06B0C4BB52763A
          708AF56373C6BFE124F117FD04AEFF00EFFC9FFC551FF092788BFE82577FF7FE
          4FFE2AB168AF179E5DCF7F923D8FB534E667D3ED9DC9666890927924951572A8
          E99FF20DB5FF00AE31FF00E822AF57D02D8F9896EC28A28A620A28A2800AE274
          7FB82BB6AE2747FB82803FFFD1F79B6FF90D41FF0002FF00D04D7615C7DB7FC8
          6A0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002AADE
          DED9E9D6B25EDFCA904110DCF2390AA07B93583E2BF17E8DE0FD3CDFEAD272D9
          1142BCC92B0ECA3F993C0AF8CBC67E3BD6FC6979E6DF3F956A87315B213B13DC
          FF0079BD58FE181C544A691AD3A4E47A7F8DFE375DDD9934DF0866DE1E55AED8
          7EF1FF00DC53F707B9F9BE95F3FCD34B712B4F3BB492392CCCC49624F5249E49
          A8E8AC1C9BDCEB8C1474414515ADA5687AB6B73793A65BBCC47561C2AFD58F03
          F3A4519340049C0AF6ED23E13C31A89F5FBACE3931C3C01F573FD00FAD7596F3
          F833C38445A5C08D28E0792BE639FF00819FF1A9724B7624DCB48AB9E1361E10
          F12EA4035AD8CBB4F4671E5AFE6F806BADB4F84FAFCD83753C100F4CB3B7E406
          3F5AF57FED6F11DEFF00C83F4F10A9FE3B838FC71F29FE747F65F89EE7FE3EB5
          15841ED0A74FC7E5353ED2FB21B8B5F1348E161F83F1819B8D4493E89163F52C
          6B417E11E8E07CF79707E9B07F435D5FFC229E6F377A85D4A7FDFC7F3CD1FF00
          0866907EFB4CDF57FF00EB51CD2FE5FC49F77F9BF03946F847A31FBB77703EBB
          0FFECA2A94DF082023FD1F51653FEDC41BF930AEE3FE10BD1C7DD332FD1FFF00
          AD47FC22691F36B7D7511FF7F3FC80A77976FC43DDFE6FC0F2ABAF84BAE44336
          97304C3D09643FC88FD6B94BFF000578A34ECB4F632328FE28B120C7AFC99C7E
          35EFFF00D91E24B6FF008F4D4FCD1E9327F5F98D1FDA5E28B2FF008FDB14B941
          FC50373F9727F414B9EDBA2945BF85A67CB0CAC8C55C1047041E08A4AFA767D4
          3C27AEFF00A3EB36EA9274C5C26D61F471C8FCC572FAAFC2AD3EE90DC68175E5
          6EE55243BE33F461C81FF7D55464A5B313BC7E2563C2A8ADCD67C37ACE82FB75
          2B7645270241F321FA30E3F03CD61D50C5566560CA7047208EA0D7B8F823E346
          A9A398F4FF0012EEBEB318513759E31F53F7C7D79F7ED5E1B4534DAD8528A92B
          33F46749D5F4DD72C5351D2674B8824E8E87BF70475047707915A35F9FBE15F1
          7EB7E10BF17BA4CB85623CD85B98E403B30FE44722BECDF05F8EB47F1AD8F9D6
          2DE55CC6079D6CE7E743EA3FBCBE8C3F1C1E2B78CEE71D4A4E3AF43B5A28A2AC
          C828A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002B83F1
          E785AFFC53676D6F612451B4321763296008231C6D56AEF2A39258A200CAEA80
          F4DC40FE7533829479645D39B8494A3B9F3CFF00C2A1F117FCFCDA7FDF527FF1
          147FC2A1F117FCFCDA7FDF527FF115F417DB2D3FE7B47FF7D0FF001A3ED969FF
          003DA3FF00BE87F8D737D4E91D5F5FAC1670B5BDA436EE4168E3542474CA802A
          C500823239068AEB47130A28A2800A28A2800AE2747FB82BB6AE2747FB82803F
          FFD2F79B6FF90D41FF0002FF00D04D7615C7DB7FC86A0FF817FE826BB0A0028A
          28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
          28A0028A28A0028A28A0028A28A002B88F1CF8E74DF04E9BF69B9C4B752822DE
          DC1C173EA7D14773F80E6ADF8CBC5FA77837477D4AF4EF91B2B0420E1A57F41E
          807527B0F7C03F0CEBDAEEA5E24D4E5D5B5590C934A7FE02ABD9547651D87F5A
          CE73B688DA952E6D5EC3B5FF00106ABE26D4A4D575794CB2BF0074545ECAA3B2
          8FFEB9E6B168A2B03B120AB16B69737D7096B671B4B2B9C2A20C935B7E1CF0BE
          A5E25BAF26CD76C487F79337DD41FD4FA0FE9CD7BCD9D9787FC0B6821B6432DD
          CA0027ACB21FFD9573DBA7D4D26D25762BB6ECB7391F0F7C3082DD05F789E407
          037790AD855FF7DFBFD071EE6BB51AE43181A6785AD04DB3805176429F963FA7
          D688F49D4F5C6171AF398A0CE56D50E3FEFA3FE4FD2B745DE8DA5CD0692B2450
          4B2F11C2080C78F4F7F53D6A3DE96DA207CB1DF57F818ABE1DBED448975FBB69
          075F262F9507F8FE5F8D6E25AE93A25B3CEA91DB4518CB4878C0F763CD72FE38
          D4B56D3A3B43652BDB5ABBB0B9B88E3F35A3000DBC1EC4E727DBF03B7A25FE99
          AD696218EED3520A812666500B67FBD191C67D08AA8C12D4894E4D6BB0BA5789
          F47D6EEE5B3D325699A25DCCC118275C63240E6BA0AF3DD0123D17C5FAA6888A
          121BA44BB8140C01D9C01F53C0F415E855666D1C4EB7AB6AF71AD47E1AD01D20
          98C5E7CF70EBBBCB4CE00553C124FAFAD558351D7F40D66D34BD76E52FEDAFC9
          48A70823749076651C60E6AEEB9A36AD1EAF17893C3E636B958BC99A194E1658
          F39183D883FD3F1E3ED740F151F115AEAFAADB33DAADC3482DD670FE4B30FBC3
          71E80E0E01EDD2914AC76FE28D56F74E9B4B82C5C235DDEC713E40398CFDE1CF
          4FA8E69F6DAC5DCFE2EBBD17E5FB35BDB249D3E6DEC477F4C1A83C59A56A57A6
          C350D291669B4F9C4BE4BB6D0E3B804F00F1DEA3F0CE99AAAEA5A86BFACC4B6F
          3DE945585583EC48C63961C1CF14C5A58E8B57D56CF45B09351BE6DB1C63A0FB
          CC4F4551DC9A348D56DB5AD3A1D4ECC308A60480C30C304A90704F422BCDF5B8
          FC49AF6B4B77069A67B0D365212099845E7381CBE1BA81DBB63EA456E7C3777F
          F8475AD64528D6D732C454F55390C47E1BA80B687697563677A9B2EE14947FB4
          3247D0F515CDBF8666B263368174F6CDD7CB73BA33FCFF005CD53D3EEEEB58F1
          95DCF14AE2CB4C8FECE155885799BEF123A1DBC8FC05749ABEB365A2C514B79B
          8F9D2AC48A83733337A0FE7512827B9519CA3A2661FF006ECB6F9B1F13DA6C57
          F97CC0BBE271EE39FEBF415C9EBDF0D74DD4E23A8786A4589986E11E73137FBA
          792BFA8FA57AD4B0C53C6629903A370558641FC2B939B42BDD2A46BCF0EC9B41
          E5ED9CE51BE99FF3EF53EF47CD7E25A7196DA3FC0F99B50D3AFB4AB96B3D4216
          8655EAAC3B7A83D08F71C552AFA8251A1F8C6DDB4CD5A1F2AEA3CFC8DF2C887B
          946FE9F98AF0DF14F83B51F0CCDBA4FDF5AB9C47328E3E8C3B1FE7DAAD34D5D0
          F54ED2DCE46B434AD5750D12FE2D4F4B99A0B884E55D7F5047420F7078359F45
          319F70FC3CF88B63E35B3F265DB06A50AE66873C30FEFA67AAFA8EAA7AF627D2
          6BF38B4DD46F748BE8B52D3A5686E2060C8EBD41FEA0F420F04715F6F7C3EF1D
          D9F8DB4AF37E58AFA0005C423B1ECEBFECB7E8783EA7784EFA3392AD2E5D56C7
          7F45145686014514500145145001451450014514500145145001451450015CDF
          897FD443FEF1FE55D25737E25FF510FF00BC7F954CF62A1B9C7D14515CE6E7A7
          C1FEA23FF747F2A96A283FD447FEE8FE552D751CC145145001451450015C4E8F
          F70576D5C4E8FF00705007FFD3F79B6FF90D41FF0002FF00D04D7615C7DB7FC8
          6A0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A002B3F55D52CB45D3A7D575
          190456F6E85DD8FA0EC3D493C01DCD6857C8FF0019BC7275AD48F8674D7FF43B
          27FDF329E2498707F04E9F5CFB54CA56572E9C399D8F3AF1A78BAFBC65ADC9A9
          DD65225F9208B3C4718E83EA7AB1EE7DB15C95145733773BD2B6882BB2F08783
          EEFC4F75B9B3159C47F7B2FAFF00B2BEADFCBBF606AF853C3175E27D445BC794
          823C34D27F757D07FB47B7E7DABDF6EA74D2E287C33E1B8C2CDB7031D225EECC
          7D4F5E7EBE999949455D8B56F950935D5BE8D1C7E1DF0D40A67030157EEC7EAC
          E7B9EFCFE3EF7B4ED1ED74957D4F5294497182D24F21C05F5C13D07BFF00FAAA
          EE91A3DBE930154F9E57E6494FDE63FE151788F448BC41A4CBA64AE632F86460
          7A3AF4C8EE33D47F5A518B6F9A44CA697BB0DBF32D69DAC697ABABBE9B709388
          CE1B61CE33D323DFB57935D58EA3A078B25B4B378213AA31921BEB91BDE20012
          E8A5B8CF6E7AF1EB5CF417BAAE857177702E12CF5381A2B7FB14700DB70A3001
          E3839EB903F2C8AF70D5743B0F11D8C506AD11F94AC9807055B1C8C8EDD8D591
          B0E87505D4F4E9868B750DC5C440C7E6758FCD03A90BDBBF19AC1F0E787B53B3
          D5EE35DD58DB4734D10884568A4478C8259B3FC4715D6D95859E9D6EB6B6312C
          312F454181F5F73EE6ADD326FD8AED696AD72B7AD1219D14A2C8546E0A7A807A
          E2AC5145020A28A2800A28A2800AAF0DA5B5BF9A6DA3588CCC5DCA003739EAC7
          D4FBD58A28038EF0D787752F0ECF341F6B4B8B294B49864C4BE6B63924704607
          3FC8552B6826F1078BA5D42E5196CF48CC302B82374C7EF3E0FA76FC0D77D450
          3B9E71E30BAD46E759D3B49F0ECEF1EA0A5A46C362258C8EB20C1CF4E320FD39
          15DB58CB79169D149ADB451CE001214388F7138182DEBC7E359FA3787E3D2AEE
          F350965373757921669586084FE141D781FE1E82B97F8917EBF60B6D121569A7
          BB99098539668D0E4F039E4E31F8FA503DF43AFD5B43B6D514499315C2731CCB
          C3023A67D47F915916D7E642DE1EF13C4A5E41B5598663997FC7FAFA1AD0D16E
          FC437924936AD67159C047EE903EF973FED63E5C63E847A5686A7A5DAEAB6C6D
          AE47BAB0FBCA7D4567286BCD1DCD233D3967B7E47CF5E35F044FE1D94DED9664
          B073C1EA6327F85BDBD0FE079EBE7F5F5258DD3A48DE1AF10A8937A958DDB959
          90F1839EFF00E7AF5F11F1AF8465F0D5EF99002F65393E53F5DA7AEC6F71DBD4
          7E34E325257456A9D99C4D6E7873C41A8F863578758D31B6C911E54FDD743F79
          1BD41FFEB8E4561D15436AE7E86F86BC4361E29D1A0D674E6FDDCA3E653F7A37
          1F791BDC1FCC73D0D6ED7C51F0ABC70DE12D705ADEBE34EBE2126CF48DBA2C9F
          8746F6FA0AFB5C10464720D74C257470D4872B0A28A2A8CC28A28A0028A28A00
          28A28A0028A28A0028A28A002A8DFE9F16A08A92B3285391B71FD6AF51435704
          CE7BFE11BB4FF9E927E9FE147FC23769FF003D24FD3FC2BA1A2A79115CCC6A28
          44083A2803F2A75145512145145001451450015C4E8FF70576D5C4E8FF007050
          07FFD4F79B6FF90D41FF0002FF00D04D7615C7DB7FC86A0FF817FE826BB0A002
          8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
          8A28A0028A28A0028A28A00F37F8A3E30FF844BC36ED6CF8BEBCCC36FEAA48F9
          9FFE003A7B915F0E9249C9E49AF44F89FE2A3E29F154F342FBAD2D336F6F8E85
          54FCCFFF00026C9CFA63D2BCEEB9A72BB3BA94396215774ED3EEB55BD8B4FB25
          DF2CCDB547F327D80E4FB552AF7BF877A143A2E932789B521B6499094CF548BD
          47BBFF002C7AD416DD8E92382D7C19A2C3A569ABE65DCC70BC73248782E7D876
          1F415B9A269034C80C931F32EA6F9A690F2493D81F41FAD66E836D2EA172FE22
          BF5C349F2DBA1FE08FD7F1FF00EBF7AEB6A22B99F3BF91351F2AE45F331BC437
          97BA7E89757BA747E64F12651719EFC9C77C0C9FC2B8AF877E23D775EFB5AEAA
          7CD8E2DA525D817E639CAFCA003C73EA3F1AD6D23C5D71A9789AEF417B368D2D
          F78126493F21C6586300376FEB5DB850A30A303DAB533D958A2FA5E9F2DFA6A9
          2408D731AEC5908F982FB7F8D5FA28A090A28A2800A28A2800A28A2800A28A28
          00A28A2800A28A2800AC98744D3E0D5A6D6954B5D4EAA859896DAA0630B9E99E
          F5AD4500701E3EF13EA3E1BB4B63A746A5AE198191C642ED00E31EA73FA1ADDF
          0A6AF73AE68506A577188E49370206429DA48C8CF638ADD9EDE0B98CC5731ACA
          87AAB80C3F235C86BFE30B4F0DEA169A5B5ABC82650729801549DA368C7278E9
          C5056EAC8DFD5F4A8756B530BFCB22FCD1B8EAADEBF4F5AC1B7F2BC436171E1C
          D793FD2231B5FD481F76453EA383FF00D635D9D731E21B0986CD6B4FE2EAD792
          07F1A7707D7FFD7594D59F3A34A72BAE47F23E67D7346BAD0753974DBB1F321C
          AB76753D187B1FD0F15915F44F8CB4883C5BE1D4D634F5CDCDBA97503A951F7E
          33EE3A8F7E9D6BE76ABBDF54527D1857D8BF067C6075FD04E8D7AFBAF34D0141
          3D5E13C21FAAFDD3F87AD7C755D5F827C4B2F853C496BAC293E52B6C9D47F144
          FC38F7C751EE055C25664D48732B1F7FD14C8A58E789268583A3A86561C8208C
          823EB4FAE938028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
          28A0028A28A0028A28A0028A28A002B89D1FEE0AEDAB89D1FEE0A00FFFD5F79B
          6FF90D41FF0002FF00D04D7615C7DB7FC86A0FF817FE826BB0A0028A28A0028A
          28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
          28A002BCF3E28788CF86BC1F753C2DB6E2E7FD1A1F50D203923FDD5048F7C57A
          1D7C97F1E35D37BE21B7D0A26CC76116E71FF4D65C1E7E88171F53533764694A
          3CD23C268A28AE63B8E9BC23A1378835C86C581F257F7931F48D7AFE7C0FC6BD
          FF00571FDA9A941E1DB7F96088092E36F0028FBABFE7D47A5733F0EB4F8B44F0
          DCFAFDD0C3DC65C7AF96990A07FBC73F5E2BB0F0BDAC8B68FA9DCFFAFBD63231
          F45FE11FD7F1ACE7AB5004ED79F6DBD4E995551422001546001D0014B54B50D4
          AC34AB66BBD46658625FE263D4FA01D49F61CD792EADF169158C5A1DAEFEC249
          F807E88BCFE647D2B53049B3D9F0339A2BE67B9F14F8E355C937124287B47884
          0FC461BF53592F69AFDC1DD3DDBB1FF6A5763FD6B37562B766B1C3CDF43EAEA2
          BE4E1A5EAABCADCE0FFBEDFE156636F155AFFC7BDF4C3D926703F52292AD0EE5
          3C2CFB1F54515F31AEB9E3B8C616F263F5753FCF3514BA9F8DAEC6C9AF670A7A
          E25DA3FF001D34FDAC3B93F579F63EA1A2BE73F016A7AC5BF8AE1D37ED0F2C52
          975950B1653B549CF3D0823AFE15F4655A77D4CA51E576614515E69E26F893A7
          690ED67A5A8BCB95E18E7F7487D091F78FB0FCE9892BEC7A5D15F31DD789BC69
          AD92C6E648633D1623E5281F86091F526B25B4AD5253BE6B8DCDEECC4D66EAC5
          6ECDE3869BD6C7D65457CAB01F13E9877D8DDCAB8EC92363F10700D76FA07C50
          BDB6996CFC4B1EF4CE0CCABB5D7DD947047D003F5A719C65B32674651DD1EE74
          5456F710DD429736CE248E4019594E4107B8A96ACC428A2B2F56D674DD0ED4DD
          EA730893A01D598FA28EA4D006A54325B5BCCE924D1A3B46728CCA0953EA09E9
          5E17ABFC52D56F6436FA040204ECEC37C87DF1CA8FD7EB5C94F3F8B3523BAF2F
          26C1ECD290BFF7CAF03F2A894E31DD9B428CA5B23EA7A2BE4D1A4EA6A77A5C61
          BD7730FD6B62C3C59E2DF0EC8A6499AE20CF293132291E81BEF2FE7F8528D58C
          B44C72C3CE2AED1ED369FF00121D75B4FE9697D978BD164EEBF8FF008578978F
          F401A1EBAED0AEDB6BBCCB1E3A024FCCBF81FD08AF60FED3B4F19F875AFB4ECA
          5CDB10FB3F891D79C67B823A1EFF008551F16DA278A7C1835189733DB2F9C31E
          ABC48BF4C64FE0294746E253774A7F267CEB451456807D99F05FC4675AF092E9
          F3B6E9F4C6F20E7A988F319FCB2A3FDDAF5EAF8C3E0BEBA748F19476523621D4
          50C0DE9BFEF21FAE46D1FEF57D9F5D1077471568DA4145145599051451400514
          5140051451400514514005145140051451400514514005145140051451400571
          3A3FDC15DB5713A3FDC1401FFFD6F79B6FF90D41FF0002FF00D04D7615C7DB7F
          C86A0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
          28A0028A28A0028A28A00E0BC69F10F48F03C96B1EA704F31BA0E57C90A70131
          9CEE65F5AE1FFE17F7857FE7CAFBFEF98BFF008E572DFB42FF00C7DE8FFF005C
          E7FE695F39D6329B4EC7553A51714D9F5AFF00C2FEF0AFFCF95F7FDF317FF1CA
          3FE17F7857FE7CAFBFEF98BFF8E57C95454FB465FB089F5AFF00C2FEF0AFFCF9
          5F7FDF317FF1CAF98BC43ABC9AF6B97BACC80837533C801EAAA4FCABF80C0AC7
          A294A4DEE5469A8EC156AC6CE5D42F60B187EFCF22C6BF5638AAB5E85F0CB4F1
          7BE2749D8656D23697DB27E51FFA167F0A929BB23D835D81160D3BC3367F2A48
          55481DA2880FFF005FE15A5E22F1058785F4CFB4CE3271B2188705D80E00F403
          B9EDF9553B2FF4EF14DDDDB7296718857D89EBFF00B35787788F5597C5BE2377
          563F668894887611A9FBDF563CFE5E95945AD66C6E0DF2D35FD5CA77777ABF8B
          6F4DFEA521D8090A07DD51FDD41FD7F3CD6A5BD95AD9AFEE94023AB1EBF9D594
          44890220DAAA30057297535DEAB2CCB6D9F2604691BB0DABFC47EA7007B915CD
          7956765B1DDCB0A31BF53A78EE2095CA4522B30E48073535739E1E8BE59663DC
          851F8726BA3AC2A45465CA8DE9C9CA3CCC28AC7D6AE64B7B6511315666EA3AE0
          5323B2F17A5B4776B693C90C8A1D58465C152320FCA33CFBD5C284A4B99113AF
          183E566DD41737096B0B4D21E0741EA7B0AC03A96B0ADE535B7CFD3051B3F966
          B7B4AF06789BC4970925EA35ADB03CBCABB703FD943824FBF4F7AB861657F78C
          E78A8A5A1BFF000A34B927BFBAD7661F2C6A62427BBB9CB11F41FCEBDD6B3F4A
          D2ECF46B08B4EB15DB1443033D49EE49EE49EB58FE31D77FE11FD0A6BC8CE267
          FDD43FEFB77FC064FE15DE794DF333CFBE2178D25F35FC39A339DDF76E244EB9
          3FF2CD4FFE85F97AD707A7E9115B812DC00F27E617FF00AF55B44B52DBAFE7CB
          3313B49E4FB9FC6BA2240193C015C588ACEFCB13D3C35049733229E78ADA332C
          CDB545647F6FDA6EC6C7C7AE07F8D3F49D2EE7C63AE2D944C5204CB3BFF7231D
          4FD4F415EE8DE02F0B1B0360B66A3E5DA25EB2038FBDBBAE7BFA7B62AA9E195B
          DE22AE2DA7689E3F0CF15C462585B729AAF7D6315EC455861C7DD6EE3FFAD593
          A624B63A95CE9931E636646FF791B06BA3AE79C5D39E875424AA42ECD5F865E2
          19ACAFDBC357AC7CB94B1873FC320E4A8F661CFD7EB5EEF5F27EA1249A6EAD6F
          A9DBF0E8CB20FF0079083FE15F547DAE0169F6E660B0ECF30B1E81719C9FC2BD
          1A72E68A67935E1CB2B18FE24F1159F86F4E6BDBAF99CFCB1460F2EDE9EC0773
          DABE72B89F54F155FB6A3A9C876E7031F7547F7507603FFD79356B5BD56E3C63
          AF3DC312B6D1FCB1AFF76307FF00426EA7FC056AA22468238C615460015857AD
          CBEEC773A70D87BFBD22382DA1B64D90A851FA9FA9AAD79A8DB59FCB21DCFF00
          DD1D7F1F4A6EA57C2CA0CAFF00AC7E147F5FC2BA6F03780D3558C6B9AF02D139
          CC511246FF00F69BBEDF41DFE9D71A3479FDE91D15EBAA6B96271906BD0C9204
          9633182701B39FCF815B8E892214719561820D2FC4B6B18F5A834BB1B68ADC5A
          C6016450BBB7E08071C61474FA9AC69B58B5B788244DE6B81818E99F734EB50B
          35C88542BF326E66EFC38B9974FF0016B69C8498EE124423FDC05D4FD460FE75
          EB3A2AAD86AD7FA1B8FDD39F3A253D36B7DE1FA81F8579FF00C30D02EE4BD93C
          4B78A5536B2C248C6F66FBCC3D80C8FC7DABD0B5EFF42D5F4ED54703798243EC
          DD3F2C935D33D1293E87126A52715D4F9BFC41A61D1F5ABBD34F4864217FDC3C
          A9FF00BE48AC7AF57F8B3A788357B6D454605CC455BDDA33D7F261F9579456A2
          8BBA2CD95DCD617905F5B1DB2DBC8B2A1F4642187EA2BEAB5F8FFE16DA3758DE
          838E70B1919FFBF95F25D14E326B6265052DCFAD7FE17F7857FE7CAFBFEF98BF
          F8E51FF0BFBC2BFF003E57DFF7CC5FFC72BE4AA2ABDA327D844FAD7FE17F7857
          FE7CAFBFEF98BFF8E57AAF863C4765E2BD1A2D6EC1248E298B80B280181462A7
          3B491D47AD7E7AD7DAFF00063FE49FD97FD749FF00F46355C26DBB332AB4E315
          747A9D14515A9CE1451450014514500145145001451450014514500145145001
          451450015C4E8FF70576D5C4E8FF00705007FFD7F79B6FF90D41FF0002FF00D0
          4D7615C7DB7FC86A0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A00F987F685FF8FBD1FF00EB9CFF00CD2B
          E73AFA33F685FF008FBD1FFEB9CFFCD2BE73AE6A9F11DD47E0414514549A0514
          5140057B8FC24B658ACF50D49FA1648C1F4080B1FF00D08578757D01E0A5FB1F
          C3E9EE07065F3DBF1FB83F9526ECAE292BE84C6EE4B2F04EABABF492E4C84377
          CC84463F224D79268108581E73D59B6FE03FFD75EB1E2584C5F0D0A8FEEC2E7F
          E052A9FEB5E61A263EC0BFEF1AE5ABA5248E9A1AD56CB3A94A61B195C75DB81F
          8F1515B46961E02BABBFF96BA85D2400F7F2E21BFF0098E7F0A8B5B6C5811EAC
          07F5AADAA5D67C37A369E9D713CCC3D4B4A517FF0041355855EEB618B779245D
          D1E2F2EC10F77CB1FC7FFAD5A751C3188A14887F0A81F90A92B8A6EF26CEE82B
          248E6B5857BABEB7B18FEF3600FAB9C0AFAB2DE14B6823B78F848D422FD14605
          7C9C9A8C767E228F51953CD4B6995B6038CF964719E7B8AF52FF0085BF6DFF00
          40E7FF00BFA3FF0089AF4A92B4123C9C45E536D1EC94579DF877E23E9BAEDFA6
          9B240F6D2C99F2F710CAC40CE323183E9C57A256A73B56DC2BC23E2CDF3CFA95
          9E9319E238CC847FB521C0FC82FEB5EEF5F3678D9CCFE3C990F48DA251F8229F
          E753276572E92BCAC3E18D6189625E8A00FCAB3F589CC362D8EAFF0020FC7AFE
          95A95CEF8849F2E15F524FE55E6525CD3573D9AAF960EC7B2FC2FD216C740FED
          061FBDBD72D9EFB109551F9E4FE35E9358DE1D8960D034F897A2DB45F9EC19FD
          6B55A78524589DD43B74524027E82BD53C37AB3E62D4C6CF1BDF01DEE26FD726
          B56B22F184DE32D4241D05C4F8FA0622B5EBCEC57C67AF84F80E7BC42BFBA89B
          D188FCC577FE2CF10983C0FA569B0B7EF6F6DE2F30F7D88A33FF007D37E80D70
          3E20FF005117FBC7F955237126B17B69149F72DE18E203D163193F9B67F3AE8A
          0ED4EECE7C4479AA58DBD2AD7ECB68BB87CEFF00337F415A54552D467FB3D9C9
          20E0E303EA78AE1779CBD4EF49423E855D174D6F15789E3B339FB3A9DD211DA2
          4EBFF7D1E3F1AFA851122458E3015540000E0003A015F36F837C51A57856D2E6
          EA589EE2F27608A8BF2854519E58F4C93D81E95A53FC53F125CB1FB15B431AF6
          C2B39FC4E71FA57AB14A2AC78F539A72B9E9DE25F03695E25B84BCB879219D57
          6968F1F328E99041E47AD55D33E1B78674E712C91BDDBAF23CF60573FEE8001F
          C735E7B6FF00153C436CE3EDF6B0CA9DC6D68DBF03923F4AF55F0DF8C749F12A
          15B66315C28CB42FF7B1EA3B30FA7E2053336A48EA9555142200AAA3000E0002
          B9DF1641E7E87330FBD115907E079FD09AE8EA96A5179FA7DCC3FDF89D7F3534
          A6AF16829CAD24CF33F89318D43C2567A98196478DC9F4591483FAE2BC0ABE87
          D4D7EDBF0D2653C98E3CFF00DFB933FC857CF14A2EE9336B59B8851451540145
          1450015F6BFC18FF00927F65FF005D27FF00D18D5F1457DAFF00063FE49FD97F
          D749FF00F4635694B731AFF09EA7451456E71851451400514514005145140051
          4514005145140051451400514514005713A3FDC15DB5713A3FDC1401FFD0F79B
          6FF90D41FF0002FF00D04D7615C7DB7FC86A0FF817FE826BB0A0028A28A0028A
          28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00F987F685FF8
          FBD1FF00EB9CFF00CD2BE73AFA33F685FF008FBD1FFEB9CFFCD2BE73AE6A9F11
          DD47E0414514549A05145140057D0BA48F27E18C58EE87FF001E98FF008D7CF5
          5F4358FCDF0CA023FB8BFA4D5153E1638FC51F5475B77A52EABE163A4E4032DA
          AA293D03050549FA102BE6FB2B89348B8974ED450C4C8E430239561C1CFB57D5
          362736501FFA669FC85616BFE10D13C47F3DF46566030268CED7C7A1EA08FA83
          44A0A51B322155C25747816A92417360FE548AC4618608EC7FC2B9DB2DF73776
          F0B9CAC7C01E8A09723F326BD6EE7E114481A58B532B1A824EF872401EE1C7F2
          AF31D0620D76F27508BC7D4FFF005AB2E5F6706742A9ED668EB68A2A8EA570D6
          D66F2A1C37001F726B822AEEC8F464ECAECB06DADD89668D093D495149F65B6F
          F9E49FF7C8ACED3B47F196AB68B7DA7C2F2C2C485605067070700907AD5DFF00
          845BC7DFF3EB27FDF51FF8D74FD5A7DCE5FAD53EC1E0EB55BDF1CC0235012177
          7381803CB538FF00C7B15F4BD794FC3CF07EA7A25C5C6A9ABA08E5913CB44DC1
          98024162482473818E7D6BD5ABB62ACAC79B525CD2B857CDFE3A88DAF8EA495B
          8597CA71F42814FEA0D7D215E39F163467920B6D7611930FEE6523B293943F40
          723F114E4AEAC14E5695CE5AB075F8CB5BA4A3A2373F8D68D85DADDDB2C99F98
          70C3DFFF00AF56E48D25431C8372B0C106BCA8B709DDF43DA9253859753BDD27
          E2068365E18B56B99B3750C0B198003B99906D1CE30338CE738AF12B97D47589
          AE3599D8B49BB7B364FD70BE8147E42B60685641B712E47A6463F966ADDDB416
          762EA0055DA5547B9AEB96253B281C50C2F2DDC8C3D0B7497924CE4B1DA724F2
          4924726BABAE73C3D1E12597D485FCB9FEB5D1D73E21DE6CEAC3AB411CDF885B
          E5853DD8FF002A6787E2CBCB39EC028FC793506BF26EBA48C7F0A7EA4D6BE871
          ECB10DFDF627FA7F4AD5BE5A28C92E6ACCD7AE7BC412E228A11FC44B1FC38FEB
          5D0D727ACCA3FB4230DF7502E7F3CD65875799AE21DA05ED3B478E34135D2EE7
          3C853D07F89ADE0001803005666A5A8AD9460261A47FBA3B01EA6A85CD8789EC
          F4F8F5CBA4923B69580566239C8C8F933900E382455AA73ABEF321D4852F751D
          0B22BA9570181EA0F22B9BBB827D1EEA3D534C731346C0823F85BFC0FA7E15BB
          6938B9B649C71B873F5E869D71089E0785BF8811F8F6ACE9CDC2469520AA44F7
          3F0CEB91F8874687524015CFCB2A8FE1917A8FA771EC6B79806054F43C5788FC
          22BD712DFE9AC7E52A9328F420ED6FCF23F2AF6FAF50F164ACCF36B35F33C05A
          944DFC115CFE884D7CE55F4869E40F04EACDDBCBBA3FF90EBE6FACA97C08E99F
          C720A28A2B42428A28A002BED7F831FF0024FECBFEBA4FFF00A31ABE28AFB5FE
          0C7FC93FB2FF00AE93FF00E8C6AD296E635FE13D4E8A28ADCE30A28A2800A28A
          2800A28A2800A28A2800A28A2800A28A2800A28A2800AE2747FB82BB6AE2747F
          B82803FFD1F79B6FF90D41FF0002FF00D04D7615C7DB7FC86A0FF817FE826BB0
          A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A00F987F685FF8FBD1FF00EB9CFF00CD2BE73AFA33F685FF008FBD1FFEB9CFFC
          D2BE73AE6A9F11DD47E0414514549A05145140057D05E1E6FB47C3309D4C6B20
          3FF0194B7F2AF9F6BDE7E1BBFDB7C237FA7F56579140F67418FD73532574D05E
          CD33D37487F334AB47F5863FCF68AD0AE7BC2B379DA15B9EE8190FE0C71FA574
          3441DE2998D456934735E31BDFECFF000C5FDC038262318FAC9F20FE75F3D681
          16DB6797FBED8FC00FFEBD7AB7C59BDF2744B7B1538371364FBAC6327F522BCE
          74D8BCAB1897D5777FDF5CD638A95A363AF051F7AE5EAE7FC4126218E2FEF316
          FC87FF005EBA0AE7AE603A9EBD6BA6AFFCB478E2FF00BEDB9FD0D72E1E379A3B
          7112B419F46F852CBFB3FC37616A4608855987A33FCC7F535D05200140551803
          80296BD33C40A28A2800AAF77696F7D6B259DD20922954ABA9EE0D58A2803E69
          F10784B59F09DD3DD59869EC89C8900CE07A48074C7AF43FA56447E20848FDF4
          6C0FFB383FCF15F49DDF89340B1631DDDF408E382A5C161F50326B3E3D23C1DE
          208CDE416D697209C178D5739F72B839FAD653A5196E74D3C44E08F9EE5F1046
          07EE6224FF00B471FCB359DA843AB49047A85F44F1C3212B1961B54F193B41E4
          8F7FD6BEA4B4F0D68160E24B4B0811C746D80B0FA13935E1FF00113533AD7895
          34CB76CC769FBAE3A6F3CB9FC3807E94A34A10D514EBCEA3E532F488BCAB04CF
          57CB1FC7A7E95A748AA11422F014607E155350B8FB2DA3CB9C3630BF535E73BC
          E5EA7A8AD08FA1C6EA1379F792C83A6EC0FA0E2BB1D397658C23FD907F3E6B8F
          9AC2786C2DF5090623B979153DFCBDB93F4CB63F035DBDB0DB6D10F445FE55D5
          89568A89CB8677939135728DA7DE6B5AE3D8D8279933EEDAB9033B172793C741
          5D5D3BE1DA79BE35790FF024CC3F3C7F5A9C2AF79B1E31DA2893C2DE05D62FF5
          78A7D76DDE2B5B720B09782FB7EEA01DC7A9E98AF4DF88CA9FF0875E647DD316
          DFAF98A3F957735E59F15F514B7D161D341F9EE650C47FB11F27F522BBAC799C
          CE52D4F2FD0F3F6019FEF1AD7AA1A64461B1894F52371FC79AB57128860794FF
          000A935E554D66EC7B74F482B9A3F0A327C4576474FB337FE8C4AF7D95FCB89E
          43FC2A4FE42BC57E10D99DF7F7EC38012253F5CB37F4AF59D6E6FB3E91772F4C
          44C07D58607EA6BD46ECAE78AD5E7638656FB3FC3BBE94F1E64530FF00BEBE4A
          F9DABE80F14BFD83E1C240783388947FC09BCC3FA035F3FD4D3568A46D277949
          F98514515620A28A2800AFB5FE0C7FC93FB2FF00AE93FF00E8C6AF8A2BED7F83
          1FF24FECBFEBA4FF00FA31AB4A5B98D7F84F53A28A2B738C28A28A0028A28A00
          28A28A0028A28A0028A28A0028A28A0028A28A002B89D1FEE0AEDAB89D1FEE0A
          00FFD2F79B6FF90D41FF0002FF00D04D7615C7DB7FC86A0FF817FE826BB0A002
          8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00F
          987F685FF8FBD1FF00EB9CFF00CD2BE73AFA33F685FF008FBD1FFEB9CFFCD2BE
          73AE6A9F11DD47E0414514549A05145140057AEFC23BEF2F51BCD3C9FF005D12
          C83EB19C7F26FD2BC8ABA5F07EA434AF12595DB1C2799E5B9EDB64F9493F4CE7
          F0A0525747D09E17FF00469750D2CF1E44E5947FB2DD3F97EB5D6D7233FF00C4
          BBC5914E788EFE23193FEDAF4FE407E35D75453D172F626B6AD4BB9F3FFC54BA
          377AFDAE9C87221887E0D2373FA01549542A851D00C0ACDD6EE7FB53C6D77719
          CAA4CCA0FB44360FE42B4EB93172D523D0C1C6D1B8547E04B6FED1F1B2CE7958
          3CC94FD146D5FD48A4B893C982497FBAA4FE42BA4F8436596BFD4587409129FA
          E59BFF0065A7848EEC9C6CAC923DB68A28AEE3CB0A28A2800AF14F88DE2BBDFB
          6FFC235A4B94C01E7B21C33330C8407B0C1E7D738AF6BAF97F590C9E38BD13F5
          3712119F42095FD31533764D9AD18A9492664BE8A96F6CF3DC484955CE17A67E
          A6BD27E10DADD06BEBDCE2DC848F1D8B8E7F407F5AE7658D668DA27FBAC083F8
          D60DBC7E21D2FCC834BB99228E4FBDE5C8533E99191CD7350AD7BF3B3B71141D
          97223DCBC6BE31B6F0F59BDB5B387BF95708839F2F3FC6DE98EC3B9F6CD78768
          B68F96BF9F25DF3B49EBCF53F8D16BA33197ED17EFE631392339C9F727AD7400
          6381515EBA6B962561B0DCBEF482B9CB84B8D73558748B11B999F60F4DC7A93E
          CA3FAD58D57531029B6B73994F048FE1FF00EBD7ACFC3BF08368F6E757D45317
          73AE114F58D0FAFF00B4DDFD071EB4F0D4BEDB0C5564972A39AF899A443A5E8D
          A3DB5B0FDD5AF99167D4B05393EE4A926B9FB460F6B130EE8BFCABD6FE22696D
          A9F8627F286E92D889D47B26437FE3A4D788E877225B5F209F9A3FE47A55E2A3
          78DCCF052D6C6D53FE1CC8B178CE48DB82E9328FA821BF90A65615DD85E45783
          50D32431CA0EECAB6D60DEA0D61869A8CB53A3154DCA3A1F505E5E5B585B4979
          79208A2886E666E807F9E82BE64D6B549BC5FE207BC6056DD3E5453FC31A9E3F
          16EA7EBED50DD9F12EB2563D56E647453C091F207B851C66B52D2D22B38BCA8B
          EA49EA4D7455AE92B45EA7350C33BDE45AE9C0AC0D76E8244B6AA7E67E5BE83F
          C4D6A5E5E4567119243CFF000AF726B47C05E1A9BC41AA7F6E6A2BFE8B6EFB86
          7A4920E8A3FD95EA7F2F5AC30F4AEF999D189AAA31E53D67C11A33689E1DB7B7
          9576CD2FEFA51DC33F63EE0601FA53FC5F231D352CA3FBF75324607E39FE6057
          555C8DDFFC4C7C556F6C394B18CCAFFEF374FF00D94D7655F86DDCF3A8FC7CCF
          A6A70BF166E960B3D3B488FA65A423D0200ABFCCD788D773F117521A8F8A2754
          394B50205FAAF2DFF8F122B86AB2A3B05145140C28A28A002BED7F831FF24FEC
          BFEBA4FF00FA31ABE28AFB5FE0C7FC93FB2FFAE93FFE8C6AD296E635FE13D4E8
          A28ADCE30A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
          0AE2747FB82BB6AE2747FB82803FFFD3F79B6FF90D41FF0002FF00D04D7615C7
          DB7FC86A0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A00F1EF8A7F0F758F1C4D612E9535BC42D5655713B
          3AE7795231B51BD39E95E4FF00F0A0BC5FFF003F961FF7F25FFE355F5CD150E0
          9BB9A46AC92B23E46FF8505E2FFF009FCB0FFBF92FFF001AA3FE14178BFF00E7
          EEC3FEFE4BFF00C6ABEB9A297B3457B791F237FC282F17FF00CFDD87FDFC97FF
          008D579978ABC2BA9F83F553A46AA6369362C8AF1125195B3C82C14F5041E3A8
          AFD06AF03F8F3E1E379A35AF88A05CBD93F95291FF003CA52304FD1F03FE054A
          54D25745D3ACDCACCF9468A28AC4E93E8F8EF1FC45E0DB6D5E239BAB4C3B11D4
          3C5C3FE63E6FCABB34D4E393473AB20CA884CA47BA8248FC08C578AFC2CD6D6D
          AFE6D0AE4FEEEEC6E8C1E9E628E47FC097F90AF4DD140D3AFEEBC39703313665
          83772191BAAFF9F7ACDE92BF713578B5DBF23E78D1A6885C4D717322AB30EAC4
          0C96393FCABA2FB7597FCF68FF00EFA15E8573F09B45966692DEE678518E427C
          AC07B024671F5CD57FF8545A5FFCFECDFF007CAD67530EA6EED9B53C5F22B247
          99EAD7B6ED64D1C322B339030A41E3AD7B4FC34B2FB278562948C35CC8F29FCF
          68FD16B1A2F847A3AB8696EE7750790368CFE3835EA36D6D059DBC7696CA1228
          942228EC00C0AD695350564635EB7B47727A28A2B439C28A28A002BC53E26F86
          6E45C2F89B4F52C0002E02F552BF75FE98E0FA6057B5D040230790690E2ECEE7
          CB567ACDBCC81672237EF9E87E86B4FED56C4644A98FF7857A96B1F0DBC3BAA3
          B4F0AB59CADC930E0293EE8723F2C572E7E0FC7BB23533B7D3C9E7F3DFFD2B9A
          5858B7A33BE38D76D4E325D4EC621F34A0FB2FCDFCAB29B51BED4A6165A542EC
          EFC00A3739FA01D2BD7ACFE13E850B06BC9E7B8C7F0E4229FC813FAD77FA668B
          A568D1795A65B2400F52A3E63F563C9FC4D5430D18EAC8A98C93D11E77E0DF87
          8BA63A6ABAE8125D0F9922FBCB19F527BB7E83DCF4F57A28AE838DBBEE210181
          561907820D7CEBE2FF0007DF786AF5B55D294B58B1278E7CACFF000B0FEEFA1F
          CF9EBF45D210181561907820D26AFA31C64E2EE8F96ADB5BB594013FEEDBF31F
          9D692DDDAB0CACA87FE042BD6756F873E1AD51CCA9135A48DC93010A09FF0074
          82BF9015C9C9F07E12DFB9D4D947A34218FE61C5734B0B17B1DD1C6BEA722D79
          68832D2A0FF810ACAB9D7604056D86F6F53C0FF135E9307C21B253FE95A848E3
          FD88C27F32D5D9693E05F0D68EC2582DBCE957A4931DE7EA01F941F70288E162
          B714F1ADEC791786BC0FAAF89675D4357DD059F5C918771E880F41EFD3D335F4
          25A5A5B58DB476767188A2886D555E80558A2BA52B688E294DC9DD91CD3476F0
          BCF29C246A598FB0E4D70DA7DE8D3745D43C57783E79B748A0FA2F08BF8B1C7E
          55A3E259A4BA68341B63FBCBB605C8FE18D4E49FD3F4AF3EF8A3ABC76D6F6BE1
          8B33854024940ECABC229FD49FC2B3DE5E86A95A16EFF91E352CB24F2BCF29DC
          F2316627B92724D474515A146D787B41BFF136B10689A6EDF3EE09C17242A850
          589620120003D2BD5FFE14178BFF00E7EEC3FEFE4BFF00C6AB7FE00F87CB4B7D
          E26997851F65849F538690FE0368FC4D7D355AC209ABB39AA556A5647C8DFF00
          0A0BC5FF00F3F761FF007F25FF00E3547FC282F17FFCFE587FDFC97FF8D57D73
          4557B3447B791F237FC282F17FFCFE587FDFC97FF8D57D0DE00F0E5E7853C2F6
          FA25FC91C9344D233344494F9DCB0C160A7A1F4AECE8AA504B544CAA392B30A2
          8A2A8CC28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
          B89D1FEE0AEDAB89D1FEE0A00FFFD4F79B6FF90D41FF0002FF00D04D7615C7DB
          7FC86A0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28A0028A28A002
          8A28A0028A28A0028A28A0028A28A0028A28A002B3B57D32DB5AD2EE749BC198
          AEA268DBD46E18C8F71D47BD68D1401F9CBAB69973A36A773A55E0C4D6D2346D
          E84A9C647B1EA3DAB3EBE90F8EFE122B243E2FB34F95B105D63B11C46E7EA3E5
          27D96BE6FAE592B3B1E8425CCAE4D6D7135A5C47756EC5248983A30ECCA720D7
          D22D783C49A15AF8974CE2EEDBE62A3A82BF7D3FA8F51F5AF9A2BBEF0078A3FB
          0353FB35DB62CEE8857CF446FE17FA763EDF4A8946EACCABB4F991F4569B7F0E
          A5671DE41D1C723BA9EE0FD2AF5714C7FE119D53CC1FF20EBD6E7D2290F7FA1F
          E5F4AED410464720D1095F47B99548A4EEB6663EBFAC43A16933EA930DDE52FC
          ABFDE63C28FC4FE95C9696DE2EBAD3ECB5A79DA49AEE78D9EDC045863B66CE49
          046ECE39C839E475E6A1F8ACB33786A33182556E50BE3B2ED6033F89149ABF8B
          34C8FC22D1E8D70B2DCB5B2A2A45F33C630033301CA6D19E4E39AB125A1DBC1A
          E68F757ADA75B5D4525C2E728AC09F97A8FA8EE3B578D6A7E38D6DE6D4350B4B
          E104504C20B78046AC1C12416248EA00CFD7DAA3B4FB23697A69D2A6753A65A5
          CDE5D4911C6D9244C2A93FDE2DF2FAEDACBB3B64B8D2F41D1548637D7AF712AE
          72428611827FE0209A4528A47ACE8DACAE97A7452F88B568E6372AB2465D423A
          F1F38C0EAA0F438AE8EF75DD1B4E68D2F6EE289A500A8661C83DFE9EFD2BC78B
          C7A8F8AF5B1AADEC766B936DFBC1990C392A5611D32C00EC4F3C039AAFA2241A
          D6BBA95BDFCE2D3ED1224022756F3CC2A4E2241FC3C2A86383803F1A05CBD4F7
          B95D92269235DEC1490A3B9C703F1AF29F0FEB7AF6BD07DAEDEE99AF92ED566B
          5C46B1476F9E49561B88EA32096CD75BE31D62EF40D196E74F550ED2A45BDC65
          6356CFCC47A0C63F1AF3ABE30D9F8D74FBED2AE52E2631F997CF06021519F318
          85240CA0C919EB83D4D31451D859F8DE17F126A1A76A13DBDB5A5A9F2A32E76B
          B480E0E4938C020F618E2BB1D4357D334B8D64D42E23815F85DC796FA0EA7F0A
          F9E24815FC1EFAA5CA289B52D48032B0CED4009273D47CD9AE87FB674B97C577
          F7F7336E82D2CCC5620672C76851E5FA9396C1F7CD21B89EB57FE26D0F4C16AD
          797488B79CC2DC9561C739190072393C568D8EA363A9C3F68D3E749E304A9643
          9008EC7DEBC16CA3B6D27C4BA6DB6B93958F4EB41248B3104248CA5C228F51B9
          78E4E4577DF0D6DA71A65DEA32218E3BDB9692253C7CBEBF4CF1F850271B227B
          CD56FEEBC69FF08FCB72F636AB07991940A1A7738E03303C0E781FDDAEAB426D
          55B4B88EB2BB6EBE60C3E5CE031DA4EDF9725719C719AF22D2AFED2E3C55A9DC
          78A6E16DEEA02CB6A66C148B0C7940DF2E40C15F5EBCD7A1F8634CB95DDAADD5
          EDDDC89598C093B9C08CF0AC5381961C8E3804700D012467F89FC4D776735E5B
          599F2A3B085259A418DECD290A91A6E0C067392C41F61DEA1D035AD4A7D5EC6D
          7CE69E2BAB3FB4CF1BED63013CA1DEAAA7E618E0FAE6A1F89ADBF4EB5D3A0502
          6BEB848F38E4AAE703FEFA22B8DBE5FECBBDF12BE86A6182DEDE2B62A9C0CBB2
          2B363D400FCFBE681A5747B55A6B9A45FDD3D959DD4534C8096546CF4E0FB1C7
          7C5509BC55A38D3AFEFECE65B81A783E605C81BFF85412307278C8C8AF2FD32E
          6C74DD22D278AEE296E9E016F124442ADB09C832492B9380FF005C723001EB5C
          B7DAD2C347D7ECAC23792D6E2E628E2994131844763CB74C90063D680E43DCF4
          8F14D9DD68106B9AA3C766262C305B8C8620019009240CF15D15ADDDB5EDBA5D
          5A48B2C520CAB29C822BC35354D1C789F4D5B9B853A7E9766BE531FB8D22A724
          7A9DDE9DD715E8FE05D28E9FA2ADCCEACB3DDB34AC1C92C1598945E7A707247A
          9340A4AC767505D5CC3676EF7539DA918DC4D4F5C5DE3B7893531A6C27FD06D5
          834EE3A3B0E8A0FF009EE7D2A672B2D371D38733D7621B1B94B2B4BCF18EAFF2
          EF52635EE231F7547BB1C01FFD7AF9CB54D46E356D427D46E8E649DCB1F41E80
          7B01C0AF42F891E274D42EC685A7B7FA2DA1F9CAF4690718FA2F4FAE7DABCBA8
          8C79558D6F77CC152C104D733C76D6EA5E49582228EACCC7000FA9A8ABDCFE08
          7848EA9AD3F892ED336DA79C459E8D391C7FDF00E7EA455C55DD8994B955CFA4
          FC23A045E18F0ED9E8B1E0B4118F3187F148DF339FFBE89C7B57494515D47037
          7D428A28A0414514500145145001451450014514500145145001451450014514
          500145145001451450015C4E8FF70576D5C4E8FF00705007FFD5F79B6FF90D41
          FF0002FF00D04D7615C7DB7FC86A0FF817FE826BB0A0028A28A0028A28A0028A
          28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
          28A00A1AAE9969ACE9B71A55FA6F82E50C6E3D8F71E847507B1AF80FC4FE1EBC
          F0B6B771A2DE8CB42DF23E301D0F2AE3EA3F23C76AFD0BAF29F8ADE04FF84B74
          717B6080EA5640B458EB2A7568FEBDD7DF8EE6B3A91BA36A33E57667C57452B2
          B2B15604107041EA0D2560761EDFE03F135BEB1627C29ADB6E7DBB6066EACA3A
          2E7FBCBFC3EDF4E7B7D2AF27D1EE8683AA3650FF00C7B4C7A32F653EE3FF00AD
          E95F2E4723C522CB131574219581C1047420D7BEF86BC4963E34D3FF00B17592
          12FD0655BA6FC7F1AFFB43F887E238E9128BF8A3B868B47B1EA72C514F1B4532
          2BA30C32B00411EE0D55B5D374EB1564B2B68A057FBC2345407EA0019AE7B4ED
          56E74DB81A3EBA70DD219CFDD907604FAFF93EFD755464A4633838BB1E6FE2EF
          0D6AFA8A8B1D123852D2540AC9BBCA54903EE2E55461B2001CE71CE073553C3D
          E10D56DF5CB5D43538E1861D3A010C4B136EF31B04173C0EB9279E738AF53A2A
          85CCF62B1B3B36B8174D0C6661D242A37FFDF58CD28B3B41706F043189C8C193
          68DF8F4DD8CD58A28248E58629E3686745911C619580208F420F06AA5AE95A65
          8ABA59DAC30AC830C238D5430F7C0E6AFD140159ACAC9ADC5A3411984748CA0D
          9EBF7718A536768D224AD0C65E318462A32A3D8E38FC2AC552D46F4585AB4FB4
          BB9212341D5DD8E1547D4F7EC39A00E4B4AF0B4A35FD5359D6638665BA70B029
          01C8453C139180480B5DCAAAAA85500003000E8056568B70D3592248C1991546
          E1FC4A3E5DC3D98A923DB15AD40DB2ACB61633CC2E26B789E45E8EC8A5863D09
          19AB5451408865B7B79991E68D1DA33942CA0953EA33D0D46B616292CB3A4112
          C938C4AC100671FED1C64FE356A8A00AA96365142D6D1C11AC4FF790200A7EA3
          1834BF61B2FB37D8FC88FC8FF9E7B06CF5FBB8C559A2802ABD8D949E5F99046D
          E57FABCA03B7FDDE38FC2AD515CBEABACCF24FFD91A28F32E9B877FE1887724F
          A8FD3EBC54CA4A2AECB841C9D90DD6752B8B89C685A41CDC49FEB641D224EFCF
          AFF9EB5C878BBC416DE11D297C3FA3B7FA64ABF3B8EA81BAB1FF0069BB7A0E7D
          2AEEB5AD69FE04D34DBDB9171A9DC0DDF372493FC6FE8A3B0EFF0099AF9F2EAE
          AE2F6E24BBBA7324B2B16766EA49A98C5DF9A5B9AE96E58EDF9905145156334B
          47D2AF35CD4EDF49D3D37CF72E1147619EA4FA003927D2BEFBF0D68167E18D16
          DB45B11F240B866C60BB9E598FB93CFB74AF2EF839E033A0E9FF00F0916A91E2
          FAF13F76AC398A13C8FA33F53E8303D6BDBAB7A71B2B9C75A777641451456862
          1451450014514500145145001451450014514500145145001451450014514500
          145145001451450015C4E8FF0070576D5C4E8FF705007FFFD6F79B6FF90D41FF
          0002FF00D04D7615C7DB7FC86A0FF817FE826BB0A0028A28A0028A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A0028A28A00F997E317C3831B4BE2FD0A2CAB65AF6251D0F7940F43FC7F9FAD7
          CDF5FA52CAAEA5580208C107A115F257C53F85CFA14927887C3F196D3DCEE9A2
          5193013DC7FD333FF8EFD2B1A90EA8EAA357ECB3C2EA48A59609566858A3A10C
          ACA70411D08351D1591D07BBF86FC65A778A2D5743F12ED4B93811CBF7439EC4
          1FE17FD0FE95D54779A8F865C5BEA5BAE6C73849C0CB20EC187F9F6F4AF97ABD
          47C2FF0011A7B041A6EBE0DD5A11B439F99D07A1CFDE5FAF3F5E95128DF55B82
          D15B747D0105C417512CF6EE2446E4329C8AE335BF12EADA6F88ECB48B5B2F3A
          0B8DBB9F0C49DCD83B48E06D1C9CFE9D6996F620C6357F06DD23C5272D09398D
          8FA73F74FB1C11EA2B56CBC4D6D249F64D4D0D95C8E0AC9C29FA37F8FEB42A96
          D25A10E9F586BF99D0CD3C16EA1A7916304E01620027D39A96BCBFE20785758F
          114D6973A595912352A63660B8C9CEE19E0E7BFD0577BA2D94FA76936B637327
          9B2C312A337A903B67B0E82B432B6869D453CD1DB42F7131C246A5D8E09C0519
          3C0E4D4B484060558641E083408E3BFE160F83FF00E7FC7FDFB93FF89ACFD47C
          63E0CD461589F51DA558B0223938254A1FE1F4638F7AF16F18F8765F0E6B1240
          14FD9A525E06EC54FF000E7D57A1FCFBD72948D9416E7D356BE39F07DBAB0FB7
          AE58E788E4E0000003E5E800C0AB5FF0B07C1FFF003FE3FEFDC9FF00C4D7CB75
          A3A469E755D4EDF4E122C5E7B852EC7000EE7F2E83B9E280E447D75637D6BA95
          A477D64FE64328CA3608C8071D0806ADD79CE8907D875C874BD02F6E2EACAD91
          85D895D648A3E3E444200C3E79201C015E8D4CC9A0A8A39E0999961915CA1C30
          520953E871D29B7513CF6B2C11398DE4465571D5491807F0AF2AF02F8375CD07
          5896FB516548846C802B6EF3092307E8319E79A0123A483C4BAB4BE317D01ACB
          6DAA827CDC36E002E4393F77693C018EFD6BB59248E1432CAC115464927000FA
          D606A1E25B1B47FB35A8377727811C5CF3EE467FA9AC99AC2EAF50EA3E2BB85B
          7B58FE6F2036D51FEF1CF5FCCFD2B3753A4753554FACB444D3EA97FAECAD65A1
          663801C4974463F04FF39FA75AE735DF13693E0AB46D2F470B3EA0DF7C9E769F
          573EBE8BF9FBF37E24F88E3CA3A578557C88146D33E36B11FEC0FE1FA9E7E95E
          46CCCEC59C9249C927924D118EB77B977BAB2D17F5B93DDDDDCDFDCBDE5E4865
          9643B999BA9355E8A2AC02BDE3E10FC396D62E53C4FAD45FE830B66DE361FEBA
          453F788FEE29FCCF1D01AC5F865F0CE7F16DC2EABAAAB45A544DCF669D87F0AF
          FB3FDE6FC073D3EC782086DA14B7B7458E38D42A228C2AA8180001D0015A421D
          59856AB6F7512D14515B9C814514500145145001451450014514500145145001
          4514500145145001451450014514500145145001451450015C4E8FF70576D5C4
          E8FF00705007FFD7F79B6FF90D41FF0002FF00D04D7615C7DB7FC86A0FF817FE
          826BB0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0029AE8B22947019586083C82
          0F634EA2803E5AF893F0824B2326BDE1388BDBF2D35A28CB47EAD18EEBFECF51
          DB8E9F3D57E95578AF8FFE10587888C9AB683B6D35039664E914C7DF1F758FA8
          E0F71DEB29D3EA8E9A75BA48F8FE8AD1D5748D4B44BD7D3B5681EDE78FAA38C7
          1EA0F420F6238359D589D26A693AD6A7A25C7DA74C9DA16EE072AC3D194F06BD
          734DF889A26B512D9F8A6D9627E825505933EBC7CC9F867EB5E1F4527AE8C56E
          A7D3D6DA65D4310BBF0B6A0B35BB7223760E87D830CE3F43EF5647896EAC484D
          72C6483B7991FCC87FCFD4D7CCD61A9EA1A5CDE7E9D3C903F728C467EA3A11F5
          AF45D33E2B6B36C047AA411DE2F761FBB73F5C02BFF8ED4725BE1761B77F895F
          F33DBAD75CD26F40FB3DCA127F858ED6FC9B06B56BC822F17F80356FF8FF00B7
          6B490F5250819FAC79CFE22B66D6D3C3B3F3A26B66227F85665FFD072A69DE6B
          A5C97087768EBF5AD134FD7EC5AC3514DCA79561C3237F794F63FE4D7CFDADFC
          3AF1069739FB1C46F6027E578865BFE049D41FA647BD7B52E95E248C66D75512
          2F6DE80FEBF352FD9BC64BD2EAD5BEA08FE4B4B9DF58B051B6D24785E99F0FFC
          4FA8CCA8F6AD6D1E7E6926F9401F4FBC7F015EEBA3783343D274D6D38C0973E6
          E0CCF2A862E474E0F403B01D3EBCD27D9FC66DD6E6D57E809FFD9690E97E2794
          7FA46A8B18FF006231FE0B473BE916371BEF2474D6B696B6302DB59C490C4BD1
          100503F01556EB58D2EC81FB4DCC6A476CE5BF21935C75D5968B003FDB7AE17F
          F65A655CFF00C04963F9562CBE28F879A47FC7AC4D7920F442DCFD64C0FCA8BC
          DEC85C90EF73AF6F14BDDB18F45B396E9BA6F236A0FC7FC71504DA76AD7B119F
          C437AB6B6C3968E221540FF698F1F9E6BCDB52F8AFA94AA62D22D63B55E819FE
          761F41C28FC8D79D6A5ACEABAC49E6EA77324E7B063F28FA28E07E028E4BFC4C
          A4EDF0AB7E2CF63BEF1E786BC3B1B5AF86E01733743272133EEC7E66FA0E3DEB
          C935AF116AFE209BCED4A62E01CAC63845FA2FF5EBEF589455A56D105B5BB0A2
          8AB3676577A85CC7656313CF34A76A4680B313EC05302B57B77C37F84D73E217
          8F5AF10A341A70C324672AF3FA7BAA7BF53DBD6BBCF007C18B7D34C7ABF8B42C
          F7230C96A30D1C67FDB3D1C8F4FBA3DEBE800001815AC29F567354ADD22436F6
          F05A4096B6B1AC5144A1511000AAA3A0007415351456C7305145140051451400
          5145140051451400514514005145140051451400514514005145140051451400
          51451400514514005713A3FDC15DB5713A3FDC1401FFD0F79B6FF90D41FF0002
          FF00D04D7615C7DB7FC86A0FF817FE826BB0A0028A28A0028A28A0028A28A002
          8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
          8A28A0028A28A0028A28A00E7BC47E15D0FC5567F63D6ADC4A067638E248C9EE
          ADD47D3A1EE0D7CB5E30F833AFE825EEF46CEA566327E41FBE41FED20FBDF55F
          C857D8D454CA099A42A38EC7E6B32952558608E083DA92BEF2F13FC3BF0B78AC
          349A8DB08EE4FF00CBC43F24BF89C61BFE040D7CFBE22F819E23D38B4DA14A9A
          8C23909C47301F42769FC1B27D2B174DA3A635A2F73C3E8ABDA8699A8E9539B5
          D4EDA5B6947F04A850FE4474AA3506A145145004D15C5C41CC32327FBAC47F2A
          BCBAE6B49C25F5CAFD2571FD6B2E8A00D56D775C7FBF7F727EB2B9FEB5465BAB
          99FF00D7CAF27FBCC4FF003A828A0028A28A0028A2AD59D8DEEA338B6B0824B8
          95BA244A5D8FE0013401568AF67F0F7C10F14EAA566D5CA69901EBBFE7948F64
          5381FF0002607DABE80F0BFC30F09F858ACF6F6FF6ABA5E7ED17187607D54636
          AFD40CFBD5AA6D994AB451F377843E11F893C4DB2EAED4E9D64DCF99329DEC3F
          D88F827EA703D335F53F857C13E1FF0007DB793A4C1FBD6189277F9A57FAB761
          EC303DABADA2B68C1239A755C828A28AA330A28A2800A28A2800A28A2800A28A
          2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A
          2800A28A2800AE2747FB82BB6AE2747FB82803FFD1F79B6FF90D41FF0002FF00
          D04D7615C7DB7FC86A0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A00A9796163A8C06DB50823B888F5495
          03A9FC18115E6BABFC1AF036A84BC36F258B9FE2B672067FDD6DCA3F002BD568
          A4D27B8D49AD99F326A3FB3E4E096D275556F449E32BFF008F293FFA0D71979F
          04BC776A4F910C1758FF009E53019FFBF9B2BECEA2A5D346AABC91F074FF000D
          3C796C71269139C7F702BFFE804D6737823C649D745BFF00C2DA43FC96BF40A8
          A9F648AFAC3EC7E7EAF823C64E70345BFF00C6DA41FCD6B420F86BE3BB8E23D2
          2E07FBE027FE84457DE5451EC907D61F63E2DB3F82BE3DB9C79D6F0DB67FE7AC
          CA7FF45EFAECF4EFD9F2F5886D5B558E31DD608CBE7E8CC571F957D3F4552A68
          975E4792693F053C11A710F7314D7CE39CCF27CB9FF75028FC0E6BD374FD2F4D
          D2A1FB3E996D15AC7FDD891507E400ABD4552496C66E4DEEC28A28A648514514
          0051451400514514005145140051451400514514005145140051451400514514
          005145140051451400514514005145140051451400514514005713A3FDC15DB5
          713A3FDC1401FFD2F79B6FF90D41FF0002FF00D04D7615C7DB7FC86A0FF817FE
          826BB0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002B89D1F
          EE0AEDAB89D1FEE0A00FFFD3F79B6FF90D41FF0002FF00D04D7615C7DB7FC86A
          0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          02B89D1FEE0AEDAB89D1FEE0A00FFFD4F79B6FF90D41FF0002FF00D04D7615C7
          DB7FC86A0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A002B89D1FEE0AEDAB89D1FEE0A00FFFD5F79B6FF90D41FF0002FF00D0
          4D7615C7DB7FC86A0FF817FE826BB0A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A002B89D1FEE0AEDAB89D1FEE0A00FFFD9}
        mmHeight = 21696
        mmLeft = 0
        mmTop = 265
        mmWidth = 30956
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'lTrxNo2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ':  '#1575#1604#1585#1602#1605' '#1575#1604#1590#1585#1610#1576#1610' '
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 39423
        mmTop = 19579
        mmWidth = 17992
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = '15555454555'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 19579
        mmWidth = 29369
        BandType = 1
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15346
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
        mmLeft = 33338
        mmTop = 5292
        mmWidth = 11642
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
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 42863
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
        mmLeft = 2910
        mmTop = 5821
        mmWidth = 13229
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
        mmLeft = 2381
        mmTop = 10848
        mmWidth = 13758
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
        mmLeft = 33338
        mmTop = 10319
        mmWidth = 11642
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
        Caption = ': '#1575#1604#1589#1606#1601'-Item'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 45773
        mmTop = 1058
        mmWidth = 17198
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
        Caption = ': '#1575#1604#1603#1605#1610#1577'-Qty'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 45773
        mmTop = 5821
        mmWidth = 15875
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
        Caption = ': '#1575#1604#1587#1593#1585'-Price'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 5292
        mmWidth = 16140
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
        Caption = ': '#1575#1604#1575#1580#1605#1575#1604#1610'-Total'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 45773
        mmTop = 10319
        mmWidth = 18521
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
        Caption = ': '#1575#1604#1589#1575#1601#1609'-Net'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 10583
        mmWidth = 15875
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
        mmTop = 14817
        mmWidth = 50271
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object pplTotal: TppLabel
        UserName = 'lTotal'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1589#1575#1601#1610'-Net'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 17727
        mmTop = 794
        mmWidth = 14288
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
        Caption = ': '#1575#1604#1605#1583#1601#1608#1593'-Payed'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 46302
        mmTop = 6085
        mmWidth = 18785
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
        mmLeft = 33338
        mmTop = 6085
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
        Caption = ': '#1575#1604#1576#1575#1602#1609'-Remain'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 17727
        mmTop = 6085
        mmWidth = 18521
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
        mmLeft = 4763
        mmTop = 6085
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
        mmLeft = 4763
        mmTop = 794
        mmWidth = 12171
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
        Caption = ': '#1575#1604#1575#1580#1605#1575#1604#1610'-Total'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 46302
        mmTop = 794
        mmWidth = 18785
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
        mmLeft = 33338
        mmTop = 794
        mmWidth = 12171
        BandType = 7
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TotalTaxes'
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
        Visible = False
        DataPipelineName = 'DPL_Header'
        mmHeight = 3440
        mmLeft = 4233
        mmTop = 11113
        mmWidth = 12171
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ' :  VAT 0 %  - '#1590#1585#1610#1576#1577' '#1575#1604#1602#1610#1605#1577' '#1575#1604#1605#1590#1575#1601#1577
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 20108
        mmTop = 11113
        mmWidth = 41275
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
        72614576656E7448616E646C65720B50726F6772616D4E616D6506116C547278
        446174654F6E476574546578740B50726F6772616D54797065070B747450726F
        63656475726506536F75726365067D70726F636564757265206C547278446174
        654F6E476574546578742876617220546578743A20537472696E67293B0D0A62
        6567696E0D0A20206966205265706F72742E506172616D65746572735B274C61
        6E67275D203D20274527207468656E0D0A202054657874203A3D202744617465
        203A273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506086C547278
        44617465094576656E744E616D6506094F6E47657454657874074576656E7449
        4402350001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060F6C5472784E6F4F6E476574546578740B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365067D70726F636564757265206C
        5472784E6F4F6E476574546578742876617220546578743A20537472696E6729
        3B0D0A626567696E0D0A20206966205265706F72742E506172616D6574657273
        5B274C616E67275D203D20274527207468656E0D0A202054657874203A3D2027
        547278204E6F203A273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        06066C5472784E6F094576656E744E616D6506094F6E47657454657874074576
        656E74494402350001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060D6C4E65744F6E476574546578740B50726F6772616D547970
        65070B747450726F63656475726506536F75726365067670726F636564757265
        206C4E65744F6E476574546578742876617220546578743A20537472696E6729
        3B0D0A626567696E0D0A20206966205265706F72742E506172616D6574657273
        5B274C616E67275D203D20274527207468656E0D0A202054657874203A3D2027
        4E6574273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506046C4E65
        74094576656E744E616D6506094F6E47657454657874074576656E7449440235
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        0F6C50726963654F6E476574546578740B50726F6772616D54797065070B7474
        50726F63656475726506536F75726365067A70726F636564757265206C507269
        63654F6E476574546578742876617220546578743A20537472696E67293B0D0A
        626567696E0D0A20206966205265706F72742E506172616D65746572735B274C
        616E67275D203D20274527207468656E0D0A202054657874203A3D2027507269
        6365273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506066C507269
        6365094576656E744E616D6506094F6E47657454657874074576656E74494402
        350001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060D6C5174794F6E476574546578740B50726F6772616D54797065070B747450
        726F63656475726506536F75726365067B70726F636564757265206C5174794F
        6E476574546578742876617220546578743A20537472696E67293B0D0A626567
        696E0D0A20206966205265706F72742E506172616D65746572735B274C616E67
        275D203D20274527207468656E0D0A202054657874203A3D20275175616E7469
        7479273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506046C517479
        094576656E744E616D6506094F6E47657454657874074576656E744944023500
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650612
        6C4974656D4E616D654F6E476574546578740B50726F6772616D54797065070B
        747450726F63656475726506536F75726365068170726F636564757265206C49
        74656D4E616D654F6E476574546578742876617220546578743A20537472696E
        67293B0D0A626567696E0D0A20206966205265706F72742E506172616D657465
        72735B274C616E67275D203D20274527207468656E0D0A202054657874203A3D
        20274974656D204E616D65273B0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506096C4974656D4E616D65094576656E744E616D6506094F6E47657454
        657874074576656E74494402350001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D6506146C546F74616C50726963654F6E4765745465
        78740B50726F6772616D54797065070B747450726F63656475726506536F7572
        6365068070726F636564757265206C546F74616C50726963654F6E4765745465
        78742876617220546578743A20537472696E67293B0D0A626567696E0D0A2020
        6966205265706F72742E506172616D65746572735B274C616E67275D203D2027
        4527207468656E0D0A202054657874203A3D2027416D6F756E74273B0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060B6C546F74616C507269636509
        4576656E744E616D6506094F6E47657454657874074576656E74494402350001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F6C
        546F74616C4F6E476574546578740B50726F6772616D54797065070B74745072
        6F63656475726506536F75726365067C70726F636564757265206C546F74616C
        4F6E476574546578742876617220546578743A20537472696E67293B0D0A6265
        67696E0D0A20206966205265706F72742E506172616D65746572735B274C616E
        67275D203D20274527207468656E0D0A202054657874203A3D2027546F74616C
        203A273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506066C546F74
        616C094576656E744E616D6506094F6E47657454657874074576656E74494402
        350001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        061144424974656D4E616D654F6E5072696E740B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365069270726F6365647572652044
        424974656D4E616D654F6E5072696E743B0D0A626567696E0D0A202069662052
        65706F72742E506172616D65746572735B274C616E67275D203D202745272074
        68656E0D0A202044424974656D4E616D652E446174614669656C64203A3D2027
        4974656D4E6D616545273B0D0A656E643B202020202020202020202020202020
        20202020200D0A0D436F6D706F6E656E744E616D65060A44424974656D4E616D
        65094576656E744E616D6506074F6E5072696E74074576656E74494402200001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F6C
        5469746C654F6E476574546578740B50726F6772616D54797065070B74745072
        6F63656475726506536F75726365069270726F636564757265206C5469746C65
        4F6E476574546578742876617220546578743A20537472696E67293B0D0A6265
        67696E0D0A20206966205265706F72742E506172616D65746572735B274C616E
        67275D203D20274527207468656E20626567696E0D0A20202020205465787420
        3A3D202753616C657320496E766F696365270D0A2020656E643B0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D6506066C5469746C65094576656E744E61
        6D6506094F6E47657454657874074576656E74494402350001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060E6C4E6574314F6E47
        6574546578740B50726F6772616D54797065070B747450726F63656475726506
        536F75726365068870726F636564757265206C4E6574314F6E47657454657874
        2876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2020
        6966205265706F72742E506172616D65746572735B274C616E67275D203D2027
        4527207468656E0D0A202054657874203A3D2027457374696D61746564205469
        6D65203A273B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650605
        6C4E657431094576656E744E616D6506094F6E47657454657874074576656E74
        494402350000}
    end
    object ppParameterList2: TppParameterList
      object ppParamTrxType: TppParameter
        DataType = dtString
        Value = ''
      end
    end
  end
  object qry_Branch: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'Select * from tbl_Branch'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 651
    Top = 436
    object qry_BranchCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_BranchBranchCode: TStringField
      FieldName = 'BranchCode'
      Required = True
      Size = 4
    end
    object qry_BranchBranchNameAr: TStringField
      FieldName = 'BranchNameAr'
      Size = 250
    end
    object qry_BranchBranchNameEn: TStringField
      FieldName = 'BranchNameEn'
      Size = 250
    end
  end
  object DS_Branch: TDataSource
    DataSet = qry_Branch
    Left = 651
    Top = 460
  end
  object qry_SourceDoc: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'Select * from sa_POS_TrxHeader'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 691
    Top = 436
    object qry_SourceDocCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_SourceDocBranchCode: TStringField
      FieldName = 'BranchCode'
      Required = True
      Size = 4
    end
    object qry_SourceDocTrxNo: TStringField
      FieldName = 'TrxNo'
      Required = True
      Size = 8
    end
    object qry_SourceDocTrxType: TStringField
      FieldName = 'TrxType'
      Required = True
      Size = 4
    end
    object qry_SourceDocYearID: TStringField
      FieldName = 'YearID'
      Required = True
      Size = 4
    end
    object qry_SourceDocPeriodID: TStringField
      FieldName = 'PeriodID'
      Required = True
      Size = 2
    end
    object qry_SourceDocTrxDate: TSQLTimeStampField
      FieldName = 'TrxDate'
    end
    object qry_SourceDocTrxStatus: TStringField
      FieldName = 'TrxStatus'
      FixedChar = True
      Size = 1
    end
    object qry_SourceDocTrxDescA: TStringField
      FieldName = 'TrxDescA'
      Size = 4000
    end
    object qry_SourceDocTrxDescE: TStringField
      FieldName = 'TrxDescE'
      Size = 4000
    end
    object qry_SourceDocIntRefrence: TStringField
      FieldName = 'IntRefrence'
      Size = 15
    end
    object qry_SourceDocTrxAmount: TFMTBCDField
      FieldName = 'TrxAmount'
      Precision = 18
      Size = 8
    end
    object qry_SourceDocTrxBalance: TFMTBCDField
      FieldName = 'TrxBalance'
      Precision = 18
      Size = 8
    end
    object qry_SourceDocTotalDiscount: TFMTBCDField
      FieldName = 'TotalDiscount'
      Precision = 18
      Size = 8
    end
    object qry_SourceDocCustomerCode: TStringField
      FieldName = 'CustomerCode'
      Size = 6
    end
    object qry_SourceDocWarehouseCode: TStringField
      FieldName = 'WarehouseCode'
      Size = 6
    end
    object qry_SourceDocSourceDocNo: TStringField
      FieldName = 'SourceDocNo'
      Size = 8
    end
    object qry_SourceDocSourceDocType: TStringField
      FieldName = 'SourceDocType'
      Size = 4
    end
    object qry_SourceDocTrxTime: TSQLTimeStampField
      FieldName = 'TrxTime'
    end
    object qry_SourceDocPOSShift: TStringField
      FieldName = 'POSShift'
      FixedChar = True
      Size = 1
    end
    object qry_SourceDocPOSCode: TStringField
      FieldName = 'POSCode'
      FixedChar = True
      Size = 4
    end
    object qry_SourceDocOperatorCode: TStringField
      FieldName = 'OperatorCode'
      Size = 6
    end
    object qry_SourceDocSourceDocYearId: TStringField
      FieldName = 'SourceDocYearId'
      Size = 4
    end
    object qry_SourceDocSourceDocPeriodId: TStringField
      FieldName = 'SourceDocPeriodId'
      Size = 2
    end
    object qry_SourceDocCashCode: TStringField
      FieldName = 'CashCode'
      Size = 4
    end
    object qry_SourceDocBankCode: TStringField
      FieldName = 'BankCode'
      Size = 4
    end
    object qry_SourceDocCash: TFMTBCDField
      FieldName = 'Cash'
      Precision = 18
      Size = 8
    end
    object qry_SourceDocATM: TFMTBCDField
      FieldName = 'ATM'
      Precision = 18
      Size = 8
    end
    object qry_SourceDocVisa: TFMTBCDField
      FieldName = 'Visa'
      Precision = 18
      Size = 8
    end
    object qry_SourceDocChecks: TFMTBCDField
      FieldName = 'Checks'
      Precision = 18
      Size = 8
    end
    object qry_SourceDocCredit: TFMTBCDField
      FieldName = 'Credit'
      Precision = 18
      Size = 8
    end
    object qry_SourceDocCreateDate: TSQLTimeStampField
      FieldName = 'CreateDate'
    end
    object qry_SourceDocLastUpdateDate: TSQLTimeStampField
      FieldName = 'LastUpdateDate'
    end
    object qry_SourceDocPayedValue: TFMTBCDField
      FieldName = 'PayedValue'
      Precision = 18
      Size = 8
    end
    object qry_SourceDocRemainderValue: TFMTBCDField
      FieldName = 'RemainderValue'
      Precision = 18
      Size = 8
    end
    object qry_SourceDocTotalTaxes: TFMTBCDField
      FieldName = 'TotalTaxes'
      Precision = 18
      Size = 8
    end
  end
  object DS_SourceDoc: TDataSource
    DataSet = qry_SourceDoc
    Left = 691
    Top = 460
  end
  object qry_Tables: TSimpleDataSet
    Tag = 1
    Active = True
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 'Select * from tbl_Tables'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 571
    Top = 492
    object StringField1: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_TablesTableCode: TStringField
      FieldName = 'TableCode'
      Required = True
      Size = 6
    end
    object qry_TablesTableNameAr: TStringField
      FieldName = 'TableNameAr'
      Size = 255
    end
    object qry_TablesTableNameEn: TStringField
      FieldName = 'TableNameEn'
      Size = 255
    end
  end
  object DS_Tables: TDataSource
    DataSet = qry_Tables
    Left = 571
    Top = 524
  end
  object qry_RelatedItemDetails: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 
      'SELECT  D.CompanyCode, '#39'00000001'#39' AS TrxNo, '#39'SAIV'#39' AS TrxType, '#39 +
      '00000000'#39' AS YearID, '#39'00'#39' AS PeriodID, '#13#10'       Cast (1.0 As Dec' +
      'imal (18,0) )  AS TrxLineNo, D.ItemService, D.DetailItemCode  , ' +
      'D.ItemCode, '#13#10'        D.DetailItemUnit AS ItemUnit, D.ItemQuanti' +
      'ty AS Quantity, ISNULL(I.AvgCost, 0) AS CostPrice,  D.UnitTransV' +
      'alue'#13#10'FROM    tbl_ItemSpecification AS D LEFT OUTER JOIN'#13#10'      ' +
      '  Tbl_ItemStock AS I ON D.CompanyCode = I.CompanyCode AND D.Item' +
      'Code = I.ItemCode AND D.ItemService = I.ItemService '
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 370
    Top = 444
    object qry_RelatedItemDetailsCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_RelatedItemDetailsTrxNo: TStringField
      FieldName = 'TrxNo'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qry_RelatedItemDetailsTrxType: TStringField
      FieldName = 'TrxType'
      Required = True
      FixedChar = True
      Size = 4
    end
    object qry_RelatedItemDetailsYearID: TStringField
      FieldName = 'YearID'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qry_RelatedItemDetailsPeriodID: TStringField
      FieldName = 'PeriodID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qry_RelatedItemDetailsTrxLineNo: TFMTBCDField
      FieldName = 'TrxLineNo'
      Precision = 18
      Size = 0
    end
    object qry_RelatedItemDetailsItemService: TStringField
      FieldName = 'ItemService'
      Required = True
      Size = 3
    end
    object qry_RelatedItemDetailsDetailItemCode: TStringField
      FieldName = 'DetailItemCode'
      Required = True
      Size = 25
    end
    object qry_RelatedItemDetailsItemCode: TStringField
      FieldName = 'ItemCode'
      Required = True
      Size = 25
    end
    object qry_RelatedItemDetailsItemUnit: TStringField
      FieldName = 'ItemUnit'
      Size = 6
    end
    object qry_RelatedItemDetailsQuantity: TFMTBCDField
      FieldName = 'Quantity'
      Precision = 18
      Size = 8
    end
    object qry_RelatedItemDetailsCostPrice: TFMTBCDField
      FieldName = 'CostPrice'
      Required = True
      Precision = 18
      Size = 8
    end
    object qry_RelatedItemDetailsUnitTransValue: TFMTBCDField
      FieldName = 'UnitTransValue'
      Precision = 18
      Size = 8
    end
  end
  object SDS_Details_Temp2: TSimpleDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 
      'SELECT     D.CompanyCode, D.BranchCode, D.TrxNo, D.TrxType, D.Ye' +
      'arID, D.PeriodID, D.TrxLineNo, D.Barcode, D.ItemCode, D.ItemServ' +
      'ice, Sum(D.Quantity) As Quantity, D.ItemPrice, D.Discount, '#13#10'   ' +
      '                   D.DiscountRatio, D.NetPrice, D.CostPrice, D.I' +
      'temUnitCode, D.UnitTransValue, D.TrxDetailDescA, D.TrxDetailDesc' +
      'E, D.SourceDocLineNo, D.TaxPercent, D.TaxValue, '#13#10'              ' +
      '        T.SectionNameA, T.SectionCode, T.SectionNameE, T.Printer' +
      'Path, G.ItemGroupNameAr, G.ItemGroupNameEn, G.ItemGroupCode, I.I' +
      'temNameAr, I.ItemNameEn'#13#10'FROM         tbl_ItemGroupSections AS T' +
      ' INNER JOIN'#13#10'                      tbl_ItemGroup AS G ON T.Compa' +
      'nyCode = G.CompanyCode AND T.SectionCode = G.SectionCode INNER J' +
      'OIN'#13#10'                      sa_POS_TrxDetails AS D INNER JOIN'#13#10'  ' +
      '                    tbl_ItemDefinition AS I ON D.CompanyCode = I' +
      '.CompanyCode AND D.ItemCode = I.ItemCode AND D.ItemService = I.I' +
      'temService ON '#13#10'                      G.CompanyCode = I.CompanyC' +
      'ode AND G.ItemGroupCode = I.ItemGroupCode'#13#10'GROUP BY D.CompanyCod' +
      'e, D.BranchCode, D.TrxNo, D.TrxType, D.YearID, D.PeriodID, D.Trx' +
      'LineNo, D.Barcode, D.ItemCode, D.ItemService, D.ItemPrice, '#13#10'   ' +
      '                   D.Discount, D.DiscountRatio, D.NetPrice, D.Co' +
      'stPrice, D.ItemUnitCode, D.UnitTransValue, D.TrxDetailDescA, D.T' +
      'rxDetailDescE, D.SourceDocLineNo, D.TaxPercent, '#13#10'              ' +
      '        D.TaxValue, T.SectionNameA, T.SectionCode, T.SectionName' +
      'E, T.PrinterPath, G.ItemGroupNameAr, G.ItemGroupNameEn, G.ItemGr' +
      'oupCode, I.ItemNameAr, '#13#10'                      I.ItemNameEn '#13#10
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 347
    Top = 385
    object SDS_Details_Temp2CompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object SDS_Details_Temp2BranchCode: TStringField
      FieldName = 'BranchCode'
      Required = True
      Size = 4
    end
    object SDS_Details_Temp2TrxNo: TStringField
      FieldName = 'TrxNo'
      Required = True
      Size = 8
    end
    object SDS_Details_Temp2TrxType: TStringField
      FieldName = 'TrxType'
      Required = True
      Size = 4
    end
    object SDS_Details_Temp2YearID: TStringField
      FieldName = 'YearID'
      Required = True
      Size = 4
    end
    object SDS_Details_Temp2PeriodID: TStringField
      FieldName = 'PeriodID'
      Required = True
      Size = 2
    end
    object SDS_Details_Temp2TrxLineNo: TFMTBCDField
      FieldName = 'TrxLineNo'
      Required = True
      Precision = 18
      Size = 0
    end
    object SDS_Details_Temp2Barcode: TStringField
      FieldName = 'Barcode'
      Size = 30
    end
    object SDS_Details_Temp2ItemCode: TStringField
      FieldName = 'ItemCode'
      Size = 25
    end
    object SDS_Details_Temp2ItemService: TStringField
      FieldName = 'ItemService'
      Size = 3
    end
    object SDS_Details_Temp2Quantity: TFMTBCDField
      FieldName = 'Quantity'
      Precision = 18
    end
    object SDS_Details_Temp2ItemPrice: TFMTBCDField
      FieldName = 'ItemPrice'
      Precision = 18
    end
    object SDS_Details_Temp2Discount: TFMTBCDField
      FieldName = 'Discount'
      Precision = 18
    end
    object SDS_Details_Temp2DiscountRatio: TFMTBCDField
      FieldName = 'DiscountRatio'
      Precision = 18
    end
    object SDS_Details_Temp2NetPrice: TFMTBCDField
      FieldName = 'NetPrice'
      Precision = 18
    end
    object SDS_Details_Temp2CostPrice: TFMTBCDField
      FieldName = 'CostPrice'
      Precision = 18
    end
    object SDS_Details_Temp2ItemUnitCode: TStringField
      FieldName = 'ItemUnitCode'
      Size = 6
    end
    object SDS_Details_Temp2UnitTransValue: TFMTBCDField
      FieldName = 'UnitTransValue'
      Precision = 18
    end
    object SDS_Details_Temp2TrxDetailDescA: TStringField
      FieldName = 'TrxDetailDescA'
      Size = 4000
    end
    object SDS_Details_Temp2TrxDetailDescE: TStringField
      FieldName = 'TrxDetailDescE'
      Size = 4000
    end
    object SDS_Details_Temp2SourceDocLineNo: TFMTBCDField
      FieldName = 'SourceDocLineNo'
      Precision = 18
      Size = 0
    end
    object SDS_Details_Temp2TaxPercent: TFMTBCDField
      FieldName = 'TaxPercent'
      Precision = 18
    end
    object SDS_Details_Temp2TaxValue: TFMTBCDField
      FieldName = 'TaxValue'
      Precision = 18
    end
    object SDS_Details_Temp2SectionNameA: TStringField
      FieldName = 'SectionNameA'
      Size = 75
    end
    object SDS_Details_Temp2SectionCode: TStringField
      FieldName = 'SectionCode'
      Required = True
      Size = 6
    end
    object SDS_Details_Temp2SectionNameE: TStringField
      FieldName = 'SectionNameE'
      Size = 75
    end
    object SDS_Details_Temp2PrinterPath: TStringField
      FieldName = 'PrinterPath'
      Size = 200
    end
    object SDS_Details_Temp2ItemGroupNameAr: TStringField
      FieldName = 'ItemGroupNameAr'
      Size = 255
    end
    object SDS_Details_Temp2ItemGroupNameEn: TStringField
      FieldName = 'ItemGroupNameEn'
      Size = 255
    end
    object SDS_Details_Temp2ItemGroupCode: TStringField
      FieldName = 'ItemGroupCode'
      Required = True
      Size = 6
    end
    object SDS_Details_Temp2ItemNameAr: TStringField
      FieldName = 'ItemNameAr'
      Size = 255
    end
    object SDS_Details_Temp2ItemNameEn: TStringField
      FieldName = 'ItemNameEn'
      Size = 255
    end
    object SDS_Details_Temp2TotalAmount: TAggregateField
      FieldName = 'TotalAmount'
      Active = True
      Expression = 'Sum(NetPrice)'
    end
    object SDS_Details_Temp2TotalDiscount: TAggregateField
      FieldName = 'TotalDiscount'
      Active = True
      Expression = 'Sum(Discount)'
    end
    object SDS_Details_Temp2TotalTaxes: TAggregateField
      FieldName = 'TotalTaxes'
      Active = True
      Expression = 'Sum(TaxValue)'
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
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
    PrinterSetup.mmPaperWidth = 60000
    PrinterSetup.PaperSize = 119
    Template.FileName = 'E:\Work\SVN\DelphiPOS\trunk\Code\Reports\Sales_POS_Temp.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 340
    Top = 240
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppTitleBand2: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'lTitle'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1573#1585#1587#1575#1604#1610#1577
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Traditional Arabic'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 5027
        mmTop = 8202
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
        mmLeft = 37306
        mmTop = 3175
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
        mmLeft = 1852
        mmTop = 3440
        mmWidth = 17463
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape2'
        Pen.Style = psDashDot
        Pen.Width = 2
        mmHeight = 8467
        mmLeft = 0
        mmTop = 264
        mmWidth = 56621
        BandType = 0
      end
      object ppLabel12: TppLabel
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
        mmLeft = 46302
        mmTop = 2117
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel13: TppLabel
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
        mmLeft = 19050
        mmTop = 2117
        mmWidth = 9525
        BandType = 0
      end
      object ppDBText2: TppDBText
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
        mmLeft = 30956
        mmTop = 2117
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText12: TppDBText
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
        mmLeft = 1588
        mmTop = 2117
        mmWidth = 16404
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppDBText17: TppDBText
        UserName = 'DBQty'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Quantity'
        DataPipeline = ppDBPipeline1
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 3969
        mmTop = 4498
        mmWidth = 7673
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'lItemName'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ' '#1575#1604#1589#1606#1601' Item'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3217
        mmLeft = 23019
        mmTop = 1058
        mmWidth = 32279
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'lQty'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1575#1604#1603#1605#1610#1577' Qty'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3969
        mmTop = 529
        mmWidth = 13494
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Pen.Style = psDot
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.500000000000000000
        mmHeight = 1588
        mmLeft = 1058
        mmTop = 8995
        mmWidth = 56092
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemNameAr'
        DataPipeline = ppDBPipeline1
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 14817
        mmTop = 4763
        mmWidth = 41010
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
    end
    object raCodeModule2: TraCodeModule
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
        72614576656E7448616E646C65720B50726F6772616D4E616D6506116C547278
        446174654F6E476574546578740B50726F6772616D54797065070B747450726F
        63656475726506536F75726365067D70726F636564757265206C547278446174
        654F6E476574546578742876617220546578743A20537472696E67293B0D0A62
        6567696E0D0A20206966205265706F72742E506172616D65746572735B274C61
        6E67275D203D20274527207468656E0D0A202054657874203A3D202744617465
        203A273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506086C547278
        44617465094576656E744E616D6506094F6E47657454657874074576656E7449
        4402350001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060F6C5472784E6F4F6E476574546578740B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365067D70726F636564757265206C
        5472784E6F4F6E476574546578742876617220546578743A20537472696E6729
        3B0D0A626567696E0D0A20206966205265706F72742E506172616D6574657273
        5B274C616E67275D203D20274527207468656E0D0A202054657874203A3D2027
        547278204E6F203A273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        06066C5472784E6F094576656E744E616D6506094F6E47657454657874074576
        656E74494402350001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060D6C5174794F6E476574546578740B50726F6772616D547970
        65070B747450726F63656475726506536F75726365067B70726F636564757265
        206C5174794F6E476574546578742876617220546578743A20537472696E6729
        3B0D0A626567696E0D0A20206966205265706F72742E506172616D6574657273
        5B274C616E67275D203D20274527207468656E0D0A202054657874203A3D2027
        5175616E74697479273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        06046C517479094576656E744E616D6506094F6E47657454657874074576656E
        74494402350001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D6506126C4974656D4E616D654F6E476574546578740B50726F6772616D
        54797065070B747450726F63656475726506536F75726365068170726F636564
        757265206C4974656D4E616D654F6E476574546578742876617220546578743A
        20537472696E67293B0D0A626567696E0D0A20206966205265706F72742E5061
        72616D65746572735B274C616E67275D203D20274527207468656E0D0A202054
        657874203A3D20274974656D204E616D65273B0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D6506096C4974656D4E616D65094576656E744E616D650609
        4F6E47657454657874074576656E74494402350001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D65060F6C5469746C654F6E47657454
        6578740B50726F6772616D54797065070B747450726F63656475726506536F75
        726365069270726F636564757265206C5469746C654F6E476574546578742876
        617220546578743A20537472696E67293B0D0A626567696E0D0A202069662052
        65706F72742E506172616D65746572735B274C616E67275D203D202745272074
        68656E20626567696E0D0A202020202054657874203A3D202753616C65732049
        6E766F696365270D0A2020656E643B0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506066C5469746C65094576656E744E616D6506094F6E4765745465
        7874074576656E74494402350000}
    end
    object ppParameterList1: TppParameterList
      object ppParameter1: TppParameter
        DataType = dtString
        Value = ''
      end
    end
  end
  object DS_DetatilsTemp: TDataSource
    DataSet = SDS_Details_Temp2
    Left = 399
    Top = 441
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DS_DetatilsTemp
    UserName = 'Details_Temp'
    Left = 427
    Top = 441
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'CompanyCode'
      FieldName = 'CompanyCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'BranchCode'
      FieldName = 'BranchCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'TrxNo'
      FieldName = 'TrxNo'
      FieldLength = 8
      DisplayWidth = 8
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'TrxType'
      FieldName = 'TrxType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'YearID'
      FieldName = 'YearID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'PeriodID'
      FieldName = 'PeriodID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrxLineNo'
      FieldName = 'TrxLineNo'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'Barcode'
      FieldName = 'Barcode'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'ItemCode'
      FieldName = 'ItemCode'
      FieldLength = 25
      DisplayWidth = 25
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'ItemService'
      FieldName = 'ItemService'
      FieldLength = 3
      DisplayWidth = 3
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'Quantity'
      FieldName = 'Quantity'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'ItemPrice'
      FieldName = 'ItemPrice'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'Discount'
      FieldName = 'Discount'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'DiscountRatio'
      FieldName = 'DiscountRatio'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'NetPrice'
      FieldName = 'NetPrice'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'CostPrice'
      FieldName = 'CostPrice'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      FieldAlias = 'ItemUnitCode'
      FieldName = 'ItemUnitCode'
      FieldLength = 6
      DisplayWidth = 6
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'UnitTransValue'
      FieldName = 'UnitTransValue'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 17
    end
    object ppDBPipeline1ppField19: TppField
      FieldAlias = 'TrxDetailDescA'
      FieldName = 'TrxDetailDescA'
      FieldLength = 4000
      DisplayWidth = 4000
      Position = 18
    end
    object ppDBPipeline1ppField20: TppField
      FieldAlias = 'TrxDetailDescE'
      FieldName = 'TrxDetailDescE'
      FieldLength = 4000
      DisplayWidth = 4000
      Position = 19
    end
    object ppDBPipeline1ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'SourceDocLineNo'
      FieldName = 'SourceDocLineNo'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 20
    end
    object ppDBPipeline1ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TaxPercent'
      FieldName = 'TaxPercent'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 21
    end
    object ppDBPipeline1ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'TaxValue'
      FieldName = 'TaxValue'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 22
    end
    object ppDBPipeline1ppField24: TppField
      FieldAlias = 'SectionNameA'
      FieldName = 'SectionNameA'
      FieldLength = 75
      DisplayWidth = 75
      Position = 23
    end
    object ppDBPipeline1ppField25: TppField
      FieldAlias = 'SectionCode'
      FieldName = 'SectionCode'
      FieldLength = 6
      DisplayWidth = 6
      Position = 24
    end
    object ppDBPipeline1ppField26: TppField
      FieldAlias = 'SectionNameE'
      FieldName = 'SectionNameE'
      FieldLength = 75
      DisplayWidth = 75
      Position = 25
    end
    object ppDBPipeline1ppField27: TppField
      FieldAlias = 'PrinterPath'
      FieldName = 'PrinterPath'
      FieldLength = 200
      DisplayWidth = 200
      Position = 26
    end
    object ppDBPipeline1ppField28: TppField
      FieldAlias = 'ItemGroupNameAr'
      FieldName = 'ItemGroupNameAr'
      FieldLength = 255
      DisplayWidth = 255
      Position = 27
    end
    object ppDBPipeline1ppField29: TppField
      FieldAlias = 'ItemGroupNameEn'
      FieldName = 'ItemGroupNameEn'
      FieldLength = 255
      DisplayWidth = 255
      Position = 28
    end
    object ppDBPipeline1ppField30: TppField
      FieldAlias = 'ItemGroupCode'
      FieldName = 'ItemGroupCode'
      FieldLength = 6
      DisplayWidth = 6
      Position = 29
    end
    object ppDBPipeline1ppField31: TppField
      FieldAlias = 'ItemNameAr'
      FieldName = 'ItemNameAr'
      FieldLength = 255
      DisplayWidth = 255
      Position = 30
    end
    object ppDBPipeline1ppField32: TppField
      FieldAlias = 'ItemNameEn'
      FieldName = 'ItemNameEn'
      FieldLength = 255
      DisplayWidth = 255
      Position = 31
    end
  end
end

object fmBaseReports: TfmBaseReports
  Left = 130
  Top = 252
  BorderStyle = bsDialog
  Caption = #1575#1604#1578#1602#1575#1585#1610#1585
  ClientHeight = 321
  ClientWidth = 878
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 878
    Height = 321
    ActivePage = tsh_ItemCard
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabWidth = 280
    object tsh_ItemCard: TTabSheet
      Caption = #1578#1602#1585#1610#1585' '#1581#1585#1603#1577' '#1575#1604#1589#1606#1601
      object grpIncomeData: TGroupBox
        Left = 0
        Top = 0
        Width = 870
        Height = 290
        Align = alTop
        TabOrder = 0
        DesignSize = (
          870
          290)
        object Label4: TLabel
          Left = 786
          Top = 82
          Width = 48
          Height = 19
          Anchors = []
          Caption = #1605#1606' '#1578#1575#1585#1610#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 291
          Top = 78
          Width = 49
          Height = 19
          Anchors = []
          Caption = #1573#1604#1609' '#1578#1575#1585#1610#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 788
          Top = 131
          Width = 45
          Height = 19
          Anchors = []
          Caption = #1575#1604#1589#1606#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 291
          Top = 134
          Width = 43
          Height = 19
          Anchors = []
          Caption = #1575#1604#1606#1600#1600#1600#1600#1600#1608#1593
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnlTitle: TPanel
          Left = 2
          Top = 21
          Width = 866
          Height = 41
          Align = alTop
          Caption = #1578#1602#1600#1585#1610#1600#1600#1600#1585' '#1581#1600#1585#1603#1600#1600#1600#1600#1577' '#1575#1604#1589#1606#1600#1600#1600#1600#1601
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dt_ItemCardFromDate: TDateTimePicker
          Left = 568
          Top = 80
          Width = 186
          Height = 27
          BiDiMode = bdLeftToRight
          Date = 42846.739573414350000000
          Time = 42846.739573414350000000
          ParentBiDiMode = False
          TabOrder = 1
        end
        object dt_ItemCardtoDate: TDateTimePicker
          Left = 88
          Top = 80
          Width = 186
          Height = 27
          Date = 42846.739573414350000000
          Time = 42846.739573414350000000
          TabOrder = 2
        end
        object rg_AllItems: TRadioGroup
          Left = 571
          Top = 112
          Width = 185
          Height = 78
          BiDiMode = bdRightToLeft
          ItemIndex = 0
          Items.Strings = (
            #1603#1600#1600#1600#1604' '#1575#1604#1571#1589#1606#1600#1600#1600#1600#1575#1601
            #1589#1606#1600#1600#1601' '#1605#1581#1600#1600#1600#1583#1583)
          ParentBiDiMode = False
          TabOrder = 3
          OnClick = rg_AllItemsClick
        end
        object cbo_Item: TDBLookupComboBox
          Left = 572
          Top = 198
          Width = 184
          Height = 25
          BiDiMode = bdRightToLeft
          DataField = 'ItemCode'
          DataSource = DS_ItemCard
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          KeyField = 'ItemCode'
          ListField = 'ItemNameAr'
          ListSource = DS_Items
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnKeyDown = cbo_ItemKeyDown
        end
        object rg_ReportType: TRadioGroup
          Left = 83
          Top = 116
          Width = 190
          Height = 78
          BiDiMode = bdRightToLeft
          ItemIndex = 0
          Items.Strings = (
            #1578#1601#1589#1600#1610#1604#1600#1600#1600#1600#1610
            #1605#1604#1582#1600#1600#1600#1600#1600#1600#1600#1600#1600#1589)
          ParentBiDiMode = False
          TabOrder = 5
        end
        object GroupBox2: TGroupBox
          Left = 2
          Top = 231
          Width = 866
          Height = 57
          Align = alBottom
          TabOrder = 6
          object btnPrintItemCardReport: TButton
            Left = 524
            Top = 13
            Width = 159
            Height = 35
            Caption = #1591#1576#1600#1600#1600#1600#1600#1600#1600#1600#1575#1593#1577
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
            OnClick = btnPrintItemCardReportClick
          end
          object btnClose: TButton
            Left = 226
            Top = 13
            Width = 159
            Height = 35
            Caption = #1573#1594#1600#1600#1600#1600#1600#1600#1600#1600#1604#1575#1602
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 1
            OnClick = btnCloseClick
          end
        end
      end
    end
    object tsh_Sales: TTabSheet
      Caption = #1578#1602#1585#1610#1585' '#1575#1604#1605#1576#1610#1593#1575#1578
      ImageIndex = 1
      object grpSales: TGroupBox
        Left = 0
        Top = 0
        Width = 870
        Height = 288
        Align = alTop
        TabOrder = 0
        DesignSize = (
          870
          288)
        object Label5: TLabel
          Left = 778
          Top = 78
          Width = 48
          Height = 19
          Anchors = []
          Caption = #1605#1606' '#1578#1575#1585#1610#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 291
          Top = 80
          Width = 49
          Height = 19
          Anchors = []
          Caption = #1573#1604#1609' '#1578#1575#1585#1610#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 788
          Top = 131
          Width = 45
          Height = 19
          Anchors = []
          Caption = #1575#1604#1589#1606#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 291
          Top = 134
          Width = 43
          Height = 19
          Anchors = []
          Caption = #1575#1604#1606#1600#1600#1600#1600#1600#1608#1593
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel1: TPanel
          Left = 2
          Top = 21
          Width = 866
          Height = 41
          Align = alTop
          Caption = #1578#1602#1585#1610#1600#1600#1585' '#1575#1604#1605#1576#1610#1593#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1575#1578
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dt_SalesFromDate: TDateTimePicker
          Left = 568
          Top = 80
          Width = 186
          Height = 27
          Date = 42846.739573414350000000
          Time = 42846.739573414350000000
          TabOrder = 1
        end
        object dt_SalesToDate: TDateTimePicker
          Left = 88
          Top = 80
          Width = 186
          Height = 27
          Date = 42846.739573414350000000
          Time = 42846.739573414350000000
          TabOrder = 2
        end
        object GroupBox3: TGroupBox
          Left = 2
          Top = 229
          Width = 866
          Height = 57
          Align = alBottom
          TabOrder = 3
          object btnPrintSalesRepot: TButton
            Left = 524
            Top = 13
            Width = 159
            Height = 35
            Caption = #1591#1576#1600#1600#1600#1600#1600#1600#1600#1600#1575#1593#1577
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
            OnClick = btnPrintSalesRepotClick
          end
          object Button2: TButton
            Left = 226
            Top = 13
            Width = 159
            Height = 35
            Caption = #1573#1594#1600#1600#1600#1600#1600#1600#1600#1600#1604#1575#1602
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 1
            OnClick = btnCloseClick
          end
        end
        object rg_Sales_AllItems: TRadioGroup
          Left = 571
          Top = 112
          Width = 185
          Height = 78
          BiDiMode = bdRightToLeft
          ItemIndex = 0
          Items.Strings = (
            #1603#1600#1600#1600#1604' '#1575#1604#1571#1589#1606#1600#1600#1600#1600#1575#1601
            #1589#1606#1600#1600#1601' '#1605#1581#1600#1600#1600#1583#1583)
          ParentBiDiMode = False
          TabOrder = 4
          OnClick = rg_Sales_AllItemsClick
        end
        object cbo_Sales_Item: TDBLookupComboBox
          Left = 572
          Top = 198
          Width = 184
          Height = 25
          BiDiMode = bdRightToLeft
          DataField = 'ItemCode'
          DataSource = DS_ItemCard
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          KeyField = 'ItemCode'
          ListField = 'ItemNameAr'
          ListSource = DS_Items
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 5
          Visible = False
        end
        object rg_Sales_ReportType: TRadioGroup
          Left = 83
          Top = 116
          Width = 190
          Height = 78
          BiDiMode = bdRightToLeft
          ItemIndex = 0
          Items.Strings = (
            #1578#1601#1589#1600#1610#1604#1600#1600#1600#1600#1610
            #1605#1604#1582#1600#1600#1600#1600#1600#1600#1600#1600#1600#1589)
          ParentBiDiMode = False
          TabOrder = 6
        end
      end
    end
    object tsh_Purchases: TTabSheet
      Caption = #1578#1602#1585#1610#1585' '#1575#1604#1605#1588#1578#1585#1610#1575#1578
      ImageIndex = 2
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 870
        Height = 288
        Align = alTop
        TabOrder = 0
        DesignSize = (
          870
          288)
        object Label3: TLabel
          Left = 778
          Top = 78
          Width = 48
          Height = 19
          Anchors = []
          Caption = #1605#1606' '#1578#1575#1585#1610#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 291
          Top = 80
          Width = 49
          Height = 19
          Anchors = []
          Caption = #1573#1604#1609' '#1578#1575#1585#1610#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 788
          Top = 131
          Width = 45
          Height = 19
          Anchors = []
          Caption = #1575#1604#1589#1606#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 291
          Top = 134
          Width = 43
          Height = 19
          Anchors = []
          Caption = #1575#1604#1606#1600#1600#1600#1600#1600#1608#1593
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel2: TPanel
          Left = 2
          Top = 21
          Width = 866
          Height = 41
          Align = alTop
          Caption = #1578#1602#1585#1610#1600#1600#1585' '#1575#1604#1605#1588#1578#1585#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1575#1578
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dt_PurchaseFromDate: TDateTimePicker
          Left = 568
          Top = 80
          Width = 186
          Height = 27
          Date = 42846.739573414350000000
          Time = 42846.739573414350000000
          TabOrder = 1
        end
        object dt_PurchaseToDate: TDateTimePicker
          Left = 88
          Top = 80
          Width = 186
          Height = 27
          Date = 42846.739573414350000000
          Time = 42846.739573414350000000
          TabOrder = 2
        end
        object GroupBox4: TGroupBox
          Left = 2
          Top = 229
          Width = 866
          Height = 57
          Align = alBottom
          TabOrder = 3
          object btnPrintPurchaseRepot: TButton
            Left = 524
            Top = 13
            Width = 159
            Height = 35
            Caption = #1591#1576#1600#1600#1600#1600#1600#1600#1600#1600#1575#1593#1577
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
            OnClick = btnPrintPurchaseRepotClick
          end
          object Button3: TButton
            Left = 226
            Top = 13
            Width = 159
            Height = 35
            Caption = #1573#1594#1600#1600#1600#1600#1600#1600#1600#1600#1604#1575#1602
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 1
            OnClick = btnCloseClick
          end
        end
        object rg_Purchase_AllItems: TRadioGroup
          Left = 571
          Top = 112
          Width = 185
          Height = 78
          BiDiMode = bdRightToLeft
          ItemIndex = 0
          Items.Strings = (
            #1603#1600#1600#1600#1604' '#1575#1604#1571#1589#1606#1600#1600#1600#1600#1575#1601
            #1589#1606#1600#1600#1601' '#1605#1581#1600#1600#1600#1583#1583)
          ParentBiDiMode = False
          TabOrder = 4
          OnClick = rg_Purchase_AllItemsClick
        end
        object cbo_Purchase_Item: TDBLookupComboBox
          Left = 572
          Top = 198
          Width = 184
          Height = 25
          BiDiMode = bdRightToLeft
          DataField = 'ItemCode'
          DataSource = DS_ItemCard
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          KeyField = 'ItemCode'
          ListField = 'ItemNameAr'
          ListSource = DS_Items
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 5
          Visible = False
        end
        object rg_Purchase_ReportType: TRadioGroup
          Left = 83
          Top = 116
          Width = 190
          Height = 78
          BiDiMode = bdRightToLeft
          ItemIndex = 0
          Items.Strings = (
            #1578#1601#1589#1600#1610#1604#1600#1600#1600#1600#1610
            #1605#1604#1582#1600#1600#1600#1600#1600#1600#1600#1600#1600#1589)
          ParentBiDiMode = False
          TabOrder = 6
        end
      end
    end
  end
  object pp_ItemCard: TppReport
    AutoStop = False
    DataPipeline = PPL_ItemCard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'E:\Work\SVN\DelphiPOS\trunk\Code\Reports\sa_ItemCard.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 94
    Top = 1
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'PPL_ItemCard'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 100542
        mmTop = 14817
        mmWidth = 68263
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clWindow
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 97367
        mmTop = 16669
        mmWidth = 68263
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1578#1602#1600#1585#1610#1600#1600#1600#1600#1585' '#1581#1600#1600#1585#1603#1600#1600#1577' '#1575#1604#1589#1606#1600#1600#1600#1601' '#1578#1601#1589#1610#1604#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6646
        mmLeft = 97997
        mmTop = 18256
        mmWidth = 66411
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        Shape = stRoundRect
        mmHeight = 10054
        mmLeft = 3969
        mmTop = 0
        mmWidth = 261144
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 240507
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 215900
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 124354
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 84931
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 47361
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxDate'
        DataPipeline = PPL_ItemCard
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_ItemCard'
        mmHeight = 4233
        mmLeft = 216165
        mmTop = 3440
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxNo'
        DataPipeline = PPL_ItemCard
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_ItemCard'
        mmHeight = 4191
        mmLeft = 241036
        mmTop = 3175
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'InQty'
        DataPipeline = PPL_ItemCard
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_ItemCard'
        mmHeight = 4233
        mmLeft = 84931
        mmTop = 3175
        mmWidth = 38365
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'OutQty'
        DataPipeline = PPL_ItemCard
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_ItemCard'
        mmHeight = 4233
        mmLeft = 48419
        mmTop = 3440
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxDescA'
        DataPipeline = PPL_ItemCard
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PPL_ItemCard'
        mmHeight = 4233
        mmLeft = 125942
        mmTop = 3175
        mmWidth = 54504
        BandType = 4
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtDouble
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ResetComponent = ppGroup1
        ResetType = veGroupStart
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 2646
        mmWidth = 40481
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 182034
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxType'
        DataPipeline = PPL_ItemCard
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_ItemCard'
        mmHeight = 4233
        mmLeft = 182827
        mmTop = 3175
        mmWidth = 31750
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'ItemCode'
      DataPipeline = PPL_ItemCard
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PPL_ItemCard'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 21696
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'ItemNameAr'
          DataPipeline = PPL_ItemCard
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PPL_ItemCard'
          mmHeight = 5027
          mmLeft = 108744
          mmTop = 2646
          mmWidth = 127000
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = ': '#1575#1604#1589#1606#1600#1600#1600#1600#1600#1601' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 241036
          mmTop = 2381
          mmWidth = 17272
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          Shape = stRoundRect
          mmHeight = 10054
          mmLeft = 3969
          mmTop = 11642
          mmWidth = 261144
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1600#1600#1600#1600#1600#1600#1600#1600#1608#1575#1585#1583
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 88106
          mmTop = 14288
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1585#1602#1600#1600#1600#1605
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 242623
          mmTop = 14552
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1578#1600#1575#1585#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 217223
          mmTop = 14552
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1585#1589#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1583
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 7408
          mmTop = 14552
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 240507
          mmTop = 11906
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10319
          mmLeft = 215900
          mmTop = 11642
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 124354
          mmTop = 11906
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 84931
          mmTop = 11377
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 47361
          mmTop = 12171
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1608#1589#1600#1600#1600#1600#1600#1600#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 125942
          mmTop = 14817
          mmWidth = 52652
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1605#1606#1589#1600#1600#1600#1600#1600#1600#1600#1600#1585#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 50800
          mmTop = 14817
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line4'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 182034
          mmTop = 11906
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1606#1608#1593' '#1575#1604#1605#1593#1575#1605#1604#1600#1600#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 184415
          mmTop = 14288
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppVariable3: TppVariable
          UserName = 'Variable3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          BlankWhenZero = False
          CalcOrder = 0
          DataType = dtDouble
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetComponent = ppGroup1
          ResetType = veGroupStart
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 5821
          mmTop = 2910
          mmWidth = 40481
          BandType = 5
          GroupNo = 0
        end
        object ppLine21: TppLine
          UserName = 'Line3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 8731
          mmWidth = 266701
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'InQty'
          DataPipeline = PPL_ItemCard
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_ItemCard'
          mmHeight = 4233
          mmLeft = 85990
          mmTop = 2910
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'OutQty'
          DataPipeline = PPL_ItemCard
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_ItemCard'
          mmHeight = 4233
          mmLeft = 47890
          mmTop = 2646
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = ': '#1575#1604#1575#1580#1605#1600#1575#1604#1600#1600#1600#1600#1600#1600#1600#1610
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 127265
          mmTop = 2381
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365068670726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D202056616C7565202B205050
        4C5F4974656D436172645B27496E517479275D202D2050504C5F4974656D4361
        72645B274F7574517479275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506095661726961626C6531094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D6506105661726961626C65314F6E52657365740B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365068170
        726F636564757265205661726961626C65314F6E526573657428766172205661
        6C75653A2056617269616E74293B0D0A626567696E0D0A0D0A2020202056616C
        7565203A3D202050504C5F4974656D436172645B27496E517479275D202D2050
        504C5F4974656D436172645B274F7574517479275D3B0D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D6506095661726961626C6531094576656E744E
        616D6506074F6E5265736574074576656E74494402220001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D65060F5661726961626C6533
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F75726365068570726F636564757265205661726961626C65334F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D
        0A2056616C7565203A3D202056616C7565202B2050504C5F4974656D43617264
        5B27496E517479275D202D2050504C5F4974656D436172645B274F7574517479
        275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609566172
        6961626C6533094576656E744E616D6506064F6E43616C63074576656E744944
        02210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        6506105661726961626C65334F6E52657365740B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365068070726F6365647572652056
        61726961626C65334F6E5265736574287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D20202050504C5F
        4974656D436172645B27496E517479275D202D2050504C5F4974656D43617264
        5B274F7574517479275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506095661726961626C6533094576656E744E616D6506074F6E52657365
        74074576656E74494402220001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D650610444254657874354F6E476574546578740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636514160200
        0070726F63656475726520444254657874354F6E476574546578742876617220
        546578743A20537472696E67293B0D0A626567696E0D0A20204966202050504C
        5F4974656D436172645B2754727854797065275D203D20275052495627205468
        656E0D0A202054657874203A3D2027D981D8A7D8AAD988D8B1D8A920D985D8B4
        D8AAD8B1D98AD8A7D8AA270D0A2020656C73652020204966202050504C5F4974
        656D436172645B2754727854797065275D203D20274956424227205468656E0D
        0A202054657874203A3D202720D8B1D8B5D98AD8AF20D8A7D981D8AAD8AAD8A7
        D8ADD98A20270D0A2020656C73652020204966202050504C5F4974656D436172
        645B2754727854797065275D203D20275341495627205468656E0D0A20205465
        7874203A3D2027D981D8A7D8AAD988D8B1D8A920D985D8A8D98AD8B9D8A7D8AA
        270D0A2020656C73652020204966202050504C5F4974656D436172645B275472
        7854797065275D203D20275341525427205468656E0D0A202054657874203A3D
        2027D985D8B1D8AAD8ACD8B920D985D8A8D98AD8B9D8A7D8AA270D0A2020656C
        73652020204966202050504C5F4974656D436172645B2754727854797065275D
        203D20274956414427205468656E0D0A202054657874203A3D2027D8AAD8B3D9
        88D98AD8A920D985D8AED8B2D986D98AD8A920270D0A2020656C73650D0A2020
        54657874203A3D20272027203B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060744425465787435094576656E744E616D6506094F6E47657454
        657874074576656E74494402350000}
    end
    object ppParameterList2: TppParameterList
    end
  end
  object DS_ItemCard: TDataSource
    DataSet = qry_ItemCard
    Left = 32
  end
  object PPL_ItemCard: TppDBPipeline
    DataSource = DS_ItemCard
    UserName = 'PPL_ItemCard'
    Left = 62
    Top = 1
    object PPL_ItemCardppField1: TppField
      FieldAlias = 'CompanyCode'
      FieldName = 'CompanyCode'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object PPL_ItemCardppField2: TppField
      FieldAlias = 'BranchCode'
      FieldName = 'BranchCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object PPL_ItemCardppField3: TppField
      FieldAlias = 'TrxNo'
      FieldName = 'TrxNo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object PPL_ItemCardppField4: TppField
      FieldAlias = 'TrxType'
      FieldName = 'TrxType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 3
    end
    object PPL_ItemCardppField5: TppField
      FieldAlias = 'TrxDate'
      FieldName = 'TrxDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 4
    end
    object PPL_ItemCardppField6: TppField
      FieldAlias = 'TrxStatus'
      FieldName = 'TrxStatus'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object PPL_ItemCardppField7: TppField
      FieldAlias = 'TrxDescA'
      FieldName = 'TrxDescA'
      FieldLength = 4000
      DisplayWidth = 4000
      Position = 6
    end
    object PPL_ItemCardppField8: TppField
      FieldAlias = 'TrxDescE'
      FieldName = 'TrxDescE'
      FieldLength = 4000
      DisplayWidth = 4000
      Position = 7
    end
    object PPL_ItemCardppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrxAmount'
      FieldName = 'TrxAmount'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 8
    end
    object PPL_ItemCardppField10: TppField
      FieldAlias = 'Barcode'
      FieldName = 'Barcode'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object PPL_ItemCardppField11: TppField
      FieldAlias = 'ItemCode'
      FieldName = 'ItemCode'
      FieldLength = 25
      DisplayWidth = 25
      Position = 10
    end
    object PPL_ItemCardppField12: TppField
      FieldAlias = 'ItemService'
      FieldName = 'ItemService'
      FieldLength = 4
      DisplayWidth = 4
      Position = 11
    end
    object PPL_ItemCardppField13: TppField
      FieldAlias = 'ItemNameAr'
      FieldName = 'ItemNameAr'
      FieldLength = 255
      DisplayWidth = 255
      Position = 12
    end
    object PPL_ItemCardppField14: TppField
      FieldAlias = 'ItemNameEn'
      FieldName = 'ItemNameEn'
      FieldLength = 255
      DisplayWidth = 255
      Position = 13
    end
    object PPL_ItemCardppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'InQty'
      FieldName = 'InQty'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 14
    end
    object PPL_ItemCardppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'OutQty'
      FieldName = 'OutQty'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 15
    end
    object PPL_ItemCardppField17: TppField
      FieldAlias = 'ItemUnitCode'
      FieldName = 'ItemUnitCode'
      FieldLength = 6
      DisplayWidth = 6
      Position = 16
    end
    object PPL_ItemCardppField18: TppField
      FieldAlias = 'ItemUnitDescA'
      FieldName = 'ItemUnitDescA'
      FieldLength = 75
      DisplayWidth = 75
      Position = 17
    end
    object PPL_ItemCardppField19: TppField
      FieldAlias = 'ItemUnitDescE'
      FieldName = 'ItemUnitDescE'
      FieldLength = 75
      DisplayWidth = 75
      Position = 18
    end
    object PPL_ItemCardppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'UnitTransValue'
      FieldName = 'UnitTransValue'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 19
      Position = 19
    end
    object PPL_ItemCardppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrxOrder'
      FieldName = 'TrxOrder'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
  end
  object pp_Sales: TppReport
    AutoStop = False
    DataPipeline = PPL_Sales_Purchases
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'E:\Work\SVN\DelphiPOS\trunk\Code\Reports\sa_SalesReport.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 91
    Top = 35
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'PPL_Sales_Purchases'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 105040
        mmTop = 12435
        mmWidth = 68263
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape4'
        Brush.Color = clWindow
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 101865
        mmTop = 14288
        mmWidth = 68263
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1578#1602#1585#1610#1600#1600#1600#1585' '#1575#1604#1605#1576#1610#1593#1600#1600#1600#1600#1600#1600#1575#1578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 117740
        mmTop = 15875
        mmWidth = 36248
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'Shape3'
        Shape = stRoundRect
        mmHeight = 10054
        mmLeft = 3969
        mmTop = 0
        mmWidth = 261144
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 215900
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line15'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 124354
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line18'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 84931
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line19'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 47361
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Quantity'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 84931
        mmTop = 3175
        mmWidth = 38365
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemPrice'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 48419
        mmTop = 3440
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'NetPrice'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 3440
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemNameAr'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 5027
        mmLeft = 126471
        mmTop = 2646
        mmWidth = 87048
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemCode'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 217488
        mmTop = 3175
        mmWidth = 46302
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'TrxNo'
      DataPipeline = PPL_Sales_Purchases
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PPL_Sales_Purchases'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 32015
        mmPrintPosition = 0
        object ppShape8: TppShape
          UserName = 'Shape1'
          Shape = stRoundRect
          mmHeight = 10054
          mmLeft = 3969
          mmTop = 21696
          mmWidth = 261144
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1587#1600#1600#1600#1605' '#1575#1604#1589#1606#1600#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 126736
          mmTop = 24342
          mmWidth = 86519
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label7'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1603#1605#1610#1600#1600#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 88106
          mmTop = 24342
          mmWidth = 32544
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label8'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1585#1602#1600#1600#1600#1605
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 239978
          mmTop = 3969
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label9'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1578#1600#1575#1585#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 85725
          mmTop = 3175
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label10'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1589#1600#1575#1601#1600#1600#1600#1600#1600#1600#1600#1610
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 6879
          mmTop = 24606
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object ppLine20: TppLine
          UserName = 'Line2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10319
          mmLeft = 215900
          mmTop = 21696
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine22: TppLine
          UserName = 'Line5'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 124354
          mmTop = 21960
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine32: TppLine
          UserName = 'Line8'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 84931
          mmTop = 21431
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'Line9'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 47361
          mmTop = 22225
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1608#1589#1600#1600#1600#1600#1600#1600#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 238125
          mmTop = 13494
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label12'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1587#1593#1600#1600#1600#1600#1585
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 51065
          mmTop = 24871
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label11'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1606#1608#1593' '#1575#1604#1605#1593#1575#1605#1604#1600#1600#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 83608
          mmTop = 13494
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText1'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxNo'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 211138
          mmTop = 3704
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxDate'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 44450
          mmTop = 3969
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'DBText3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxDescA'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 116417
          mmTop = 14023
          mmWidth = 117740
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText5'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxType'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 44186
          mmTop = 14023
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1585#1605#1600#1600#1586' '#1575#1604#1589#1606#1600#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 220398
          mmTop = 24077
          mmWidth = 41275
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLine35: TppLine
          UserName = 'Line3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 8731
          mmWidth = 266701
          BandType = 5
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label17'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = ': '#1575#1604#1575#1580#1605#1600#1575#1604#1600#1600#1600#1600#1600#1600#1600#1610
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 50006
          mmTop = 794
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'NetPrice'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 6879
          mmTop = 1588
          mmWidth = 36248
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
        444254657874354F6E476574546578740B50726F6772616D54797065070B7474
        50726F63656475726506536F75726365147601000070726F6365647572652044
        4254657874354F6E476574546578742876617220546578743A20537472696E67
        293B0D0A626567696E0D0A20204966202050504C5F53616C65735F5075726368
        617365735B2754727854797065275D203D20275052495627205468656E0D0A20
        2054657874203A3D2027D981D8A7D8AAD988D8B1D8A920D985D8B4D8AAD8B1D9
        8AD8A7D8AA270D0A2020656C73652020204966202050504C5F53616C65735F50
        75726368617365735B2754727854797065275D203D2027534149562720546865
        6E0D0A202054657874203A3D2027D981D8A7D8AAD988D8B1D8A920D985D8A8D9
        8AD8B9D8A7D8AA270D0A2020656C73652020204966202050504C5F53616C6573
        5F5075726368617365735B2754727854797065275D203D202753415254272054
        68656E0D0A202054657874203A3D2027D985D8B1D8AAD8ACD8B920D985D8A8D9
        8AD8B9D8A7D8AA270D0A2020656C73650D0A202054657874203A3D2027202720
        3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506074442546578
        7435094576656E744E616D6506094F6E47657454657874074576656E74494402
        350000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qry_ItemCard: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 
      'Select * From'#13#10'('#13#10'SELECT     H.CompanyCode, H.BranchCode, H.TrxN' +
      'o, H.TrxType,  H.TrxDate, H.TrxStatus, H.TrxDescA, H.TrxDescE, H' +
      '.TrxAmount, D.Barcode, D.ItemCode, '#13#10'                      D.Ite' +
      'mService, I.ItemNameAr, I.ItemNameEn, Case When H.TrxType = '#39'SAR' +
      'T'#39' Then D.Quantity Else 0 End As InQty, '#13#10'                      ' +
      'Case When H.TrxType = '#39'SAIV'#39' Then D.Quantity Else 0 End As OutQt' +
      'y , D.ItemPrice, D.Discount, D.NetPrice, D.CostPrice, '#13#10'        ' +
      '              D.ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, ' +
      'D.UnitTransValue ,'#13#10'                      Case When H.TrxType = ' +
      #39'SART'#39' Then 0 Else 1 End As TrxOrder'#13#10'FROM         sa_POS_TrxHea' +
      'der AS H INNER JOIN'#13#10'                      sa_POS_TrxDetails AS ' +
      'D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCo' +
      'de AND H.TrxNo = D.TrxNo AND H.TrxType = D.TrxType AND '#13#10'       ' +
      '               H.YearID = D.YearID AND H.PeriodID = D.PeriodID L' +
      'EFT OUTER JOIN'#13#10'                      tbl_ItemUnit AS U ON D.Com' +
      'panyCode = U.CompanyCode AND D.ItemUnitCode = U.ItemUnitCode LEF' +
      'T OUTER JOIN'#13#10'                      tbl_ItemDefinition AS I ON D' +
      '.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService A' +
      'ND D.ItemCode = I.ItemCode'#13#10'Where  H.TrxType In ( '#39'SAIV'#39' , '#39'SART' +
      #39')'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT     H.CompanyCode, H.BranchCode, H.Trx' +
      'No, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescAr, H.TrxDescEn,' +
      ' H.TrxAmount, D.Barcode, D.ItemCode, '#13#10'                      D.I' +
      'temService, I.ItemNameAr, I.ItemNameEn, Case When H.TrxType In (' +
      #39'IVBB'#39' , '#39'PRIV'#39') Then D.Quantity Else 0 End As InQty, '#13#10'        ' +
      '              Case When H.TrxType = '#39'PRRT'#39' Then D.Quantity Else ' +
      '0 End As OutQty , D.CostPrice As ItemPrice, D.Discount, D.NetPri' +
      'ce, D.CostPrice, '#13#10'                      D.ItemUnit, U.ItemUnitD' +
      'escA, U.ItemUnitDescE, D.UnitTransValue ,'#13#10'                     ' +
      ' Case When H.TrxType In ('#39'IVBB'#39' , '#39'PRIV'#39') Then 0 Else 1 End As T' +
      'rxOrder'#13#10'FROM         tbl_PrTrxHeader AS H INNER JOIN'#13#10'         ' +
      '             tbl_PrTrxDetails AS D ON H.CompanyCode = D.CompanyC' +
      'ode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND H.' +
      'TrxType = D.TrxType  LEFT OUTER JOIN'#13#10'                      tbl_' +
      'ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnit = ' +
      'U.ItemUnitCode LEFT OUTER JOIN'#13#10'                      tbl_ItemDe' +
      'finition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService' +
      ' = I.ItemService AND D.ItemCode = I.ItemCode'#13#10'Where   H.TrxType ' +
      'In ('#39'IVBB'#39' , '#39'PRIV'#39' , '#39'PRRT'#39')'#13#10') RD'#13#10'Where companyCode = '#39'0001'#39' ' +
      'And BranchCode = '#39'0001'#39#13#10'Order By  TrxDate , TrxOrder ASC'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Top = 2
    object qry_ItemCardCompanyCode: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object qry_ItemCardBranchCode: TStringField
      FieldName = 'BranchCode'
      Required = True
      Size = 4
    end
    object qry_ItemCardTrxNo: TStringField
      FieldName = 'TrxNo'
      Required = True
      Size = 10
    end
    object qry_ItemCardTrxType: TStringField
      FieldName = 'TrxType'
      Required = True
      Size = 4
    end
    object qry_ItemCardTrxDate: TSQLTimeStampField
      FieldName = 'TrxDate'
    end
    object qry_ItemCardTrxStatus: TStringField
      FieldName = 'TrxStatus'
      FixedChar = True
      Size = 1
    end
    object qry_ItemCardTrxDescA: TStringField
      FieldName = 'TrxDescA'
      Size = 4000
    end
    object qry_ItemCardTrxDescE: TStringField
      FieldName = 'TrxDescE'
      Size = 4000
    end
    object qry_ItemCardTrxAmount: TFMTBCDField
      FieldName = 'TrxAmount'
      Precision = 18
      Size = 8
    end
    object qry_ItemCardBarcode: TStringField
      FieldName = 'Barcode'
      Size = 30
    end
    object qry_ItemCardItemCode: TStringField
      FieldName = 'ItemCode'
      Size = 25
    end
    object qry_ItemCardItemService: TStringField
      FieldName = 'ItemService'
      Size = 4
    end
    object qry_ItemCardItemNameAr: TStringField
      FieldName = 'ItemNameAr'
      Size = 255
    end
    object qry_ItemCardItemNameEn: TStringField
      FieldName = 'ItemNameEn'
      Size = 255
    end
    object qry_ItemCardInQty: TFMTBCDField
      FieldName = 'InQty'
      Precision = 18
      Size = 8
    end
    object qry_ItemCardOutQty: TFMTBCDField
      FieldName = 'OutQty'
      Precision = 18
      Size = 8
    end
    object qry_ItemCardItemUnitCode: TStringField
      FieldName = 'ItemUnitCode'
      Size = 6
    end
    object qry_ItemCardItemUnitDescA: TStringField
      FieldName = 'ItemUnitDescA'
      Size = 75
    end
    object qry_ItemCardItemUnitDescE: TStringField
      FieldName = 'ItemUnitDescE'
      Size = 75
    end
    object qry_ItemCardUnitTransValue: TFMTBCDField
      FieldName = 'UnitTransValue'
      Precision = 18
      Size = 8
    end
    object qry_ItemCardTrxOrder: TIntegerField
      FieldName = 'TrxOrder'
      Required = True
    end
  end
  object qry_Items: TSimpleDataSet
    Tag = 1
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.SchemaName = 'dbo'
    DataSet.CommandText = 
      'Select ItemCode, ItemService, ItemNameAr, ItemNameEn, ItemUnitCo' +
      'de'#13#10'From   tbl_ItemDefinition'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 2
    Top = 204
    object qry_ItemsItemService: TStringField
      FieldName = 'ItemService'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qry_ItemsItemCode: TStringField
      Tag = 1
      DisplayLabel = 'Code'
      FieldName = 'ItemCode'
      Origin = #1575#1604#1585#1605#1586
      Required = True
    end
    object qry_ItemsItemNameAr: TStringField
      FieldName = 'ItemNameAr'
      Size = 255
    end
    object qry_ItemsItemNameEn: TStringField
      FieldName = 'ItemNameEn'
      Size = 255
    end
    object qry_ItemsItemUnitCode: TStringField
      FieldName = 'ItemUnitCode'
      Size = 6
    end
  end
  object DS_Items: TDataSource
    DataSet = qry_Items
    Left = 32
    Top = 204
  end
  object pp_ItemCard_Summary: TppReport
    AutoStop = False
    DataPipeline = PPL_ItemCard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'E:\Work\SVN\DelphiPOS\trunk\Code\Reports\sa_ItemCard_Summary.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 118
    Top = 65533
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'PPL_ItemCard'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36777
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'Shape1'
        Shape = stRoundRect
        mmHeight = 10054
        mmLeft = 3704
        mmTop = 26194
        mmWidth = 197380
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 66411
        mmTop = 9790
        mmWidth = 68263
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape4'
        Brush.Color = clWindow
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 63236
        mmTop = 11642
        mmWidth = 68263
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1578#1602#1600#1585#1610#1600#1600#1600#1600#1585' '#1581#1600#1585#1603#1600#1600#1577' '#1575#1604#1589#1606#1600#1600#1600#1601' '#1605#1604#1582#1600#1589
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6646
        mmLeft = 65073
        mmTop = 13229
        mmWidth = 62738
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label7'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ' '#1573#1580#1605#1575#1604#1610' '#1575#1604#1600#1600#1600#1600#1600#1600#1600#1600#1608#1575#1585#1583
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 68527
        mmTop = 28840
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label10'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1575#1604#1585#1589#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1583
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 5292
        mmTop = 29104
        mmWidth = 28575
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 100277
        mmTop = 26458
        mmWidth = 794
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 66411
        mmTop = 26194
        mmWidth = 794
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 35983
        mmTop = 26194
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1573#1580#1605#1575#1604#1610' '#1575#1604#1605#1606#1589#1600#1600#1600#1600#1600#1585#1601
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 37465
        mmTop = 29369
        mmWidth = 27728
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ' '#1575#1604#1589#1606#1600#1600#1600#1600#1600#1601' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 101336
        mmTop = 28840
        mmWidth = 95250
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'Line15'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 100542
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line18'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 66675
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine28: TppLine
        UserName = 'Line19'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 36248
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'InQty'
        DataPipeline = PPL_ItemCard
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_ItemCard'
        mmHeight = 4233
        mmLeft = 67998
        mmTop = 3175
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'OutQty'
        DataPipeline = PPL_ItemCard
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_ItemCard'
        mmHeight = 4233
        mmLeft = 37835
        mmTop = 3440
        mmWidth = 27781
        BandType = 4
      end
      object ppVariable5: TppVariable
        UserName = 'Variable1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtDouble
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ResetComponent = ppGroup3
        ResetType = veGroupStart
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 2646
        mmWidth = 31485
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
    end
    object ppGroup3: TppGroup
      BreakName = 'ItemCode'
      DataPipeline = PPL_ItemCard
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PPL_ItemCard'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppShape12: TppShape
          UserName = 'Shape3'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 3704
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppVariable6: TppVariable
          UserName = 'Variable3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          BlankWhenZero = False
          CalcOrder = 0
          DataType = dtDouble
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetComponent = ppGroup3
          ResetType = veGroupStart
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 3969
          mmTop = 2381
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc1'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'InQty'
          DataPipeline = PPL_ItemCard
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_ItemCard'
          mmHeight = 4233
          mmLeft = 69056
          mmTop = 2117
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'OutQty'
          DataPipeline = PPL_ItemCard
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_ItemCard'
          mmHeight = 4233
          mmLeft = 37306
          mmTop = 2117
          mmWidth = 28310
          BandType = 5
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText4'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'ItemNameAr'
          DataPipeline = PPL_ItemCard
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PPL_ItemCard'
          mmHeight = 5027
          mmLeft = 102394
          mmTop = 1852
          mmWidth = 94986
          BandType = 5
          GroupNo = 0
        end
        object ppLine29: TppLine
          UserName = 'Line13'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8731
          mmLeft = 100277
          mmTop = 0
          mmWidth = 3440
          BandType = 5
          GroupNo = 0
        end
        object ppLine30: TppLine
          UserName = 'Line14'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8731
          mmLeft = 66411
          mmTop = 0
          mmWidth = 3440
          BandType = 5
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'Line22'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 8731
          mmLeft = 35983
          mmTop = 0
          mmWidth = 3440
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule3: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365068670726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D202056616C7565202B205050
        4C5F4974656D436172645B27496E517479275D202D2050504C5F4974656D4361
        72645B274F7574517479275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506095661726961626C6531094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D6506105661726961626C65314F6E52657365740B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365068170
        726F636564757265205661726961626C65314F6E526573657428766172205661
        6C75653A2056617269616E74293B0D0A626567696E0D0A0D0A2020202056616C
        7565203A3D202050504C5F4974656D436172645B27496E517479275D202D2050
        504C5F4974656D436172645B274F7574517479275D3B0D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D6506095661726961626C6531094576656E744E
        616D6506074F6E5265736574074576656E74494402220001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D65060F5661726961626C6533
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F75726365068570726F636564757265205661726961626C65334F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D
        0A2056616C7565203A3D202056616C7565202B2050504C5F4974656D43617264
        5B27496E517479275D202D2050504C5F4974656D436172645B274F7574517479
        275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609566172
        6961626C6533094576656E744E616D6506064F6E43616C63074576656E744944
        02210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        6506105661726961626C65334F6E52657365740B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365068070726F6365647572652056
        61726961626C65334F6E5265736574287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D20202050504C5F
        4974656D436172645B27496E517479275D202D2050504C5F4974656D43617264
        5B274F7574517479275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506095661726961626C6533094576656E744E616D6506074F6E52657365
        74074576656E74494402220000}
    end
    object ppParameterList3: TppParameterList
    end
  end
  object qry_Sales_Purchases: TSimpleDataSet
    Aggregates = <>
    Connection = fmMainForm.MainConnection
    DataSet.CommandText = 
      'SELECT     CompanyCode, BranchCode, TrxNo, TrxType, TrxDate, Trx' +
      'Status, TrxDescA, TrxDescE, TrxAmount, Cash, ATM, Visa, Checks, ' +
      'Credit, Barcode, ItemCode, ItemService, ItemNameAr, ItemNameEn, ' +
      #13#10'                      ItemUnitCode, ItemUnitDescA, ItemUnitDes' +
      'cE, UnitTransValue, TrxOrder, Quantity, ItemPrice, Discount, Net' +
      'Price'#13#10'FROM         (SELECT     H.CompanyCode, H.BranchCode, H.T' +
      'rxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescA, H.TrxDescE,' +
      ' H.TrxAmount, D.Barcode, D.ItemCode, '#13#10'                         ' +
      '                     D.ItemService, I.ItemNameAr, I.ItemNameEn, ' +
      'D.ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransVal' +
      'ue, '#13#10'                                              CASE WHEN H.' +
      'TrxType = '#39'SART'#39' THEN 0 ELSE 1 END AS TrxOrder, D.Quantity, D.It' +
      'emPrice, D.Discount, D.NetPrice , H.Cash, H.ATM, H.Visa, H.Check' +
      's, '#13#10'                                              H.Credit'#13#10'   ' +
      '                     FROM         sa_POS_TrxHeader AS H INNER JO' +
      'IN'#13#10'                                              sa_POS_TrxDeta' +
      'ils AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.B' +
      'ranchCode AND H.TrxNo = D.TrxNo AND '#13#10'                          ' +
      '                    H.TrxType = D.TrxType AND H.YearID = D.YearI' +
      'D AND H.PeriodID = D.PeriodID LEFT OUTER JOIN'#13#10'                 ' +
      '                             tbl_ItemUnit AS U ON D.CompanyCode ' +
      '= U.CompanyCode AND D.ItemUnitCode = U.ItemUnitCode LEFT OUTER J' +
      'OIN'#13#10'                                              tbl_ItemDefin' +
      'ition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = ' +
      'I.ItemService AND D.ItemCode = I.ItemCode'#13#10'                     ' +
      '   WHERE     (H.TrxType IN ('#39'SAIV'#39', '#39'SART'#39'))'#13#10'                  ' +
      '      UNION ALL'#13#10'                        SELECT     H.CompanyCod' +
      'e, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.T' +
      'rxDescAr, H.TrxDescEn, H.TrxAmount, D.BarCode, D.ItemCode, '#13#10'   ' +
      '                                           D.ItemService, I.Item' +
      'NameAr, I.ItemNameEn, D.ItemUnit, U.ItemUnitDescA, U.ItemUnitDes' +
      'cE, D.UnitTransValue, CASE WHEN H.TrxType IN ('#39'IVBB'#39', '#39'PRIV'#39') '#13#10 +
      '                                              THEN 0 ELSE 1 END ' +
      'AS TrxOrder, D.Quantity, D.CostPrice, D.Discount, D.NetPrice , N' +
      'ULL AS Cash, NULL AS ATM, NULL AS Visa, NULL AS Checks, NULL '#13#10' ' +
      '                                             AS Credit'#13#10'        ' +
      '                FROM         tbl_PrTrxHeader AS H INNER JOIN'#13#10'  ' +
      '                                            tbl_PrTrxDetails AS ' +
      'D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCo' +
      'de AND H.TrxNo = D.TrxNo AND '#13#10'                                 ' +
      '             H.TrxType = D.TrxType LEFT OUTER JOIN'#13#10'            ' +
      '                                  tbl_ItemUnit AS U ON D.Company' +
      'Code = U.CompanyCode AND D.ItemUnit = U.ItemUnitCode LEFT OUTER ' +
      'JOIN'#13#10'                                              tbl_ItemDefi' +
      'nition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService =' +
      ' I.ItemService AND D.ItemCode = I.ItemCode'#13#10'                    ' +
      '    WHERE     (H.TrxType IN ('#39'IVBB'#39', '#39'PRIV'#39', '#39'PRRT'#39'))) AS RD_Tra' +
      'ns'#13#10'WHERE     (CompanyCode = '#39'0001'#39') AND (BranchCode = '#39'0001'#39') A' +
      'ND (TrxDate >= '#39'01/01/2017'#39') AND (TrxDate <= '#39'04/28/2017'#39')'#13#10'ORDE' +
      'R BY TrxDate, TrxOrder'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Top = 34
    object StringField1: TStringField
      FieldName = 'CompanyCode'
      Required = True
      Size = 4
    end
    object StringField2: TStringField
      FieldName = 'BranchCode'
      Required = True
      Size = 4
    end
    object StringField3: TStringField
      FieldName = 'TrxNo'
      Required = True
      Size = 10
    end
    object StringField4: TStringField
      FieldName = 'TrxType'
      Required = True
      Size = 4
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'TrxDate'
    end
    object StringField5: TStringField
      FieldName = 'TrxStatus'
      FixedChar = True
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'TrxDescA'
      Size = 4000
    end
    object StringField7: TStringField
      FieldName = 'TrxDescE'
      Size = 4000
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'TrxAmount'
      Precision = 18
      Size = 8
    end
    object StringField8: TStringField
      FieldName = 'Barcode'
      Size = 30
    end
    object StringField9: TStringField
      FieldName = 'ItemCode'
      Size = 25
    end
    object StringField10: TStringField
      FieldName = 'ItemService'
      Size = 4
    end
    object StringField11: TStringField
      FieldName = 'ItemNameAr'
      Size = 255
    end
    object StringField12: TStringField
      FieldName = 'ItemNameEn'
      Size = 255
    end
    object StringField13: TStringField
      FieldName = 'ItemUnitCode'
      Size = 6
    end
    object StringField14: TStringField
      FieldName = 'ItemUnitDescA'
      Size = 75
    end
    object StringField15: TStringField
      FieldName = 'ItemUnitDescE'
      Size = 75
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'UnitTransValue'
      Precision = 18
      Size = 8
    end
    object qry_Sales_PurchasesQuantity: TFMTBCDField
      FieldName = 'Quantity'
      Precision = 18
      Size = 8
    end
    object qry_Sales_PurchasesItemPrice: TFMTBCDField
      FieldName = 'ItemPrice'
      Precision = 18
      Size = 8
    end
    object qry_Sales_PurchasesDiscount: TFMTBCDField
      FieldName = 'Discount'
      Precision = 18
      Size = 8
    end
    object qry_Sales_PurchasesNetPrice: TFMTBCDField
      FieldName = 'NetPrice'
      Precision = 18
      Size = 8
    end
    object IntegerField1: TIntegerField
      FieldName = 'TrxOrder'
      Required = True
    end
    object qry_Sales_PurchasesCash: TFMTBCDField
      FieldName = 'Cash'
      Precision = 18
      Size = 8
    end
    object qry_Sales_PurchasesATM: TFMTBCDField
      FieldName = 'ATM'
      Precision = 18
      Size = 8
    end
    object qry_Sales_PurchasesVisa: TFMTBCDField
      FieldName = 'Visa'
      Precision = 18
      Size = 8
    end
    object qry_Sales_PurchasesChecks: TFMTBCDField
      FieldName = 'Checks'
      Precision = 18
      Size = 8
    end
    object qry_Sales_PurchasesCredit: TFMTBCDField
      FieldName = 'Credit'
      Precision = 18
      Size = 8
    end
  end
  object DS_Sales_Purchases: TDataSource
    DataSet = qry_Sales_Purchases
    Left = 32
    Top = 40
  end
  object PPL_Sales_Purchases: TppDBPipeline
    DataSource = DS_Sales_Purchases
    UserName = 'PPL_Sales_Purchases'
    Left = 62
    Top = 41
  end
  object pp_Sales_Summary: TppReport
    AutoStop = False
    DataPipeline = PPL_Sales_Purchases
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
    Template.FileName = 
      'E:\Work\SVN\DelphiPOS\trunk\Code\Reports\sa_SalesReport_Summary.' +
      'rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 123
    Top = 35
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'PPL_Sales_Purchases'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36248
      mmPrintPosition = 0
      object ppShape13: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 64294
        mmTop = 10054
        mmWidth = 78581
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape4'
        Brush.Color = clWindow
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 61119
        mmTop = 11906
        mmWidth = 78581
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1578#1602#1585#1610#1600#1600#1600#1585' '#1575#1604#1605#1576#1610#1593#1600#1600#1600#1600#1600#1600#1575#1578' '#1575#1604#1610#1608#1605#1610#1600#1600#1577' '#1605#1604#1582#1600#1600#1589
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 60590
        mmTop = 13494
        mmWidth = 78317
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape1'
        Shape = stRoundRect
        mmHeight = 10054
        mmLeft = 265
        mmTop = 26194
        mmWidth = 200819
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1575#1604#1578#1600#1575#1585#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1582
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 171186
        mmTop = 28840
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label10'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1575#1604#1575#1580#1605#1575#1604#1600#1600#1600#1600#1600#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1588
        mmTop = 29104
        mmWidth = 28310
        BandType = 0
      end
      object ppLine39: TppLine
        UserName = 'Line9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 57415
        mmTop = 26458
        mmWidth = 1852
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 111654
        mmTop = 26458
        mmWidth = 1852
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 169069
        mmTop = 26458
        mmWidth = 1852
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 140494
        mmTop = 26458
        mmWidth = 1852
        BandType = 0
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 29898
        mmTop = 26458
        mmWidth = 1852
        BandType = 0
      end
      object ppLine43: TppLine
        UserName = 'Line43'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 84402
        mmTop = 26458
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1606#1602#1600#1600#1600#1583#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 142082
        mmTop = 28575
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1588#1576#1603#1600#1600#1577' '#1587#1593#1600#1600#1608#1583#1610#1577
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 112977
        mmTop = 29104
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1601#1610#1600#1600#1600#1586#1575
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 84931
        mmTop = 29104
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1588#1610#1600#1600#1600#1600#1603
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 57679
        mmTop = 28840
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1570#1580#1600#1600#1600#1600#1600#1604
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 30427
        mmTop = 29104
        mmWidth = 26723
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxAmount'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 5027
        mmLeft = 2381
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText201'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Cash'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 5027
        mmLeft = 143934
        mmTop = 265
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ATM'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 5027
        mmLeft = 115623
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Visa'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 5027
        mmLeft = 86254
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Checks'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 5027
        mmLeft = 59267
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Credit'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 5027
        mmLeft = 33338
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppLine40: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 8996
        mmWidth = 203200
        BandType = 7
      end
      object ppLabel37: TppLabel
        UserName = 'Label17'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = ': '#1575#1604#1575#1580#1605#1600#1575#1604#1600#1600#1600#1600#1600#1600#1600#1610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 172509
        mmTop = 794
        mmWidth = 23283
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxAmount'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 1852
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Credit'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 30427
        mmTop = 1852
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Checks'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 57679
        mmTop = 1852
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Visa'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 1852
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ATM'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 112448
        mmTop = 1852
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Cash'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 141817
        mmTop = 1852
        mmWidth = 27252
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'TrxDate'
      DataPipeline = PPL_Sales_Purchases
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PPL_Sales_Purchases'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppShape15: TppShape
          UserName = 'Shape3'
          Shape = stRoundRect
          mmHeight = 10054
          mmLeft = 265
          mmTop = 0
          mmWidth = 200819
          BandType = 5
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'DBText2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxDate'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 5027
          mmLeft = 171186
          mmTop = 2910
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line1'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 57415
          mmTop = 0
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxAmount'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4763
          mmLeft = 1588
          mmTop = 2646
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppLine17: TppLine
          UserName = 'Line17'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 111654
          mmTop = 0
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object ppLine36: TppLine
          UserName = 'Line36'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 169069
          mmTop = 0
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object ppLine38: TppLine
          UserName = 'Line38'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 140494
          mmTop = 0
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object ppLine42: TppLine
          UserName = 'Line42'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 29898
          mmTop = 0
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'Line44'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 84402
          mmTop = 0
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'Credit'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4763
          mmLeft = 30427
          mmTop = 2646
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'Checks'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4763
          mmLeft = 57679
          mmTop = 2646
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc101'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'Visa'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4763
          mmLeft = 84667
          mmTop = 2646
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'ATM'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4763
          mmLeft = 112448
          mmTop = 2646
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'Cash'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4763
          mmLeft = 141817
          mmTop = 2646
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule4: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList4: TppParameterList
    end
  end
  object pp_Purchases: TppReport
    AutoStop = False
    DataPipeline = PPL_Sales_Purchases
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'E:\Work\SVN\DelphiPOS\trunk\Code\Reports\pr_PurchasesReport.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 155
    Top = 35
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'PPL_Sales_Purchases'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppShape17: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 105040
        mmTop = 12435
        mmWidth = 68263
        BandType = 0
      end
      object ppShape18: TppShape
        UserName = 'Shape4'
        Brush.Color = clWindow
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 101865
        mmTop = 14288
        mmWidth = 68263
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1578#1602#1585#1610#1600#1600#1600#1585' '#1575#1604#1605#1588#1600#1578#1585#1610#1600#1600#1600#1600#1600#1600#1575#1578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6646
        mmLeft = 115314
        mmTop = 15875
        mmWidth = 43127
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppShape19: TppShape
        UserName = 'Shape3'
        Shape = stRoundRect
        mmHeight = 10054
        mmLeft = 3969
        mmTop = 0
        mmWidth = 261144
        BandType = 4
      end
      object ppLine45: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 215900
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine46: TppLine
        UserName = 'Line15'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 124354
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine47: TppLine
        UserName = 'Line18'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 84931
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine48: TppLine
        UserName = 'Line19'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 47361
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Quantity'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 84931
        mmTop = 3175
        mmWidth = 38365
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemPrice'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 48419
        mmTop = 3440
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText18'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'NetPrice'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 3440
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemNameAr'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 5027
        mmLeft = 126471
        mmTop = 2646
        mmWidth = 87048
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText19'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemCode'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 217488
        mmTop = 3175
        mmWidth = 46302
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
    end
    object ppGroup5: TppGroup
      BreakName = 'TrxNo'
      DataPipeline = PPL_Sales_Purchases
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PPL_Sales_Purchases'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 32015
        mmPrintPosition = 0
        object ppShape20: TppShape
          UserName = 'Shape1'
          Shape = stRoundRect
          mmHeight = 10054
          mmLeft = 3969
          mmTop = 21696
          mmWidth = 261144
          BandType = 3
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'Label3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1587#1600#1600#1600#1605' '#1575#1604#1589#1606#1600#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 126736
          mmTop = 24342
          mmWidth = 86519
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'Label7'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1603#1605#1610#1600#1600#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 88106
          mmTop = 24342
          mmWidth = 32544
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'Label8'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1585#1602#1600#1600#1600#1605
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 239978
          mmTop = 3969
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'Label9'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1578#1600#1575#1585#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 85725
          mmTop = 3175
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'Label10'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1589#1600#1575#1601#1600#1600#1600#1600#1600#1600#1600#1610
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 6879
          mmTop = 24606
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object ppLine49: TppLine
          UserName = 'Line2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10319
          mmLeft = 215900
          mmTop = 21696
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine50: TppLine
          UserName = 'Line5'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 124354
          mmTop = 21960
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine51: TppLine
          UserName = 'Line8'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 84931
          mmTop = 21431
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine52: TppLine
          UserName = 'Line9'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 47361
          mmTop = 22225
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'Label2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1608#1589#1600#1600#1600#1600#1600#1600#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 238125
          mmTop = 13494
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'Label12'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1587#1593#1600#1600#1600#1600#1585
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 51065
          mmTop = 24871
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'Label11'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1606#1608#1593' '#1575#1604#1605#1593#1575#1605#1604#1600#1600#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 83608
          mmTop = 13494
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'DBText1'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxNo'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 211138
          mmTop = 3704
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'DBText2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxDate'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 44450
          mmTop = 3969
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
        end
        object ppDBText34: TppDBText
          UserName = 'DBText3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxDescA'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 116417
          mmTop = 14023
          mmWidth = 117740
          BandType = 3
          GroupNo = 0
        end
        object ppDBText35: TppDBText
          UserName = 'DBText5'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxType'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 44186
          mmTop = 14023
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label26'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1585#1605#1600#1600#1586' '#1575#1604#1589#1606#1600#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 220398
          mmTop = 24077
          mmWidth = 41275
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLine53: TppLine
          UserName = 'Line3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 8731
          mmWidth = 266701
          BandType = 5
          GroupNo = 0
        end
        object ppLabel46: TppLabel
          UserName = 'Label17'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = ': '#1575#1604#1575#1580#1605#1600#1575#1604#1600#1600#1600#1600#1600#1600#1600#1610
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 50006
          mmTop = 794
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'NetPrice'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 6879
          mmTop = 1588
          mmWidth = 36248
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule5: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
        444254657874354F6E476574546578740B50726F6772616D54797065070B7474
        50726F63656475726506536F75726365147601000070726F6365647572652044
        4254657874354F6E476574546578742876617220546578743A20537472696E67
        293B0D0A626567696E0D0A20204966202050504C5F53616C65735F5075726368
        617365735B2754727854797065275D203D20275052495627205468656E0D0A20
        2054657874203A3D2027D981D8A7D8AAD988D8B1D8A920D985D8B4D8AAD8B1D9
        8AD8A7D8AA270D0A2020656C73652020204966202050504C5F53616C65735F50
        75726368617365735B2754727854797065275D203D2027534149562720546865
        6E0D0A202054657874203A3D2027D981D8A7D8AAD988D8B1D8A920D985D8A8D9
        8AD8B9D8A7D8AA270D0A2020656C73652020204966202050504C5F53616C6573
        5F5075726368617365735B2754727854797065275D203D202753415254272054
        68656E0D0A202054657874203A3D2027D985D8B1D8AAD8ACD8B920D985D8A8D9
        8AD8B9D8A7D8AA270D0A2020656C73650D0A202054657874203A3D2027202720
        3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506074442546578
        7435094576656E744E616D6506094F6E47657454657874074576656E74494402
        350000}
    end
    object ppParameterList5: TppParameterList
    end
  end
  object pp_Purchases_Summary: TppReport
    AutoStop = False
    DataPipeline = PPL_Sales_Purchases
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'E:\Work\SVN\DelphiPOS\trunk\Code\Reports\pr_PurchasesReport_Summ' +
      'ary.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 187
    Top = 35
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'PPL_Sales_Purchases'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppShape21: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 63236
        mmTop = 12171
        mmWidth = 68263
        BandType = 0
      end
      object ppShape22: TppShape
        UserName = 'Shape4'
        Brush.Color = clWindow
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 60061
        mmTop = 14023
        mmWidth = 68263
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = #1578#1602#1585#1610#1600#1600#1600#1585' '#1575#1604#1605#1588#1600#1578#1585#1610#1600#1600#1600#1600#1600#1600#1575#1578' '#1605#1604#1582#1600#1600#1589
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 65617
        mmTop = 15610
        mmWidth = 59002
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppShape23: TppShape
        UserName = 'Shape3'
        Shape = stRoundRect
        mmHeight = 10054
        mmLeft = 5821
        mmTop = 0
        mmWidth = 179652
        BandType = 4
      end
      object ppLine54: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 156104
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine55: TppLine
        UserName = 'Line15'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 89959
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine56: TppLine
        UserName = 'Line18'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 65088
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine57: TppLine
        UserName = 'Line19'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 35719
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Quantity'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 65617
        mmTop = 3175
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'ItemPrice'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 36777
        mmTop = 3440
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText18'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'NetPrice'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 3440
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxDate'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 130704
        mmTop = 3175
        mmWidth = 24342
        BandType = 4
      end
      object ppLine64: TppLine
        UserName = 'Line64'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 129646
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxNo'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 158486
        mmTop = 3440
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TrxDescA'
        DataPipeline = PPL_Sales_Purchases
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PPL_Sales_Purchases'
        mmHeight = 4233
        mmLeft = 91281
        mmTop = 3440
        mmWidth = 38365
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object ppSummaryBand6: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
    end
    object ppGroup6: TppGroup
      BreakName = 'ItemCode'
      DataPipeline = PPL_Sales_Purchases
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PPL_Sales_Purchases'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 26988
        mmPrintPosition = 0
        object ppShape24: TppShape
          UserName = 'Shape1'
          Shape = stRoundRect
          mmHeight = 10054
          mmLeft = 5821
          mmTop = 16669
          mmWidth = 179652
          BandType = 3
          GroupNo = 0
        end
        object ppLabel49: TppLabel
          UserName = 'Label7'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1603#1605#1610#1600#1600#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 68792
          mmTop = 19315
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel50: TppLabel
          UserName = 'Label8'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1585#1602#1600#1600#1600#1605
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 158750
          mmTop = 19844
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppLabel51: TppLabel
          UserName = 'Label9'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1578#1600#1575#1585#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1582
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 131763
          mmTop = 20108
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppLabel52: TppLabel
          UserName = 'Label10'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1589#1600#1575#1601#1600#1600#1600#1600#1600#1600#1600#1610
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 6350
          mmTop = 19579
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppLine58: TppLine
          UserName = 'Line2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10319
          mmLeft = 156104
          mmTop = 16669
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine59: TppLine
          UserName = 'Line5'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 89959
          mmTop = 17198
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine60: TppLine
          UserName = 'Line8'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 65088
          mmTop = 16404
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine61: TppLine
          UserName = 'Line9'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 35719
          mmTop = 17198
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLabel53: TppLabel
          UserName = 'Label2'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1608#1589#1600#1600#1600#1600#1600#1600#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 94192
          mmTop = 19315
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object ppLabel54: TppLabel
          UserName = 'Label12'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1604#1587#1593#1600#1600#1600#1600#1585
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 39423
          mmTop = 19844
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'Label11'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1606#1608#1593' '#1575#1604#1605#1593#1575#1605#1604#1600#1600#1577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 157957
          mmTop = 9525
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object ppDBText44: TppDBText
          UserName = 'DBText5'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'TrxType'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 118269
          mmTop = 10054
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object ppLine63: TppLine
          UserName = 'Line63'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10319
          mmLeft = 129646
          mmTop = 16669
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLabel48: TppLabel
          UserName = 'Label3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = #1575#1587#1600#1600#1600#1605' '#1575#1604#1589#1606#1600#1600#1600#1600#1601
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 157427
          mmTop = 2646
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppDBText39: TppDBText
          UserName = 'DBText4'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'ItemNameAr'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 5027
          mmLeft = 37571
          mmTop = 2646
          mmWidth = 87048
          BandType = 3
          GroupNo = 0
        end
        object ppDBText40: TppDBText
          UserName = 'DBText19'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'ItemCode'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 126207
          mmTop = 3175
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLine62: TppLine
          UserName = 'Line3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 8731
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel57: TppLabel
          UserName = 'Label17'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          Caption = ': '#1575#1604#1575#1580#1605#1600#1575#1604#1600#1600#1600#1600#1600#1600#1600#1610
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 92869
          mmTop = 1852
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc3'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'NetPrice'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 6350
          mmTop = 1588
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc20'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Border.Weight = 1.000000000000000000
          DataField = 'Quantity'
          DataPipeline = PPL_Sales_Purchases
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PPL_Sales_Purchases'
          mmHeight = 4233
          mmLeft = 66146
          mmTop = 1588
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule6: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
        444254657874354F6E476574546578740B50726F6772616D54797065070B7474
        50726F63656475726506536F75726365147601000070726F6365647572652044
        4254657874354F6E476574546578742876617220546578743A20537472696E67
        293B0D0A626567696E0D0A20204966202050504C5F53616C65735F5075726368
        617365735B2754727854797065275D203D20275052495627205468656E0D0A20
        2054657874203A3D2027D981D8A7D8AAD988D8B1D8A920D985D8B4D8AAD8B1D9
        8AD8A7D8AA270D0A2020656C73652020204966202050504C5F53616C65735F50
        75726368617365735B2754727854797065275D203D2027534149562720546865
        6E0D0A202054657874203A3D2027D981D8A7D8AAD988D8B1D8A920D985D8A8D9
        8AD8B9D8A7D8AA270D0A2020656C73652020204966202050504C5F53616C6573
        5F5075726368617365735B2754727854797065275D203D202753415254272054
        68656E0D0A202054657874203A3D2027D985D8B1D8AAD8ACD8B920D985D8A8D9
        8AD8B9D8A7D8AA270D0A2020656C73650D0A202054657874203A3D2027202720
        3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506074442546578
        7435094576656E744E616D6506094F6E47657454657874074576656E74494402
        350000}
    end
    object ppParameterList6: TppParameterList
    end
  end
end

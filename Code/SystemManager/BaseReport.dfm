object fmBaseReports: TfmBaseReports
  Left = 69
  Top = 250
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
    TabWidth = 434
    object tsh_ItemCard: TTabSheet
      Caption = #1578#1602#1585#1610#1585' '#1581#1585#1603#1577' '#1575#1604#1589#1606#1601
      object grpIncomeData: TGroupBox
        Left = 0
        Top = 0
        Width = 870
        Height = 298
        Align = alTop
        TabOrder = 0
        DesignSize = (
          870
          298)
        object Label4: TLabel
          Left = 786
          Top = 85
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
        object Label1: TLabel
          Left = 788
          Top = 135
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
          Top = 138
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
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 230
        Width = 870
        Height = 57
        Align = alBottom
        TabOrder = 1
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
    object tsh_Sales: TTabSheet
      Caption = #1578#1602#1585#1610#1585' '#1575#1604#1605#1576#1610#1593#1575#1578
      ImageIndex = 1
      TabVisible = False
      object grpOutComeData: TGroupBox
        Left = 0
        Top = 0
        Width = 870
        Height = 298
        Align = alTop
        TabOrder = 0
        DesignSize = (
          870
          298)
        object Label5: TLabel
          Left = 778
          Top = 81
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
          Top = 83
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
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 230
        Width = 870
        Height = 57
        Align = alBottom
        TabOrder = 1
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
        6772616D54797065070B747450726F63656475726506536F7572636514BC0100
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
        73650D0A202054657874203A3D20272027203B0D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D65060744425465787435094576656E744E616D650609
        4F6E47657454657874074576656E74494402350000}
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
      FieldLength = 4
      DisplayWidth = 4
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
      FieldLength = 4
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
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 14
    end
    object PPL_ItemCardppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'OutQty'
      FieldName = 'OutQty'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 15
    end
    object PPL_ItemCardppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'ItemPrice'
      FieldName = 'ItemPrice'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 16
    end
    object PPL_ItemCardppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'Discount'
      FieldName = 'Discount'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 17
    end
    object PPL_ItemCardppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'NetPrice'
      FieldName = 'NetPrice'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 18
    end
    object PPL_ItemCardppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'CostPrice'
      FieldName = 'CostPrice'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 19
    end
    object PPL_ItemCardppField21: TppField
      FieldAlias = 'ItemUnitCode'
      FieldName = 'ItemUnitCode'
      FieldLength = 6
      DisplayWidth = 6
      Position = 20
    end
    object PPL_ItemCardppField22: TppField
      FieldAlias = 'ItemUnitDescA'
      FieldName = 'ItemUnitDescA'
      FieldLength = 75
      DisplayWidth = 75
      Position = 21
    end
    object PPL_ItemCardppField23: TppField
      FieldAlias = 'ItemUnitDescE'
      FieldName = 'ItemUnitDescE'
      FieldLength = 75
      DisplayWidth = 75
      Position = 22
    end
    object PPL_ItemCardppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'UnitTransValue'
      FieldName = 'UnitTransValue'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 23
    end
    object PPL_ItemCardppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrxOrder'
      FieldName = 'TrxOrder'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
  end
  object pp_Sales: TppReport
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
    Left = 94
    Top = 29
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'PPL_ItemCard'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36777
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'Shape1'
        Shape = stRoundRect
        mmHeight = 10054
        mmLeft = 3704
        mmTop = 26194
        mmWidth = 197380
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 66411
        mmTop = 9790
        mmWidth = 68263
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape4'
        Brush.Color = clWindow
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 63236
        mmTop = 11642
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
      object ppLabel6: TppLabel
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
      object ppLabel14: TppLabel
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
      object ppLine16: TppLine
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
      object ppLine17: TppLine
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
      object ppLine20: TppLine
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
      object ppLabel16: TppLabel
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
      object ppLabel5: TppLabel
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
    object ppDetailBand2: TppDetailBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine6: TppLine
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
      object ppLine7: TppLine
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
      object ppLine10: TppLine
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
      object ppDBText7: TppDBText
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
      object ppDBText9: TppDBText
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
      object ppVariable2: TppVariable
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
        ResetComponent = ppGroup2
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
      BreakName = 'ItemCode'
      DataPipeline = PPL_ItemCard
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PPL_ItemCard'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppShape7: TppShape
          UserName = 'Shape3'
          Shape = stRoundRect
          mmHeight = 8731
          mmLeft = 3704
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppVariable4: TppVariable
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
          ResetComponent = ppGroup2
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
        object ppDBCalc3: TppDBCalc
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
          ResetGroup = ppGroup2
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
        object ppDBCalc4: TppDBCalc
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
          ResetGroup = ppGroup2
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
        object ppDBText12: TppDBText
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
        object ppLine13: TppLine
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
        object ppLine14: TppLine
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
        object ppLine22: TppLine
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
    object raCodeModule2: TraCodeModule
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
    object ppParameterList1: TppParameterList
    end
  end
  object qry_ItemCard: TSimpleDataSet
    Active = True
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
    end
    object qry_ItemCardOutQty: TFMTBCDField
      FieldName = 'OutQty'
      Precision = 18
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
    end
    object qry_ItemCardTrxOrder: TIntegerField
      FieldName = 'TrxOrder'
      Required = True
    end
  end
  object qry_Items: TSimpleDataSet
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
    Left = 2
    Top = 36
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
    Top = 36
  end
end

�
 TFRMSALESCROSS 0#!  TPF0TfrmSalesCrossfrmSalesCrossLeft� TopkWidth^Height� CaptionfrmSalesCrossColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoScreenCenterPixelsPerInch`
TextHeight TButton
btnPreviewLeft� TopcWidthKHeightCaptionPreviewTabOrder OnClickbtnPreviewClick  TQueryqryOrderActive	DatabaseNameDBDEMOSSQL.StringsSELECT AmountPaid,          State,3          Extract(MONTH FROM SaleDate) AS SaleMonthFROM Customer, Orders%WHERE Orders.custNo = Customer.CustNo LeftTop  TDataSourcedsOrderDataSetqryOrderLeft=Top  TppDBPipelineplOrder
DataSourcedsOrderUserNameplOrderLeft]Top TppFieldplOrderppField1
FieldAlias
AmountPaid	FieldName
AmountPaidFieldLength DataType
dtCurrencyDisplayWidth
Position   TppFieldplOrderppField2
FieldAliasState	FieldNameStateFieldLengthDisplayWidthPosition  TppFieldplOrderppField3	AlignmenttaRightJustify
FieldAlias	SaleMonth	FieldName	SaleMonthFieldLength DataTypedtDoubleDisplayWidth
Position   	TppReportrbOrderPassSetting	psTwoPassPrinterSetup.BinNameDefaultPrinterSetup.DocumentNameReportPrinterSetup.OrientationpoLandscapePrinterSetup.PaperNameLetterPrinterSetup.PrinterNameDefaultPrinterSetup.mmMarginBottom�PrinterSetup.mmMarginLeft�PrinterSetup.mmMarginRight�PrinterSetup.mmMarginTop�PrinterSetup.mmPaperHeight\K PrinterSetup.mmPaperWidthiC PrinterSetup.PaperSize
DeviceTypeScreenLeft� TopVersion5.5mmColumnWidth  TppHeaderBandppHeaderBand1mmBottomOffset mmHeight�3mmPrintPosition  TppLabelppLabel1UserNameLabel1CaptionMonthly Sales by StateFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.StylefsBold Transparent	mmHeight�mmLeftmmTop mmWidthͲ  BandType    TppDetailBandppDetailBand1PrintHeight	phDynamicmmBottomOffset mmHeight�3mmPrintPosition  TppCrossTabppCrossTab1UserName	CrossTab1DataPipelineplOrder
PaginationctptAcrossThenDownStretch	StyleRepeatedCaptionsmmHeight�mmLeft mmToppmmWidth� BandTypemmBottomOffset mmOverFlowOffset mmStopPosition  TppGrandTotal 	ChildType TppTotalCaptionDef 	ChildType	AlignmenttaRightJustifyColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppGrandTotal 	ChildType TppTotalCaptionDef 	ChildType	AlignmenttaRightJustifyColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppGrandTotal 	ChildType TppTotalCaptionDef 	ChildType	AlignmenttaRightJustifyColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppGrandTotal 	ChildType TppTotalCaptionDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppGrandTotal 	ChildType TppTotalCaptionDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppGrandTotal 	ChildType TppTotalCaptionDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppColumnDef 
FieldAlias	SaleMonth	FieldName	SaleMonthColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style  TppSubTotal 	ChildType TppTotalCaptionDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppSubTotal 	ChildType TppTotalCaptionDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppSubTotal 	ChildType TppTotalCaptionDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style     	TppRowDef 	ChildType
FieldAliasState	FieldNameStateColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style  TppSubTotal 	ChildType TppTotalCaptionDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppSubTotal 	ChildType TppTotalCaptionDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppSubTotal 	ChildType TppTotalCaptionDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style   TppTotalDef 	ChildTypeColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style     TppValueDef 	ChildType
FieldAlias
AmountPaid	FieldName
AmountPaidColorclWhiteDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style  TppValueCaptionDef 	ChildTypeCalcTypedcSumColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppValueDef 	ChildType
FieldAlias
AmountPaid	FieldName
AmountPaidColorclWhiteDisplayFormat$#,0.00;($#,0.00)Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style  TppValueCaptionDef 	ChildTypeCalcType	dcAverageColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style    TppValueDef 	ChildType
FieldAlias
AmountPaid	FieldName
AmountPaidColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style  TppValueCaptionDef 	ChildTypeCalcTypedcCountColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style      TppFooterBandppFooterBand1mmBottomOffset mmHeight�3mmPrintPosition  TppSystemVariableppSystemVariable1UserNameSystemVariable1VarTypevtPrintDateTimeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.Style Transparent	mmHeightxmmLeft"mmTop�mmWidth_BandType  TppSystemVariableppSystemVariable2UserNameSystemVariable2VarTypevtPageSetDescFont.CharsetDEFAULT_CHARSET
Font.ColorclBlack	Font.NameArial	Font.Size
Font.Style TextAlignmenttaRightJustifiedTransparent	mmHeightxmmLeftQ� mmTop�mmWidth�8BandType     
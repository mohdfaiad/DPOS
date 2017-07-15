unit BaseReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Mask, StdCtrls, DBCtrls, ExtCtrls, ppBands, ppCache,
  ppClass, ppComm, ppRelatv, ppProd, ppReport , ppParameter, DB, DBClient,
  SimpleDS, ppDB, ppDBPipe, ppCtrls, ppPrnabl, ppModule, raCodMod, ppVar;

type
  TfmBaseReports = class(TForm)
    PageControl1: TPageControl;
    tsh_ItemCard: TTabSheet;
    grpIncomeData: TGroupBox;
    Label4: TLabel;
    Label9: TLabel;
    pnlTitle: TPanel;
    pp_ItemCard: TppReport;
    DS_ItemCard: TDataSource;
    PPL_ItemCard: TppDBPipeline;
    tsh_Sales: TTabSheet;
    grpSales: TGroupBox;
    Label5: TLabel;
    Label10: TLabel;
    Panel1: TPanel;
    pp_Sales: TppReport;
    ppParameterList1: TppParameterList;
    qry_ItemCard: TSimpleDataSet;
    dt_ItemCardFromDate: TDateTimePicker;
    dt_ItemCardtoDate: TDateTimePicker;
    dt_SalesFromDate: TDateTimePicker;
    dt_SalesToDate: TDateTimePicker;
    ppParameterList2: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppShape4: TppShape;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine5: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel3: TppLabel;
    ppLabel12: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape3: TppShape;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine15: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    qry_ItemCardCompanyCode: TStringField;
    qry_ItemCardBranchCode: TStringField;
    qry_ItemCardTrxNo: TStringField;
    qry_ItemCardTrxType: TStringField;
    qry_ItemCardTrxDate: TSQLTimeStampField;
    qry_ItemCardTrxStatus: TStringField;
    qry_ItemCardTrxDescA: TStringField;
    qry_ItemCardTrxDescE: TStringField;
    qry_ItemCardTrxAmount: TFMTBCDField;
    qry_ItemCardBarcode: TStringField;
    qry_ItemCardItemCode: TStringField;
    qry_ItemCardItemService: TStringField;
    qry_ItemCardItemNameAr: TStringField;
    qry_ItemCardItemNameEn: TStringField;
    qry_ItemCardInQty: TFMTBCDField;
    qry_ItemCardOutQty: TFMTBCDField;
    qry_ItemCardItemUnitCode: TStringField;
    qry_ItemCardItemUnitDescA: TStringField;
    qry_ItemCardItemUnitDescE: TStringField;
    qry_ItemCardUnitTransValue: TFMTBCDField;
    qry_ItemCardTrxOrder: TIntegerField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppVariable1: TppVariable;
    raCodeModule1: TraCodeModule;
    ppVariable3: TppVariable;
    ppLine21: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel17: TppLabel;
    qry_Items: TSimpleDataSet;
    qry_ItemsItemService: TStringField;
    qry_ItemsItemCode: TStringField;
    qry_ItemsItemNameAr: TStringField;
    qry_ItemsItemNameEn: TStringField;
    qry_ItemsItemUnitCode: TStringField;
    DS_Items: TDataSource;
    Label1: TLabel;
    rg_AllItems: TRadioGroup;
    cbo_Item: TDBLookupComboBox;
    rg_ReportType: TRadioGroup;
    Label2: TLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel11: TppLabel;
    ppDBText5: TppDBText;
    tsh_Purchases: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    dt_PurchaseFromDate: TDateTimePicker;
    dt_PurchaseToDate: TDateTimePicker;
    GroupBox4: TGroupBox;
    btnPrintPurchaseRepot: TButton;
    Button3: TButton;
    GroupBox3: TGroupBox;
    btnPrintSalesRepot: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    btnPrintItemCardReport: TButton;
    btnClose: TButton;
    Label7: TLabel;
    Label8: TLabel;
    rg_Purchase_AllItems: TRadioGroup;
    cbo_Purchase_Item: TDBLookupComboBox;
    rg_Purchase_ReportType: TRadioGroup;
    Label11: TLabel;
    Label12: TLabel;
    rg_Sales_AllItems: TRadioGroup;
    cbo_Sales_Item: TDBLookupComboBox;
    rg_Sales_ReportType: TRadioGroup;
    pp_ItemCard_Summary: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel18: TppLabel;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppDBText6: TppDBText;
    ppDBText10: TppDBText;
    ppVariable5: TppVariable;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppShape12: TppShape;
    ppVariable6: TppVariable;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBText13: TppDBText;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    raCodeModule3: TraCodeModule;
    ppParameterList3: TppParameterList;
    qry_Sales_Purchases: TSimpleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FMTBCDField1: TFMTBCDField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    FMTBCDField4: TFMTBCDField;
    IntegerField1: TIntegerField;
    DS_Sales_Purchases: TDataSource;
    PPL_Sales_Purchases: TppDBPipeline;
    qry_Sales_PurchasesQuantity: TFMTBCDField;
    qry_Sales_PurchasesItemPrice: TFMTBCDField;
    qry_Sales_PurchasesDiscount: TFMTBCDField;
    qry_Sales_PurchasesNetPrice: TFMTBCDField;
    ppHeaderBand2: TppHeaderBand;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape7: TppShape;
    ppLine7: TppLine;
    ppLine10: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText18: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape8: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel21: TppLabel;
    ppLine20: TppLine;
    ppLine22: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBText9: TppDBText;
    ppDBText7: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel26: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine35: TppLine;
    ppLabel25: TppLabel;
    ppDBCalc3: TppDBCalc;
    raCodeModule2: TraCodeModule;
    pp_Sales_Summary: TppReport;
    ppParameterList4: TppParameterList;
    ppHeaderBand4: TppHeaderBand;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppLabel27: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    ppLine40: TppLine;
    ppLabel37: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppShape16: TppShape;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLine39: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppShape15: TppShape;
    ppDBText26: TppDBText;
    ppLine6: TppLine;
    raCodeModule4: TraCodeModule;
    ppDBCalc7: TppDBCalc;
    ppDBText20: TppDBText;
    qry_Sales_PurchasesCash: TFMTBCDField;
    qry_Sales_PurchasesATM: TFMTBCDField;
    qry_Sales_PurchasesVisa: TFMTBCDField;
    qry_Sales_PurchasesChecks: TFMTBCDField;
    qry_Sales_PurchasesCredit: TFMTBCDField;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine34: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    pp_Purchases: TppReport;
    ppParameterList5: TppParameterList;
    ppHeaderBand5: TppHeaderBand;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppLabel35: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppShape19: TppShape;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppSummaryBand5: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppShape20: TppShape;
    ppLabel36: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLabel45: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine53: TppLine;
    ppLabel46: TppLabel;
    ppDBCalc18: TppDBCalc;
    raCodeModule5: TraCodeModule;
    pp_Purchases_Summary: TppReport;
    ppParameterList6: TppParameterList;
    ppHeaderBand6: TppHeaderBand;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel47: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppShape23: TppShape;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppSummaryBand6: TppSummaryBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppShape24: TppShape;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLine62: TppLine;
    ppLabel57: TppLabel;
    ppDBCalc19: TppDBCalc;
    raCodeModule6: TraCodeModule;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppDBCalc20: TppDBCalc;
    ppLabel56: TppLabel;
    ppShape25: TppShape;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    procedure btnPrintItemCardReportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnPrintSalesRepotClick(Sender: TObject);
    procedure rg_AllItemsClick(Sender: TObject);
    procedure rg_Sales_AllItemsClick(Sender: TObject);
    procedure rg_Purchase_AllItemsClick(Sender: TObject);
    procedure btnPrintPurchaseRepotClick(Sender: TObject);
    procedure cbo_ItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
      Rep: TppReport;
      RepParam : TppParameterList;
  end;

var
  fmBaseReports: TfmBaseReports;

implementation

uses GFunctions, DateUtils, GVariable, Main, LookUp;

{$R *.dfm}

procedure TfmBaseReports.btnPrintItemCardReportClick(Sender: TObject);
Var
   RepFileName : String ;
   FDate , TDate , F_OBDate , ItemCode : String ;
   StrLst : TStringList;
begin
    STRLST := TStringList.Create;
    RepParam.Clear;
    RepParam['From_Date'].AsString := DateToStr(dt_ItemCardFromDate.Date);
    RepParam['To_Date'].AsString := DateToStr(dt_ItemCardtoDate.Date);

    If DateToStr(dt_ItemCardFromDate.Date) <> '' Then FDate := ' And RD_Trans.TrxDate >= ''' + FormatDateTime('MM/DD/YYYY', dt_ItemCardFromDate.Date) + ''' '
    else FDate := '';

    If DateToStr(dt_ItemCardtoDate.Date) <> '' Then TDate := ' And RD_Trans.TrxDate <= ''' + FormatDateTime('MM/DD/YYYY', dt_ItemCardtoDate.Date) + ''' '
    else TDate := '';

    If DateToStr(dt_ItemCardFromDate.Date) <> '' Then F_OBDate := ' And H.TrxDate < ''' + FormatDateTime('MM/DD/YYYY', dt_ItemCardFromDate.Date) + ''' '
    else F_OBDate := '';

    If (rg_AllItems.ItemIndex = 1) Then
       ItemCode := ' And ItemCode = ''' + qry_ItemsItemCode.AsString  + ''' '
    else ItemCode := ' ';


    qry_ItemCard.Close;
    qry_ItemCard.DataSet.Close;
    qry_ItemCard.DataSet.CommandText := ''
      + ' SELECT     * '
      + ' FROM         (SELECT     * '
      + '                         FROM         (SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescA, H.TrxDescE, H.TrxAmount, D.Barcode, D.ItemCode, '
      + '                                                                       D.ItemService, I.ItemNameAr, I.ItemNameEn, CASE WHEN H.TrxType = ''SART'' THEN D .Quantity ELSE 0 END AS InQty, '
      + '                                                                       CASE WHEN H.TrxType = ''SAIV'' THEN D .Quantity ELSE 0 END AS OutQty, D.ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, '
      + '                                                                       D.UnitTransValue, CASE WHEN H.TrxType = ''SART'' THEN 0 ELSE 1 END AS TrxOrder '
      + '                                                 FROM         sa_POS_TrxHeader AS H INNER JOIN '
      + '                                                                       sa_POS_TrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
      + '                                                                       H.TrxType = D.TrxType AND H.YearID = D.YearID AND H.PeriodID = D.PeriodID LEFT OUTER JOIN '
      + '                                                                       tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnitCode = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                                                       tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND D.ItemCode = I.ItemCode '
      + '                                                 WHERE     (H.TrxType IN (''SAIV'', ''SART'')) '
      + '                                                 UNION ALL '
      + '                                                 SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescAr, H.TrxDescEn, H.TrxAmount, D.BarCode,D.ItemCode, D.ItemService, I.ItemNameAr,  '
      + '                                                            I.ItemNameEn, CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') THEN D .Quantity When (H.TrxType =  ''IVAD'' And D.DiffQty > 0) Then D.DiffQty  ELSE 0 END AS InQty, '
      + '                                                            CASE WHEN H.TrxType = ''PRRT'' THEN D .Quantity When (H.TrxType =  ''IVAD'' And D.DiffQty < 0) Then Abs(D.DiffQty)  ELSE 0 END AS OutQty,  '
      + '                                                            D.ItemUnit, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue,  '
      + '                                                            CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') THEN 0 When (H.TrxType =  ''IVAD'' And D.DiffQty > 0) Then 0 ELSE 1 END AS TrxOrder '
      + '                                                 FROM         tbl_PrTrxHeader AS H INNER JOIN '
      + '                                                                       tbl_PrTrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
      + '                                                                       H.TrxType = D.TrxType LEFT OUTER JOIN '
      + '                                                                       tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnit = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                                                       tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND D.ItemCode = I.ItemCode '
      + '                                                 WHERE     (H.TrxType IN (''IVBB'', ''PRIV'', ''PRRT'' , ''IVAD'')) '

      + '                                                 UNION ALL '
      + '                                                 SELECT  H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, ''ãäÕÑÝ ãä ãßæäÇÊ ÇÍÏì ÇáÇÕäÇÝ'' As TrxDescA, H.TrxDescE, H.TrxAmount, D.Barcode, DD.DetailsItemCode, D.ItemService, '
      + '                                            							I.ItemNameAr, I.ItemNameEn, CASE WHEN H.TrxType = ''SART'' THEN DD.Quantity ELSE 0 END AS InQty, '
      + '                                            							CASE WHEN H.TrxType = ''SAIV'' THEN DD.Quantity ELSE 0 END AS OutQty, DD.ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, '
      + '                                            							CASE WHEN H.TrxType = ''SART'' THEN 0 ELSE 1 END AS TrxOrder '
      + '                                            			FROM   sa_POS_TrxHeader AS H INNER JOIN '
      + '                                            							sa_POS_TrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND H.TrxType = D.TrxType AND '
      + '                                            							H.YearID = D.YearID AND H.PeriodID = D.PeriodID INNER JOIN '
      + '                                            							sa_POS_TrxItemSpecification AS DD ON D.CompanyCode = DD.CompanyCode AND D.BranchCode = DD.BranchCode AND D.TrxNo = DD.TrxNo AND '
      + '                                            							D.TrxType = DD.TrxType AND D.YearID = DD.YearID AND D.PeriodID = DD.PeriodID AND D.ItemCode = DD.ItemCode AND '
      + '                                            							D.ItemService = DD.ItemService LEFT OUTER JOIN '
      + '                                            							tbl_ItemUnit AS U ON DD.CompanyCode = U.CompanyCode AND DD.ItemUnitCode = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                            							tbl_ItemDefinition AS I ON DD.CompanyCode = I.CompanyCode AND DD.ItemService = I.ItemService AND DD.DetailsItemCode = I.ItemCode '
      + '                                                 WHERE     (H.TrxType IN (''SAIV'', ''SART'')) '

      + '                                       ) AS RD_Trans '
      + '                         WHERE     companyCode = ''' + DCompany + ''' And BranchCode = ''' + DBranch + '''  '
      + FDate + TDate + ItemCode
      + '                         UNION ALL '
      + '                         SELECT     * '
      + '                         FROM         (SELECT     CompanyCode, BranchCode, NULL AS TrxNo, ''BBBB'' AS TrxType, NULL AS TrxDate, ''P'' AS TrxStatus, ''ÑÕíÏ ÇÝÊÊÇÍí'' AS TrxDescA, '
      + '                                                                       ''Opening Balance'' AS TrxDescE, SUM(TrxAmount) AS TrxAmount, NULL AS Barcode, ItemCode, ItemService, ItemNameAr, ItemNameEn, '
      + '                                                                       CASE WHEN (SUM(InQty) - SUM(OutQty)) > 0 THEN (SUM(InQty) - SUM(OutQty)) ELSE 0 END AS InQty, CASE WHEN (SUM(OutQty) - SUM(InQty)) > 0  '
      + '                                                                       THEN (SUM(OutQty) - SUM(InQty)) ELSE 0 END AS OutQty, MAX(ItemUnitCode) AS ItemUnitCode, NULL '
      + '                                                                       AS ItemUnitDescA, NULL AS ItemUnitDescE, NULL AS UnitTransValue, - 1 AS TrxOrder '
      + '                                                 FROM         (SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescA, H.TrxDescE, H.TrxAmount, D.Barcode, '
      + '                                                                                               D.ItemCode, D.ItemService, I.ItemNameAr, I.ItemNameEn, CASE WHEN H.TrxType = ''SART'' THEN D .Quantity ELSE 0 END AS InQty, '
      + '                                                                                               CASE WHEN H.TrxType = ''SAIV'' THEN D .Quantity ELSE 0 END AS OutQty, D.ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, '
      + '                                                                                               D.UnitTransValue, CASE WHEN H.TrxType = ''SART'' THEN 0 ELSE 1 END AS TrxOrder '
      + '                                                                         FROM         sa_POS_TrxHeader AS H INNER JOIN '
      + '                                                                                               sa_POS_TrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
      + '                                                                                               H.TrxType = D.TrxType AND H.YearID = D.YearID AND H.PeriodID = D.PeriodID LEFT OUTER JOIN '
      + '                                                                                               tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnitCode = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                                                                               tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND '
      + '                                                                                               D.ItemCode = I.ItemCode '
      + '                                                                         WHERE     (H.TrxType IN (''SAIV'', ''SART''))  ' + F_OBDate
      + '                                                                         UNION ALL '
      + '                                                                         SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescAr, H.TrxDescEn, H.TrxAmount, D.BarCode, '
      + '                                                                                     D.ItemCode, D.ItemService, I.ItemNameAr, I.ItemNameEn, CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') '
      + '                                                                                     THEN D .Quantity When (H.TrxType =  ''IVAD'' And D.DiffQty > 0) Then D.DiffQty ELSE 0 END AS InQty,  '
      + '                                                                                     CASE WHEN H.TrxType = ''PRRT'' THEN D .Quantity When (H.TrxType =  ''IVAD'' And D.DiffQty < 0) Then Abs(D.DiffQty)  ELSE 0 END AS OutQty, D.ItemUnit, '
      + '                                                                                     U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') '
      + '                                                                                     THEN 0 When (H.TrxType =  ''IVAD'' And D.DiffQty > 0) Then 0 ELSE 1 END AS TrxOrder '
      + '                                                                         FROM         tbl_PrTrxHeader AS H INNER JOIN '
      + '                                                                                               tbl_PrTrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
      + '                                                                                               H.TrxType = D.TrxType LEFT OUTER JOIN '
      + '                                                                                               tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnit = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                                                                               tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND '
      + '                                                                                               D.ItemCode = I.ItemCode '
      + '                                                                         WHERE     (H.TrxType IN (''IVBB'', ''PRIV'', ''PRRT'' , ''IVAD''))  '   + F_OBDate

      + '                                                                         UNION ALL '
      + '                                                                         SELECT  H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescA, H.TrxDescE, H.TrxAmount, D.Barcode, DD.DetailsItemCode, D.ItemService, '
      + '                                                                    							I.ItemNameAr, I.ItemNameEn, CASE WHEN H.TrxType = ''SART'' THEN DD.Quantity ELSE 0 END AS InQty, '
      + '                                                                   							CASE WHEN H.TrxType = ''SAIV'' THEN DD.Quantity ELSE 0 END AS OutQty, DD.ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, '
      + '                                                                   							CASE WHEN H.TrxType = ''SART'' THEN 0 ELSE 1 END AS TrxOrder '
      + '                                                                    			FROM   sa_POS_TrxHeader AS H INNER JOIN '
      + '                                                                   							sa_POS_TrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND H.TrxType = D.TrxType AND '
      + '                                                                   							H.YearID = D.YearID AND H.PeriodID = D.PeriodID INNER JOIN '
      + '                                                                  					  		sa_POS_TrxItemSpecification AS DD ON D.CompanyCode = DD.CompanyCode AND D.BranchCode = DD.BranchCode AND D.TrxNo = DD.TrxNo AND '
      + '                                            		                        					D.TrxType = DD.TrxType AND D.YearID = DD.YearID AND D.PeriodID = DD.PeriodID AND D.ItemCode = DD.ItemCode AND '
      + '                                                                    							D.ItemService = DD.ItemService LEFT OUTER JOIN '
      + '                                                                   							tbl_ItemUnit AS U ON DD.CompanyCode = U.CompanyCode AND DD.ItemUnitCode = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                                                   							tbl_ItemDefinition AS I ON DD.CompanyCode = I.CompanyCode AND DD.ItemService = I.ItemService AND DD.DetailsItemCode = I.ItemCode '
      + '                                                                          WHERE     (H.TrxType IN (''SAIV'', ''SART'')) '    + F_OBDate


      + '                                                              ) AS RD_OB '
      + '                                                 GROUP BY CompanyCode, BranchCode, TrxStatus, ItemCode, ItemService, ItemNameAr, ItemNameEn '
      + '                                      ) AS RD_Sum_OB '
      + '                         Where companyCode = ''' + DCompany + ''' And BranchCode = ''' + DBranch + ''' '  + ItemCode
      + '              ) AS RD '
      + ' ORDER BY ItemCode, TrxDate, TrxOrder ';

    StrLst.Add(qry_ItemCard.DataSet.CommandText ) ;
    StrLst.SaveToFile('LastQuery.txt');

    qry_ItemCard.Open;

    If (rg_ReportType.ItemIndex = 0) Then
       pp_ItemCard.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\sa_ItemCard.rtm'
    else pp_ItemCard.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\sa_ItemCard_Summary.rtm';;

    pp_ItemCard.Template.LoadFromFile;
    pp_ItemCard.Parameters := RepParam;
    pp_ItemCard.OutlineSettings.CreateNode := false;
    pp_ItemCard.OutlineSettings.CreatePageNodes := false;
    pp_ItemCard.OutlineSettings.Visible := false;
    pp_ItemCard.PreviewFormSettings.WindowState := wsMaximized;
    pp_ItemCard.PreviewFormSettings.ZoomPercentage := 100;
    pp_ItemCard.AllowPrintToFile := True;
    pp_ItemCard.ShowPrintDialog := True;
    pp_ItemCard.Print;

end;

procedure TfmBaseReports.FormCreate(Sender: TObject);
Var YearOfDate : Variant;
begin
  YearOfDate := YearOf(Date);

  dt_ItemCardFromDate.Date := StrToDate('01/01/'+ VarToStr(YearOfDate)) ;
  dt_ItemCardtoDate.Date := Date;

  dt_SalesFromDate.Date := StrToDate('01/01/'+ VarToStr(YearOfDate)) ;
  dt_SalesToDate.Date := Date;

  dt_PurchaseFromDate.Date := StrToDate('01/01/'+ VarToStr(YearOfDate)) ;
  dt_PurchaseToDate.Date := Date;

  qry_Items.Open;
  qry_Items.First;
  
  RepParam := TppParameterList.Create(Self);
  RepParam.Clear;
  RepParam['From_Date'].AsString := DateToStr(dt_ItemCardFromDate.Date);
  RepParam['To_Date'].AsString := DateToStr(dt_ItemCardtoDate.Date);

end;

procedure TfmBaseReports.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmBaseReports.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmBaseReports.btnPrintSalesRepotClick(Sender: TObject);
Var
   RepFileName : String ;
   FDate , TDate , F_OBDate , ItemCode : String ;
   StrLst : TStringList;
begin
    STRLST := TStringList.Create;
    RepParam.Clear;
    {RepParam['From_Date'].AsString := DateToStr(dt_SalesFromDate.Date);
    RepParam['To_Date'].AsString := DateToStr(dt_SalesToDate.Date);
    }
    If DateToStr(dt_SalesFromDate.Date) <> '' Then FDate := ' And RD_Trans.TrxDate >= ''' + FormatDateTime('MM/DD/YYYY', dt_SalesFromDate.Date) + ''' '
    else FDate := '';

    If DateToStr(dt_SalesToDate.Date) <> '' Then TDate := ' And RD_Trans.TrxDate <= ''' + FormatDateTime('MM/DD/YYYY', dt_SalesToDate.Date) + ''' '
    else TDate := '';

    If (rg_Sales_AllItems.ItemIndex = 1) Then
       ItemCode := ' And ItemCode = ''' + qry_ItemsItemCode.AsString  + ''' '
    else ItemCode := ' ';

    If (rg_Sales_ReportType.ItemIndex = 0) Then Begin
      qry_Sales_Purchases.Close;
      qry_Sales_Purchases.DataSet.Close;
      qry_Sales_Purchases.DataSet.CommandText := ''
        + ' SELECT  *   FROM  (SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescA, H.TrxDescE, H.TrxAmount, H.Cash, H.ATM, H.Visa, H.Checks, H.Credit, D.Barcode, D.ItemCode, '
        + '                                D.ItemService, I.ItemNameAr, I.ItemNameEn, D.ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, '
        + '                                D.UnitTransValue, CASE WHEN H.TrxType = ''SART'' THEN 0 ELSE 1 END AS TrxOrder , D.Quantity, D.ItemPrice, D.Discount, D.NetPrice '
        + '                     FROM       sa_POS_TrxHeader AS H INNER JOIN '
        + '                                sa_POS_TrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
        + '                                H.TrxType = D.TrxType AND H.YearID = D.YearID AND H.PeriodID = D.PeriodID LEFT OUTER JOIN '
        + '                                tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnitCode = U.ItemUnitCode LEFT OUTER JOIN '
        + '                                tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND D.ItemCode = I.ItemCode '
        + '                      WHERE     (H.TrxType IN (''SAIV'', ''SART'')) '
        + '                      UNION ALL '
        + '                      SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescAr, H.TrxDescEn, H.TrxAmount, NULL AS Cash, NULL AS ATM, NULL AS Visa, NULL AS Checks, NULL AS Credit, D.BarCode, '
        + '                                 D.ItemCode, D.ItemService, I.ItemNameAr, I.ItemNameEn, D.ItemUnit, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, '
        + '                                 CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') THEN 0 ELSE 1 END AS TrxOrder , D.Quantity, D.CostPrice, D.Discount, D.NetPrice '
        + '                      FROM       tbl_PrTrxHeader AS H INNER JOIN '
        + '                                 tbl_PrTrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
        + '                                 H.TrxType = D.TrxType LEFT OUTER JOIN '
        + '                                 tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnit = U.ItemUnitCode LEFT OUTER JOIN '
        + '                                 tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND D.ItemCode = I.ItemCode '
        + '                      WHERE     (H.TrxType IN (''IVBB'', ''PRIV'', ''PRRT'')) '
        + '  ) AS RD_Trans '
        + '  WHERE     companyCode = ''' + DCompany + ''' And BranchCode = ''' + DBranch + ''' And TrxType = ''SAIV'' '
        + FDate + TDate + ItemCode
        + ' ORDER BY  TrxDate, TrxOrder ';

      StrLst.Add(qry_Sales_Purchases.DataSet.CommandText ) ;
      StrLst.SaveToFile('LastQuery.txt');
      qry_Sales_Purchases.Open;

       pp_Sales.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\sa_SalesReport.rtm' ;
    end else Begin
      qry_Sales_Purchases.Close;
      qry_Sales_Purchases.DataSet.Close;
      qry_Sales_Purchases.DataSet.CommandText := ''
        + ' SELECT   Distinct  CompanyCode, BranchCode, TrxNo, TrxType, TrxDate, TrxStatus, TrxDescA, TrxDescE, TrxAmount, Cash, ATM, Visa, Checks, Credit, Cast ( Null As NvarChar(20)) AS Barcode,  '
        + '            Cast ( Null As NvarChar(20)) AS ItemCode, Cast ( Null As NvarChar(20)) AS ItemService, Cast ( Null As NvarChar(20)) AS ItemNameAr, Cast ( Null As NvarChar(20)) AS ItemNameEn, '
        + '            Cast ( Null As NvarChar(20)) AS ItemUnitCode, Cast ( Null As NvarChar(20)) AS ItemUnitDescA, Cast ( Null As NvarChar(20)) AS ItemUnitDescE,  Cast ( 0.0 As decimal(18,4)) AS UnitTransValue,   '
        + '            Cast ( 0 As Integer) AS TrxOrder, Cast (0.0 As decimal(18,4)) AS Quantity, Cast ( 0.0 As decimal(18,4)) AS ItemPrice, Cast ( 0.0 As decimal(18,4)) AS Discount, Cast ( 0.0 As decimal(18,4)) AS NetPrice '
        + ' FROM  (SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescA, H.TrxDescE, H.TrxAmount, H.Cash, H.ATM, H.Visa, H.Checks, H.Credit, D.Barcode, D.ItemCode, '
        + '                   D.ItemService, I.ItemNameAr, I.ItemNameEn, D.ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, '
        + '                   D.UnitTransValue, CASE WHEN H.TrxType = ''SART'' THEN 0 ELSE 1 END AS TrxOrder , D.Quantity, D.ItemPrice, D.Discount, D.NetPrice '
        + '         FROM      sa_POS_TrxHeader AS H INNER JOIN '
        + '                   sa_POS_TrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
        + '                   H.TrxType = D.TrxType AND H.YearID = D.YearID AND H.PeriodID = D.PeriodID LEFT OUTER JOIN '
        + '                   tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnitCode = U.ItemUnitCode LEFT OUTER JOIN '
        + '                   tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND D.ItemCode = I.ItemCode '
        + '          WHERE     (H.TrxType IN (''SAIV'', ''SART'')) '
        + '          UNION ALL '
        + '          SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescAr, H.TrxDescEn, H.TrxAmount, NULL AS Cash, NULL AS ATM, NULL AS Visa, NULL AS Checks, NULL AS Credit, D.BarCode, '
        + '                     D.ItemCode, D.ItemService, I.ItemNameAr, I.ItemNameEn, D.ItemUnit, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, '
        + '                     CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') THEN 0 ELSE 1 END AS TrxOrder , D.Quantity, D.CostPrice, D.Discount, D.NetPrice '
        + '          FROM       tbl_PrTrxHeader AS H INNER JOIN '
        + '                     tbl_PrTrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
        + '                     H.TrxType = D.TrxType LEFT OUTER JOIN '
        + '                     tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnit = U.ItemUnitCode LEFT OUTER JOIN '
        + '                     tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND D.ItemCode = I.ItemCode '
        + '          WHERE     (H.TrxType IN (''IVBB'', ''PRIV'', ''PRRT'')) '
        + ' ) AS RD_Trans '
        + '  GROUP BY CompanyCode, BranchCode, TrxNo, TrxType, TrxDate, TrxStatus, TrxDescA, TrxDescE, TrxAmount, Cash, ATM, Visa, Checks, Credit , ItemCode '
        + '  Having  companyCode = ''' + DCompany + ''' And BranchCode = ''' + DBranch + ''' And TrxType = ''SAIV'' '
        + FDate + TDate + ItemCode
        + ' ORDER BY  TrxDate, TrxOrder ';

      StrLst.Add(qry_Sales_Purchases.DataSet.CommandText ) ;
      StrLst.SaveToFile('LastQuery.txt');
      qry_Sales_Purchases.Open;

       pp_Sales.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\sa_SalesReport_Summary.rtm';

    end;

    pp_Sales.Template.LoadFromFile;
    pp_Sales.Parameters := RepParam;
    pp_Sales.OutlineSettings.CreateNode := false;
    pp_Sales.OutlineSettings.CreatePageNodes := false;
    pp_Sales.OutlineSettings.Visible := false;
    pp_Sales.PreviewFormSettings.WindowState := wsMaximized;
    pp_Sales.PreviewFormSettings.ZoomPercentage := 100;
    pp_Sales.AllowPrintToFile := True;
    pp_Sales.ShowPrintDialog := True;
    pp_Sales.Print;


end;

procedure TfmBaseReports.rg_AllItemsClick(Sender: TObject);
begin
   If rg_AllItems.ItemIndex = 1 Then cbo_Item.Visible := True
   else cbo_Item.Visible := False;
end;

procedure TfmBaseReports.rg_Sales_AllItemsClick(Sender: TObject);
begin
   If rg_Sales_AllItems.ItemIndex = 1 Then cbo_Sales_Item.Visible := True
   else cbo_Sales_Item.Visible := False;
end;
procedure TfmBaseReports.rg_Purchase_AllItemsClick(Sender: TObject);
begin
   If rg_Purchase_AllItems.ItemIndex = 1 Then cbo_Purchase_Item.Visible := True
   else cbo_Purchase_Item.Visible := False;
end;

procedure TfmBaseReports.btnPrintPurchaseRepotClick(Sender: TObject);
Var
   RepFileName : String ;
   FDate , TDate , F_OBDate , ItemCode : String ;
   StrLst : TStringList;
begin
    STRLST := TStringList.Create;
    RepParam.Clear;
    {RepParam['From_Date'].AsString := DateToStr(dt_SalesFromDate.Date);
    RepParam['To_Date'].AsString := DateToStr(dt_SalesToDate.Date);
    }
    If DateToStr(dt_PurchaseFromDate.Date) <> '' Then FDate := ' And RD_Trans.TrxDate >= ''' + FormatDateTime('MM/DD/YYYY', dt_PurchaseFromDate.Date) + ''' '
    else FDate := '';

    If DateToStr(dt_PurchaseToDate.Date) <> '' Then TDate := ' And RD_Trans.TrxDate <= ''' + FormatDateTime('MM/DD/YYYY', dt_PurchaseToDate.Date) + ''' '
    else TDate := '';

    If (rg_Purchase_AllItems.ItemIndex = 1) Then
       ItemCode := ' And ItemCode = ''' + qry_ItemsItemCode.AsString  + ''' '
    else ItemCode := ' ';

    qry_Sales_Purchases.Close;
    qry_Sales_Purchases.DataSet.Close;
    qry_Sales_Purchases.DataSet.CommandText := ''
      + ' SELECT  *   FROM  ( SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescAr  As TrxDescA, H.TrxDescEn  As TrxDescE, H.TrxAmount, '
      + '         Cast (0.0 As decimal(18,4)) AS Cash, Cast (0.0 As decimal(18,4)) AS  ATM, Cast (0.0 As decimal(18,4)) AS  Visa, Cast (0.0 As decimal(18,4)) AS  Checks, Cast (0.0 As decimal(18,4)) AS  Credit, D.BarCode, '
      + '                                 D.ItemCode, D.ItemService, I.ItemNameAr, I.ItemNameEn, D.ItemUnit As ItemUnitCode, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, '
      + '                                 CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') THEN 0 ELSE 1 END AS TrxOrder , D.Quantity, D.CostPrice As ItemPrice, D.Discount, D.NetPrice '
      + '                      FROM       tbl_PrTrxHeader AS H INNER JOIN '
      + '                                 tbl_PrTrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
      + '                                 H.TrxType = D.TrxType LEFT OUTER JOIN '
      + '                                 tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnit = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                 tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND D.ItemCode = I.ItemCode '
      + '                      WHERE     (H.TrxType IN (''IVBB'', ''PRIV'', ''PRRT'')) '
      + '  ) AS RD_Trans '
      + '  WHERE     companyCode = ''' + DCompany + ''' And BranchCode = ''' + DBranch + ''' And TrxType = ''PRIV'' '
      + FDate + TDate + ItemCode
      + ' ORDER BY  TrxDate, TrxOrder ';

    StrLst.Add(qry_Sales_Purchases.DataSet.CommandText ) ;
    StrLst.SaveToFile('LastQuery.txt');
    qry_Sales_Purchases.Open;

    If (rg_Purchase_ReportType.ItemIndex = 0) Then
       pp_Purchases.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\pr_PurchasesReport.rtm'
    else
       pp_Purchases.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\pr_PurchasesReport_Summary.rtm';


    pp_Purchases.Template.LoadFromFile;
    pp_Purchases.Parameters := RepParam;
    pp_Purchases.OutlineSettings.CreateNode := false;
    pp_Purchases.OutlineSettings.CreatePageNodes := false;
    pp_Purchases.OutlineSettings.Visible := false;
    pp_Purchases.PreviewFormSettings.WindowState := wsMaximized;
    pp_Purchases.PreviewFormSettings.ZoomPercentage := 100;
    pp_Purchases.AllowPrintToFile := True;
    pp_Purchases.ShowPrintDialog := True;
    pp_Purchases.Print;

end;

procedure TfmBaseReports.cbo_ItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key<>VK_F2 then Exit
 else begin
    lkp := Tlkp.Create(qry_Items,nil);
    lkp.ShowModal;
    qry_ItemCard.Open;
    qry_ItemCard.Edit;
    qry_ItemCardItemCode.AsString := qry_ItemsItemCode.AsString;
    qry_ItemCardItemService.AsString := qry_ItemsItemService.AsString;
    qry_ItemCardItemNameAr.AsString := qry_ItemsItemNameAr.AsString;
    qry_ItemCardItemNameEn.AsString := qry_ItemsItemNameEn.AsString;
    qry_ItemCardItemUnitCode.AsString := qry_ItemsItemUnitCode.AsString;
  end;
end;

end.

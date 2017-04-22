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
    GroupBox2: TGroupBox;
    btnPrintItemCardReport: TButton;
    btnClose: TButton;
    pnlTitle: TPanel;
    pp_ItemCard: TppReport;
    DS_ItemCard: TDataSource;
    PPL_ItemCard: TppDBPipeline;
    tsh_Sales: TTabSheet;
    grpOutComeData: TGroupBox;
    Label5: TLabel;
    Label10: TLabel;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    btnPrintSalesRepot: TButton;
    Button2: TButton;
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
    ppHeaderBand2: TppHeaderBand;
    ppShape8: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel2: TppLabel;
    ppLabel6: TppLabel;
    ppLabel14: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine20: TppLine;
    ppLabel16: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine10: TppLine;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppVariable2: TppVariable;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppVariable4: TppVariable;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBText12: TppDBText;
    ppShape7: TppShape;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine22: TppLine;
    raCodeModule2: TraCodeModule;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel11: TppLabel;
    ppDBText5: TppDBText;
    procedure btnPrintItemCardReportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnPrintSalesRepotClick(Sender: TObject);
    procedure rg_AllItemsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      Rep: TppReport;
      RepParam , ExpensesRepParam : TppParameterList;
  end;

var
  fmBaseReports: TfmBaseReports;

implementation

uses GFunctions, DateUtils, GVariable, Main;

{$R *.dfm}

procedure TfmBaseReports.btnPrintItemCardReportClick(Sender: TObject);
Var
   RepFileName : String ;
   FDate , TDate , F_OBDate , ItemCode : String ;
begin
    RepParam.Clear;
    RepParam['From_Date'].AsString := DateToStr(dt_ItemCardFromDate.Date);
    RepParam['To_Date'].AsString := DateToStr(dt_ItemCardtoDate.Date);

    If DateToStr(dt_ItemCardFromDate.Date) <> '' Then FDate := ' And RD_Trans.TrxDate >= ''' + FormatDateTime('MM/DD/YYYY', dt_ItemCardFromDate.Date) + ''' '
    else FDate := '';

    If DateToStr(dt_ItemCardtoDate.Date) <> '' Then TDate := ' And RD_Trans.TrxDate <= ''' + FormatDateTime('MM/DD/YYYY', dt_ItemCardtoDate.Date) + ''' '
    else TDate := '';

    If DateToStr(dt_ItemCardFromDate.Date) <> '' Then F_OBDate := ' And H.TrxDate < ''' + FormatDateTime('MM/DD/YYYY', dt_ItemCardFromDate.Date) + ''' '
    else FDate := '';

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
      + '                                                 SELECT     H.CompanyCode, H.BranchCode, H.TrxNo, H.TrxType, H.TrxDate, H.TrxStatus, H.TrxDescAr, H.TrxDescEn, H.TrxAmount, D.BarCode, '
      + '                                                                       D.ItemCode, D.ItemService, I.ItemNameAr, I.ItemNameEn, CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') THEN D .Quantity ELSE 0 END AS InQty, '
      + '                                                                       CASE WHEN H.TrxType = ''PRRT'' THEN D .Quantity ELSE 0 END AS OutQty, D.ItemUnit, U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, '
      + '                                                                       CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') THEN 0 ELSE 1 END AS TrxOrder '
      + '                                                 FROM         tbl_PrTrxHeader AS H INNER JOIN '
      + '                                                                       tbl_PrTrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
      + '                                                                       H.TrxType = D.TrxType LEFT OUTER JOIN '
      + '                                                                       tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnit = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                                                       tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND D.ItemCode = I.ItemCode '
      + '                                                 WHERE     (H.TrxType IN (''IVBB'', ''PRIV'', ''PRRT'')) '
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
      + '                                                                                               D.ItemCode, D.ItemService, I.ItemNameAr, I.ItemNameEn, CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') '
      + '                                                                                               THEN D .Quantity ELSE 0 END AS InQty, CASE WHEN H.TrxType = ''PRRT'' THEN D .Quantity ELSE 0 END AS OutQty, D.ItemUnit, '
      + '                                                                                               U.ItemUnitDescA, U.ItemUnitDescE, D.UnitTransValue, CASE WHEN H.TrxType IN (''IVBB'', ''PRIV'') '
      + '                                                                                               THEN 0 ELSE 1 END AS TrxOrder '
      + '                                                                         FROM         tbl_PrTrxHeader AS H INNER JOIN '
      + '                                                                                               tbl_PrTrxDetails AS D ON H.CompanyCode = D.CompanyCode AND H.BranchCode = D.BranchCode AND H.TrxNo = D.TrxNo AND '
      + '                                                                                               H.TrxType = D.TrxType LEFT OUTER JOIN '
      + '                                                                                               tbl_ItemUnit AS U ON D.CompanyCode = U.CompanyCode AND D.ItemUnit = U.ItemUnitCode LEFT OUTER JOIN '
      + '                                                                                               tbl_ItemDefinition AS I ON D.CompanyCode = I.CompanyCode AND D.ItemService = I.ItemService AND '
      + '                                                                                               D.ItemCode = I.ItemCode '
      + '                                                                         WHERE     (H.TrxType IN (''IVBB'', ''PRIV'', ''PRRT''))  '   + F_OBDate
      + '                                                              ) AS RD_OB '
      + '                                                 GROUP BY CompanyCode, BranchCode, TrxStatus, ItemCode, ItemService, ItemNameAr, ItemNameEn '
      + '                                      ) AS RD_Sum_OB '
      + '                         Where companyCode = ''' + DCompany + ''' And BranchCode = ''' + DBranch + ''' '  + ItemCode
      + '              ) AS RD '
      + ' ORDER BY ItemCode, TrxDate, TrxOrder ';

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
   FDate , TDate , FBuilding , TBuilding , FEstate , TEstate , TrxType : String ;
begin
    RepParam.Clear;
    {
    If edt_OutComeFromDate.Text <> '' Then FDate := ' And RD.GDate >= ''' + FormatDateTime('MM/DD/YYYY', StrToDateTime(edt_OutComeFromDate.Text)) + ''' '
    else FDate := '';

    If edt_OutComeToDate.Text <> '' Then TDate := ' And RD.GDate <= ''' + FormatDateTime('MM/DD/YYYY', StrToDateTime(edt_OutComeToDate.Text)) + ''' '
    else TDate := '';

    qry_GeneralTransaction.Close;
    qry_GeneralTransaction.DataSet.Close;
    qry_GeneralTransaction.DataSet.CommandText := ''
      + ' Select * From   '
      + ' (  '
      + ' SELECT     lkp_HijriDates.GDate, General_Transaction.*  '
      + ' FROM         General_Transaction INNER JOIN  '
      + '                       lkp_HijriDates ON General_Transaction.TrxDate_hijri = lkp_HijriDates.HDate '
      + ' ) RD '
      + ' Where TrxType = ''OTCM''  '
      + FDate + TDate
      + ' ORDER BY RD.TrxNo   ';
    qry_GeneralTransaction.Open;

    pp_GeneralTransaction.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\GeneralOutcomeReport.rtm';
    pp_GeneralTransaction.Template.LoadFromFile;
    pp_GeneralTransaction.Parameters := RepParam;
    pp_GeneralTransaction.OutlineSettings.CreateNode := false;
    pp_GeneralTransaction.OutlineSettings.CreatePageNodes := false;
    pp_GeneralTransaction.OutlineSettings.Visible := false;
    pp_GeneralTransaction.PreviewFormSettings.WindowState := wsMaximized;
    pp_GeneralTransaction.PreviewFormSettings.ZoomPercentage := 100;
    pp_GeneralTransaction.AllowPrintToFile := True;
    pp_GeneralTransaction.ShowPrintDialog := True;
    pp_GeneralTransaction.Print;
     }
 
end;

procedure TfmBaseReports.rg_AllItemsClick(Sender: TObject);
begin
   If rg_AllItems.ItemIndex = 1 Then cbo_Item.Visible := True
   else cbo_Item.Visible := False;
end;

end.

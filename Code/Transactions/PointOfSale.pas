unit PointOfSale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls,  StdCtrls, Mask, Grids, DBGrids,
  Buttons, ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, SimpleDS,
  ppBands, ppCache, ppClass, ppProd, ppReport, ppParameter,
  DBXpress, Math,
  VrMatrix, VrLcd, VrControls, VrBlotter, VrAnalog, VrCounter, VrLeds,adodb,
  VrDigit,VrButtons ,
  ppTypes, DateUtils,  FMTBcd, SqlExpr,
  VrKeyPad,   ComCtrls, ppModule, raCodMod, ppStrtch, ppMemo, ppCtrls,
  ppVar, ppPrnabl;

type
  TfmPointOfSale = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnlTitle: TPanel;
    Panel4: TPanel;
    paButtons: TPanel;
    btn_Cancel: TVrDemoButton;
    btn_SaveAndPrint: TVrDemoButton;
    btn_Add: TVrDemoButton;
    SDS_Items: TSimpleDataSet;
    SDS_ItemsItemService: TStringField;
    SDS_ItemsItemCode: TStringField;
    qryBarcodeVio: TSimpleDataSet;
    SDS_AllUnits: TSimpleDataSet;
    SDS_Header: TSimpleDataSet;
    SDS_HeaderYearID: TStringField;
    SDS_HeaderPeriodID: TStringField;
    SDS_HeaderTrxType: TStringField;
    SDS_HeaderTrxNo: TStringField;
    SDS_HeaderTrxDate: TSQLTimeStampField;
    SDS_HeaderTrxDescA: TStringField;
    SDS_HeaderTrxDescE: TStringField;
    SDS_HeaderTrxStatus: TStringField;
    SDS_HeaderCustomerCode: TStringField;
    SDS_HeaderWarehouseCode: TStringField;
    SDS_HeaderTotalDiscount: TFMTBCDField;
    SDS_HeaderTrxAmount: TFMTBCDField;
    SDS_HeaderTrxBalance: TFMTBCDField;
    SDS_HeaderPOSShift: TStringField;
    SDS_HeaderPOSCode: TStringField;
    DS_Header: TDataSource;
    DPL_Header: TppDBPipeline;
    ppSales: TppDBPipeline;
    SDS_Details: TSimpleDataSet;
    SDS_DetailsBarcode: TStringField;
    SDS_DetailsItemService: TStringField;
    SDS_DetailsItemCode: TStringField;
    SDS_DetailsQuantity: TFMTBCDField;
    SDS_DetailsItemPrice: TFMTBCDField;
    SDS_DetailsDiscount: TFMTBCDField;
    SDS_DetailsDiscountRatio: TFMTBCDField;
    SDS_DetailsNetPrice: TFMTBCDField;
    SDS_DetailsUnitTransValue: TFMTBCDField;
    SDS_DetailsTotalPrice: TFMTBCDField;
    SDS_DetailsCostPrice: TFMTBCDField;
    SDS_DetailsTotalAmount: TAggregateField;
    SDS_DetailsTotalDiscount: TAggregateField;
    DS_Details: TDataSource;
    SDS_HeaderTrxTime: TSQLTimeStampField;
    Panel7: TPanel;
    ArEnPanel1: TPanel;
    QLabel10: TLabel;
    vrmAmount: TVrMatrix;
    QLabel7: TLabel;
    vrmTotalDiscount: TVrMatrix;
    vrmTotal: TVrMatrix;
    QLabel13: TLabel;
    vrmChange: TVrMatrix;
    ArEnLabel1: TLabel;
    qry_SorceDocItems: TSimpleDataSet;
    SDS_HeaderOperatorCode: TStringField;
    VrBlotter2: TVrBlotter;
    VrBlotter1: TVrBlotter;
    vrdgAmount: TVrDigitGroup;
    DS_Policy: TDataSource;
    SDS_SourceDoc: TSimpleDataSet;
    SDS_HeaderCompanyCode: TStringField;
    SDS_HeaderBranchCode: TStringField;
    SDS_DetailsTrxDetailDescA: TStringField;
    SDS_DetailsTrxDetailDescE: TStringField;
    SDS_DetailsCompanyCode: TStringField;
    SDS_DetailsBranchCode: TStringField;
    SDS_DetailsTrxNo: TStringField;
    SDS_DetailsTrxType: TStringField;
    SDS_DetailsYearID: TStringField;
    SDS_DetailsPeriodID: TStringField;
    SDSBranches: TSimpleDataSet;
    SDSBranchesBranchCode: TStringField;
    SQLQuery1: TSQLQuery;
    VrClock1: TVrClock;
    grp_Container: TGroupBox;
    pnlKeyPad: TPanel;
    ArEnPanel3: TPanel;
    Bevel1: TBevel;
    ArEnLabel7: TLabel;
    vrmPayed: TVrMatrix;
    ArEnLabel8: TLabel;
    vrmRemainder: TVrMatrix;
    Bevel2: TBevel;
    pnlDetails: TPanel;
    grdDetails: TDBGrid;
    pnl_Header: TPanel;
    Panel6: TPanel;
    ArEnLabel10: TLabel;
    DBComboBox1: TDBComboBox;
    qdbeCode: TDBEdit;
    lcbPolicy: TDBLookupComboBox;
    btnPrint: TVrDemoButton;
    btn_Close: TVrDemoButton;
    btnShow: TVrDemoButton;
    pnl_InsertBarcode: TPanel;
    ArEnLabel11: TLabel;
    ArEnLabel12: TLabel;
    edtQuantity: TDBEdit;
    VrKeyPad1: TVrKeyPad;
    VrDigitGroup1: TVrDigitGroup;
    edtBarcode: TEdit;
    btn_DeleteItem: TVrDemoButton;
    Btn_LogOut: TVrDemoButton;
    PageControlDetails: TPageControl;
    pnl_PaymentType: TPanel;
    ArEnLabel9: TLabel;
    ArEnLabel2: TLabel;
    ArEnLabel3: TLabel;
    ArEnLabel4: TLabel;
    ArEnLabel5: TLabel;
    ArEnLabel6: TLabel;
    ArEnLabel13: TLabel;
    edtCashPaid: TEdit;
    edtCash: TEdit;
    edtCheck: TEdit;
    edtCreditCard: TEdit;
    edtATM: TEdit;
    edtCredit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SDS_HeaderIntRefrence: TStringField;
    SDS_HeaderSourceDocNo: TStringField;
    SDS_HeaderSourceDocType: TStringField;
    SDS_HeaderSourceDocYearId: TStringField;
    SDS_HeaderSourceDocPeriodId: TStringField;
    SDS_HeaderCashCode: TStringField;
    SDS_HeaderBankCode: TStringField;
    SDS_HeaderCash: TFMTBCDField;
    SDS_HeaderATM: TFMTBCDField;
    SDS_HeaderVisa: TFMTBCDField;
    SDS_HeaderChecks: TFMTBCDField;
    SDS_HeaderCredit: TFMTBCDField;
    SDS_HeaderCreateDate: TSQLTimeStampField;
    SDS_HeaderLastUpdateDate: TSQLTimeStampField;
    SDS_DetailsTrxLineNo: TFMTBCDField;
    SDS_DetailsItemUnitCode: TStringField;
    SDS_DetailsSourceDocLineNo: TFMTBCDField;
    SDS_ItemsItemNameAr: TStringField;
    SDS_ItemsItemNameEn: TStringField;
    SDS_ItemsItemUnitCode: TStringField;
    qryBarcodeVioCompanyCode: TStringField;
    qryBarcodeVioItemCode: TStringField;
    qryBarcodeVioItemService: TStringField;
    qryBarcodeVioBarcode: TStringField;
    qryBarcodeVioStatus: TStringField;
    qryBarcodeVioPrice: TFMTBCDField;
    qryBarcodeVioItemUnitDescA: TStringField;
    qryBarcodeVioItemUnit: TStringField;
    qryBarcodeVioBaseUnit: TStringField;
    qryBarcodeVioUnitTransValue: TFMTBCDField;
    qryBarcodeVioItemUnitDescE: TStringField;
    qryBarcodeVioItemTypeCode: TStringField;
    qryBarcodeVioItemGroupCode: TStringField;
    qryBarcodeVioItemNameAr: TStringField;
    qryBarcodeVioItemNameEn: TStringField;
    qryBarcodeVioItemCategoryCode: TStringField;
    qryBarcodeVioDiscountRatio: TFMTBCDField;
    qryBarcodeVioDiscountValue: TFMTBCDField;
    qryBarcodeVioItemColorCode: TStringField;
    qryBarcodeVioItemSizeCode: TStringField;
    SDS_AllUnitsCompanyCode: TStringField;
    SDS_AllUnitsItemUnitCode: TStringField;
    SDS_AllUnitsItemUnitDescA: TStringField;
    SDS_AllUnitsItemUnitDescE: TStringField;
    SDS_AllUnitsUnitTransCode: TStringField;
    SDS_AllUnitsUnitTransValue: TFMTBCDField;
    SDS_AllUnitsCreateDate: TSQLTimeStampField;
    SDS_AllUnitsLastUpdateDate: TSQLTimeStampField;
    SDSBranchesBranchNameAr: TStringField;
    SDSBranchesBranchNameEn: TStringField;
    SDS_SourceDocTrxNo: TStringField;
    SDS_SourceDocTrxDate: TSQLTimeStampField;
    SDS_SourceDocTrxDescA: TStringField;
    SDS_SourceDocTrxDescE: TStringField;
    qry_SorceDocItemsCompanyCode: TStringField;
    qry_SorceDocItemsBranchCode: TStringField;
    qry_SorceDocItemsTrxNo: TStringField;
    qry_SorceDocItemsTrxType: TStringField;
    qry_SorceDocItemsYearID: TStringField;
    qry_SorceDocItemsPeriodID: TStringField;
    qry_SorceDocItemsTrxLineNo: TFMTBCDField;
    qry_SorceDocItemsBarcode: TStringField;
    qry_SorceDocItemsItemCode: TStringField;
    qry_SorceDocItemsItemService: TStringField;
    qry_SorceDocItemsQuantity: TFMTBCDField;
    qry_SorceDocItemsItemPrice: TFMTBCDField;
    qry_SorceDocItemsDiscount: TFMTBCDField;
    qry_SorceDocItemsDiscountRatio: TFMTBCDField;
    qry_SorceDocItemsNetPrice: TFMTBCDField;
    qry_SorceDocItemsCostPrice: TFMTBCDField;
    qry_SorceDocItemsItemUnitCode: TStringField;
    qry_SorceDocItemsUnitTransValue: TFMTBCDField;
    qry_SorceDocItemsTrxDetailDescA: TStringField;
    qry_SorceDocItemsTrxDetailDescE: TStringField;
    qry_SorceDocItemsSourceDocLineNo: TFMTBCDField;
    qryItemPrices: TSimpleDataSet;
    qryItemPricesCompanyCode: TStringField;
    qryItemPricesItemService: TStringField;
    qryItemPricesItemCode: TStringField;
    qryItemPricesPolicyCode: TStringField;
    qryItemPricesItemUnit: TStringField;
    qryItemPricesPriceValue: TFMTBCDField;
    qryItemPricesPriceRatio: TFMTBCDField;
    qryItemPricesDiscountRatio: TFMTBCDField;
    qryItemPricesCreateDate: TSQLTimeStampField;
    qryItemPricesLastUpdateDate: TSQLTimeStampField;
    SDS_HeaderPayedValue: TFMTBCDField;
    SDS_HeaderRemainderValue: TFMTBCDField;
    SDS_HeaderTotal: TFMTBCDField;
    SDS_DetailsItemNameAr: TStringField;
    SDS_DetailsItemUnitDescA: TStringField;
    cbo_Operators: TDBLookupComboBox;
    qry_Operators: TSimpleDataSet;
    qry_OperatorsCompanyCode: TStringField;
    qry_OperatorsOperatorCode: TStringField;
    qry_OperatorsOperatorNameAr: TStringField;
    qry_OperatorsOperatorNameEn: TStringField;
    qry_OperatorsUserID: TStringField;
    qry_OperatorsCreateDate: TSQLTimeStampField;
    qry_OperatorsLastUpdateDate: TSQLTimeStampField;
    DS_Operators: TDataSource;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    cbo_Customers: TDBLookupComboBox;
    Label5: TLabel;
    cbo_Warehouse: TDBLookupComboBox;
    Label6: TLabel;
    qry_Customers: TSimpleDataSet;
    qry_CustomersCompanyCode: TStringField;
    qry_CustomersCustomerCode: TStringField;
    qry_CustomersCustomerGroupCode: TStringField;
    qry_CustomersCustomerNameAr: TStringField;
    qry_CustomersCustomerNameEn: TStringField;
    qry_CustomersCreateDate: TSQLTimeStampField;
    qry_CustomersLastUpdateDate: TSQLTimeStampField;
    DS_Customers: TDataSource;
    qry_Warehouse: TSimpleDataSet;
    DS_Warehouse: TDataSource;
    qry_WarehouseCompanyCode: TStringField;
    qry_WarehouseWareHouseCode: TStringField;
    qry_WarehouseWareHouseNameAr: TStringField;
    qry_WarehouseWareHouseNameEn: TStringField;
    qry_WarehouseCreateDate: TSQLTimeStampField;
    qry_WarehouseLastUpdateDate: TSQLTimeStampField;
    ppPrintSales: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel10: TppLabel;
    pplTitle: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    pplTrxNo: TppLabel;
    pplTrxDate: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBQty: TppDBText;
    ppDBItemName: TppDBText;
    ppDBUnit: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText6: TppDBText;
    pplItemName: TppLabel;
    pplUnit: TppLabel;
    pplQty: TppLabel;
    pplPrice: TppLabel;
    pplTotalPrice: TppLabel;
    pplDiscount: TppLabel;
    pplNet: TppLabel;
    ppLine12: TppLine;
    ppLabel9: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    pplTotal: TppLabel;
    ppLabel2: TppLabel;
    ppDBText9: TppDBText;
    ppLabel3: TppLabel;
    ppDBText10: TppDBText;
    ppDBText16: TppDBText;
    ppLabel6: TppLabel;
    ppDBText17: TppDBText;
    ppLabel7: TppLabel;
    ppDBText14: TppDBText;
    raCodeModule1: TraCodeModule;
    ppParameterList2: TppParameterList;
    ppParamTrxType: TppParameter;
    qryItemPricesUnitTransValue: TFMTBCDField;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SDS_HeaderAfterScroll(DataSet: TDataSet);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveAndPrintClick(Sender: TObject);
    procedure SDS_DetailsCalcFields(DataSet: TDataSet);
    procedure SDS_HeaderCalcFields(DataSet: TDataSet);
    procedure SDS_DetailsAfterScroll(DataSet: TDataSet);
    procedure grdDetailsExit(Sender: TObject);
    procedure SDS_DetailsDiscountChange(Sender: TField);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SDS_DetailsNewRecord(DataSet: TDataSet);
    procedure SDS_HeaderNewRecord(DataSet: TDataSet);
    procedure SDS_HeaderTrxAmountChange(Sender: TField);
    procedure SDS_HeaderTotalDiscountChange(Sender: TField);
    procedure btnShowClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edtCashKeyPress(Sender: TObject; var Key: Char);
    procedure edtCashChange(Sender: TObject);
    procedure CalcPayedAndRemainder();
    procedure FormShow(Sender: TObject);
    procedure VrKeyPad1Extra1Click(Sender: TObject);
    procedure VrKeyPad1Extra2Click(Sender: TObject);
    procedure VrKeyPad1Extra3Click(Sender: TObject);
    procedure VrKeyPad1NumericKeyClick(Sender: TObject; Key: Integer);
    procedure VrKeyPad1SharpClick(Sender: TObject);
    procedure edtBarcodeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_DeleteItemClick(Sender: TObject);
    procedure SDS_HeaderTotalChange(Sender: TField);
    procedure Btn_LogOutClick(Sender: TObject);
  private
    { Private declarations }
    TrxType , QueryStr: string;
    procedure SavingTransaction;
    procedure DeletingTransaction;
    procedure GenerateGroupAndItems;
    procedure ItemClick(Sender: TObject);
  public
    Cash, Check, CreditCard, ATM, Credit : string;
    Rep: TppReport;
    RepParam : TppParameterList;    
    { Public declarations }
    procedure InsertBarcode(Barcode: string; Quantity: Real);
    procedure InsertItem(ItemCode: string; Quantity , Price: Real);
  end;

var
  fmPointOfSale: TfmPointOfSale;

implementation

uses Main,Login, GFunctions, GVariable, posPayType, LookUp;

  {$R *.dfm}


procedure TfmPointOfSale.InsertBarcode(Barcode :  string; Quantity : Real);
begin
  if grdDetails.ReadOnly then Exit;
  qryBarcodeVio.Refresh;

  if not ((SDS_Details.RecordCount < 2) and (SDS_Details.FieldByName('ItemCode').AsString = ''))
  then  SDS_Details.Append
  else  SDS_Details.Edit;

  SDS_DetailsBarcode.ReadOnly := False;
  if Quantity <> 0 then
  begin
    if not qryBarcodeVio.Locate('Barcode', Barcode, []) then
    begin

      SDS_DetailsItemService.Value := qryItemPricesItemService.Value;
      SDS_DetailsItemCode.Value := qryItemPricesItemCode.Value;
     

      SDS_DetailsQuantity.ReadOnly := False;
      SDS_DetailsQuantity.AsFloat := Quantity ;
      SDS_DetailsQuantity.ReadOnly := True;

      SDS_DetailsItemUnitCode.ReadOnly := False;
      SDS_DetailsItemUnitCode.Value := qryItemPricesItemUnit.Value;
      SDS_DetailsItemPrice.ReadOnly := False;
      SDS_DetailsItemPrice.AsFloat := qryItemPricesPriceValue.AsFloat;
      SDS_DetailsUnitTransValue.AsFloat := qryItemPricesUnitTransValue.AsFloat;
    end
    else
    begin

      SDS_DetailsBarcode.Value := qryBarcodeVioBarcode.Value;
      SDS_DetailsItemService.Value := qryBarcodeVioItemService.Value;
      SDS_DetailsItemCode.Value := qryBarcodeVioItemCode.Value;

      SDS_DetailsQuantity.ReadOnly := False;
      SDS_DetailsQuantity.AsFloat := Quantity ;
      SDS_DetailsQuantity.ReadOnly := True;

      SDS_DetailsItemUnitCode.ReadOnly := False;
      SDS_DetailsItemUnitCode.Value := qryBarcodeVioItemUnit.Value;
      SDS_DetailsUnitTransValue.AsFloat := qryBarcodeVioUnitTransValue.AsFloat;

      SDS_DetailsItemPrice.AsFloat := qryBarcodeVioPrice.AsFloat

    end;
  end;

  SDS_DetailsItemUnitCode.ReadOnly := True;
  SDS_DetailsBarcode.ReadOnly := True;
  SDS_Details.Append;
  SDS_Details.Cancel;
  edtCashPaid.Text := vrmAmount.Text;
end;

procedure TfmPointOfSale.btn_CloseClick(Sender: TObject);
Var
  buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('åá ÊÑíÏ ÍÞÇ ÇáÛÇÁ ÇáÊÚÏíáÇÊ',mtInformation, mbOKCancel, 0);
  if buttonSelected = mrOK then
  Begin
     SDS_Header.CancelUpdates;
     close;
  end;
end;

procedure TfmPointOfSale.FormCreate(Sender: TObject);
var
  i: integer;
begin
  TrxType := 'SAIV';
  RepParam := TppParameterList.Create(Self);
  if gPOSWorkByTouch = 'T' Then Begin
     pnl_InsertBarcode.Visible := False;
     PageControlDetails.Visible := True;
     SDS_DetailsItemCode.Visible := False;
     SDS_DetailsBarcode.Visible := False;
     If (Screen.Width = 1024) And (Screen.Height = 768)  Then Begin
       SDS_DetailsItemNameAr.DisplayWidth := 15;
       SDS_DetailsQuantity.DisplayWidth := 6;
       SDS_DetailsItemPrice.DisplayWidth := 6;
       SDS_DetailsNetPrice.DisplayWidth := 6;
       PageControlDetails.Width := 350
     end else Begin
       SDS_DetailsItemNameAr.DisplayWidth := 22;
       SDS_DetailsQuantity.DisplayWidth := 7;
       SDS_DetailsItemPrice.DisplayWidth := 7;
       SDS_DetailsNetPrice.DisplayWidth := 7;
     end;

     SDS_DetailsDiscount.Visible := False;
     SDS_DetailsDiscountRatio.Visible := False;
     grdDetails.BiDiMode := bdLeftToRight;

  end else Begin
     pnl_InsertBarcode.Visible := True;
     PageControlDetails.Visible := False;
     grdDetails.BiDiMode := bdRightToLeft;
  end;

  WindowState := wsMaximized;


  Inherited;

  SDS_Items.Open;
  qryBarcodeVio.Open;
  SDS_AllUnits.open;
  qry_Operators.Open;
  qryBarcodeVio.Open;
  qry_Warehouse.Open;
  qry_Customers.Open;
  qryItemPrices.Open;
  SDS_Header.Open;


  QueryStr := ' '
    + ' SELECT H.* '
    + ' FROM sa_POS_TrxHeader H '
    + ' Where  H.CompanyCode = ''' + DCompany + ''' And H.BranchCode = ''' +  DBranch + ''' '
    + ' And H.TrxType = ''SAIV'' '
    + ' Order By  H.TrxNo ';

  SDS_Header.Close;
  SDS_Header.DataSet.Close;
  SDS_Header.DataSet.CommandText := QueryStr;
  SDS_Header.Open;

  GenerateGroupAndItems ;
end;

procedure TfmPointOfSale.SDS_HeaderAfterScroll(DataSet: TDataSet);
Var
   WhereCond : String;
begin

   WhereCond := ' Where D.CompanyCode=''' + DCompany + ''' And D.BranchCode = ''' + DBranch
        + ''' And D.TrxNo='''  + SDS_HeaderTrxNo.AsString  + ''' And D.TrxType=''SAIV'' ';


  QueryStr := ' '
    + ' Select D.* '
    + ' FROM sa_POS_TrxDetails D '
    + WhereCond;
  SDS_Details.Close;
  SDS_Details.DataSet.Close;
  SDS_Details.DataSet.CommandText := QueryStr;
  SDS_Details.Open;


  edtCashPaid.Text := '0';
  edtCash.Text := '0';
  edtCheck.Text := '0';
  edtCreditCard.Text := '0';
  edtATM.Text := '0';
  edtCredit.Text := '0';  
end;

procedure TfmPointOfSale.btn_AddClick(Sender: TObject);
begin
  try
    QueryStr := ' '
      + ' SELECT H.* '
      + ' FROM sa_POS_TrxHeader H '
      + ' Where  H.CompanyCode = ''' + DCompany + ''' And H.BranchCode = ''' +  DBranch + ''' '
      + ' And H.TrxType = ''SAIV'' '
      + ' Order By  H.TrxNo ';

    SDS_Header.Close;
    SDS_Header.DataSet.Close;
    SDS_Header.DataSet.CommandText := QueryStr;
    SDS_Header.Open;

    vrmChange.Text := '0.00';
    if not SDS_Header.Active then
      SDS_Header.Active := True;
    SDS_Header.Append;
    SDS_HeaderTrxNo.AsString := '';
    SDS_HeaderTrxStatus.AsString := 'A';
    SDS_HeaderTrxDate.AsDateTime := Date;
    SDS_HeaderTrxTime.AsDateTime := Time;
    SDS_HeaderPOSShift.AsString := '1';

    SDS_HeaderCustomerCode.AsString := gCustomerCode;
    SDS_HeaderWarehouseCode.AsString := gWarehouseCode;
    SDS_HeaderPOSCode.AsString := gPOSCode;
    SDS_HeaderCashCode.AsString := gCashCode;
    SDS_HeaderBankCode.AsString := gBankCode;
    SDS_HeaderOperatorCode.AsString := gOperatorCode;

    Cash := '';
    Check := '';
    CreditCard := '';
    ATM := '';
    Credit := '';

    SDS_Details.Edit;

    btnShow.Enabled := False;
    btn_SaveAndPrint.Enabled := True;
    btn_Cancel.Enabled := True;
    btnPrint.Enabled := False;
    btn_Close.Enabled := True;
    btn_DeleteItem.Enabled := True;
    Btn_LogOut.Enabled := True;
    btn_Add.Enabled := False;
    pnl_Header.Enabled := True;
    pnlDetails.Enabled := True;
    pnlKeyPad.Enabled := True;    

  except
    SDS_Header.CancelUpdates;
  end;

  If pnl_InsertBarcode.Visible Then edtBarcode.SetFocus;
end;


procedure TfmPointOfSale.SavingTransaction;
var
  TD: TTransactionDesc;
  NewTransID: Integer;
  SQLStatements: TStringList;
  SQLText: string;
  TempQry : TSimpleDataSet;
  NewCode : String;  
begin
  try

    SQLStatements := TStringList.Create;
    SQLStatements.Clear;
    TD.TransactionID := 1;
    TD.IsolationLevel := xilREADCOMMITTED;
    fmMainForm.MainConnection.StartTransaction(TD);

    SDS_HeaderYearID.AsString := VarToStr(YearOf(SDS_HeaderTrxDate.AsDateTime));
    SDS_HeaderPeriodID.AsString := VarToStr(MonthOf(SDS_HeaderTrxDate.AsDateTime));

    TempQry := TSimpleDataSet.Create(nil);
    TempQry.Connection := fmMainForm.MainConnection;
    TempQry.Close;
    TempQry.DataSet.Close;
    TempQry.DataSet.CommandText := ''
      + ' Select ISNULL(Max(CAST(TrxNo AS NUMERIC)),0) As LastTrxNo FROM sa_POS_TrxHeader Where CompanyCode = ''' + DCompany
      + ''' And BranchCode = ''' + DBranch + ''' And TrxType = ''' + TrxType + '''   ' ;
    TempQry.Open;

    NewCode := TempQry.Fields[0].AsString;
    NewCode := IntToStr(StrToInt(NewCode)+1) ;
    SDS_HeaderTrxNo.AsString := NewCode;


    SQLText := 'Insert Into sa_POS_TrxHeader '
           + '           (CompanyCode ,BranchCode,YearID,PeriodID ,TrxNo,TrxType, TrxDate,TrxStatus,TrxDescA '
           + '           ,TrxDescE,IntRefrence,TrxAmount,TrxBalance,TotalDiscount,CustomerCode,WarehouseCode '
           + '           ,SourceDocNo,SourceDocType,TrxTime,POSShift,POSCode,OperatorCode,SourceDocYearId '
           + '           ,SourceDocPeriodId,CashCode,BankCode,Cash,ATM,Visa,Checks,Credit '
           + '           ,CreateDate,PayedValue,RemainderValue) Values (''' + DCompany + ''', ''' + DBranch
           + ''', ''' + SDS_HeaderYearID.AsString + ''', ''' + SDS_HeaderPeriodID.AsString
           + ''', ''' + SDS_HeaderTrxNo.AsString + ''', ''' + TrxType + ''', ''' + FormatDateTime('MM/DD/YYYY', SDS_HeaderTrxDate.AsDateTime)
           + ''', ''A'', ''' + SDS_HeaderTrxDescA.AsString
           + ''', ''' + SDS_HeaderTrxDescE.AsString
           + ''', ''' + SDS_HeaderIntRefrence.AsString

           + '''  , ' + SDS_HeaderTrxAmount.AsString
           + ', ' + SDS_HeaderTrxBalance.AsString
           + ', ' + SDS_HeaderTotalDiscount.AsString

           + ', '''  + SDS_HeaderCustomerCode.AsString
           + ''',''' + SDS_HeaderWarehouseCode.AsString
           + ''', ''' + SDS_HeaderSourceDocNo.AsString
           + ''', ''' + SDS_HeaderSourceDocType.AsString
           + ''', ''' + FormatDateTime('hh:nn:ss', Time)

           + ''',''' + SDS_HeaderPOSShift.AsString

           + ''', ''' + SDS_HeaderPOSCode.AsString
           + ''', ''' + SDS_HeaderOperatorCode.AsString

           + ''', ''' + SDS_HeaderSourceDocYearID.AsString
           + ''', ''' + SDS_HeaderSourceDocPeriodID.AsString

           + ''', ''' + SDS_HeaderCashCode.AsString
           + ''', ''' + SDS_HeaderBankCode.AsString

           + ''', ' + FloatToStr(SDS_HeaderCash.AsFloat)
           + ', ' + FloatToStr(SDS_HeaderATM.AsFloat)
           + ', ' + FloatToStr(SDS_HeaderVisa.AsFloat)
           + ', ' + FloatToStr(SDS_HeaderChecks.AsFloat)
           + ', ' + FloatToStr(SDS_HeaderCredit.AsFloat)

           + ',''' + FormatDateTime('MM/DD/YYYY hh:nn:ss', Now)
           + ''', ' + FloatToStr(SDS_HeaderPayedValue.AsFloat)
           + ', ' + FloatToStr(SDS_HeaderRemainderValue.AsFloat)

           + ') ';

     With SDS_Details do Begin
       DisableControls;
       First;
       While Not Eof Do Begin

             Edit;
             SDS_DetailsTrxLineNo.AsInteger := SDS_Details.RecNo;

             SQLText := SQLText + ' Insert Into sa_POS_TrxDetails(CompanyCode, BranchCode, YearID, PeriodID, TrxNo, TrxType, '
                + 'TrxLineNo, Barcode, ItemService, ItemCode, ItemUnitCode, Quantity, ItemPrice , CostPrice,  Discount, '
                + 'DiscountRatio, NetPrice, UnitTransValue, TrxDetailDescA, TrxDetailDescE, '
                + '  SourceDocLineNo  ) '
                + 'Values (''' + DCompany + ''',''' + DBranch + ''', ''' + SDS_HeaderYearID.AsString
                + ''', ''' + SDS_HeaderPeriodID.AsString + ''', ''' + SDS_HeaderTrxNo.AsString + ''', ''' + TrxType
                + ''', ' + IntToStr(SDS_Details.RecNo)
                + ', ''' + SDS_DetailsBarcode.AsString
                + ''', ''' + SDS_DetailsItemService.AsString
                + ''', ''' + SDS_DetailsItemCode.AsString
                + ''', ''' + SDS_DetailsItemUnitCode.AsString
                + ''', ' + FloatToStr(SDS_DetailsQuantity.AsFloat)
                + ', ' + FloatToStr(SDS_DetailsItemPrice.AsFloat)                
                + ', ' + FloatToStr(SDS_DetailsCostPrice.AsFloat)
                + ', ' + FloatToStr(SDS_DetailsDiscount.AsFloat)
                + ', ' + FloatToStr(SDS_DetailsDiscountRatio.AsFloat)
                + ', ' + FloatToStr(SDS_DetailsNetPrice.AsFloat)
                + ', ' + FloatToStr(SDS_DetailsUnitTransValue.AsFloat)
                + ', ''' + SDS_DetailsTrxDetailDescA.AsString
                + ''',''' + SDS_DetailsTrxDetailDescE.AsString
                + ''', ' + IntToStr(SDS_DetailsSourceDocLineNo.AsInteger)
                + ')';

          Next;
       end;
       First;
       If ControlsDisabled then EnableControls;
     end;

    fmMainForm.MainConnection.ExecuteDirect(SQLText);

    fmMainForm.MainConnection.Commit(TD);
    SQLStatements.Free;
  except
    ShowMessage('ÍÏË ÎØÇ ÃËäÇÁ ÇáÍÝÙ');
    if fmMainForm.MainConnection.InTransaction then
      fmMainForm.MainConnection.Rollback(TD);
    SQLStatements.Free;
  end;
end;

procedure TfmPointOfSale.btn_CancelClick(Sender: TObject);
Var
  buttonSelected : Integer;
begin
  // Show a confirmation dialog
  buttonSelected := MessageDlg('åá ÊÑíÏ ÍÞÇ ÇáÛÇÁ ÇáÊÚÏíáÇÊ',mtInformation, mbOKCancel, 0);

  // Show the button type selected
  if buttonSelected = mrOK then
  Begin
      SDS_Details.EmptyDataSet;
      SDS_Header.CancelUpdates;
      btn_AddClick(Sender);
  end;


end;



procedure TfmPointOfSale.btn_SaveAndPrintClick(Sender: TObject);
var
  ChangeAmount: Double;
  Message_A, Message_E: string;
  TrxDate: TDateTime;
  SQLStatements : TStringList;
  RepFileName : String ;
begin
  TrxDate := SDS_HeaderTrxDate.AsDateTime;
  SQLStatements := TStringList.Create;
  SQLStatements.Clear;

  If SDS_HeaderWareHouseCode.AsString = '' Then
  Begin
     ShowMessage('íÌÈ ÊÍÏíÏ ÇáãÓÊæÏÚ  ÞÈá ÇáÍÝÙ');
     cbo_Warehouse.SetFocus;
     Exit;
  end;

  If (SDS_HeaderOperatorCode.AsString = '')   Then
  Begin
     ShowMessage('íÌÈ ÊÍÏíÏ ÇáßÇÔíÑ ÞÈá ÇáÍÝÙ');
     cbo_Operators.SetFocus;
     Exit;
  end;

  If (SDS_HeaderCustomerCode.AsString = '')   Then
  Begin
     ShowMessage('íÌÈ ÊÍÏíÏ ÇáÚãíá ÞÈá ÇáÍÝÙ');
     cbo_Customers.SetFocus;
     Exit;
  end;

  grdDetails.Options := grdDetails.Options - [dgIndicator];
  if (True) then
  begin
    SDS_HeaderPayedValue.AsFloat := StrToFloat(edtCash.Text);
    SDS_HeaderRemainderValue.AsFloat := StrToFloat(vrmRemainder.Text);

      Application.CreateForm(Tpos_fmPayType, pos_fmPayType);
      pos_fmPayType.PayAmount := SDS_HeaderTrxAmount.AsFloat;
      pos_fmPayType.edtAmount.Text := SDS_HeaderTrxAmount.AsString;
      pos_fmPayType.vrmTotal.Text := vrmAmount.Text;
      if pos_fmPayType.ShowModal = mrOk then
      begin
        If (pos_fmPayType.edtCash.Text = '') Then SDS_HeaderPayedValue.AsFloat := 0
        else SDS_HeaderPayedValue.AsFloat := StrToFloat(pos_fmPayType.edtCash.Text) ;

        SDS_HeaderRemainderValue.AsFloat := StrToFloat(pos_fmPayType.vrmRemainder.Text);
        Cash := pos_fmPayType.edtCash.Text;
        Check := pos_fmPayType.edtCheck.Text;
        CreditCard := pos_fmPayType.edtCreditCard.Text;
        ATM := pos_fmPayType.edtATM.Text;
        Credit := pos_fmPayType.edtCredit.Text;

        edtCash.Text := Cash;
        edtCheck.Text := Check;
        edtCreditCard.Text := CreditCard;
        edtATM.Text := ATM  ;
        edtCredit.Text := Credit;

      end
      ELSE BEGIN
        EXIT;
      END ;


    Cash := edtCash.Text;
    Check := edtCheck.Text;
    CreditCard := edtCreditCard.Text;
    ATM := edtATM.Text;
    Credit := edtCredit.Text;

    ChangeAmount := 0;
    if Cash = '' then
      Cash := '0';
    if (StrToFloat(Cash) > 0)  then
    begin
      SDS_HeaderCash.AsFloat := StrToFloat(Cash);
      ChangeAmount := ChangeAmount + StrToFloat(Cash);
    end;

    if Check = '' then
      Check := '0';
    if (StrToFloat(Check) > 0) then
    begin
      SDS_HeaderChecks.AsFloat := StrToFloat(Check);
      ChangeAmount := ChangeAmount + StrToFloat(Check);
    end;

    if CreditCard = '' then
      CreditCard := '0';
    if (StrToFloat(CreditCard) > 0)
    then
    begin
      SDS_HeaderVisa.AsFloat := StrToFloat(CreditCard);
      ChangeAmount := ChangeAmount + StrToFloat(CreditCard);
    end;

    if ATM = '' then
      ATM := '0';
    if (StrToFloat(ATM) > 0) then
    begin
      SDS_HeaderATM.AsFloat := StrToFloat(ATM);
      ChangeAmount := ChangeAmount + StrToFloat(ATM);
    end;

    if Credit = '' then
      Credit := '0';
    if (StrToFloat(Credit) > 0)
    then
    begin
      SDS_HeaderCredit.AsFloat := StrToFloat(Credit);
      ChangeAmount := ChangeAmount + StrToFloat(Credit);
    end;

    ChangeAmount := (RoundTo(ChangeAmount, 0) - RoundTo(SDS_HeaderTrxAmount.AsFloat, 0));

    pos_fmPayType.Free;
    if ChangeAmount < 0 then
    begin
      ShowMessage('ÇáãÈáÛ ÇáÏÝæÚ ÎØÃ');
      Exit;
    end;
    vrmChange.Text := FormatFloat('#,0.00', (SDS_HeaderRemainderValue.AsFloat));
  end
  else
  begin
      pos_fmPayType.Free;
      Exit;
  end;

  try
    SavingTransaction;
    SDS_Header.Edit;
    SDS_HeaderTrxDate.AsDateTime := TrxDate;

    RepParam.Clear;
    ppPrintSales.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\POS_SalesForm.rtm' ;

    ppPrintSales.Parameters.Clear;
    ppPrintSales.Template.LoadFromFile;
    ppPrintSales.Parameters := RepParam;
    ppPrintSales.OutlineSettings.CreateNode := false;
    ppPrintSales.OutlineSettings.CreatePageNodes := false;
    ppPrintSales.OutlineSettings.Visible := false;
    ppPrintSales.PreviewFormSettings.WindowState := wsMaximized;
    ppPrintSales.PreviewFormSettings.ZoomPercentage := 100;
    ppPrintSales.AllowPrintToFile := True;

    ppPrintSales.ShowPrintDialog := false;
    ppPrintSales.DeviceType := 'dtPrinter';
    ppPrintSales.Device := dvPrinter;

    ppPrintSales.Print;



    grdDetails.Options := grdDetails.Options + [dgIndicator];
    btn_AddClick(Sender);

  except on E: Exception do Begin
      ShowMessage(E.Message);
      grdDetails.Options := grdDetails.Options + [dgIndicator];
  end;
  
  end;
end;

procedure TfmPointOfSale.SDS_DetailsCalcFields(DataSet: TDataSet);
begin
  SDS_DetailsTotalPrice.AsFloat := SDS_DetailsItemPrice.AsFloat * SDS_DetailsQuantity.AsFloat;
end;

procedure TfmPointOfSale.SDS_HeaderCalcFields(DataSet: TDataSet);
begin
    SDS_HeaderTotal.AsFloat := SDS_HeaderTrxAmount.AsFloat + Floor(SDS_HeaderTotalDiscount.AsFloat)
end;

procedure TfmPointOfSale.SDS_DetailsAfterScroll(DataSet: TDataSet);
begin

    if SDS_DetailsTotalAmount.AsString = '' then Begin
      SDS_Header.Edit;
      SDS_HeaderTrxAmount.AsFloat := 0
    end else Begin
      SDS_Header.Edit;
      SDS_HeaderTrxAmount.AsFloat := SDS_DetailsTotalAmount.Value ;
    end;

    if edtCashPaid.Text = '' then
      edtCashPaid.Text := vrmAmount.Text;
end;

procedure TfmPointOfSale.grdDetailsExit(Sender: TObject);
var
  CurrentRecord: TBookmark;
begin
  CurrentRecord := SDS_Details.GetBookmark;

  If SDS_Details.State in [dsInsert, dsEdit] then SDS_Details.Post;
  SDS_Details.Edit;

  SDS_DetailsTrxLineNo.AsInteger := SDS_Details.RecNo;
  If SDS_Details.State in [dsInsert, dsEdit] then SDS_Details.Post;

end;

procedure TfmPointOfSale.SDS_DetailsDiscountChange(Sender: TField);
var
  DefaultPrice: Double;
begin
   SDS_DetailsNetPrice.ReadOnly := False;
   SDS_DetailsNetPrice.AsFloat := ((SDS_DetailsItemPrice.AsFloat - SDS_DetailsDiscount.AsFloat ) * SDS_DetailsQuantity.AsFloat );
   SDS_DetailsNetPrice.Readonly := True;
end;

procedure TfmPointOfSale.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  V: Variant;
  S: string;
begin
  if ((Key = VK_F11) and (Shift = [ssCtrl])) then
  begin
    Cash := edtCash.Text;
    Check := edtCheck.Text;
    CreditCard := edtCreditCard.Text;
    ATM := edtATM.Text;
    Credit := edtCredit.Text;
    btn_SaveAndPrint.OnClick(nil);
  end;

  if ((Key = ord('n')) or (Key = ord('N'))) and (Shift = [ssAlt]) or (Key =
    VK_F6) then
  begin
    if (btn_Add.Enabled) and (btn_Add.Visible) then
      btn_AddClick(nil);
  end;


  if ((Key = ord('c')) or (Key = ord('C'))) and (Shift = [ssAlt]) or (Key =
    VK_F10) then
  begin
    if (btn_Cancel.Enabled) and (btn_Cancel.Visible) then
      btn_CancelClick(nil);
  end;

  if ((Key = ord('p')) or (Key = ord('P'))) and (Shift = [ssAlt]) or ((Key =
    VK_F11) and (Shift = [])) then
  begin
    if (btn_SaveAndPrint.Enabled) and (btn_SaveAndPrint.Visible) then
      btn_SaveAndPrint.OnClick(nil);
  end;

  if ((Key = ord('l')) or (Key = ord('L'))) and (Shift = [ssAlt]) then
  begin
    if (btn_Close.Enabled) and (btn_Close.Visible) then
      btn_CloseClick(nil);
  end;

  if ((Key = ord('p')) or (Key = ord('P'))) and (Shift = [ssCtrl]) then
  begin
    if (btnPrint.Enabled) and (btnPrint.Visible) then
      btnPrintClick(nil);
  end;

  if ((Key = ord('v')) or (Key = ord('V'))) and (Shift = [ssAlt]) then
  begin
    if (btnShow.Enabled) and (btnShow.Visible) then
      btnShowClick(nil);
  end;


end;

procedure TfmPointOfSale.SDS_DetailsNewRecord(DataSet: TDataSet);
begin
  SDS_Details.Edit;
  SDS_DetailsCompanyCode.AsString := DCompany;
  SDS_DetailsBranchCode.AsString := DBranch;
  SDS_DetailsTrxType.AsString := TrxType;
  SDS_DetailsTrxNo.AsString := 'xx';
  SDS_DetailsYearID.AsString := 'xx';
  SDS_DetailsPeriodID.AsString := 'xx';
  SDS_DetailsTrxLineNo.AsInteger := SDS_Details.RecNo;

  SDS_DetailsDiscount.AsFloat := 0;
  SDS_DetailsQuantity.ReadOnly := False;
  SDS_DetailsQuantity.AsFloat := 1;
  SDS_DetailsQuantity.ReadOnly := True;
  SDS_DetailsDiscountRatio.AsFloat := 0;

end;

procedure TfmPointOfSale.SDS_HeaderNewRecord(DataSet: TDataSet);
begin
  SDS_HeaderCompanyCode.AsString := DCompany;
  SDS_HeaderBranchCode.AsString := DBranch;
  SDS_HeaderTrxType.AsString := TrxType;
     
  edtCashPaid.Text := '0';
  edtCash.Text := '0';
  edtCheck.Text := '0';
  edtCreditCard.Text := '0';
  edtATM.Text := '0';
  edtCredit.Text := '0';
end;

procedure TfmPointOfSale.SDS_HeaderTrxAmountChange(Sender: TField);
begin
    vrdgAmount.Value := SDS_HeaderTrxAmount.AsFloat;
    vrmAmount.Text := FormatFloat('#,0.00', SDS_HeaderTrxAmount.AsFloat);
    Cash := SDS_HeaderTrxAmount.AsString;
    edtCash.Text := SDS_HeaderTrxAmount.AsString;
    edtCashPaid.Text := vrmAmount.Text ;
end;


procedure TfmPointOfSale.SDS_HeaderTotalDiscountChange(Sender: TField);
begin
  vrmTotalDiscount.Text := FormatFloat('#,0.00',
    SDS_HeaderTotalDiscount.AsFloat);
end;

procedure TfmPointOfSale.InsertItem(ItemCode: string; Quantity , Price: Real);
begin
  if grdDetails.ReadOnly then Exit;

  if not SDS_Items.Locate('ItemCode', ItemCode, []) then
  begin
    ShowMessage('') ;
    Exit;
  end;

  SDS_Details.Append;
  SDS_DetailsItemService.Value := SDS_ItemsItemService.Value;
  SDS_DetailsItemCode.Value := SDS_ItemsItemCode.Value;
  SDS_DetailsQuantity.ReadOnly := False;
  SDS_DetailsQuantity.AsFloat := Quantity;
  SDS_DetailsItemPrice.AsFloat := Price;
  SDS_DetailsQuantity.ReadOnly := True;
  SDS_DetailsItemUnitCode.ReadOnly := False;
  SDS_DetailsItemUnitCode.Value := SDS_ItemsItemUnitCode.Value;
  SDS_DetailsItemUnitCode.ReadOnly := True;
  qryItemPrices.Locate('ItemCode', ItemCode, []) ;
  SDS_DetailsUnitTransValue.AsFloat := qryItemPricesUnitTransValue.AsFloat;
  SDS_Details.Append;
  SDS_Details.Cancel;
end;

procedure TfmPointOfSale.btnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
  QueryStr := ' '
    + ' SELECT * '
    + ' FROM sa_POS_TrxHeader  '
    + ' Where  CompanyCode = ''' + DCompany + ''' And BranchCode = ''' +  DBranch + ''' '
    + ' And TrxType = ''' + TrxType + ''''
    + '  ';

  SDS_Header.Close;
  SDS_Header.DataSet.Close;
  SDS_Header.DataSet.CommandText := QueryStr;
  SDS_Header.Open;

  lkp := Tlkp.Create(SDS_Header,nil);
  lkp.ShowModal;

  vrmTotal.Text := FloatToStr((SDS_HeaderTotal.AsFloat));
  vrmTotalDiscount.Text := FloatToStr((SDS_HeaderTotalDiscount.AsFloat));
  vrdgAmount.Value := (SDS_HeaderTrxAmount.AsFloat);
  vrmAmount.Text := FloatToStr((SDS_HeaderTrxAmount.AsFloat));

end;

procedure TfmPointOfSale.btnPrintClick(Sender: TObject);
begin
  if SDS_HeaderTrxNo.AsString = '' then    exit;
    RepParam.Clear;
    ppPrintSales.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\POS_SalesForm.rtm' ;

    ppPrintSales.Parameters.Clear;
    ppPrintSales.Template.LoadFromFile;
    ppPrintSales.Parameters := RepParam;
    ppPrintSales.OutlineSettings.CreateNode := false;
    ppPrintSales.OutlineSettings.CreatePageNodes := false;
    ppPrintSales.OutlineSettings.Visible := false;
    ppPrintSales.PreviewFormSettings.WindowState := wsMaximized;
    ppPrintSales.PreviewFormSettings.ZoomPercentage := 100;
    ppPrintSales.AllowPrintToFile := True;

    ppPrintSales.ShowPrintDialog := false;
    ppPrintSales.DeviceType := 'dtPrinter';
    ppPrintSales.Device := dvPrinter;

    ppPrintSales.Print;
end;


procedure TfmPointOfSale.DeletingTransaction;
var
  SQLText: string;
  HeaderChanges, DetailChanges: OleVariant;
  NewTransID: Integer;
  SQLStatements: TStringList;
  TD: TTransactionDesc;
begin
  try
    SQLStatements := TStringList.Create;
    SQLStatements.Clear;
    TD.TransactionID := 1;
    TD.IsolationLevel := xilREADCOMMITTED;
    fmMainForm.MainConnection.StartTransaction(TD);
    //

    fmMainForm.MainConnection.Commit(TD);
    SQLStatements.Free;

    if SDS_Details.RecordCount > 0 then
      DetailChanges := SDS_Details.Data
    else
      DetailChanges := Null;
    SDS_Details.EmptyDataSet;
    SDS_Header.Delete;
    SDS_Header.MergeChangeLog;
    ShowMessage('');
  except
    if fmMainForm.MainConnection.InTransaction then
      fmMainForm.MainConnection.Rollback(TD);
    SDS_Header.CancelUpdates;
    SDS_HeaderAfterScroll(nil);
    ShowMessage('');
    SQLStatements.Free;
  end
end;

procedure TfmPointOfSale.edtCashKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (key in ['0'..'9', '.', '-', #8, #9, #13])) then
    key := #0;
end;

procedure TfmPointOfSale.edtCashChange(Sender: TObject);
begin
  if (Sender as TEdit).Text = '-' then
    Exit;
  CalcPayedAndRemainder;
end;

procedure TfmPointOfSale.CalcPayedAndRemainder;
var
  TotalAmount, Remainder, TotalOther: Double;
begin
  TotalAmount := 0;
  if edtCashPaid.Text <> '' then
    TotalAmount := TotalAmount + StrToFloat(StringReplace(edtCashPaid.Text, ',',
      '', [rfIgnoreCase, rfReplaceAll]));
  vrmPayed.Text := FormatFloat('#,0.00', TotalAmount);    
  if edtCheck.Text <> '' then
    TotalAmount := TotalAmount + StrToFloat(StringReplace(edtCheck.Text, ',', '',
      [rfIgnoreCase, rfReplaceAll]));
  if edtCreditCard.Text <> '' then
    TotalAmount := TotalAmount + StrToFloat(StringReplace(edtCreditCard.Text,
      ',', '', [rfIgnoreCase, rfReplaceAll]));
  if edtATM.Text <> '' then
    TotalAmount := TotalAmount + StrToFloat(StringReplace(edtATM.Text, ',', '',
      [rfIgnoreCase, rfReplaceAll]));
  if edtCredit.Text <> '' then
    TotalAmount := TotalAmount + StrToFloat(StringReplace(edtCredit.Text, ',',
      '', [rfIgnoreCase, rfReplaceAll]));
  If edtCashPaid.Text = '' Then edtCashPaid.Text := '0';
  TotalOther := TotalAmount - StrToFloat(StringReplace(edtCashPaid.Text, ',', '',
    [rfIgnoreCase, rfReplaceAll]));

  if edtCashPaid.Text = '' then
    edtCashPaid.Text := '0';

  Remainder := TotalAmount - SDS_HeaderTrxAmount.AsFloat;

  if Remainder > 0 then
      edtCash.Text := FloatToStr(TotalAmount - TotalOther - Remainder)
  else
      edtCash.Text := FloatToStr(TotalAmount - TotalOther);

  Remainder :=  Remainder  - TotalOther ;
  vrmRemainder.Text := FormatFloat('#,0.00', Remainder);

end;

procedure TfmPointOfSale.FormShow(Sender: TObject);
begin
    btnShow.Enabled := True;
    btn_SaveAndPrint.Enabled := False;
    btn_Cancel.Enabled := False;
    btnPrint.Enabled := True;
    btn_Close.Enabled := True;
    btn_DeleteItem.Enabled := False;
    Btn_LogOut.Enabled := True;
    btn_Add.Enabled := True;
    pnl_Header.Enabled := False;
    pnlDetails.Enabled := False;
    pnlKeyPad.Enabled := False;
end;

procedure TfmPointOfSale.VrKeyPad1Extra1Click(Sender: TObject);
begin
   VrDigitGroup1.Value := VrDigitGroup1.Value + 0.25 ;
end;

procedure TfmPointOfSale.VrKeyPad1Extra2Click(Sender: TObject);
begin
  VrDigitGroup1.Value := VrDigitGroup1.Value + 0.5 ;
end;

procedure TfmPointOfSale.VrKeyPad1Extra3Click(Sender: TObject);
begin
  VrDigitGroup1.Value := VrDigitGroup1.Value + 0.75 ;
end;

procedure TfmPointOfSale.VrKeyPad1NumericKeyClick(Sender: TObject; Key: Integer);
begin
 if (VrDigitGroup1.Value>99) then
      VrDigitGroup1.Value := VrDigitGroup1.Value
else if (key=0) then
  begin
    if (VrDigitGroup1.Value<10) then
      VrDigitGroup1.Value := VrDigitGroup1.Value*10 + Key
    else
      VrDigitGroup1.Value := 0 ;
  end
else
  VrDigitGroup1.Value := VrDigitGroup1.Value*10 + Key ;

  If pnl_InsertBarcode.Visible Then edtBarcode.SetFocus;

end;

procedure TfmPointOfSale.VrKeyPad1SharpClick(Sender: TObject);
begin
  VrDigitGroup1.Value := 0 ;
end;

procedure TfmPointOfSale.edtBarcodeKeyPress(Sender: TObject; var Key: Char);
Var
   Quantity : Real;
begin
  if (Key = #13) And (edtBarcode.Text <> '') then begin
     if edtQuantity.Text<>'' then
     Quantity := StrToFloat(edtQuantity.Text) ;

     if VrDigitGroup1.Value>0 then Quantity := VrDigitGroup1.Value
     else Quantity := 1;

     InsertBarcode(edtBarcode.Text, Abs(Quantity));
     edtBarcode.Text := '';
     If VrDigitGroup1.Value > 0 Then VrDigitGroup1.Value := 0;
  end;
end;

procedure TfmPointOfSale.btn_DeleteItemClick(Sender: TObject);
Var
  buttonSelected : Integer;
begin
  if SDS_Details.RecordCount = 0 then Exit;
  If SDS_Header.State in [dsEdit,dsInsert] then Begin
      buttonSelected := MessageDlg('åá ÊÑíÏ ÍÞÇ ÍÐÝ ÇáÕäÝ ¿',mtInformation, mbOKCancel, 0);
        if buttonSelected = mrOK then
           SDS_Details.Delete;
   end;
end;

procedure TfmPointOfSale.GenerateGroupAndItems;
Var
 I, n, x, y, z : Integer ;
 TempBtn : TVrDemoButton;
 obj : TTabSheet ;
 TempScroll : TScrollBox ;
 PhotoPath : String ;
begin
  fmMainForm.qry_Main.Close ;
  fmMainForm.qry_Main.DataSet.Close ;
  fmMainForm.qry_Main.DataSet.CommandText := ''
            + ' SELECT     CompanyCode, ItemGroupCode, ItemGroupNameAr , ItemGroupNameEn '
            + ' FROM       tbl_ItemGroup '
            + ' WHERE  (CompanyCode = ''' + DCompany + ''')  ' ;

   fmMainForm.qry_Main.Open;
   fmMainForm.qry_Main.First;

while not fmMainForm.qry_Main.Eof   do
     begin
    with TTabSheet.Create(PageControlDetails) do
    begin
      PageControl := PageControlDetails;

        Caption := fmMainForm.qry_Main.FieldByName('ItemGroupNameAr').AsString ;
        Color := clGray ;
    end;
    fmMainForm.qry_Main.Next ;
 end;

   n := PageControlDetails.ControlCount-1;

   y := 0 ;
   z := 0 ;
   fmMainForm.qry_Main.First;

   for I := 0 to n do begin
       fmMainForm.qry_Main2.Close;
       fmMainForm.qry_Main2.DataSet.Close ;
       fmMainForm.qry_Main2.DataSet.CommandText := ''
            + ' SELECT     CompanyCode, ItemCode, ItemNameAr, ItemNameEn, ItemGroupCode '
            + ' FROM         tbl_ItemDefinition '
            + ' WHERE (CompanyCode = ''' + DCompany + ''')   '
            + ' AND (ItemGroupCode =''' + fmMainForm.qry_Main.FieldByName('ItemGroupCode').AsString + ''') ';

       fmMainForm.qry_Main2.Open;
       fmMainForm.qry_Main2.First;
       fmMainForm.qry_Main.Next ;

       if PageControlDetails.Controls[I] is TTabSheet then
        begin
         TempScroll := TScrollBox.Create(PageControlDetails.Controls[I]);
         with TempScroll do begin
            Parent := (PageControlDetails.Controls[I] as TTabSheet);
            Align := alClient ;
         end;
         for x := 0 to fmMainForm.qry_Main2.RecordCount-1 do
         begin
            y := x div 3 ;
            if ((x mod 3)=0) then
             z := 0 ;
            TempBtn := TVrDemoButton.Create(TempScroll);
            Font.Size := 9;
            with TempBtn do begin
            BevelWidth := 5;
            Parent := TempScroll;
            FontEnter.Size := 9;
            FontLeave.Size := 9;
            TextAlignment := vtaCenter;
            height := 50;
            width := 100;
            caption :=  fmMainForm.qry_Main2.FieldByName('ItemNameAr').AsString ; 
            
 
              Brush.Color := clBlack ;
            TempBtn.Hint := fmMainForm.qry_Main2.FieldByName('ItemCode').AsString ;
            left := z * (100 + 10) ;
            top := y* (50 + 10) ;
            Inc(z) ;
            OnClick := ItemClick;
            end;
            fmMainForm.qry_Main2.Next ;
        end;
       end ;
 end ;

end;

procedure TfmPointOfSale.ItemClick(Sender: TObject);
Var
  Price : Double ;
begin
  If not (SDS_Header.State in [dsInsert, dsEdit]) then Exit;
  QueryStr := ''
            + ' SELECT ISNULL(I.PriceValue,0) As PriceValue'
            + ' FROM   tbl_ItemPrices I '
            + ' WHERE  (I.CompanyCode = ''' + DCompany + ''') And (I.ItemService = ''IVI'')  AND (I.ItemCode = '''+(Sender as TVrDemoButton).Hint+''')' ; // And (I.ItemService = ''IVI'')
   fmMainForm.qry_Main2.Close;
   fmMainForm.qry_Main2.DataSet.Close;
   fmMainForm.qry_Main2.DataSet.CommandText := QueryStr;
   fmMainForm.qry_Main2.Open;
  if fmMainForm.qry_Main2.RecordCount>0 then
    Price := fmMainForm.qry_Main2.FieldByName('PriceValue').AsFloat
  else
    Price := 0 ;
 if VrDigitGroup1.Value>0 then
   InsertItem((Sender as TVrDemoButton).Hint, VrDigitGroup1.Value, Price)
 else
   InsertItem((Sender as TVrDemoButton).Hint, 1, Price) ;
 VrKeyPad1SharpClick(Self);

end;

procedure TfmPointOfSale.SDS_HeaderTotalChange(Sender: TField);
begin
  vrmTotal.Text := FloatToStr((SDS_HeaderTotal.AsFloat));
end;
procedure TfmPointOfSale.Btn_LogOutClick(Sender: TObject);
Var
   LoginForm : TfmLogin;
begin
   LoginForm := TfmLogin.Create(Nil);
   LoginForm.edt_UserName.Text := gUserName;
   LoginForm.edt_UserName.Enabled := False;
   gLoginFrom_POS_Screen := True;
   If LoginForm.ShowModal = mrOk then begin
      LoginForm.Free; 
   end
   else Application.Terminate;
end;

end.


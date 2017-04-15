unit PosClose;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,
  ExtCtrls, VrControls, VrButtons, VrNavigator, ppBands, ppClass, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppBarCod, ppModule, raCodMod, ppVar, ppParameter, daDataView,
  daQueryDataView, daADO, daDataModule, VrLabel;

type
  TfmPosClose = class(TForm)
    grp_Type: TGroupBox;
    SDS_Header: TSimpleDataSet;
    DS_Header: TDataSource;
    GroupBox2: TGroupBox;
    BtnOpen: TVrDemoButton;
    btnAdd: TVrDemoButton;
    btnEdit: TVrDemoButton;
    btnDelete: TVrDemoButton;
    btnSave: TVrDemoButton;
    BtnCancel: TVrDemoButton;
    grpData: TGroupBox;
    Label3: TLabel;
    edt_TrxNo: TDBEdit;
    Label6: TLabel;
    qry_Cash: TSimpleDataSet;
    Label12: TLabel;
    qry_Bank: TSimpleDataSet;
    qry_POS: TSimpleDataSet;
    edt_Subject: TDBMemo;
    Label1: TLabel;
    grp_Total: TGroupBox;
    DBEdit6: TDBEdit;
    edt_TrxDate: TDBEdit;
    cb_Operator: TDBLookupComboBox;
    DS_Cash: TDataSource;
    DS_Bank: TDataSource;
    DS_POS: TDataSource;
    Navigator: TDBNavigator;
    GroupBox1: TGroupBox;
    btnPrintDailySales: TVrDemoButton;
    PPL_Header: TppDBPipeline;
    btnSearch: TVrDemoButton;
    GroupBox3: TGroupBox;
    lbl_Title: TVrLabel;
    SDS_HeaderCompanyCode: TStringField;
    SDS_HeaderBranchCode: TStringField;
    SDS_HeaderTrxNo: TStringField;
    SDS_HeaderTrxDate: TSQLTimeStampField;
    SDS_HeaderTrxStatus: TStringField;
    SDS_HeaderTrxDescA: TStringField;
    SDS_HeaderTrxDescE: TStringField;
    SDS_HeaderPOSCode: TStringField;
    SDS_HeaderCashCode: TStringField;
    SDS_HeaderBankCode: TStringField;
    SDS_HeaderCash: TFMTBCDField;
    SDS_HeaderCreditCard: TFMTBCDField;
    SDS_HeaderATM: TFMTBCDField;
    SDS_HeaderCredit: TFMTBCDField;
    SDS_HeaderChecks: TFMTBCDField;
    SDS_HeaderDiscount: TFMTBCDField;
    SDS_HeaderPOSShift: TStringField;
    SDS_HeaderOperatorCode: TStringField;
    SDS_HeaderActualCash: TFMTBCDField;
    SDS_HeaderOldOpenBalance: TFMTBCDField;
    SDS_HeaderNewOpenBalance: TFMTBCDField;
    SDS_HeaderMainCashCode: TStringField;
    Label7: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    qry_CashCompanyCode: TStringField;
    qry_CashCB_Code: TStringField;
    qry_CashCB_Type: TStringField;
    qry_CashCB_NameA: TStringField;
    qry_CashCB_NameE: TStringField;
    qry_BankCompanyCode: TStringField;
    qry_BankCB_Code: TStringField;
    qry_BankCB_Type: TStringField;
    qry_BankCB_NameA: TStringField;
    qry_BankCB_NameE: TStringField;
    qry_POSCompanyCode: TStringField;
    qry_POSPOSCode: TStringField;
    qry_POSPOSNameAr: TStringField;
    qry_POSPOSNameEn: TStringField;
    qry_POSCashCode: TStringField;
    qry_POSBankCode: TStringField;
    qry_POSOpenBalance: TFMTBCDField;
    qry_POSCreateDate: TSQLTimeStampField;
    qry_POSLastUpdateDate: TSQLTimeStampField;
    qry_Operators: TSimpleDataSet;
    DS_Operators: TDataSource;
    DBLookupComboBox5: TDBLookupComboBox;
    Label2: TLabel;
    cb_Shift: TDBComboBox;
    Label4: TLabel;
    Label5: TLabel;
    qry_OperatorsCompanyCode: TStringField;
    qry_OperatorsOperatorCode: TStringField;
    qry_OperatorsOperatorNameAr: TStringField;
    qry_OperatorsOperatorNameEn: TStringField;
    qry_OperatorsUserID: TStringField;
    qry_OperatorsCreateDate: TSQLTimeStampField;
    qry_OperatorsLastUpdateDate: TSQLTimeStampField;
    DBLookupComboBox7: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label11: TLabel;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    grp_RealTotal: TGroupBox;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    SDS_HeaderCashDifference: TFMTBCDField;
    ppDailySales: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    procedure BtnOpenClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnPrintDailySalesClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure SDS_HeaderOperatorCodeChange(Sender: TField);
    procedure SDS_HeaderCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    QueryStr  : String;
  public
    { Public declarations }
    TrxType : String;
    Rep: TppReport;
    RepParam , ExpensesRepParam : TppParameterList;
    function PadStringLeft(InString : String; StrSize : Integer; PadChar : Char = '0' ): String;
  end;

var
  fmPosClose: TfmPosClose;

implementation

uses Main, DateUtils, GVariable, GFunctions, LookUp;

{$R *.dfm}

procedure TfmPosClose.BtnOpenClick(Sender: TObject);
begin
  SDS_Header.Close;
  SDS_Header.DataSet.Close;
  SDS_Header.DataSet.CommandText := 'Select * From tbl_PosClose Where CompanyCode = ''' + DCompany + ''' And BranchCode = ''' + DBranch + '''  ';
  SDS_Header.Open;
  btnEdit.Enabled := True;
  BtnOpen.Enabled := True;
  btnAdd.Enabled := True;
  btnSave.Enabled := False;
  BtnCancel.Enabled := False;
  btnDelete.Enabled := True;
  grpData.Enabled := False;
  grp_Total.Enabled := grpData.Enabled;
  grp_RealTotal.Enabled := grpData.Enabled;
  Navigator.Enabled := True;
  btnSearch.Enabled := BtnOpen.Enabled;
  btnPrintDailySales.Enabled := BtnOpen.Enabled;
end;

procedure TfmPosClose.btnEditClick(Sender: TObject);
begin
  SDS_Header.Edit;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  grp_Total.Enabled := grpData.Enabled;
  grp_RealTotal.Enabled := grpData.Enabled;
  edt_TrxNo.Enabled := False;
  edt_TrxDate.Enabled := False;
  Navigator.Enabled := False;
  btnSearch.Enabled := BtnOpen.Enabled;
  btnPrintDailySales.Enabled := BtnOpen.Enabled;  
end;

procedure TfmPosClose.btnSaveClick(Sender: TObject);
Var SQLState : TStringList;
  TempQry : TSimpleDataSet;
  NewCode : String;
begin
  try
     
    If SDS_HeaderPOSCode.AsString = '' Then
    Begin
        ShowMessage('ÌÃ»  ÕœÌœ ‰ﬁÿ… «·»Ì⁄   ﬁ»· «·Õ›Ÿ');
        edt_Subject.SetFocus;
        Exit;
    end;

    If SDS_HeaderOperatorCode.AsString = '' Then
    Begin
        ShowMessage('Ì—ÃÏ  ÕœÌœ «·ﬂ«‘Ì— ﬁ»· «·Õ›Ÿ  ');
        cb_Operator.SetFocus;
        Exit;
    end;

    If SDS_Header.State = dsInsert Then Begin
      TempQry := TSimpleDataSet.Create(nil);
      TempQry.Connection := fmMainForm.MainConnection;
      TempQry.Close;
      TempQry.DataSet.Close;
      TempQry.DataSet.CommandText := ''
        + ' Select ISNULL(Max(CAST(TrxNo AS NUMERIC)),0) As LastTrxNo FROM tbl_PosClose Where CompanyCode = ''' + DCompany + ''' And BranchCode = ''' + DBranch + '''   ' ;
      TempQry.Open;

      NewCode := TempQry.Fields[0].AsString;
      NewCode := IntToStr(StrToInt(NewCode)+1) ;
      SDS_HeaderTrxNo.AsString := NewCode; //PadStringLeft(NewCode,10) ;
    end;

    SQLState := TStringList.Create;
    if SDS_Header.ApplyUpdates(0) = 0 then Begin
        ShowMessage(' „ «·Õ›‹‹Ÿ »‰Ã«Õ');
        //BtnOpenClick(Sender);
        btnEdit.Enabled := True;
        BtnOpen.Enabled := True;
        btnAdd.Enabled := True;
        btnSave.Enabled := False;
        BtnCancel.Enabled := False;
        btnDelete.Enabled := True;
        grpData.Enabled := False;
        grp_Total.Enabled := grpData.Enabled;
        grp_RealTotal.Enabled := grpData.Enabled;
        grp_RealTotal.Enabled := grpData.Enabled;
        Navigator.Enabled := True;
        btnSearch.Enabled := BtnOpen.Enabled;
        btnPrintDailySales.Enabled := BtnOpen.Enabled;



    end
    else Begin
     ShowMessage('ÕœÀ Œÿ√ √À‰«¡ «·Õ›Ÿ') ;
    end;
  except
     ShowMessage('ÕœÀ Œÿ√ √À‰«¡ «·Õ›Ÿ') ;
  end;

end;

procedure TfmPosClose.BtnCancelClick(Sender: TObject);
Var
  buttonSelected : Integer;
begin
  // Show a confirmation dialog
  buttonSelected := MessageDlg('Â·  —Ìœ Õﬁ« «·€«¡ «· ⁄œÌ·« ',mtInformation, mbOKCancel, 0);

  // Show the button type selected
  if buttonSelected = mrOK then
  Begin
     SDS_Header.CancelUpdates;
      BtnOpenClick(Sender);
  end;
end;

procedure TfmPosClose.btnAddClick(Sender: TObject);
begin
  SDS_Header.Append;

  SDS_HeaderCompanyCode.AsString := DCompany;
  SDS_HeaderBranchCode.AsString := DBranch;
  cb_Shift.ItemIndex := 0;
  SDS_HeaderPOSCode.AsString := DPOS_Code ;
  SDS_HeaderCashCode.AsString := GetDBValue(' CashCode' , 'tbl_POS_Definition' , ' And CompanyCode = ''' + DCompany + ''' And POSCode = ''' + SDS_HeaderPOSCode.AsString + '''  ') ;
  SDS_HeaderBankCode.AsString := GetDBValue(' BankCode' , 'tbl_POS_Definition' , ' And CompanyCode = ''' + DCompany + '''  And POSCode = ''' + SDS_HeaderPOSCode.AsString + '''   ') ;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  grp_Total.Enabled := grpData.Enabled;
  grp_RealTotal.Enabled := grpData.Enabled;
  edt_TrxNo.Enabled := False;
  edt_TrxDate.Enabled := True;
  Navigator.Enabled := False;
  btnSearch.Enabled := BtnOpen.Enabled;
  btnPrintDailySales.Enabled := BtnOpen.Enabled;

  SDS_HeaderTrxDate.AsDateTime := Date;


end;

procedure TfmPosClose.btnDeleteClick(Sender: TObject);
Var
  buttonSelected : Integer;
begin

  try
    // Show a confirmation dialog
    buttonSelected := MessageDlg('Â·  —Ìœ Õﬁ« Õ–› «·»Ì«‰« ',mtError, mbOKCancel, 0);

    // Show the button type selected
    if buttonSelected = mrOK then
    Begin
        SDS_Header.Delete;
        if SDS_Header.ApplyUpdates(0) = 0 then Begin
           ShowMessage(' „ «·Õ–› »‰Ã«Õ');
           BtnOpenClick(Sender);
        end else Begin
         ShowMessage('ÕœÀ Œÿ√ √À‰«¡ Õ–› «·»Ì«‰« ') ;
         BtnOpenClick(Sender);
        end;
    end;
  except
      ShowMessage('ÕœÀ Œÿ√ √À‰«¡ „”Õ «·»Ì«‰«  , ·« Ì„ﬂ‰ Õ–› »Ì«‰«  „” Œœ„…');
      BtnOpenClick(Sender);
  end;

end;

procedure TfmPosClose.FormCreate(Sender: TObject);
begin

   BtnOpenClick(Sender);
   qry_Cash.Open;
   qry_Bank.Open;
   qry_POS.Open;
   qry_Operators.Open;
   RepParam := TppParameterList.Create(Self);
   RepParam.Clear;

end;

function TfmPosClose.PadStringLeft(InString: String; StrSize: Integer; PadChar: Char): String;
Var
   i : integer;
Begin
   Result := InString;
   For i := 1 to StrSize-Length(InString) do Result := PadChar + Result;
end;

procedure TfmPosClose.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;

end;
procedure TfmPosClose.btnPrintDailySalesClick(Sender: TObject);
Var
   RepFileName : String ;
begin

    RepParam.Clear;
    ppDailySales.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\.rtm' ;

    ppDailySales.Parameters.Clear;
    ppDailySales.Template.LoadFromFile;
    ppDailySales.Parameters := RepParam;
    ppDailySales.OutlineSettings.CreateNode := false;
    ppDailySales.OutlineSettings.CreatePageNodes := false;
    ppDailySales.OutlineSettings.Visible := false;
    ppDailySales.PreviewFormSettings.WindowState := wsMaximized;
    ppDailySales.PreviewFormSettings.ZoomPercentage := 100;
    ppDailySales.AllowPrintToFile := True;
    ppDailySales.ShowPrintDialog := True;
    ppDailySales.Print;
    
end;

procedure TfmPosClose.btnSearchClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

procedure TfmPosClose.SDS_HeaderOperatorCodeChange(Sender: TField);
begin
    fmMainForm.qry_Main.Close;
    fmMainForm.qry_Main.DataSet.Close;
    fmMainForm.qry_Main.DataSet.CommandText := ''
        + ' SELECT     CompanyCode, POSCode, POSNameAr, POSNameEn  '
        + ' ,(  '
        + ' Select IsNull(Sum (Cash),0) As Cash From sa_Pos_TrxHeader   '
        + ' Where CompanyCode = ''' + DCompany + ''' AND (BranchCode = ''' + DBranch + ''') AND (TrxType IN (''SAIV'') )   '
        + ' AND (TrxDate = ''' + FormatDateTime('mm/dd/yyyy',StrToDate(SDS_HeaderTrxDate.AsString)) + ''') And (POSShift = ''' + SDS_HeaderPOSShift.asString + ''') '
        + ' And (POSCode = '''  + SDS_HeaderPOSCode.asString + ''' ) And (OperatorCode = '''  + SDS_HeaderOperatorCode.asString + ''' ) '
        + ' ) As  Cash '

        + ' ,(  '
        + ' Select IsNull(Sum (ATM),0) As Cash From sa_Pos_TrxHeader   '
        + ' Where CompanyCode = ''' + DCompany + ''' AND (BranchCode = ''' + DBranch + ''') AND (TrxType IN (''SAIV'') )   '
        + ' AND (TrxDate = ''' + FormatDateTime('mm/dd/yyyy',StrToDate(SDS_HeaderTrxDate.AsString)) + ''') And (POSShift = ''' + SDS_HeaderPOSShift.asString + ''') '
        + ' And (POSCode = '''  + SDS_HeaderPOSCode.asString + ''' ) And (OperatorCode = '''  + SDS_HeaderOperatorCode.asString + ''' ) '
        + ' ) As  ATM '

        + ' ,(  '
        + ' Select IsNull(Sum (Visa),0) As Cash From sa_Pos_TrxHeader   '
        + ' Where CompanyCode = ''' + DCompany + ''' AND (BranchCode = ''' + DBranch + ''') AND (TrxType IN (''SAIV'') )   '
        + ' AND (TrxDate = ''' + FormatDateTime('mm/dd/yyyy',StrToDate(SDS_HeaderTrxDate.AsString)) + ''') And (POSShift = ''' + SDS_HeaderPOSShift.asString + ''') '
        + ' And (POSCode = '''  + SDS_HeaderPOSCode.asString + ''' ) And (OperatorCode = '''  + SDS_HeaderOperatorCode.asString + ''' ) '
        + ' ) As  Visa '

        + ' ,(  '
        + ' Select IsNull(Sum (Checks),0) As Cash From sa_Pos_TrxHeader   '
        + ' Where CompanyCode = ''' + DCompany + ''' AND (BranchCode = ''' + DBranch + ''') AND (TrxType IN (''SAIV'') )   '
        + ' AND (TrxDate = ''' + FormatDateTime('mm/dd/yyyy',StrToDate(SDS_HeaderTrxDate.AsString)) + ''') And (POSShift = ''' + SDS_HeaderPOSShift.asString + ''') '
        + ' And (POSCode = '''  + SDS_HeaderPOSCode.asString + ''' ) And (OperatorCode = '''  + SDS_HeaderOperatorCode.asString + ''' ) '
        + ' ) As  Checks '

        + ' ,(  '
        + ' Select IsNull(Sum (Credit),0) As Cash From sa_Pos_TrxHeader   '
        + ' Where CompanyCode = ''' + DCompany + ''' AND (BranchCode = ''' + DBranch + ''') AND (TrxType IN (''SAIV'') )   '
        + ' AND (TrxDate = ''' + FormatDateTime('mm/dd/yyyy',StrToDate(SDS_HeaderTrxDate.AsString)) + ''') And (POSShift = ''' + SDS_HeaderPOSShift.asString + ''') '
        + ' And (POSCode = '''  + SDS_HeaderPOSCode.asString + ''' ) And (OperatorCode = '''  + SDS_HeaderOperatorCode.asString + ''' ) '
        + ' ) As  Credit '

        + ' ,(  '
        + ' Select  Top 1  ISNULL(NewOpenBalance, 0) AS OpenBalance From tbl_PosClose   '
        + ' Where CompanyCode = ''' + DCompany + ''' AND (BranchCode = ''' + DBranch + ''')    '
        + ' And (TrxDate='''+FormatDateTime('mm/dd/yyyy',IncDay(StrToDate(SDS_HeaderTrxDate.AsString),-1))+''')  And (POSShift = ''' + SDS_HeaderPOSShift.asString + ''') '
        + ' And (POSCode = '''  + SDS_HeaderPOSCode.asString + ''' ) And (OperatorCode = '''  + SDS_HeaderOperatorCode.asString + ''' ) '
        + ' ORDER BY TrxDate DESC '
        + ' ) As  OpenBalance '
        + ' FROM         tbl_POS_Definition ' ;
    fmMainForm.qry_Main.Open;

    SDS_Header.Edit;
    SDS_HeaderCash.AsFloat := fmMainForm.qry_Main.FieldByName('Cash').AsFloat;
    SDS_HeaderCreditCard.AsFloat := fmMainForm.qry_Main.FieldByName('Visa').AsFloat;
    SDS_HeaderATM.AsFloat := fmMainForm.qry_Main.FieldByName('ATM').AsFloat;
    SDS_HeaderCredit.AsFloat := fmMainForm.qry_Main.FieldByName('Credit').AsFloat;
    SDS_HeaderChecks.AsFloat := fmMainForm.qry_Main.FieldByName('Checks').AsFloat;
    SDS_HeaderActualCash.AsFloat := fmMainForm.qry_Main.FieldByName('Cash').AsFloat;
    SDS_HeaderOldOpenBalance.AsFloat := fmMainForm.qry_Main.FieldByName('OpenBalance').AsFloat

end;

procedure TfmPosClose.SDS_HeaderCalcFields(DataSet: TDataSet);
begin
   SDS_HeaderCashDifference.AsFloat := SDS_HeaderCash.AsFloat + SDS_HeaderOldOpenBalance.AsFloat - SDS_HeaderActualCash.AsFloat;
end;

end.

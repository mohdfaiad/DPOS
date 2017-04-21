unit PrTrxBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,LookUp,
  VrControls, VrButtons, Buttons, ComCtrls;

type
  TfmPrTrxBaseForm = class(TForm)
    grp_Content: TGroupBox;
    SDS_Header: TSimpleDataSet;
    DS_Header: TDataSource;
    grpData: TGroupBox;
    Label2: TLabel;
    edtCode: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    GroupBox2: TGroupBox;
    BtnOpen: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    BtnCancel: TButton;
    BtnShow: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    Co_WareHouse: TDBLookupComboBox;
    CO_Vendors: TDBLookupComboBox;
    Label16: TLabel;
    SDS_Details: TSimpleDataSet;
    DS_Details: TDataSource;
    SDS_DetailsCompanyCode: TStringField;
    SDS_DetailsBranchCode: TStringField;
    SDS_DetailsTrxNo: TStringField;
    SDS_DetailsTrxType: TStringField;
    SDS_DetailsTraLineNo: TStringField;
    SDS_DetailsItemService: TStringField;
    SDS_DetailsItemCode: TStringField;
    SDS_DetailsCostPrice: TFMTBCDField;
    SDS_DetailsDiscount: TFMTBCDField;
    SDS_DetailsNetPrice: TFMTBCDField;
    SDS_DetailsUnitTransValue: TFMTBCDField;
    SDS_DetailsQuantity: TFMTBCDField;
    SDS_DetailsBarCode: TStringField;
    SDS_DetailsWareHouseCode: TStringField;
    SDS_DetailsItemCost: TFMTBCDField;
    SDS_DetailsVendoreCode: TStringField;
    SDS_WareHouse: TSimpleDataSet;
    DS_WareHouse: TDataSource;
    SDS_WareHouseWareHouseCode: TStringField;
    SDS_WareHouseWareHouseNameAr: TStringField;
    SDS_WareHouseWareHouseNameEn: TStringField;
    SDS_Vendors: TSimpleDataSet;
    DS_Vendors: TDataSource;
    SDS_VendorsVendoreCode: TStringField;
    SDS_VendorsVendoreNameAr: TStringField;
    SDS_VendorsVendoreNameEn: TStringField;
    SDS_HeaderCompanyCode: TStringField;
    SDS_HeaderBranchCode: TStringField;
    SDS_HeaderTrxDate: TSQLTimeStampField;
    SDS_HeaderTrxNo: TStringField;
    SDS_HeaderTrxStatus: TStringField;
    SDS_HeaderTrxType: TStringField;
    SDS_HeaderWareHouseCode: TStringField;
    SDS_HeaderVendoreCode: TStringField;
    SDS_HeaderTrxAmount: TFMTBCDField;
    SDS_HeaderTrxBalance: TFMTBCDField;
    SDS_HeaderIntRefrence: TStringField;
    SDS_HeaderTotalDiscount: TStringField;
    SDS_HeaderVendoreInvoiceNumber: TStringField;
    SDS_HeaderTrxDescAr: TStringField;
    SDS_HeaderTrxDescEn: TStringField;
    PG1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    grd_Details: TDBGrid;
    TabSheet2: TTabSheet;
    grd_Payment: TDBGrid;
    qry_Type: TSimpleDataSet;
    qry_TypeValue: TStringField;
    qry_TypeNameA: TStringField;
    qry_TypeNameE: TStringField;
    DS_Type: TDataSource;
    SDS_Itemunit: TSimpleDataSet;
    SDS_ItemunitItemUnitCode: TStringField;
    SDS_ItemunitItemUnitDescA: TStringField;
    SDS_ItemunitItemUnitDescE: TStringField;
    DS_ItemUnit: TDataSource;
    SDS_ItemDef: TSimpleDataSet;
    DS_ItemDEf: TDataSource;
    SDS_ItemDefItemCode: TStringField;
    SDS_ItemDefItemNameAr: TStringField;
    SDS_ItemDefItemNameEn: TStringField;
    SDS_DetailsItemNameAr2: TStringField;
    SDS_DetailsItemUnit: TStringField;
    SDS_DetailsItemUnitDescAr: TStringField;
    SDS_Payment: TSimpleDataSet;
    DS_Payment: TDataSource;
    SDS_PaymentTrxLineNo: TStringField;
    SDS_PaymentPaymentType: TStringField;
    SDS_PaymentAmount: TFMTBCDField;
    SDS_PaymentBalance: TFMTBCDField;
    SDS_PaymentTrxPaymentDescAr: TStringField;
    SDS_PaymentTrxPaymentDescEn: TStringField;
    SDS_PaymentVendoreCode: TStringField;
    SDS_PaymentCompanyCode: TStringField;
    SDS_PaymentBranchCode: TStringField;
    SDS_PaymentTrxNo: TStringField;
    SDS_PaymentTrxType: TStringField;
    SDS_PaymentType: TSimpleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DS_PaymentType: TDataSource;
    SDS_PaymentPaymentDesc: TStringField;
    trxDate: TDateTimePicker;
    procedure BtnOpenClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure BtnShowClick(Sender: TObject);
    procedure SDS_HeaderNewRecord(DataSet: TDataSet);
    procedure SDS_HeaderAfterScroll(DataSet: TDataSet);
    procedure SDS_DetailsNewRecord(DataSet: TDataSet);
    procedure SDS_DetailsItemCodeChange(Sender: TField);
    procedure SDS_DetailsQuantityChange(Sender: TField);
    procedure SDS_DetailsCostPriceChange(Sender: TField);
    procedure SDS_DetailsDiscountChange(Sender: TField);
    procedure SDS_PaymentNewRecord(DataSet: TDataSet);
    procedure SDS_DetailsItemUnitChange(Sender: TField);
  private
    { Private declarations }
    EditMode : Boolean;
  public
    { Public declarations }
  end;

var
  fmPrTrxBaseForm: TfmPrTrxBaseForm;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmPrTrxBaseForm.BtnOpenClick(Sender: TObject);
begin
  SDS_Header.Close;
  SDS_Header.DataSet.CommandText := 'Select * from tbl_PrTrxHeader where CompanyCode = ''' + DCompany + ''' and TrxType =''PRIV'' ';
  SDS_Header.Open;

  SDS_WareHouse.Close;
  SDS_WareHouse.Open;
  SDS_Vendors.close;
  SDS_Vendors.Open;
  SDS_ItemDef.Close;
  SDS_ItemDef.open;
  SDS_Itemunit.Close;
  SDS_Itemunit.open;
  SDS_PaymentType.Close;
  SDS_PaymentType.Open;

  btnEdit.Enabled := True;
  BtnOpen.Enabled := True;
  btnAdd.Enabled := True;
  btnSave.Enabled := False;
  BtnCancel.Enabled := False;
  btnDelete.Enabled := True;
  grpData.Enabled := False;
  Co_WareHouse.Enabled := False;
  CO_Vendors.Enabled := False;
  grd_Payment.Enabled := False;
  grd_Details.Enabled := False;
  trxDate.Enabled := false;

  BtnShow.Enabled := True;
  EditMode := False;
end;

procedure TfmPrTrxBaseForm.btnEditClick(Sender: TObject);
begin
  SDS_Header.Edit;
  SDS_Details.Edit;
  SDS_Payment.Edit;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  edtCode.Enabled := True;
  BtnShow.Enabled := True;
  DBEdit1.Enabled := True;
  DBEdit2.Enabled := True;
  DBEdit3.Enabled := True;
  DBEdit4.Enabled := True;
  DBEdit5.Enabled := True;
  DBEdit6.Enabled := True;
  Co_WareHouse.Enabled := True;
  CO_Vendors.Enabled := True;
  grd_Payment.Enabled := True;
  grd_Details.Enabled := true;
  trxDate.Enabled := True;
  EditMode := True;
end;

procedure TfmPrTrxBaseForm.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
TrxVal , TotalDiscount , TotalPayment : Real;
begin
  If SDS_HeaderTrxNo.AsString = '' Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·—„“  ﬁ»· «·Õ›Ÿ');
     edtCode.SetFocus;
     Exit;
  end;

  If (SDS_HeaderWareHouseCode.AsString = '')  Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·„” Êœ⁄');
     Co_WareHouse.SetFocus;
     Exit;
  end;

  If (SDS_HeaderVendoreCode.AsString = '')  Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·„Ê—œ');
     CO_Vendors.SetFocus;
     Exit;
  end;

  IsDuplicated := RepeatedKey('tbl_PrTrxHeader', ' TrxNo = ''' + SDS_HeaderTrxNo.AsString + ''' And CompanyCode = ''' + DCompany + ''' And TrxType = ''PRIV''  ');
  If (IsDuplicated = True) And (EditMode = False) Then Begin
     ShowMessage('Â–« «·—„“ „ÊÃÊœ „”»ﬁ«');
     edtCode.SetFocus;
     Exit;
  end;
   With SDS_Details do Begin
       DisableControls;
       First;
       While Not Eof Do Begin
             Edit;
             SDS_DetailsTraLineNo.AsInteger := SDS_Details.RecNo;
             TrxVal := TrxVal + SDS_DetailsNetPrice.AsFloat;
             TotalDiscount := TotalDiscount + SDS_DetailsDiscount.AsFloat;
             SDS_Details.Next;
       end;
   end;

   if SDS_Payment.RecordCount <= 0 Then begin
     ShowMessage('Ì—ÃÌ ÷»ÿ «·œ›⁄« ');
     Exit;
   end;

   With SDS_Payment do Begin
       DisableControls;
       First;
       While Not Eof Do Begin
             Edit;
             SDS_PaymentTrxLineNo.AsInteger := SDS_Payment.RecNo;
             TotalPayment := TotalPayment + SDS_PaymentAmount.AsFloat;
             SDS_Payment.Next;
       end;
   end;

   if SDS_PaymentAmount.AsFloat <>  TrxVal Then begin
     ShowMessage('Ì—ÃÌ ÷»ÿ «·œ›⁄« ');
     SDS_Payment.EnableControls;
     SDS_Details.EnableControls;
     grd_Payment.SetFocus;
     Exit;
   end;

   SDS_HeaderTrxAmount.AsFloat := TrxVal;
   SDS_HeaderTotalDiscount.AsFloat := TotalDiscount;
   SDS_HeaderTrxDate.AsDateTime := trxDate.DateTime;

  if ((SDS_Header.ApplyUpdates(0) = 0) AND (SDS_Details.ApplyUpdates(0) = 0) AND (SDS_Payment.ApplyUpdates(0) = 0)) then Begin
      ShowMessage(' „ «·Õ›‹‹Ÿ »‰Ã«Õ');
      BtnOpenClick(Sender);
  end
  else Begin
   SDS_Payment.EnableControls;
   SDS_Details.EnableControls;
   ShowMessage('ÕœÀ Œÿ√ √À‰«¡ «·Õ›Ÿ') ;
  end;

end;

procedure TfmPrTrxBaseForm.BtnCancelClick(Sender: TObject);
Var
  buttonSelected : Integer;
begin
  // Show a confirmation dialog
  buttonSelected := MessageDlg('Â·  —Ìœ Õﬁ« «·€«¡ «· ⁄œÌ·« ',mtInformation, mbOKCancel, 0);

  // Show the button type selected
  if buttonSelected = mrOK then
  Begin
     SDS_Header.CancelUpdates;
     SDS_Payment.CancelUpdates;
     SDS_Details.CancelUpdates;
      BtnOpenClick(Sender);
  end;

end;

procedure TfmPrTrxBaseForm.btnDeleteClick(Sender: TObject);
Var
  buttonSelected : Integer;
  DeleteSQL : String;
begin
  try
    // Show a confirmation dialog
    buttonSelected := MessageDlg('Â·  —Ìœ Õﬁ« Õ–› «·»Ì«‰« ',mtError, mbOKCancel, 0);

    // Show the button type selected
    if buttonSelected = mrOK then
    Begin
        Try
        DeleteSQL := 'Delete From Tbl_PrTrxDetails where CompanyCode ='''+DCompany+''' And BranchCode ='''+DBranch+''' And TrxNo ='''+SDS_HeaderTrxNo.AsString+''' and TRxType=''PRIV'' ';
        DeleteSQL := DeleteSQL + 'Delete From tbl_PrTrxPayment where CompanyCode ='''+DCompany+''' And BranchCode ='''+DBranch+''' And TrxNo ='''+SDS_HeaderTrxNo.AsString+''' and TRxType=''PRIV'' ';
        DeleteSQL := DeleteSQL + 'Delete From tbl_PrTrxHeader where CompanyCode ='''+DCompany+''' And BranchCode ='''+DBranch+''' And TrxNo ='''+SDS_HeaderTrxNo.AsString+''' and TRxType=''PRIV'' ';

        fmMainForm.MainConnection.ExecuteDirect(DeleteSQL);

        SDS_Details.Refresh;
        SDS_Payment.Refresh;

        ShowMessage(' „ «·Õ–› »‰Ã«Õ');
        BtnOpenClick(Sender);
        Except
        ShowMessage('ÕœÀ Œÿ√ √À‰«¡ Õ–› «·»Ì«‰« ') ;
        BtnOpenClick(Sender);
      End;
    end;
  except
      ShowMessage('ÕœÀ Œÿ√ √À‰«¡ „”Õ «·»Ì«‰«  , ·« Ì„ﬂ‰ Õ–› »Ì«‰«  „” Œœ„…');
      BtnOpenClick(Sender);
  end;
end;

procedure TfmPrTrxBaseForm.FormCreate(Sender: TObject);
Begin
  {
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  }
  //BtnOpenClick(Sender);
  BtnShow.Enabled := False;
end;

procedure TfmPrTrxBaseForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmPrTrxBaseForm.btnAddClick(Sender: TObject);
begin
  SDS_Header.Append;
  SDS_Details.Append;
  SDS_Payment.Append;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  edtCode.Enabled := True;
  edtCode.SetFocus;
  DBEdit1.Enabled := True;
  DBEdit2.Enabled := True;
  DBEdit3.Enabled := True;
  DBEdit4.Enabled := True;
  DBEdit5.Enabled := True;
  DBEdit6.Enabled := True;
  Co_WareHouse.Enabled := True;
  CO_Vendors.Enabled := True;
  grd_Payment.Enabled := True;
  grd_Details.Enabled := true;
  trxDate.Enabled := true;
  trxDate.DateTime := now;
  BtnShow.Enabled := False;
  EditMode := False;
end;

procedure TfmPrTrxBaseForm.BtnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

procedure TfmPrTrxBaseForm.SDS_HeaderNewRecord(DataSet: TDataSet);
begin
 SDS_HeaderCompanyCode.Value := DCompany;
 SDS_HeaderTrxType.Value := 'PRIV';
 SDS_HeaderTrxStatus.Value := 'A';
 SDS_HeaderBranchCode.Value := DBranch;
end;

procedure TfmPrTrxBaseForm.SDS_HeaderAfterScroll(DataSet: TDataSet);
begin
SDS_Details.Close;
SDS_Details.DataSet.CommandText :='Select * From tbl_PrTrxDetails where CompanyCode ='''+DCompany+''' And BranchCode ='''+DBranch+''' And TrxNo ='''+SDS_HeaderTrxNo.AsString+''' and TRxType=''PRIV'' ';
SDS_Details.Open;
SDS_Payment.Close;
SDS_Payment.DataSet.CommandText :='Select * From tbl_PrTrxPayment where CompanyCode ='''+DCompany+''' And BranchCode ='''+DBranch+''' And TrxNo ='''+SDS_HeaderTrxNo.AsString+''' and TRxType=''PRIV'' ';
SDS_Payment.Open;
trxDate.DateTime := SDS_HeaderTrxDate.AsDateTime;
end;

procedure TfmPrTrxBaseForm.SDS_DetailsNewRecord(DataSet: TDataSet);
begin
 SDS_DetailsCompanyCode.Value := DCompany;
 SDS_DetailsTrxType.Value := 'PRIV';
 SDS_DetailsBranchCode.Value := DBranch;
 SDS_DetailsTrxNo.Value := SDS_HeaderTrxNo.AsString;
 SDS_DetailsWareHouseCode.Value := SDS_HeaderWareHouseCode.AsString;
 SDS_DetailsVendoreCode.Value := SDS_HeaderVendoreCode.AsString;
 SDS_DetailsTraLineNo.Value :=  'XX';
 SDS_DetailsQuantity.AsFloat := 0.0;
 SDS_DetailsCostPrice.AsFloat := 0.0;
 SDS_DetailsDiscount.AsFloat := 0.0;
 SDS_DetailsNetPrice.AsFloat := 0.0;
end;

procedure TfmPrTrxBaseForm.SDS_DetailsItemCodeChange(Sender: TField);
begin
  SDS_Itemunit.Close;
  SDS_Itemunit.DataSet.CommandText := ' Select * from tbl_ItemUnit where CompanyCode = ''' + DCompany + ''' And '
                                     +' (ItemUnitCode in (select RelateUnitCode from tbl_ItemRelatedUnits where itemcode = ''' + SDS_DetailsItemCode.AsString + ''') '
                                     +' or ItemUnitCode = (select ItemUnitCode from tbl_ItemDefinition where itemcode = ''' + SDS_DetailsItemCode.AsString + ''')) ';
  SDS_Itemunit.Open;
  SDS_DetailsItemUnit.AsString := GetDBValue('ItemUnitCode','tbl_ItemDefinition',' And ItemCode =''' + SDS_DetailsItemCode.AsString + ''' ');
  SDS_DetailsUnitTransValue.AsString := '1'; //GetDBValue('UnitTransValue','tbl_ItemUnit',' And ItemUnitCode =''' + SDS_DetailsItemUnit.AsString + ''' ');
  SDS_DetailsItemService.AsString := GetDBValue('ItemService','tbl_ItemDefinition',' And ItemCode =''' + SDS_DetailsItemCode.AsString + ''' ');

end;

procedure TfmPrTrxBaseForm.SDS_DetailsQuantityChange(Sender: TField);
begin
 SDS_DetailsNetPrice.AsFloat := (SDS_DetailsCostPrice.AsFloat * SDS_DetailsQuantity.AsFloat) - SDS_DetailsDiscount.AsFloat;
end;

procedure TfmPrTrxBaseForm.SDS_DetailsCostPriceChange(Sender: TField);
begin
 SDS_DetailsNetPrice.AsFloat := (SDS_DetailsCostPrice.AsFloat * SDS_DetailsQuantity.AsFloat) - SDS_DetailsDiscount.AsFloat;
end;

procedure TfmPrTrxBaseForm.SDS_DetailsDiscountChange(Sender: TField);
begin
 SDS_DetailsNetPrice.AsFloat := (SDS_DetailsCostPrice.AsFloat * SDS_DetailsQuantity.AsFloat) - SDS_DetailsDiscount.AsFloat;
end;

procedure TfmPrTrxBaseForm.SDS_PaymentNewRecord(DataSet: TDataSet);
begin
 SDS_PaymentCompanyCode.Value := DCompany;
 SDS_PaymentTrxType.Value := 'PRIV';
 SDS_PaymentBranchCode.Value := DBranch;
 SDS_PaymentTrxNo.Value := SDS_HeaderTrxNo.AsString;
 SDS_PaymentVendoreCode.Value := SDS_HeaderVendoreCode.AsString;
 SDS_PaymentTrxLineNo.Value :=  'XX';
 SDS_PaymentAmount.AsFloat := 0.0;

end;

procedure TfmPrTrxBaseForm.SDS_DetailsItemUnitChange(Sender: TField);
begin
SDS_DetailsUnitTransValue.AsString := GetDBValue('UnitTransValue','tbl_ItemUnit',' And ItemUnitCode =''' + SDS_DetailsItemUnit.AsString + ''' ');
end;

end.

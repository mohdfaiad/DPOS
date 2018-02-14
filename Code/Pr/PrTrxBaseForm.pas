unit PrTrxBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,LookUp,
  VrControls, VrButtons, Buttons, ComCtrls, ExtCtrls, jpeg;

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
    tshDetails: TTabSheet;
    GroupBox3: TGroupBox;
    grd_Details: TDBGrid;
    tshPayment: TTabSheet;
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
    btnPost: TButton;
    btn_adjust: TButton;
    SDS_DetailsItemUnit: TStringField;
    Navigator: TDBNavigator;
    SDS_DetailsItemUnitDescAr: TStringField;
    SDS_ItemDef: TSimpleDataSet;
    SDS_ItemDefItemCode: TStringField;
    DS_ItemDEf: TDataSource;
    SDS_ItemDefItemService: TStringField;
    SDS_ItemDefItemNameAr: TStringField;
    SDS_ItemDefItemNameEn: TStringField;
    SDS_DetailsItemCode: TStringField;
    SDS_DetailsItemNameAr: TStringField;
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
    procedure btn_adjustClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure grd_DetailsEnter(Sender: TObject);
    procedure grd_DetailsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  SDS_Header.DataSet.CommandText := 'Select * from tbl_PrTrxHeader where CompanyCode = ''' + DCompany + ''' And BranchCode = ''' + DBranch + '''  and TrxType =''PRIV'' ';
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
  qry_Type.Close;
  qry_Type.Open;

  btnEdit.Enabled := False;
  btnDelete.Enabled := False;
  if SDS_HeaderTrxStatus.AsString <> 'P' Then begin
    btnEdit.Enabled := True;
    btnDelete.Enabled := True;
  end;
  BtnOpen.Enabled := True;
  btnAdd.Enabled := True;
  btnSave.Enabled := False;
  BtnCancel.Enabled := False;

  grpData.Enabled := False;
  Co_WareHouse.Enabled := False;
  CO_Vendors.Enabled := False;
  grd_Payment.Enabled := False;
  grd_Details.Enabled := True;
  grd_Details.ReadOnly := True;
  trxDate.Enabled := false;
  BtnShow.Enabled := True;
  Navigator.Enabled := True;
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
  edtCode.Enabled := False;
  BtnShow.Enabled := True;
  btnPost.Enabled := False;
  DBEdit1.Enabled := True;
  DBEdit2.Enabled := True;
  DBEdit3.Enabled := True;
  DBEdit4.Enabled := True;
  DBEdit5.Enabled := True;
  DBEdit6.Enabled := True;
  Co_WareHouse.Enabled := True;
  CO_Vendors.Enabled := True;
  grd_Payment.Enabled := True;
  grd_Details.Enabled := True;
  grd_Details.ReadOnly := False;
  trxDate.Enabled := True;
  Navigator.Enabled := False;
  EditMode := True;
end;

procedure TfmPrTrxBaseForm.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
    TrxVal , TotalDiscount , TotalPayment : Real;
    NewCode : String;
begin
{
  If SDS_HeaderTrxNo.AsString = '' Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·—„“  ﬁ»· «·Õ›Ÿ');
     edtCode.SetFocus;
     Exit;
  end;
}
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
  SDS_Header.Edit;
  IsDuplicated := RepeatedKey('tbl_PrTrxHeader', ' TrxNo = ''' + SDS_HeaderTrxNo.AsString + ''' And CompanyCode = ''' + DCompany + ''' And TrxType = ''PRIV''  ');
  If (IsDuplicated = True) And (EditMode = False) Then Begin
     ShowMessage('Â–« «·—„“ „ÊÃÊœ „”»ﬁ«');
     edtCode.SetFocus;
     Exit;
  end;
  if EditMode = False then
  begin


  end;
  TotalDiscount := 0;
  TrxVal := 0;
   With SDS_Details do Begin
       DisableControls;
       First;
       While Not Eof Do Begin
             Edit;
             SDS_DetailsCompanyCode.AsString := DCompany;
             SDS_DetailsBranchCode.AsString := DBranch;
             SDS_DetailsTrxNo.AsString := SDS_HeaderTrxNo.AsString;
             SDS_DetailsVendoreCode.AsString := SDS_HeaderVendoreCode.AsString;
             SDS_DetailsWareHouseCode.AsString := SDS_HeaderWareHouseCode.AsString;
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
             SDS_PaymentTrxNo.Value := SDS_HeaderTrxNo.AsString;
             SDS_PaymentVendoreCode.Value := SDS_HeaderVendoreCode.AsString;
             SDS_PaymentTrxLineNo.AsInteger := SDS_Payment.RecNo;
             TotalPayment := TotalPayment + SDS_PaymentAmount.AsFloat;
             SDS_Payment.Next;
       end;
   end;

   if SDS_PaymentAmount.AsFloat <>  TrxVal Then begin
     ShowMessage('Ì—ÃÌ ÷»ÿ «·œ›⁄« ');
     SDS_Payment.EnableControls;
     SDS_Details.EnableControls;
     PG1.ActivePageIndex := 1;
     btn_adjust.SetFocus;
     //grd_Payment.SetFocus;
     Exit;
   end;

   SDS_HeaderTrxAmount.AsFloat := TrxVal;
   SDS_HeaderTotalDiscount.AsFloat := TotalDiscount;
   SDS_HeaderTrxDate.AsDateTime := trxDate.DateTime;

   
  if ((SDS_Header.ApplyUpdates(0) = 0) AND (SDS_Details.ApplyUpdates(0) = 0) AND (SDS_Payment.ApplyUpdates(0) = 0)) then Begin
      ShowMessage(' „ «·Õ›‹‹Ÿ »‰Ã«Õ');
          SDS_Details.EnableControls;
          SDS_Payment.EnableControls;


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
      grd_Details.Enabled := True;
      grd_Details.ReadOnly := True;
      trxDate.Enabled := false;
      BtnShow.Enabled := True;
      btnPost.Enabled := True;
      Navigator.Enabled := True;
      EditMode := False;

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
  BtnOpenClick(Sender);
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
  grd_Details.Refresh;
  grd_Payment.Refresh;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  DBEdit1.Enabled := True;
  DBEdit2.Enabled := True;
  DBEdit3.Enabled := True;
  DBEdit4.Enabled := True;
  DBEdit5.Enabled := True;
  DBEdit6.Enabled := True;
  edtCode.Enabled := False;
  Co_WareHouse.Enabled := True;
  CO_Vendors.Enabled := True;
  grd_Payment.Enabled := True;
  grd_Details.Enabled := True;
  grd_Details.ReadOnly := False;
  trxDate.Enabled := true;
  trxDate.DateTime := Date;
  BtnShow.Enabled := False;
  btnPost.Enabled := False;
  EditMode := False;
  Navigator.Enabled := False;
  trxDate.SetFocus;
end;

procedure TfmPrTrxBaseForm.BtnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
    SDS_HeaderAfterScroll(SDS_Header);
end;

procedure TfmPrTrxBaseForm.SDS_HeaderNewRecord(DataSet: TDataSet);
Var NewCode : String;
begin
 SDS_HeaderCompanyCode.Value := DCompany;
 SDS_HeaderTrxType.Value := 'PRIV';
 SDS_HeaderTrxStatus.Value := 'A';
 SDS_HeaderBranchCode.Value := DBranch;
 NewCode := GetDBValue('ISNULL(Max(CAST(TrxNo AS NUMERIC)),0) As LastTrxNo ','Tbl_PrTrxHeader',' and Companycode ='''+DCompany+''' And TrxType =''PRIV''');
 NewCode := IntToStr(StrToInt(NewCode)+1) ;
 SDS_HeaderTrxNo.AsString := PadLeft(NewCode,8);
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
  if (SDS_HeaderTrxStatus.AsString = 'P')Then
  begin
    btnEdit.Enabled := False;
    btnPost.Enabled := False;
    btnDelete.Enabled := False;
  end
  else
  begin
    btnEdit.Enabled := True;
    btnPost.Enabled := True;
    btnDelete.Enabled := True;
  end;
end;

procedure TfmPrTrxBaseForm.SDS_DetailsNewRecord(DataSet: TDataSet);
begin
 SDS_DetailsCompanyCode.Value := DCompany;
 SDS_DetailsTrxType.Value := 'PRIV';
 SDS_DetailsBranchCode.Value := DBranch;
 SDS_DetailsTrxNo.AsString := 'xx';
 SDS_DetailsTraLineNo.AsInteger :=  SDS_Details.RecNo;
 SDS_DetailsQuantity.AsFloat := 1;
 SDS_DetailsDiscount.AsFloat := 0;
 SDS_DetailsCostPrice.AsFloat := 0;
 SDS_DetailsNetPrice.AsFloat := 0;
end;

procedure TfmPrTrxBaseForm.SDS_DetailsItemCodeChange(Sender: TField);
begin

  SDS_Itemunit.Close;
  SDS_Itemunit.DataSet.Close;
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
 SDS_PaymentTrxNo.Value := 'xx';
 SDS_PaymentVendoreCode.Value := 'xx';
 SDS_PaymentTrxLineNo.AsInteger := SDS_Payment.RecNo ;
 SDS_PaymentAmount.AsFloat := 0;

end;

procedure TfmPrTrxBaseForm.SDS_DetailsItemUnitChange(Sender: TField);
begin
  SDS_DetailsUnitTransValue.AsString := GetDBValue('UnitTransValue','tbl_ItemUnit',' And ItemUnitCode =''' + SDS_DetailsItemUnit.AsString + ''' ');
end;

procedure TfmPrTrxBaseForm.btn_adjustClick(Sender: TObject);
Var
Total : Real;
begin
  If SDS_Details.State in [dsInsert, dsEdit] then SDS_Details.Post;
  SDS_Payment.First ;
    While Not SDS_Payment.Eof do SDS_Payment.Delete;

    If SDS_Payment.Active And (SDS_Payment.RecordCount=0) then begin
       If Not (SDS_Payment.State in [dsInsert]) then SDS_Payment.Append;
       Total := 0;
       With SDS_Details do Begin
        First;
        While Not Eof Do Begin
           Total := Total + SDS_DetailsNetPrice.AsFloat;
           SDS_Details.Next;
        end;
       end;

       SDS_PaymentAmount.AsFloat := Total;

       SDS_PaymentPaymentType.AsString :='C';
          If SDS_HeaderVendoreCode.AsString='' then begin
             ShowMessage('ÌÃ»  ÕœÌœ «·„Ê—œ');
             CO_Vendors.SetFocus;
             Exit;
          end;
          SDS_PaymentCompanyCode.Value := DCompany;
          SDS_PaymentTrxType.Value := 'PRIV';
          SDS_PaymentBranchCode.Value := DBranch;
          SDS_PaymentTrxNo.Value := SDS_HeaderTrxNo.AsString;
          SDS_PaymentVendoreCode.Value := SDS_HeaderVendoreCode.AsString;
          SDS_PaymentTrxLineNo.Value :=  '1';



       SDS_Payment.Post ;
    end;


end;

procedure TfmPrTrxBaseForm.btnPostClick(Sender: TObject);
var
Quantity , OldQty , AvgCost , OldAvgCost  : Real;
WhrCod  , SQl   : String;
buttonSelected : Integer;
begin

buttonSelected := MessageDlg('Â·  —Ìœ  —ÕÌ· «·»Ì«‰« ',mtError, mbOKCancel, 0);
if buttonSelected = mrOK then
begin
   Quantity :=0;
   OldQty := 0;
   AvgCost := 0;
   OldAvgCost := 0;
   With SDS_Details do Begin
       First;
       While Not Eof Do Begin
          WhrCod :=  ' and CompanyCode = ''' + DCompany + ''' '
           + '   And WarehouseCode = ''' + SDS_DetailsWareHouseCode.AsString + ''' '
           + '   And ItemCode = ''' + SDS_DetailsItemCode.AsString + '''  ';
       Try
        OldQty := StrToFloat( GetDBValue(' ItemQuantity ',' tbl_itemStock ',WhrCod));
       Except
        OldQty := 0;
       End;

       Try
        OldAvgCost := StrToFloat( GetDBValue(' AvgCost ',' tbl_itemStock ',WhrCod));
       Except
        OldAvgCost := 0;
       End;

          Quantity := OldQty + SDS_DetailsQuantity.AsFloat  * SDS_DetailsUnitTransValue.AsFloat;

          AvgCost := ((OldQty * OldAvgCost)+ (Abs(SDS_DetailsQuantity.AsFloat * SDS_DetailsUnitTransValue.AsFloat *
                      SDS_DetailsCostPrice.AsFloat))) / Quantity ;
          if( GetDBValue(' ItemCode ',' tbl_itemStock ',WhrCod) = '' )  then
            SQl := ' insert into Tbl_itemStock (CompanyCode,ItemCode,ItemService,WareHouseCode,ItemQuantity,ItemUnit,AvgCost) '
             + ' Values ('''+DCompany+''','''+SDS_DetailsItemCode.AsString+''',''IVI'' , '''+SDS_DetailsWareHouseCode.AsString+''' , '''+FloatToStr(Quantity)+''' ,1 , '''+FloatToStr(AvgCost)+''' ) '
          else
            SQl := ' Update Tbl_itemStock set ItemQuantity ='''+ FloatToStr(Quantity)+''' , AvgCost ='''+FloatToStr(AvgCost)+''' where 1=1 ' + WhrCod;
          fmMainForm.MainConnection.ExecuteDirect(SQL);
          SDS_Details.Next;
       end;
   end;
   SDS_Header.Open;
   SDS_Header.Edit;
   SDS_HeaderTrxStatus.AsString := 'P';
   SDS_Header.ApplyUpdates(0);
   SDS_Header.Close;

   ShowMessage(' „ «· —ÕÌ· »‰Ã«Õ');
   BtnOpen.Enabled := True;
   btnAdd.Enabled := True;
   btnSave.Enabled := False;
   BtnCancel.Enabled := False;
   grpData.Enabled := False;
   Co_WareHouse.Enabled := False;
   CO_Vendors.Enabled := False;
   grd_Payment.Enabled := False;
   grd_Details.Enabled := True;
   grd_Details.ReadOnly := True;
   trxDate.Enabled := false;
   BtnShow.Enabled := True;
   Navigator.Enabled := True;
   btnEdit.Enabled := False;
   btnPost.Enabled := False;
   btnDelete.Enabled := False;
   EditMode := False;
end;
end;

procedure TfmPrTrxBaseForm.grd_DetailsEnter(Sender: TObject);
begin
 if (SDS_HeaderVendoreCode.AsString = '')Then
 begin
   ShowMessage('Ì—ÃÌ «Œ Ì«— «·„Ê—œ');
   CO_Vendors.SetFocus;
   Exit;
 end;
  if (SDS_HeaderWareHouseCode.AsString = '')Then
 begin
   ShowMessage('Ì—ÃÌ ≈Œ Ì«— «·„” Êœ⁄');
   Co_WareHouse.SetFocus;
   Exit;
 end;
end;

procedure TfmPrTrxBaseForm.grd_DetailsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 If Key<>VK_F2 then Exit
 else begin
  if grd_Details.SelectedField.FieldName = 'ItemCode' then begin
    lkp := Tlkp.Create(SDS_ItemDef,nil);
    lkp.ShowModal;
    SDS_Details.Edit;
    SDS_DetailsItemCode.AsString := SDS_ItemDefItemCode.AsString;
    SDS_DetailsItemService.AsString := SDS_ItemDefItemService.AsString;
    SDS_DetailsItemNameAr.AsString := SDS_ItemDefItemNameAr.AsString;
  end;
 end;
 SDS_ItemDef.Refresh;

end;

end.

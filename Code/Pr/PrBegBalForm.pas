unit PrBegBalForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,LookUp,
  VrControls, VrButtons, Buttons, ComCtrls, ExtCtrls;

type
  TfmBegBalForm = class(TForm)
    grp_Content: TGroupBox;
    SDS_Header: TSimpleDataSet;
    DS_Header: TDataSource;
    grpData: TGroupBox;
    GroupBox2: TGroupBox;
    BtnOpen: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    BtnCancel: TButton;
    BtnShow: TButton;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Co_WareHouse: TDBLookupComboBox;
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
    Label1: TLabel;
    edtCode: TDBEdit;
    Label14: TLabel;
    trxDate: TDateTimePicker;
    Label15: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit6: TDBEdit;
    Label2: TLabel;
    Navigator: TDBNavigator;
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
    procedure SDS_DetailsItemUnitChange(Sender: TField);
  private
    { Private declarations }
    EditMode : Boolean;
  public
    { Public declarations }
  end;

var
  fmBegBalForm: TfmBegBalForm;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmBegBalForm.BtnOpenClick(Sender: TObject);
begin
  SDS_Header.Close;
  SDS_Header.DataSet.CommandText := 'Select * from tbl_PrTrxHeader where CompanyCode = ''' + DCompany + ''' and TrxType =''IVBB'' ';
  SDS_Header.Open;

  SDS_WareHouse.Close;
  SDS_WareHouse.Open;
  SDS_Vendors.close;
  SDS_Vendors.Open;
  SDS_ItemDef.Close;
  SDS_ItemDef.open;
  SDS_Itemunit.Close;
  SDS_Itemunit.open;

  btnEdit.Enabled := True;
  BtnOpen.Enabled := True;
  btnAdd.Enabled := True;
  btnSave.Enabled := False;
  BtnCancel.Enabled := False;
  btnDelete.Enabled := True;
  grpData.Enabled := False;
  Co_WareHouse.Enabled := False;
  grd_Details.Enabled := False;
  trxDate.Enabled := false;

  BtnShow.Enabled := True;
  Navigator.Enabled := True;
  EditMode := False;
end;

procedure TfmBegBalForm.btnEditClick(Sender: TObject);
begin
  SDS_Header.Edit;
  SDS_Details.Edit;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  edtCode.Enabled := False;
  BtnShow.Enabled := True;
  DBEdit1.Enabled := True;
  DBEdit2.Enabled := True;
  DBEdit6.Enabled := True;
  Co_WareHouse.Enabled := True;
  grd_Details.Enabled := true;
  trxDate.Enabled := True;
  Navigator.Enabled := False;
  EditMode := True;
end;

procedure TfmBegBalForm.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
    TrxVal , TotalDiscount : Real;
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

  IsDuplicated := RepeatedKey('tbl_PrTrxHeader', ' TrxNo = ''' + SDS_HeaderTrxNo.AsString + ''' And CompanyCode = ''' + DCompany + ''' And TrxType = ''IVBB''  ');
  If (IsDuplicated = True) And (EditMode = False) Then Begin
     ShowMessage('Â–« «·—„“ „ÊÃÊœ „”»ﬁ«');
     edtCode.SetFocus;
     Exit;
  end;

  NewCode := GetDBValue('ISNULL(Max(CAST(TrxNo AS NUMERIC)),0) As LastTrxNo ','Tbl_PrTrxHeader',' and Companycode ='''+DCompany+''' And TrxType =''IVBB''');
  NewCode := IntToStr(StrToInt(NewCode)+1) ;
  SDS_HeaderTrxNo.AsString := PadLeft(NewCode,8);

   With SDS_Details do Begin
       DisableControls;
       First;
       While Not Eof Do Begin
             Edit;
             SDS_DetailsTraLineNo.AsInteger := SDS_Details.RecNo;
             SDS_Details.Next;
       end;
   end;

   SDS_HeaderTrxDate.AsDateTime := trxDate.DateTime;;

  if ((SDS_Header.ApplyUpdates(0) = 0) AND (SDS_Details.ApplyUpdates(0) = 0)) then Begin
      ShowMessage(' „ «·Õ›‹‹Ÿ »‰Ã«Õ');
        btnEdit.Enabled := True;
        BtnOpen.Enabled := True;
        btnAdd.Enabled := True;
        btnSave.Enabled := False;
        BtnCancel.Enabled := False;
        btnDelete.Enabled := True;
        grpData.Enabled := False;
        Navigator.Enabled := True;
        BtnShow.Enabled := BtnOpen.Enabled;

  end
  else Begin
   ShowMessage('ÕœÀ Œÿ√ √À‰«¡ «·Õ›Ÿ') ;
  end;

end;

procedure TfmBegBalForm.BtnCancelClick(Sender: TObject);
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

procedure TfmBegBalForm.btnDeleteClick(Sender: TObject);
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
        DeleteSQL := 'Delete From Tbl_PrTrxDetails where CompanyCode ='''+DCompany+''' And BranchCode ='''+DBranch+''' And TrxNo ='''+SDS_HeaderTrxNo.AsString+''' and TRxType=''IVBB'' ';
        DeleteSQL := DeleteSQL + 'Delete From tbl_PrTrxHeader where CompanyCode ='''+DCompany+''' And BranchCode ='''+DBranch+''' And TrxNo ='''+SDS_HeaderTrxNo.AsString+''' and TRxType=''IVBB'' ';

        fmMainForm.MainConnection.ExecuteDirect(DeleteSQL);

        SDS_Details.Refresh;

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

procedure TfmBegBalForm.FormCreate(Sender: TObject);
Begin
  BtnOpenClick(Sender);
  BtnShow.Enabled := False;
end;

procedure TfmBegBalForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmBegBalForm.btnAddClick(Sender: TObject);
begin
  SDS_Header.Append;
  grd_Details.Refresh;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  edtCode.Enabled := False;
  DBEdit1.Enabled := True;
  DBEdit2.Enabled := True;
  DBEdit6.Enabled := True;
  Co_WareHouse.Enabled := True;
  grd_Details.Enabled := true;
  trxDate.Enabled := true;
  trxDate.DateTime := Date;
  BtnShow.Enabled := False;
  EditMode := False;
  Navigator.Enabled := False;
  trxDate.SetFocus;
end;

procedure TfmBegBalForm.BtnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

procedure TfmBegBalForm.SDS_HeaderNewRecord(DataSet: TDataSet);
Var NewCode : String;
begin
 SDS_HeaderCompanyCode.Value := DCompany;
 SDS_HeaderTrxType.Value := 'IVBB';
 SDS_HeaderTrxStatus.Value := 'A';
 SDS_HeaderBranchCode.Value := DBranch;
 NewCode := GetDBValue('ISNULL(Max(CAST(TrxNo AS NUMERIC)),0) As LastTrxNo ','Tbl_PrTrxHeader',' and Companycode ='''+DCompany+''' And TrxType =''IVBB''');
 NewCode := IntToStr(StrToInt(NewCode)+1) ;
 SDS_HeaderTrxNo.AsString := PadLeft(NewCode,8); 
end;

procedure TfmBegBalForm.SDS_HeaderAfterScroll(DataSet: TDataSet);
begin
SDS_Details.Close;
SDS_Details.DataSet.CommandText :='Select * From tbl_PrTrxDetails where CompanyCode ='''+DCompany+''' And BranchCode ='''+DBranch+''' And TrxNo ='''+SDS_HeaderTrxNo.AsString+''' and TRxType=''IVBB'' ';
SDS_Details.Open;
trxDate.DateTime := SDS_HeaderTrxDate.AsDateTime;
end;

procedure TfmBegBalForm.SDS_DetailsNewRecord(DataSet: TDataSet);
begin
 SDS_DetailsCompanyCode.Value := DCompany;
 SDS_DetailsTrxType.Value := 'IVBB';
 SDS_DetailsBranchCode.Value := DBranch;
 SDS_DetailsTrxNo.Value := SDS_HeaderTrxNo.AsString;
 SDS_DetailsWareHouseCode.Value := SDS_HeaderWareHouseCode.AsString;
 SDS_DetailsVendoreCode.Value := SDS_HeaderVendoreCode.AsString;
 SDS_DetailsTraLineNo.Value :=  'XX';
 {SDS_DetailsQuantity.AsFloat := 0.0;
 SDS_DetailsCostPrice.AsFloat := 0.0;
 SDS_DetailsDiscount.AsFloat := 0.0;
 SDS_DetailsNetPrice.AsFloat := 0.0;}
end;

procedure TfmBegBalForm.SDS_DetailsItemCodeChange(Sender: TField);
begin
  SDS_DetailsItemUnit.AsString := GetDBValue('ItemUnitCode','tbl_ItemDefinition',' And ItemCode =''' + SDS_DetailsItemCode.AsString + ''' ');
  SDS_DetailsUnitTransValue.AsString := '1';//GetDBValue('UnitTransValue','tbl_ItemUnit',' And ItemUnitCode =''' + SDS_DetailsItemUnit.AsString + ''' ');
  SDS_DetailsItemService.AsString := GetDBValue('ItemService','tbl_ItemDefinition',' And ItemCode =''' + SDS_DetailsItemCode.AsString + ''' ');

end;

procedure TfmBegBalForm.SDS_DetailsItemUnitChange(Sender: TField);
begin
SDS_DetailsUnitTransValue.AsString := GetDBValue('UnitTransValue','tbl_ItemUnit',' And ItemUnitCode =''' + SDS_DetailsItemUnit.AsString + ''' ');
end;

end.

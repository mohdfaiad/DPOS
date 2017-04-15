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
    DS_ItemGroup: TDataSource;
    SDS_ItemGroup: TSimpleDataSet;
    GroupBox2: TGroupBox;
    BtnOpen: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    BtnCancel: TButton;
    BtnShow: TButton;
    SDS_HeaderCompanyCode: TStringField;
    SDS_HeaderItemCode: TStringField;
    SDS_HeaderItemService: TStringField;
    SDS_HeaderItemNameAr: TStringField;
    SDS_HeaderItemNameEn: TStringField;
    SDS_HeaderItemGroupCode: TStringField;
    SDS_HeaderItemTypeCode: TStringField;
    SDS_HeaderItemCategoryCode: TStringField;
    SDS_HeaderItemUnitCode: TStringField;
    SDS_HeaderMaxDiscountRatio: TFMTBCDField;
    SDS_HeaderMinQuantity: TFMTBCDField;
    SDS_HeaderMaxQuantity: TFMTBCDField;
    SDS_HeaderReOrderQuantity: TFMTBCDField;
    SDS_HeaderItemVendorCode: TStringField;
    SDS_HeaderOriginalItemCode: TStringField;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    PG1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    grd_Brcodes: TDBGrid;
    SDS_ItemType: TSimpleDataSet;
    DS_ItemType: TDataSource;
    SDS_Itemunit: TSimpleDataSet;
    DS_ItemUnit: TDataSource;
    SDS_ItemCategory: TSimpleDataSet;
    DS_ItemCategory: TDataSource;
    SDS_ItemGroupItemGroupCode: TStringField;
    SDS_ItemGroupItemGroupNameAr: TStringField;
    SDS_ItemGroupItemGroupNameEn: TStringField;
    SDS_ItemTypeItemTypeCode: TStringField;
    SDS_ItemTypeItemTypeNameAr: TStringField;
    SDS_ItemTypeItemTypeNameEn: TStringField;
    SDS_ItemunitItemUnitCode: TStringField;
    SDS_ItemunitItemUnitDescA: TStringField;
    SDS_ItemunitItemUnitDescE: TStringField;
    SDS_ItemCategoryItemCategoryCode: TStringField;
    SDS_ItemCategoryItemCategoryNameAr: TStringField;
    SDS_ItemCategoryItemCategoryNameEn: TStringField;
    SDS_Barcodes: TSimpleDataSet;
    DS_Barcodes: TDataSource;
    SDS_BarcodesCompanyCode: TStringField;
    SDS_BarcodesItemCode: TStringField;
    SDS_BarcodesItemService: TStringField;
    SDS_BarcodesBarcode: TStringField;
    SDS_BarcodesStatus: TStringField;
    SDS_BarcodesItemUnit: TStringField;
    SDS_BarcodesUnitTransValue: TFMTBCDField;
    SDS_BarcodesPrice: TFMTBCDField;
    SDS_BarcodesItemColorCode: TStringField;
    SDS_BarcodesItemSizeCode: TStringField;
    SDS_BarcodesDiscountRatio: TFMTBCDField;
    SDS_BarcodesDiscountValue: TFMTBCDField;
    SDS_ItemSize: TSimpleDataSet;
    DS_ItemSize: TDataSource;
    SDS_ItemColor: TSimpleDataSet;
    DS_ItemColor: TDataSource;
    SDS_ItemSizeItemSizeCode: TStringField;
    SDS_ItemSizeItemSizeNameAr: TStringField;
    SDS_ItemSizeItemSizeNameEn: TStringField;
    SDS_ItemColorItemColorCode: TStringField;
    SDS_ItemColorItemColorNameAr: TStringField;
    SDS_ItemColorItemColorNameEn: TStringField;
    Label14: TLabel;
    Label15: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    Co_ItemGroup: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label16: TLabel;
    procedure BtnOpenClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnShowClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SDS_BarcodesNewRecord(DataSet: TDataSet);
    procedure SDS_HeaderNewRecord(DataSet: TDataSet);
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
  SDS_Header.DataSet.CommandText := 'Select * from tbl_ItemDefinition where CompanyCode = ''' + DCompany + ''' ';
  SDS_Header.Open;
  SDS_Barcodes.Close;
  SDS_Barcodes.DataSet.CommandText := 'Select * from tbl_Barcodes where CompanyCode = ''' + DCompany + ''' ';
  SDS_Barcodes.Open;
  SDS_ItemGroup.Close;
  SDS_Itemunit.Close;
  SDS_ItemType.Close;
  SDS_ItemCategory.Close;
  SDS_ItemGroup.DataSet.CommandText := 'Select * from tbl_ItemGroup where CompanyCode = ''' + DCompany + ''' ';
  SDS_Itemunit.DataSet.CommandText := 'Select * from tbl_ItemUnit where CompanyCode = ''' + DCompany + ''' ';
  SDS_ItemType.DataSet.CommandText := 'Select * from tbl_ItemType where CompanyCode = ''' + DCompany + ''' ';
  SDS_ItemCategory.DataSet.CommandText := 'Select * from tbl_ItemCategory where CompanyCode = ''' + DCompany + ''' ';
  SDS_ItemGroup.Open;
  SDS_Itemunit.Open;
  SDS_ItemType.Open;
  SDS_ItemCategory.Open;
  SDS_ItemColor.Close;
  SDS_ItemColor.DataSet.CommandText := 'Select * from tbl_ItemColor where CompanyCode = ''' + DCompany + ''' ';
  SDS_ItemColor.Open;
  SDS_ItemSize.Close;
  SDS_ItemSize.DataSet.CommandText := 'Select * from tbl_ItemSize where CompanyCode = ''' + DCompany + ''' ';
  SDS_ItemSize.Open;


  btnEdit.Enabled := True;
  BtnOpen.Enabled := True;
  btnAdd.Enabled := True;
  btnSave.Enabled := False;
  BtnCancel.Enabled := False;
  btnDelete.Enabled := True;
  grpData.Enabled := False;
  BtnShow.Enabled := True;
  EditMode := False;
end;

procedure TfmPrTrxBaseForm.btnEditClick(Sender: TObject);
begin
  SDS_Header.Edit;
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
  Co_ItemGroup.Enabled := True;
  pg1.Enabled := False;
  EditMode := True;
end;

procedure TfmPrTrxBaseForm.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
begin
  If SDS_HeaderItemCode.AsString = '' Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·—„“  ﬁ»· «·Õ›Ÿ');
     edtCode.SetFocus;
     Exit;
  end;

  If (SDS_HeaderItemNameAr.AsString = '') AND (SDS_HeaderItemNameEn.AsString = '')  Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·«”„ ﬁ»· «·Õ›Ÿ');
     DBEdit6.SetFocus;
     Exit;
  end;

  IsDuplicated := RepeatedKey('tbl_ItemDefinition', ' ItemCode = ''' + SDS_HeaderItemCode.AsString + ''' And CompanyCode = ''' + DCompany + '''  ');
  If (IsDuplicated = True) And (EditMode = False) Then Begin
     ShowMessage('Â–« «·—„“ „ÊÃÊœ „”»ﬁ«');
     edtCode.SetFocus;
     Exit;
  end;

  if SDS_HeaderItemGroupCode.AsString = '' Then Begin
     ShowMessage('ÌÃ» ≈Œ Ì«— «·„Ã„Ê⁄Â');
     Co_ItemGroup.SetFocus;
     Exit;
  end;


  if ((SDS_Header.ApplyUpdates(0) = 0) AND (SDS_Barcodes.ApplyUpdates(0) = 0 )) then Begin
      ShowMessage(' „ «·Õ›‹‹Ÿ »‰Ã«Õ');
      BtnOpenClick(Sender);
  end
  else Begin
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
     SDS_Barcodes.CancelUpdates;
      BtnOpenClick(Sender);
  end;

end;

procedure TfmPrTrxBaseForm.btnDeleteClick(Sender: TObject);
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
        if ((SDS_Header.ApplyUpdates(0) = 0) AND (SDS_Barcodes.ApplyUpdates(0) = 0)) then Begin
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

procedure TfmPrTrxBaseForm.FormCreate(Sender: TObject);
Begin
  {
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  }
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
  Co_ItemGroup.Enabled := True;
  pg1.Enabled := True;
  BtnShow.Enabled := False;
  EditMode := False;
end;

procedure TfmPrTrxBaseForm.Button1Click(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;

end;

procedure TfmPrTrxBaseForm.BtnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

procedure TfmPrTrxBaseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SDS_ItemGroup.Close;
  SDS_Itemunit.Close;
  SDS_ItemType.Close;
  SDS_ItemCategory.Close;
  SDS_ItemColor.Close;
  SDS_ItemSize.Close;
  SDS_Barcodes.Close;
end;

procedure TfmPrTrxBaseForm.SDS_BarcodesNewRecord(DataSet: TDataSet);
begin
  SDS_BarcodesCompanyCode.Value := DCompany;
  SDS_BarcodesItemCode.Value :=SDS_HeaderItemCode.Value;
  SDS_BarcodesItemService.Value := SDS_HeaderItemService.Value;
  SDS_BarcodesStatus.Value := 'A';
end;

procedure TfmPrTrxBaseForm.SDS_HeaderNewRecord(DataSet: TDataSet);
begin
 SDS_HeaderCompanyCode.Value := DCompany;
 SDS_HeaderItemService.Value := 'IVI';
end;

end.

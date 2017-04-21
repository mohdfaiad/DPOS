unit lkp_ItemDefinition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,LookUp,
  VrControls, VrButtons, Buttons, ComCtrls, ExtCtrls;

type
  TfmItemDefinition = class(TForm)
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
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Co_ItemGroup: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Co_ItemType: TDBLookupComboBox;
    Co_ItemUnit: TDBLookupComboBox;
    Co_ItemCategory: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
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
    SDS_BarcodesUnitTransValue: TFMTBCDField;
    SDS_BarcodesPrice: TFMTBCDField;
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
    SDS_BarcodesItemUnit: TStringField;
    SDS_BarcodesItemUnitNameAr: TStringField;
    SDS_BarcodesItemColorCode: TStringField;
    SDS_BarcodesItemSizeCode: TStringField;
    SDS_BarcodesItemColorNameAr: TStringField;
    SDS_BarcodesItemSizeNameAr: TStringField;
    SDS_ItemSpec: TSimpleDataSet;
    DS_ItemSpec: TDataSource;
    SDS_ItemSpecItemCode: TStringField;
    SDS_ItemSpecItemService: TStringField;
    SDS_ItemSpecDetailItemCode: TStringField;
    SDS_ItemSpecDetailItemUnit: TStringField;
    SDS_ItemSpecItemQuantity: TFMTBCDField;
    SDS_ItemSpecUnitTransValue: TFMTBCDField;
    SDS_ItemSpecCompanyCode: TStringField;
    SDS_ItemSpecDetailItemUnitAr: TStringField;
    DS_ItemDef: TDataSource;
    SDS_ItemDef: TSimpleDataSet;
    StringField2: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    SDS_ItemSpecDetailItemNameAr: TStringField;
    PG1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    grd_Brcodes: TDBGrid;
    TabSheet2: TTabSheet;
    GroupBox4: TGroupBox;
    grd_ItemSpec: TDBGrid;
    Navigator: TDBNavigator;
    TabSheet3: TTabSheet;
    GroupBox5: TGroupBox;
    grd_RelatedUnits: TDBGrid;
    SDS_RelatedUnits: TSimpleDataSet;
    DS_RlatedUnits: TDataSource;
    SDS_RelatedUnitsCompanyCode: TStringField;
    SDS_RelatedUnitsItemCode: TStringField;
    SDS_RelatedUnitsItemService: TStringField;
    SDS_RelatedUnitsRelateUnitCode: TStringField;
    SDS_RelatedUnitsRelatedUnitDscrAr: TStringField;
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
    procedure SDS_ItemSpecNewRecord(DataSet: TDataSet);
    procedure SDS_BarcodesItemUnitChange(Sender: TField);
    procedure SDS_HeaderAfterScroll(DataSet: TDataSet);
    procedure SDS_ItemSpecDetailItemUnitChange(Sender: TField);
    procedure SDS_RelatedUnitsNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    EditMode : Boolean;
  public
    { Public declarations }
  end;

var
  fmItemDefinition: TfmItemDefinition;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmItemDefinition.BtnOpenClick(Sender: TObject);
begin
  SDS_Header.Close;
  SDS_Header.DataSet.CommandText := 'Select * from tbl_ItemDefinition where CompanyCode = ''' + DCompany + ''' ';
  SDS_Header.Open;
  SDS_ItemGroup.Close;
  SDS_Itemunit.Close;
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
  SDS_ItemColor.Open;
  SDS_ItemSize.Close;
  SDS_ItemSize.Open;
  SDS_ItemDef.Close;
  SDS_ItemDef.Open;


  btnEdit.Enabled := True;
  BtnOpen.Enabled := True;
  btnAdd.Enabled := True;
  btnSave.Enabled := False;
  BtnCancel.Enabled := False;
  btnDelete.Enabled := True;
  grpData.Enabled := False;
  grd_Brcodes.Enabled := False;
  grd_ItemSpec.Enabled := False;
  grd_RelatedUnits.Enabled := False;
  BtnShow.Enabled := True;
  EditMode := False;
  Navigator.Enabled := True;
end;

procedure TfmItemDefinition.btnEditClick(Sender: TObject);
begin
  SDS_Header.Edit;
  SDS_Barcodes.Edit;
  SDS_ItemSpec.Edit;
  SDS_RelatedUnits.Edit;
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
  DBEdit7.Enabled := True;
  DBEdit8.Enabled := True;
  Co_ItemGroup.Enabled := True;
  Co_ItemType.Enabled := True;
  Co_ItemUnit.Enabled := True;
  Co_ItemCategory.Enabled := True;
  grd_Brcodes.Enabled := True;
  grd_ItemSpec.Enabled := True;
  grd_RelatedUnits.Enabled := True;
  pg1.Enabled := True;
  EditMode := True;
  Navigator.Enabled := False;
end;

procedure TfmItemDefinition.btnSaveClick(Sender: TObject);
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
    if SDS_HeaderItemTypeCode.AsString = '' Then Begin
     ShowMessage('ÌÃ» ≈Œ Ì«— «·‰Ê⁄');
     Co_ItemType.SetFocus;
     Exit;
  end;
    if SDS_HeaderItemUnitCode.AsString = '' Then Begin
     ShowMessage('ÌÃ» ≈Œ Ì«— «·ÊÕœÂ');
     Co_ItemUnit.SetFocus;
     Exit;
  end;
      

  if ((SDS_Header.ApplyUpdates(0) = 0) AND (SDS_Barcodes.ApplyUpdates(0) = 0 ) AND (SDS_ItemSpec.ApplyUpdates(0) = 0 )AND (SDS_RelatedUnits.ApplyUpdates(0) = 0 )) then Begin
      ShowMessage(' „ «·Õ›‹‹Ÿ »‰Ã«Õ');
      BtnOpenClick(Sender);
  end
  else Begin
   ShowMessage('ÕœÀ Œÿ√ √À‰«¡ «·Õ›Ÿ') ;
  end;

end;

procedure TfmItemDefinition.BtnCancelClick(Sender: TObject);
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
     SDS_ItemSpec.CancelUpdates;
     SDS_RelatedUnits.CancelUpdates;
     BtnOpenClick(Sender);
  end;

end;

procedure TfmItemDefinition.btnDeleteClick(Sender: TObject);
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
        DeleteSQL := 'Delete From Tbl_Barcodes where ItemCode ='''+SDS_HeaderItemCode.AsString+''' and companyCode= '''+DCompany+''' ';
        DeleteSQL := DeleteSQL + 'Delete From tbl_ItemSpecification where ItemCode ='''+SDS_HeaderItemCode.AsString+''' and companyCode= '''+DCompany+''' ';
        DeleteSQL := DeleteSQL + 'Delete From tbl_ItemRelatedUnits where ItemCode ='''+SDS_HeaderItemCode.AsString+''' and companyCode= '''+DCompany+''' ';;
        DeleteSQL := DeleteSQL + 'Delete From tbl_ItemDefinition where ItemCode ='''+SDS_HeaderItemCode.AsString+''' and companyCode= '''+DCompany+''' ';
        
        fmMainForm.MainConnection.ExecuteDirect(DeleteSQL);

        SDS_Barcodes.Refresh;
        SDS_ItemSpec.Refresh;
        SDS_RelatedUnits.Refresh;

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

procedure TfmItemDefinition.FormCreate(Sender: TObject);
Begin
  {
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  }
  BtnOpenClick(Sender);
  BtnShow.Enabled := False;
end;

procedure TfmItemDefinition.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmItemDefinition.btnAddClick(Sender: TObject);
begin
  SDS_Header.Append;
  SDS_Barcodes.Append;
  SDS_ItemSpec.Append;
  SDS_RelatedUnits.Append;
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
  DBEdit7.Enabled := True;
  DBEdit8.Enabled := True;
  Co_ItemGroup.Enabled := True;
  Co_ItemType.Enabled := True;
  Co_ItemUnit.Enabled := True;
  Co_ItemCategory.Enabled := True;
  grd_Brcodes.Enabled := True;
  grd_ItemSpec.Enabled := True;
  grd_RelatedUnits.Enabled := True;
  BtnShow.Enabled := False;
  EditMode := False;
  Navigator.Enabled := False;
end;

procedure TfmItemDefinition.Button1Click(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;

end;

procedure TfmItemDefinition.BtnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

procedure TfmItemDefinition.FormClose(Sender: TObject;
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

procedure TfmItemDefinition.SDS_BarcodesNewRecord(DataSet: TDataSet);
begin
  SDS_BarcodesCompanyCode.Value := DCompany;
  SDS_BarcodesItemCode.Value :=SDS_HeaderItemCode.Value;
  SDS_BarcodesItemService.Value := SDS_HeaderItemService.Value;
  SDS_BarcodesStatus.Value := 'A';
end;

procedure TfmItemDefinition.SDS_HeaderNewRecord(DataSet: TDataSet);
begin
 SDS_HeaderCompanyCode.Value := DCompany;
 SDS_HeaderItemService.Value := 'IVI';
end;

procedure TfmItemDefinition.SDS_ItemSpecNewRecord(DataSet: TDataSet);
begin
  SDS_ItemSpecCompanyCode.Value := DCompany;
  SDS_ItemSpecItemCode.Value :=SDS_HeaderItemCode.Value;
  SDS_ItemSpecItemService.Value := SDS_HeaderItemService.Value;
end;

procedure TfmItemDefinition.SDS_BarcodesItemUnitChange(Sender: TField);
begin
  SDS_BarcodesUnitTransValue.AsString := GetDBValue('UnitTransValue','tbl_ItemUnit',' And ItemUnitCode =''' + SDS_BarcodesItemUnit.AsString + ''' ');
end;

procedure TfmItemDefinition.SDS_HeaderAfterScroll(DataSet: TDataSet);
begin
  SDS_Barcodes.Close;
  SDS_Barcodes.DataSet.CommandText := 'Select * from Tbl_Barcodes Where ItemCode = '''+SDS_HeaderItemCode.AsString+''' ';
  SDS_Barcodes.Open;
  SDS_ItemSpec.Close;
  SDS_ItemSpec.DataSet.CommandText := 'Select * from tbl_ItemSpecification Where ItemCode = '''+SDS_HeaderItemCode.AsString+''' ';
  SDS_ItemSpec.Open;
  SDS_RelatedUnits.Close;
  SDS_RelatedUnits.DataSet.CommandText := 'Select * from tbl_ItemRelatedUnits Where ItemCode = '''+SDS_HeaderItemCode.AsString+''' ';
  SDS_RelatedUnits.Open;
end;

procedure TfmItemDefinition.SDS_ItemSpecDetailItemUnitChange(
  Sender: TField);
begin
 SDS_ItemSpecUnitTransValue.AsString := GetDBValue('UnitTransValue','tbl_ItemUnit',' And ItemUnitCode =''' + SDS_ItemSpecDetailItemUnit.AsString + ''' ');
end;

procedure TfmItemDefinition.SDS_RelatedUnitsNewRecord(DataSet: TDataSet);
begin
  SDS_RelatedUnitsCompanyCode.Value := DCompany;
  SDS_RelatedUnitsItemCode.Value :=SDS_HeaderItemCode.Value;
  SDS_RelatedUnitsItemService.Value := SDS_HeaderItemService.Value;
end;

end.

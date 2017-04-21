unit lkp_ItemPolicies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,LookUp,
  VrControls, VrButtons, Buttons, ComCtrls;

type
  TfmItemPolicies = class(TForm)
    grp_Content: TGroupBox;
    SDS_Header: TSimpleDataSet;
    DS_Header: TDataSource;
    grpData: TGroupBox;
    edtName: TDBEdit;
    Label2: TLabel;
    edtCode: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    SDS_HeaderCompanyCode: TStringField;
    SDS_HeaderPolicyCode: TStringField;
    SDS_HeaderPolicyNameAr: TStringField;
    SDS_HeaderPolicyNameEn: TStringField;
    grd_Brcodes: TDBGrid;
    SDS_ItemPrices: TSimpleDataSet;
    DS_ItemPrices: TDataSource;
    SDS_ItemPricesCompanyCode: TStringField;
    SDS_ItemPricesItemService: TStringField;
    SDS_ItemPricesItemCode: TStringField;
    SDS_ItemPricesPolicyCode: TStringField;
    SDS_ItemPricesItemUnit: TStringField;
    SDS_ItemPricesPriceValue: TFMTBCDField;
    SDS_ItemPricesPriceRatio: TFMTBCDField;
    SDS_ItemPricesDiscountRatio: TFMTBCDField;
    SDS_ItemUnit: TSimpleDataSet;
    SDS_HeaderItemUnitCode: TStringField;
    SDS_HeaderItemUnitDescA: TStringField;
    SDS_HeaderItemUnitDescE: TStringField;
    SDS_HeaderUnitTransCode: TStringField;
    SDS_HeaderUnitTransValue: TFMTBCDField;
    StringField1: TStringField;
    DS_ItemUnit: TDataSource;
    SDS_ItemPricesItemUnitAr: TStringField;
    SDS_ItemDef: TSimpleDataSet;
    DS_ItemDef: TDataSource;
    SDS_ItemDefItemCode: TStringField;
    SDS_ItemDefItemNameAr: TStringField;
    SDS_ItemDefItemNameEn: TStringField;
    SDS_ItemPricesItemNameAr: TStringField;
    GroupBox2: TGroupBox;
    BtnOpen: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    BtnCancel: TButton;
    BtnShow: TButton;
    btn_AddAllItems: TButton;
    SDS_ItemDefItemUnitCode: TStringField;
    procedure BtnOpenClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure SDS_HeaderNewRecord(DataSet: TDataSet);
    procedure SDS_ItemPricesNewRecord(DataSet: TDataSet);
    procedure SDS_HeaderAfterScroll(DataSet: TDataSet);
    procedure BtnShowClick(Sender: TObject);
    procedure btn_AddAllItemsClick(Sender: TObject);
  private
    { Private declarations }
    EditMode : Boolean;
  public
    { Public declarations }
  end;

var
  fmItemPolicies: TfmItemPolicies;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmItemPolicies.BtnOpenClick(Sender: TObject);
begin
  SDS_Header.Close;
  SDS_Header.Open;
  SDS_ItemPrices.Close;
  SDS_ItemPrices.Open;
  SDS_ItemUnit.Close;
  SDS_ItemUnit.Open;
  SDS_ItemDef.Close;
  SDS_ItemDef.Open;
  btnEdit.Enabled := True;
  BtnOpen.Enabled := True;
  btnAdd.Enabled := True;
  btnSave.Enabled := False;
  BtnCancel.Enabled := False;
  btnDelete.Enabled := True;
  grpData.Enabled := False;
  EditMode := False;
end;

procedure TfmItemPolicies.btnEditClick(Sender: TObject);
begin
  SDS_Header.Edit;
  SDS_ItemPrices.Edit;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  edtCode.Enabled := False;
  EditMode := True;
end;

procedure TfmItemPolicies.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
begin
  If SDS_HeaderPolicyCode.AsString = '' Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·—„“  ﬁ»· «·Õ›Ÿ');
     edtCode.SetFocus;
     Exit;
  end;

  If (SDS_HeaderPolicyNameAr.AsString = '') AND (SDS_HeaderPolicyNameEn.AsString = '')  Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·«”„ ﬁ»· «·Õ›Ÿ');
     edtName.SetFocus;
     Exit;
  end;

  IsDuplicated := RepeatedKey('tbl_ItemPolicies', ' PolicyCode = ''' + SDS_HeaderPolicyCode.AsString + '''  ');
  If (IsDuplicated = True) And (EditMode = False) Then Begin
     ShowMessage('Â–« «·—„“ „ÊÃÊœ „”»ﬁ«');
     edtCode.SetFocus;
     Exit;
  end;

  if ((SDS_Header.ApplyUpdates(0) = 0) AND (SDS_ItemPrices.ApplyUpdates(0) = 0)) then Begin
      ShowMessage(' „ «·Õ›‹‹Ÿ »‰Ã«Õ');
      BtnOpenClick(Sender);
  end
  else Begin
   ShowMessage('ÕœÀ Œÿ√ √À‰«¡ «·Õ›Ÿ') ;
  end; 
end;

procedure TfmItemPolicies.BtnCancelClick(Sender: TObject);
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

procedure TfmItemPolicies.btnDeleteClick(Sender: TObject);
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
        DeleteSQL := 'Delete From Tbl_itemPrices where PolicyCode ='''+SDS_HeaderPolicyCode.AsString+''' and companyCode= '''+DCompany+''' ';
        DeleteSQL := DeleteSQL + 'Delete From tbl_ItemPolicies where PolicyCode ='''+SDS_HeaderPolicyCode.AsString+''' and companyCode= '''+DCompany+''' ';
        fmMainForm.MainConnection.ExecuteDirect(DeleteSQL);

        SDS_ItemPrices.Refresh;
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

procedure TfmItemPolicies.FormCreate(Sender: TObject);
Begin
  {
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  }
  BtnOpenClick(Sender);
end;

procedure TfmItemPolicies.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmItemPolicies.btnAddClick(Sender: TObject);
begin
  SDS_Header.Append;
  SDS_ItemPrices.Append;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  edtCode.Enabled := True;
  edtCode.SetFocus;
  EditMode := False;
end;

procedure TfmItemPolicies.SDS_HeaderNewRecord(DataSet: TDataSet);
begin
 SDS_HeaderCompanyCode.Value := DCompany;
end;

procedure TfmItemPolicies.SDS_ItemPricesNewRecord(DataSet: TDataSet);
begin
   SDS_ItemPricesCompanyCode.Value := DCompany;
   SDS_ItemPricesItemService.Value := 'IVI';
   SDS_ItemPricesPolicyCode.Value := SDS_HeaderPolicyCode.AsString;
end;

procedure TfmItemPolicies.SDS_HeaderAfterScroll(DataSet: TDataSet);
begin
SDS_ItemPrices.Close;
SDS_ItemPrices.DataSet.CommandText := 'SELECT * from tbl_ItemPrices where PolicyCode='''+SDS_HeaderPolicyCode.AsString+'''  ';
SDS_ItemPrices.Open;
end;

procedure TfmItemPolicies.BtnShowClick(Sender: TObject);
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

procedure TfmItemPolicies.btn_AddAllItemsClick(Sender: TObject);
begin
  SDS_ItemDef.First;
  while not SDS_ItemDef.Eof do
  begin
  SDS_ItemPrices.Append;
  SDS_ItemPricesCompanyCode.AsString := DCompany;
  SDS_ItemPricesItemService.AsString := 'IVI';
  SDS_ItemPricesPolicyCode.AsString := SDS_HeaderPolicyCode.AsString;
  SDS_ItemPricesItemCode.AsString := SDS_ItemDefItemCode.AsString;
  SDS_ItemPricesItemUnit.AsString := SDS_ItemDefItemUnitCode.AsString;
  SDS_ItemDef.Next;
  end;

end;

end.

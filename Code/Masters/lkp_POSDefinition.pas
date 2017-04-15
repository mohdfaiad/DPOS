unit lkp_POSDefinition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,LookUp,
  VrControls, VrButtons, Buttons;

type
  TfmPOSDefinition = class(TForm)
    grp_Content: TGroupBox;
    SDS_Header: TSimpleDataSet;
    DS_Header: TDataSource;
    grpData: TGroupBox;
    edtName: TDBEdit;
    Label2: TLabel;
    edtCode: TDBEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Co_Cash: TDBLookupComboBox;
    DS_Cash: TDataSource;
    SDS_Cash: TSimpleDataSet;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    BtnOpen: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    BtnCancel: TButton;
    BtnShow: TButton;
    SDS_HeaderCompanyCode: TStringField;
    SDS_HeaderPOSCode: TStringField;
    SDS_HeaderPOSNameAr: TStringField;
    SDS_HeaderPOSNameEn: TStringField;
    SDS_HeaderCashCode: TStringField;
    SDS_HeaderBankCode: TStringField;
    SDS_HeaderOpenBalance: TFMTBCDField;
    Label5: TLabel;
    CO_Bank: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    SDS_Bank: TSimpleDataSet;
    DS_Bank: TDataSource;
    SDS_CashCompanyCode: TStringField;
    SDS_CashCB_Code: TStringField;
    SDS_CashCB_Type: TStringField;
    SDS_CashCB_NameA: TStringField;
    SDS_CashCB_NameE: TStringField;
    SDS_BankCompanyCode: TStringField;
    SDS_BankCB_Code: TStringField;
    SDS_BankCB_Type: TStringField;
    SDS_BankCB_NameA: TStringField;
    SDS_BankCB_NameE: TStringField;
    procedure BtnOpenClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure SDS_HeaderBeforePost(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure BtnShowClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    EditMode : Boolean;
  public
    { Public declarations }
  end;

var
  fmPOSDefinition: TfmPOSDefinition;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmPOSDefinition.BtnOpenClick(Sender: TObject);
begin
  SDS_Header.Close;
  SDS_Header.Open;
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

procedure TfmPOSDefinition.btnEditClick(Sender: TObject);
begin
  SDS_Header.Edit;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  edtCode.Enabled := False;
  BtnShow.Enabled := False;
  EditMode := True;
end;

procedure TfmPOSDefinition.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
begin
  If SDS_HeaderPOSCode.AsString = '' Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·—„“  ﬁ»· «·Õ›Ÿ');
     edtCode.SetFocus;
     Exit;
  end;

  If (SDS_HeaderPOSNameAr.AsString = '') AND (SDS_HeaderPOSNameEn.AsString = '')  Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·«”„ ﬁ»· «·Õ›Ÿ');
     edtName.SetFocus;
     Exit;
  end;

  IsDuplicated := RepeatedKey('tbl_POS_Definition', ' POSCODE = ''' + SDS_HeaderPOSCode.AsString + '''  ');
  If (IsDuplicated = True) And (EditMode = False) Then Begin
     ShowMessage('Â–« «·—„“ „ÊÃÊœ „”»ﬁ«');
     edtCode.SetFocus;
     Exit;
  end;

  if SDS_HeaderBankCode.AsString = '' Then Begin
     ShowMessage('ÌÃ» ≈Œ Ì«— «·»‰ﬂ');
     CO_Bank.SetFocus;
     Exit;
  end;

  if SDS_HeaderCashCode.AsString = '' Then Begin
     ShowMessage('ÌÃ» ≈Œ Ì«— «·’‰œÊﬁ');
     Co_Cash.SetFocus;
     Exit;
  end;

  if SDS_Header.ApplyUpdates(0) = 0 then Begin
      ShowMessage(' „ «·Õ›‹‹Ÿ »‰Ã«Õ');
      BtnOpenClick(Sender);
  end
  else Begin
   ShowMessage('ÕœÀ Œÿ√ √À‰«¡ «·Õ›Ÿ') ;
  end;

end;

procedure TfmPOSDefinition.BtnCancelClick(Sender: TObject);
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

procedure TfmPOSDefinition.btnDeleteClick(Sender: TObject);
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

procedure TfmPOSDefinition.FormCreate(Sender: TObject);
Begin
  {
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  }
  BtnOpenClick(Sender);
  BtnShow.Enabled := False;
  SDS_Bank.Open;
  SDS_Cash.Open;
end;

procedure TfmPOSDefinition.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmPOSDefinition.btnAddClick(Sender: TObject);
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
  BtnShow.Enabled := False;
  EditMode := False;
end;

procedure TfmPOSDefinition.SDS_HeaderBeforePost(DataSet: TDataSet);
begin
 SDS_HeaderCompanyCode.Value := DCompany;
end;

procedure TfmPOSDefinition.Button1Click(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;

end;

procedure TfmPOSDefinition.BtnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

procedure TfmPOSDefinition.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SDS_Bank.Close;
  SDS_Cash.Close;
end;

end.

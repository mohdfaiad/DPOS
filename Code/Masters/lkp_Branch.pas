unit lkp_Branch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids, LookUp,
  VrControls, VrButtons, Buttons;

type
  TfmBranch = class(TForm)
    grp_Content: TGroupBox;
    SDS_Header: TSimpleDataSet;
    DS_Header: TDataSource;
    grpData: TGroupBox;
    edtName: TDBEdit;
    Label2: TLabel;
    edtCode: TDBEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    BtnOpen: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    BtnCancel: TButton;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    SDS_HeaderCompanyCode: TStringField;
    SDS_HeaderBranchCode: TStringField;
    SDS_HeaderBranchNameAr: TStringField;
    SDS_HeaderBranchNameEn: TStringField;
    BtnShow: TButton;
    procedure BtnOpenClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure SDS_HeaderBeforePost(DataSet: TDataSet);
    procedure BtnShowClick(Sender: TObject);
  private
    { Private declarations }
    EditMode : Boolean;
  public

    { Public declarations }
  end;

var
  fmBranch: TfmBranch;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmBranch.BtnOpenClick(Sender: TObject);
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

procedure TfmBranch.btnEditClick(Sender: TObject);
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

procedure TfmBranch.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
begin
  If SDS_HeaderBranchCode.AsString = '' Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·—„“  ﬁ»· «·Õ›Ÿ');
     edtCode.SetFocus;
     Exit;
  end;

  If (SDS_HeaderBranchNameAr.AsString = '') AND (SDS_HeaderBranchNameEn.AsString = '')  Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ «·«”„ ﬁ»· «·Õ›Ÿ');
     edtName.SetFocus;
     Exit;
  end;

  IsDuplicated := RepeatedKey('tbl_Branch', ' BranchCode = ''' + SDS_HeaderBranchCode.AsString + '''  ');
  If (IsDuplicated = True) And (EditMode = False) Then Begin
     ShowMessage('Â–« «·—„“ „ÊÃÊœ „”»ﬁ«');
     edtCode.SetFocus;
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

procedure TfmBranch.BtnCancelClick(Sender: TObject);
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

procedure TfmBranch.btnDeleteClick(Sender: TObject);
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

procedure TfmBranch.FormCreate(Sender: TObject);
var lkp:Tlkp;
Begin
  {
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  }
  BtnOpenClick(Sender);
  BtnShow.Enabled := False;

end;

procedure TfmBranch.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmBranch.btnAddClick(Sender: TObject);
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
  BtnShow.Enabled := False;
  edtCode.SetFocus;
  EditMode := False;
end;

procedure TfmBranch.SDS_HeaderBeforePost(DataSet: TDataSet);
begin
 SDS_HeaderCompanyCode.Value := DCompany;
end;

procedure TfmBranch.BtnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

end.

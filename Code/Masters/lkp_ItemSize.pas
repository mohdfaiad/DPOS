unit lkp_ItemSize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,LookUp,
  VrControls, VrButtons, Buttons;

type
  TfmItemSize = class(TForm)
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
    SDS_HeaderCompanyCode: TStringField;
    SDS_HeaderItemSizeCode: TStringField;
    SDS_HeaderItemSizeNameAr: TStringField;
    SDS_HeaderItemSizeNameEn: TStringField;
    GroupBox2: TGroupBox;
    BtnOpen: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    BtnCancel: TButton;
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
  fmItemSize: TfmItemSize;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmItemSize.BtnOpenClick(Sender: TObject);
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

procedure TfmItemSize.btnEditClick(Sender: TObject);
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

procedure TfmItemSize.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
begin
  If SDS_HeaderItemSizeCode.AsString = '' Then
  Begin
     ShowMessage('��� ����� �����  ��� �����');
     edtCode.SetFocus;
     Exit;
  end;

  If (SDS_HeaderItemSizeNameAr.AsString = '') AND (SDS_HeaderItemSizeNameEn.AsString = '')  Then
  Begin
     ShowMessage('��� ����� ����� ��� �����');
     edtName.SetFocus;
     Exit;
  end;

  IsDuplicated := RepeatedKey('tbl_ItemSize', ' ItemSizeCode = ''' + SDS_HeaderItemSizeCode.AsString + '''  ');
  If (IsDuplicated = True) And (EditMode = False) Then Begin
     ShowMessage('��� ����� ����� �����');
     edtCode.SetFocus;
     Exit;
  end;

  if SDS_Header.ApplyUpdates(0) = 0 then Begin
      ShowMessage('�� ������� �����');
      BtnOpenClick(Sender);
  end
  else Begin
   ShowMessage('��� ��� ����� �����') ;
  end;
end;

procedure TfmItemSize.BtnCancelClick(Sender: TObject);
Var
  buttonSelected : Integer;
begin
  // Show a confirmation dialog
  buttonSelected := MessageDlg('�� ���� ��� ����� ���������',mtInformation, mbOKCancel, 0);

  // Show the button type selected
  if buttonSelected = mrOK then
  Begin
     SDS_Header.CancelUpdates;
      BtnOpenClick(Sender);
  end;
end;

procedure TfmItemSize.btnDeleteClick(Sender: TObject);
Var
  buttonSelected : Integer;
begin
  try
    // Show a confirmation dialog
    buttonSelected := MessageDlg('�� ���� ��� ��� ��������',mtError, mbOKCancel, 0);

    // Show the button type selected
    if buttonSelected = mrOK then
    Begin
        SDS_Header.Delete;
        if SDS_Header.ApplyUpdates(0) = 0 then Begin
           ShowMessage('�� ����� �����');
           BtnOpenClick(Sender);
        end else Begin
         ShowMessage('��� ��� ����� ��� ��������') ;
         BtnOpenClick(Sender);
        end;
    end;
  except
      ShowMessage('��� ��� ����� ��� �������� , �� ���� ��� ������ �������');
      BtnOpenClick(Sender);
  end;
end;

procedure TfmItemSize.FormCreate(Sender: TObject);
Begin
  {
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  }
  BtnOpenClick(Sender);
  BtnShow.Enabled := False;
end;

procedure TfmItemSize.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmItemSize.btnAddClick(Sender: TObject);
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

procedure TfmItemSize.SDS_HeaderBeforePost(DataSet: TDataSet);
begin
 SDS_HeaderCompanyCode.Value := DCompany;
end;

procedure TfmItemSize.BtnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

end.

unit lkp_ItemUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,LookUp,
  VrControls, VrButtons, Buttons;

type
  TfmItemUnit = class(TForm)
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
    SDS_HeaderItemUnitCode: TStringField;
    SDS_HeaderItemUnitDescA: TStringField;
    SDS_HeaderItemUnitDescE: TStringField;
    SDS_HeaderUnitTransCode: TStringField;
    SDS_HeaderUnitTransValue: TFMTBCDField;
    GroupBox2: TGroupBox;
    BtnOpen: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    BtnCancel: TButton;
    BtnShow: TButton;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Co_UnitTransCode: TDBLookupComboBox;
    SDS_UnitTransCode: TSimpleDataSet;
    DS_UnitTransCode: TDataSource;
    SDS_UnitTransCodeItemUnitCode: TStringField;
    SDS_UnitTransCodeItemUnitDescA: TStringField;
    SDS_UnitTransCodeItemUnitDescE: TStringField;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    EditMode : Boolean;
  public
    { Public declarations }
  end;

var
  fmItemUnit: TfmItemUnit;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmItemUnit.BtnOpenClick(Sender: TObject);
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

procedure TfmItemUnit.btnEditClick(Sender: TObject);
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

procedure TfmItemUnit.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
begin
  If SDS_HeaderItemUnitCode.AsString = '' Then
  Begin
     ShowMessage('��� ����� �����  ��� �����');
     edtCode.SetFocus;
     Exit;
  end;

  If (SDS_HeaderItemUnitDescA.AsString = '') AND (SDS_HeaderItemUnitDescA.AsString = '')  Then
  Begin
     ShowMessage('��� ����� ����� ��� �����');
     edtName.SetFocus;
     Exit;
  end;

  IsDuplicated := RepeatedKey('tbl_ItemUnit', ' ItemUnitCode = ''' + SDS_HeaderItemUnitCode.AsString + '''  ');
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

procedure TfmItemUnit.BtnCancelClick(Sender: TObject);
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

procedure TfmItemUnit.btnDeleteClick(Sender: TObject);
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

procedure TfmItemUnit.FormCreate(Sender: TObject);
Begin
  {
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  }
  BtnOpenClick(Sender);
  BtnShow.Enabled := False;
  SDS_UnitTransCode.Open;

end;

procedure TfmItemUnit.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmItemUnit.btnAddClick(Sender: TObject);
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

procedure TfmItemUnit.SDS_HeaderBeforePost(DataSet: TDataSet);
begin
 SDS_HeaderCompanyCode.Value := DCompany;
end;

procedure TfmItemUnit.BtnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

procedure TfmItemUnit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SDS_UnitTransCode.Close;
end;

end.

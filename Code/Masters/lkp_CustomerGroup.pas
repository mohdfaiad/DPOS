unit lkp_CustomerGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,
  VrControls, VrButtons;

type
  TfmCustomerGroup = class(TForm)
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
    SDS_HeaderCustomerGroupCode: TStringField;
    SDS_HeaderCustomerGroupNameAr: TStringField;
    SDS_HeaderCustomerGroupNameEn: TStringField;
    procedure BtnOpenClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure SDS_HeaderBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    EditMode : Boolean;
  public
    { Public declarations }
  end;

var
  fmCustomerGroup: TfmCustomerGroup;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmCustomerGroup.BtnOpenClick(Sender: TObject);
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
  EditMode := False;
end;

procedure TfmCustomerGroup.btnEditClick(Sender: TObject);
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
  EditMode := True;
end;

procedure TfmCustomerGroup.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
begin
  If SDS_HeaderCustomerGroupCode.AsString = '' Then
  Begin
     ShowMessage('��� ����� �����  ��� �����');
     edtCode.SetFocus;
     Exit;
  end;

  If (SDS_HeaderCustomerGroupNameAr.AsString = '') AND (SDS_HeaderCustomerGroupNameEn.AsString = '')  Then
  Begin
     ShowMessage('��� ����� ����� ��� �����');
     edtName.SetFocus;
     Exit;
  end;

  IsDuplicated := RepeatedKey('tbl_CustomerGroup', ' CustomerGroupCode = ''' + SDS_HeaderCustomerGroupCode.AsString + '''  ');
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

procedure TfmCustomerGroup.BtnCancelClick(Sender: TObject);
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

procedure TfmCustomerGroup.btnDeleteClick(Sender: TObject);
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

procedure TfmCustomerGroup.FormCreate(Sender: TObject);
Begin
  {
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  }
  BtnOpenClick(Sender);
end;

procedure TfmCustomerGroup.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmCustomerGroup.btnAddClick(Sender: TObject);
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
  EditMode := False;
end;

procedure TfmCustomerGroup.SDS_HeaderBeforePost(DataSet: TDataSet);
begin
 SDS_HeaderCompanyCode.Value := DCompany;
end;

end.

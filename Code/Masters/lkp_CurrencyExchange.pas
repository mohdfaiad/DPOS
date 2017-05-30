unit lkp_CurrencyExchange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,LookUp,
  VrControls, VrButtons, Buttons, jpeg, ExtCtrls;

type
  TfmCurrencyExchange = class(TForm)
    grp_Content: TGroupBox;
    SDS_Header: TSimpleDataSet;
    DS_Header: TDataSource;
    grpData: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    EdtPrice: TDBEdit;
    GroupBox2: TGroupBox;
    BtnOpen: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    BtnCancel: TButton;
    BtnShow: TButton;
    SDS_HeaderCompanyCode: TStringField;
    SDS_HeaderCurrencyCode: TStringField;
    SDS_HeaderBaseCurrencyCode: TStringField;
    SDS_HeaderExchangeRate: TFMTBCDField;
    Co_Currency: TDBLookupComboBox;
    Co_BaseCurrency: TDBLookupComboBox;
    SDS_Currency2: TSimpleDataSet;
    StringField1: TStringField;
    SDS_HeaderCurrencyNameA: TStringField;
    SDS_HeaderCurrencyNameE: TStringField;
    StringField2: TStringField;
    DS_Currency2: TDataSource;
    SDS_Currency1: TSimpleDataSet;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DS_Currency1: TDataSource;
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
  fmCurrencyExchange: TfmCurrencyExchange;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmCurrencyExchange.BtnOpenClick(Sender: TObject);
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

procedure TfmCurrencyExchange.btnEditClick(Sender: TObject);
begin
  SDS_Header.Edit;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  Co_Currency.Enabled := False;
  Co_BaseCurrency.Enabled := False;
  BtnShow.Enabled := False;
  Co_Currency.Enabled := True;
  Co_BaseCurrency.Enabled := True;
end;

procedure TfmCurrencyExchange.btnSaveClick(Sender: TObject);
Var IsDuplicated : Boolean;
begin
  if SDS_HeaderCurrencyCode.AsString = '' Then Begin
     ShowMessage('ÌÃ» ≈Œ Ì«— «·⁄„·…');
     Co_Currency.SetFocus;
     Exit;
  end;
  if SDS_HeaderBaseCurrencyCode.AsString = '' Then Begin
     ShowMessage('ÌÃ» ≈Œ »«— «·⁄„·Â «·√”«”Ì…');
     Co_BaseCurrency.SetFocus;
     Exit;
  end;

  If SDS_HeaderExchangeRate.AsString = ''  Then
  Begin
     ShowMessage('ÌÃ»  ÕœÌœ ”⁄— «· ÕÊÌ·');
     EdtPrice.SetFocus;
     Exit;
  end;

  IsDuplicated := RepeatedKey('tbl_CurrencyExch', ' CurrencyCode = ''' + SDS_HeaderCurrencyCode.AsString + ''' and BaseCurrencyCode = ''' + SDS_HeaderBaseCurrencyCode.AsString + '''  ');
  If (IsDuplicated = True) And (EditMode = False) Then Begin
     ShowMessage('Â–« «·—„“ „ÊÃÊœ „”»ﬁ«');
     Co_Currency.SetFocus;
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

procedure TfmCurrencyExchange.BtnCancelClick(Sender: TObject);
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

procedure TfmCurrencyExchange.btnDeleteClick(Sender: TObject);
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

procedure TfmCurrencyExchange.FormCreate(Sender: TObject);
Begin
  {
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  }
  BtnOpenClick(Sender);
  BtnShow.Enabled := False;

  SDS_Currency1.Open;
  SDS_Currency2.Open;
end;

procedure TfmCurrencyExchange.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmCurrencyExchange.btnAddClick(Sender: TObject);
begin
  SDS_Header.Append;
  btnEdit.Enabled := False;
  BtnOpen.Enabled := False;
  btnAdd.Enabled := False;
  btnSave.Enabled := True;
  BtnCancel.Enabled := True;
  btnDelete.Enabled := False;
  grpData.Enabled := True;
  Co_Currency.Enabled := TRue;
  Co_BaseCurrency.Enabled := True;
  BtnShow.Enabled := False;
  Co_Currency.SetFocus;
  EditMode := False;
end;

procedure TfmCurrencyExchange.SDS_HeaderBeforePost(DataSet: TDataSet);
begin
 SDS_HeaderCompanyCode.Value := DCompany;
end;

procedure TfmCurrencyExchange.BtnShowClick(Sender: TObject);
var lkp : Tlkp;
begin
    lkp := Tlkp.Create(SDS_Header,nil);
    lkp.ShowModal;
end;

procedure TfmCurrencyExchange.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SDS_Currency1.Open;
  SDS_Currency2.Open;
end;

end.

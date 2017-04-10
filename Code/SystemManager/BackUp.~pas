unit BackUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls , IniFiles, jpeg, ExtCtrls, DB, ADODB, ComCtrls;

type
  TfmBackUp = class(TForm)
    edt_BackUpPath: TEdit;
    Label1: TLabel;
    btnCopyDB: TButton;
    btnClose: TButton;
    imgBackUp: TImage;
    BackUpDB: TADOQuery;
    SaveDialog: TSaveDialog;
    procedure btnCloseClick(Sender: TObject);
    procedure btnCopyDBClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edt_BackUpPathKeyPress(Sender: TObject; var Key: Char);
    procedure edt_BackUpPathDblClick(Sender: TObject);
  private
    { Private declarations }
    vIni: TIniFile;
  public
    { Public declarations }
    CopyNo : String;
  end;

var
  fmBackUp: TfmBackUp;

implementation

uses GVariable, Main;

{$R *.dfm}

procedure TfmBackUp.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmBackUp.btnCopyDBClick(Sender: TObject);
begin
     if edt_BackUpPath.Text = '' Then Begin
        ShowMessage('Ì—ÃÏ  ÕœÌœ „”«— Õ›Ÿ «·»Ì«‰« ');
        Exit;
     end;
     BackUpDB.Close;
     BackUpDB.SQL.Clear;
     BackUpDB.SQL.Add('BACKUP DATABASE ' +gDBName + ' TO DISK = ''' + SaveDialog.FileName + '.bak'' ');

     try
       BackUpDB.ExecSQL;
       ShowMessage(' „ ⁄„· ‰”Œ… «Õ Ì«ÿÌ… ›Ì «·„”«— «·„Õœœ »‰Ã«Õ');
     except
       ShowMessage('›‘·  ⁄„·Ì… «·‰”Œ «·«Õ Ì«ÿÌ');
     end;
     ModalResult := mrOk;

end;

procedure TfmBackUp.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmBackUp.FormShow(Sender: TObject);
begin
  edt_BackUpPath.SetFocus;
end;

procedure TfmBackUp.edt_BackUpPathKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       btnCopyDBClick(Sender);
    end;
end;

procedure TfmBackUp.edt_BackUpPathDblClick(Sender: TObject);
begin
  If SaveDialog.Execute Then edt_BackUpPath.Text := SaveDialog.FileName;
end;

end.

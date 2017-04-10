unit License;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls , IniFiles, jpeg, ExtCtrls;

type
  TfmLicense = class(TForm)
    edtLicenceCode: TEdit;
    edt_LicenseNo: TEdit;
    Label4: TLabel;
    Label1: TLabel;
    btnAccess: TButton;
    btnClose: TButton;
    Image1: TImage;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAccessClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edt_LicenseNoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vIni: TIniFile;
  public
    { Public declarations }
    CopyNo : String;
  end;

var
  fmLicense: TfmLicense;

implementation

uses GVariable;

{$R *.dfm}

procedure TfmLicense.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   Application.Terminate;
end;

procedure TfmLicense.btnAccessClick(Sender: TObject);
begin
      gLicenseNo := edtLicenceCode.Text + edt_LicenseNo.Text;
      If edtLicenceCode.Text + 'ERPWMAERP' =  gLicenseNo Then Begin
        vIni := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
        With vIni do begin
            WriteString('ERP_Option', 'LicenseNo', edtLicenceCode.Text + edt_LicenseNo.Text);
        end;
        vIni.Free;
      end;
end;

procedure TfmLicense.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmLicense.FormShow(Sender: TObject);
begin
  edt_LicenseNo.SetFocus;
end;

procedure TfmLicense.edt_LicenseNoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       btnAccessClick(Sender);
    end;
end;

procedure TfmLicense.FormCreate(Sender: TObject);
begin
   EnableMenuItem( GetSystemMenu( handle, False ),SC_CLOSE, MF_BYCOMMAND or MF_GRAYED );
end;

end.

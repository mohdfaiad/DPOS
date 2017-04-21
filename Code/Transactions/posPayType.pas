unit posPayType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, SimpleDS,
  VrControls, VrMatrix, ExtCtrls;

type
  Tpos_fmPayType = class(TForm)
    lcbPayType: TDBLookupComboBox;
    edtAmount: TEdit;
    ArEnLabel2: TLabel;
    edtCash: TEdit;
    ArEnLabel3: TLabel;
    edtCheck: TEdit;
    ArEnLabel4: TLabel;
    edtCreditCard: TEdit;
    ArEnLabel5: TLabel;
    edtATM: TEdit;
    ArEnLabel6: TLabel;
    edtCredit: TEdit;
    Bevel1: TBevel;
    QLabel13: TLabel;
    vrmPayed: TVrMatrix;
    vrmRemainder: TVrMatrix;
    ArEnLabel7: TLabel;
    ArEnLabel8: TLabel;
    vrmTotal: TVrMatrix;
    Btn_Cancel: TButton;
    Btn_Ok: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtAmountKeyPress(Sender: TObject; var Key: Char);
    procedure lcbPayTypeClick(Sender: TObject);
    procedure CalcPayedAndRemainder();
    procedure edtCashChange(Sender: TObject);
    procedure Btn_OkClick(Sender: TObject);
    procedure Btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PayAmount : Real;
  end;

var
  pos_fmPayType: Tpos_fmPayType;

implementation

uses GFunctions, GVariable, Main;



{$R *.dfm}

procedure Tpos_fmPayType.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //(And (Shift = [ssCtrl]))
  if (Key = VK_F11) then ModalResult := mrOk;
  if Key = VK_Escape then ModalResult := mrCancel;
end;

procedure Tpos_fmPayType.FormShow(Sender: TObject);
begin
  lcbPayType.KeyValue := 'C';
  lcbPayTypeClick(Nil);
  edtCash.Text := StringReplace(vrmTotal.Text, ',', '', [rfReplaceAll, rfIgnoreCase]);
  edtCash.SetFocus;
end;

procedure Tpos_fmPayType.edtAmountKeyPress(Sender: TObject; var Key: Char);
begin
  If (Not (key in ['0'..'9', '.', #8, #9, #13])) then key := #0;
end;

procedure Tpos_fmPayType.lcbPayTypeClick(Sender: TObject);
begin
  edtAmount.Text := FloatToStr(PayAmount);

  if (lcbPayType.KeyValue = 'C') then begin
     edtAmount.Enabled := True;
  end else begin
     edtAmount.Enabled := False;
  end;
end;

procedure Tpos_fmPayType.CalcPayedAndRemainder;
Var
  TotalAmount, Remainder : Double ;
begin
TotalAmount := 0 ;
if edtCash.Text<>'' then
  TotalAmount := TotalAmount + StrToFloat(StringReplace(edtCash.Text, ',', '', [ rfIgnoreCase, rfReplaceAll ])) ;
if edtCheck.Text<>'' then
  TotalAmount := TotalAmount + StrToFloat(StringReplace(edtCheck.Text, ',', '', [ rfIgnoreCase, rfReplaceAll ])) ;
if edtCreditCard.Text<>'' then
  TotalAmount := TotalAmount + StrToFloat(StringReplace(edtCreditCard.Text, ',', '', [ rfIgnoreCase, rfReplaceAll ])) ;
if edtATM.Text<>'' then
  TotalAmount := TotalAmount + StrToFloat(StringReplace(edtATM.Text, ',', '', [ rfIgnoreCase, rfReplaceAll ])) ;
if edtCredit.Text<>'' then
  TotalAmount := TotalAmount + StrToFloat(StringReplace(edtCredit.Text, ',', '', [ rfIgnoreCase, rfReplaceAll ])) ;
vrmPayed.Text := FormatFloat('#,0.00', TotalAmount);
Remainder := TotalAmount - StrToFloat(StringReplace(vrmTotal.Text, ',', '', [ rfIgnoreCase, rfReplaceAll ])) ;
vrmRemainder.Text := FormatFloat('#,0.00', Remainder);
end;

procedure Tpos_fmPayType.edtCashChange(Sender: TObject);
begin
CalcPayedAndRemainder ;
end;

procedure Tpos_fmPayType.Btn_OkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure Tpos_fmPayType.Btn_CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

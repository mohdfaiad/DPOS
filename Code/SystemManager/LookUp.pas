unit LookUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ToolWin, ActnMan, ActnCtrls,SimpleDS,
  DBClient, StdCtrls, Buttons;

type
  TLkp = class(TForm)
    LkpGrid: TDBGrid;
    DSRC: TDataSource;
    EdtSearch: TEdit;
    BtnSearch: TButton;
    CkbAuto: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Search();
    procedure BtnSearchClick(Sender: TObject);
    procedure EdtSearchChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LkpGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LkpGridDblClick(Sender: TObject);

  private
    { Private declarations }
    SDS_Lkp : TSimpleDataSet;
  public
    { Public declarations }
      Constructor Create; overload;
      Constructor Create(Dset :TSimpleDataSet;AOwner :TComponent); overload;
  end;

var
  Lkp: TLkp;

implementation
uses Main  ;

{$R *.dfm}


constructor TLkp.Create;
begin
  // Execute the parent (TObject) constructor first
  //inherited;
end;

constructor TLkp.Create(Dset :TSimpleDataSet;AOwner :TComponent);
begin
    Create(AOwner);
    DSRC.DataSet := DSET;
    LkpGrid.DataSource:=DSRC;
    SDS_Lkp := DSET;
end;


procedure TLkp.FormCreate(Sender: TObject);
begin
////
end;

procedure TLkp.Search();
var OldSql,Sql ,Cond : String;
i : Integer;
begin
   if (EdtSearch.Text = '' ) then begin
    SDS_Lkp.Refresh;
    exit;
   end;

   OldSql := SDS_Lkp.DataSet.CommandText;
   Sql := 'Select * FROM ( '+OldSql+' ) as NewTable where 1=1 and ' ;

   for i := 0 to SDS_Lkp.FieldCount-1 do begin
       Cond := Cond + SDS_Lkp.Fields[i].FieldName  + ' LIKE ''%' + EdtSearch.Text + '%'' or '  ;
   end;

   Sql :=  Sql + '('+copy(Cond,0,length(Cond)-3)+')';
   SDS_Lkp.DataSet.CommandText :=  Sql ;
   SDS_Lkp.Refresh;
   SDS_Lkp.DataSet.CommandText :=OldSql;
end;

procedure TLkp.BtnSearchClick(Sender: TObject);
begin
Search;
end;

procedure TLkp.EdtSearchChange(Sender: TObject);
begin
   if(CkbAuto.Checked) then Search;   
end;

procedure TLkp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if(key = VK_ESCAPE) then
    Close;

end;

procedure TLkp.EdtSearchKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
   if(Key = VK_DOWN) then
    LkpGrid.SetFocus;
end;

procedure TLkp.LkpGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if(Key = VK_UP) and (SDS_Lkp.RecNo = 1) then
     EdtSearch.SetFocus;
    if(Key = VK_RETURN) then
     Close;
end;

procedure TLkp.LkpGridDblClick(Sender: TObject);
begin
  Close;
end;

end.

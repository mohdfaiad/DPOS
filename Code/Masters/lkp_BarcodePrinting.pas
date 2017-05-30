unit lkp_BarcodePrinting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, Mask, DBCtrls, Grids, DBGrids,LookUp,
  VrControls, VrButtons, Buttons, ComCtrls, ppCtrls, ppPrnabl, ppClass,
  ppBarCod, ppCache, ppBands, ppDB, ppParameter, ppProd, ppReport, ppComm,
  ppRelatv, ppDBPipe, ppModule, raCodMod , ppTypes, jpeg, ExtCtrls;

type
  TfmBarcodePrinting = class(TForm)
    grp_Content: TGroupBox;
    grpData: TGroupBox;
    Label3: TLabel;
    grd_Brcodes: TDBGrid;
    SDS_ItemPrices: TSimpleDataSet;
    DS_ItemPrices: TDataSource;
    SDS_ItemPricesCompanyCode: TStringField;
    SDS_ItemPricesItemService: TStringField;
    SDS_ItemPricesItemCode: TStringField;
    SDS_ItemPricesItemUnit: TStringField;
    SDS_ItemPricesPriceValue: TFMTBCDField;
    SDS_ItemUnit: TSimpleDataSet;
    SDS_HeaderItemUnitCode: TStringField;
    SDS_HeaderItemUnitDescA: TStringField;
    SDS_HeaderItemUnitDescE: TStringField;
    SDS_HeaderUnitTransCode: TStringField;
    SDS_HeaderUnitTransValue: TFMTBCDField;
    StringField1: TStringField;
    DS_ItemUnit: TDataSource;
    SDS_ItemPricesItemUnitAr: TStringField;
    SDS_ItemDef: TSimpleDataSet;
    DS_ItemDef: TDataSource;
    SDS_ItemDefItemCode: TStringField;
    SDS_ItemDefItemNameAr: TStringField;
    SDS_ItemDefItemNameEn: TStringField;
    SDS_ItemPricesItemNameAr: TStringField;
    GroupBox2: TGroupBox;
    btnPrint: TButton;
    btn_AddAllItems: TButton;
    SDS_ItemDefItemUnitCode: TStringField;
    edt_Quantity: TEdit;
    SDS_ItemPricesQuantity: TIntegerField;
    SDS_ItemPricesPolicyCode: TStringField;
    btn_DeleteAllItems: TButton;
    pplBarcode: TppDBPipeline;
    ppBarcode: TppReport;
    ppParameterList1: TppParameterList;
    ppDetailBand1: TppDetailBand;
    ppDBBarCode1: TppDBBarCode;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    raCodeModule1: TraCodeModule;
    Image1: TImage;
    qry_ItemsToPrinter: TSimpleDataSet;
    DS_ItemsToPrinter: TDataSource;
    qry_ItemsToPrinterCompanyCode: TStringField;
    qry_ItemsToPrinterItemService: TStringField;
    qry_ItemsToPrinterPolicyCode: TStringField;
    qry_ItemsToPrinterItemCode: TStringField;
    qry_ItemsToPrinterItemNameAr: TStringField;
    qry_ItemsToPrinterItemUnit: TStringField;
    qry_ItemsToPrinterItemUnitDescAr: TStringField;
    qry_ItemsToPrinterPriceValue: TFMTBCDField;
    qry_ItemsToPrinterQuantity: TIntegerField;
    pp_ItemsToPrinter: TppDBPipeline;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SDS_ItemPricesNewRecord(DataSet: TDataSet);
    procedure btn_AddAllItemsClick(Sender: TObject);
    procedure btn_DeleteAllItemsClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure qry_ItemsToPrinterNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    EditMode : Boolean;
  public
    { Public declarations }
  end;

var
  fmBarcodePrinting: TfmBarcodePrinting;

implementation

uses Main, GFunctions, GVariable;

{$R *.dfm}

procedure TfmBarcodePrinting.FormCreate(Sender: TObject);
Begin
  SDS_ItemPrices.Open;
  SDS_ItemUnit.Close;
  SDS_ItemUnit.Open;
  SDS_ItemDef.Close;
  SDS_ItemDef.Open;
  qry_ItemsToPrinter.Open;
  grpData.Enabled := True;


end;

procedure TfmBarcodePrinting.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
    end;
end;

procedure TfmBarcodePrinting.SDS_ItemPricesNewRecord(DataSet: TDataSet);
begin
   SDS_ItemPricesCompanyCode.Value := DCompany;
   SDS_ItemPricesItemService.Value := 'IVI';
   SDS_ItemPricesPolicyCode.AsString := '001';
   SDS_ItemPricesQuantity.AsString := '1';
end;

procedure TfmBarcodePrinting.btn_AddAllItemsClick(Sender: TObject);
Var
  QueryStr : String;
begin
  QueryStr :=  'SELECT * , ' + edt_Quantity.Text +' As Quantity  from tbl_ItemPrices where CompanyCode = ''' + DCompany + ''' And PolicyCode=''001''  ';

  SDS_ItemPrices.Close;
  SDS_ItemPrices.DataSet.CommandText := QueryStr;
  SDS_ItemPrices.Open;


  qry_ItemsToPrinter.Close;
  qry_ItemsToPrinter.DataSet.CommandText := QueryStr;
  qry_ItemsToPrinter.Open;

  SDS_ItemPrices.Edit;
end;

procedure TfmBarcodePrinting.btn_DeleteAllItemsClick(Sender: TObject);
begin
   if (SDS_ItemPrices.RecordCount > 0)  Then SDS_ItemPrices.EmptyDataSet;
end;

procedure TfmBarcodePrinting.btnPrintClick(Sender: TObject);
begin
    If SDS_ItemPrices.RecordCount = 0 Then Exit;

    qry_ItemsToPrinter.close;
    qry_ItemsToPrinter.dataset.close;
    qry_ItemsToPrinter.Open;

    SDS_ItemPrices.First;
    while Not SDS_ItemPrices.Eof do
    begin
      qry_ItemsToPrinter.Append;
      qry_ItemsToPrinterItemCode.AsString := SDS_ItemPricesItemCode.AsString;
      qry_ItemsToPrinterItemService.AsString := SDS_ItemPricesItemService.AsString;
      qry_ItemsToPrinterItemUnit.AsString := SDS_ItemPricesItemUnit.AsString;
      qry_ItemsToPrinterPolicyCode.AsString := SDS_ItemPricesPolicyCode.AsString;
      qry_ItemsToPrinterCompanyCode.AsString := SDS_ItemPricesCompanyCode.AsString;
      qry_ItemsToPrinterPriceValue.AsString := SDS_ItemPricesPriceValue.AsString;
      qry_ItemsToPrinterQuantity.AsString := SDS_ItemPricesQuantity.AsString;
    SDS_ItemPrices.Next;
    end;
    qry_ItemsToPrinter.Post;
    
    ppBarcode.Template.FileName := ExtractFileDir(Application.ExeName) + '\Reports\Barcode.rtm' ;
    ppBarcode.Parameters.Clear;
    ppBarcode.Template.LoadFromFile;
    
    ppBarcode.ShowPrintDialog := False ;
    ppBarcode.DeviceType := 'dtPrinter' ;
    ppBarcode.Device := dvPrinter ;

    SDS_ItemPrices.First;
    while Not SDS_ItemPrices.Eof do
    begin
      qry_ItemsToPrinter.Filtered := False;
      qry_ItemsToPrinter.Filter := 'ItemCode = ''' + SDS_ItemPricesItemCode.AsString +''' ' ;
      qry_ItemsToPrinter.Filtered := True;
      qry_ItemsToPrinter.Open;
      ppBarcode.DataPipeline := pp_ItemsToPrinter;

      ppBarcode.PrinterSetup.Copies := (SDS_ItemPricesQuantity.AsInteger) ;
      ppBarcode.Print;
    SDS_ItemPrices.Next;
    end;


end;

procedure TfmBarcodePrinting.qry_ItemsToPrinterNewRecord(
  DataSet: TDataSet);
begin
   qry_ItemsToPrinterCompanyCode.Value := DCompany;
   qry_ItemsToPrinterItemService.Value := 'IVI';
   qry_ItemsToPrinterPolicyCode.AsString := '001';
   qry_ItemsToPrinterQuantity.AsString := '1';
end;

end.

{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit rbFrmTxt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppDB, ppComm, ppRelatv, ppTxPipe, ppVar, ppBands, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, StdCtrls, rbClass;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }



  TfrmPrintFromTextFile = class(TrbReportForm)
    plCustomer: TppTextPipeline;
    plCustomerppField1: TppField;
    plCustomerppField2: TppField;
    plCustomerppField3: TppField;
    plCustomerppField4: TppField;
    plCustomerppField5: TppField;
    plCustomerppField6: TppField;
    plCustomerppField7: TppField;
    plCustomerppField8: TppField;
    rbCustomerList: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    btnPreview: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetReport: TppReport; override;
  public
    { Public declarations }
  end;

var
  frmPrintFromTextFile: TfrmPrintFromTextFile;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmPrintFromTextFile.GetReport }

function TfrmPrintFromTextFile.GetReport: TppReport;
begin
  Result := rbCustomerList;

end; {function, GetReport}

{------------------------------------------------------------------------------}
{ TfrmPrintFromTextFile.FormCreate }

procedure TfrmPrintFromTextFile.FormCreate(Sender: TObject);
begin
  plCustomer.FileName := ExtractFilePath(paramStr(0)) + 'Customer.txt';
end;

{------------------------------------------------------------------------------}
{ TfrmPrintFromTextFile.btnPreviewClick }

procedure TfrmPrintFromTextFile.btnPreviewClick(Sender: TObject);
begin
  rbCustomerList.Print;
end;

end.

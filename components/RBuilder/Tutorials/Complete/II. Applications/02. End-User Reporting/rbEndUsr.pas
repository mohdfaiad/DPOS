{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996, 2006 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit rbEndUsr;

{$I ppIfDef.pas}

interface

uses
 {$IFDEF Delphi7} XPMan,{$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,


  ppComm, ppRelatv, ppDB, ppDBPipe, Db, DBTables, daDBBDE,
  ppRptExp, ppEndUsr, ppProd, ppClass, ppReport, StdCtrls, ExtCtrls,
  ComCtrls, ppBands, ppCache, daIDE, ppFormWrapper;

type
  TmyEndUserSolution = class(TForm)
    tblFolder: TTable;
    dsFolder: TDataSource;
    plFolder: TppDBPipeline;
    tblItem: TTable;
    dsItem: TDataSource;
    pltem: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppReportExplorer1: TppReportExplorer;
    btnLaunch: TButton;
    pnlStatusBar: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure btnLaunchClick(Sender: TObject);
  private


  public
    { Public declarations }
  end;

var
  myEndUserSolution: TmyEndUserSolution;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TmyEndUserSolution.btnLaunchClick }

procedure TmyEndUserSolution.btnLaunchClick(Sender: TObject);
begin
  if not(ppReportExplorer1.Execute) then
    pnlStatusBar.SimpleText := ppReportExplorer1.ErrorMessage;
end;

end.

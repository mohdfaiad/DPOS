program ERP;

uses
  Forms,
  Main in 'Main.pas' {fmMainForm},
  lkp_Company in 'Masters\lkp_Company.pas' {fmCompany},
  BackUp in 'SystemManager\BackUp.pas' {fmBackUp},
  GFunctions in 'SystemManager\GFunctions.pas',
  GVariable in 'SystemManager\GVariable.pas',
  License in 'SystemManager\License.pas' {fmLicense},
  Login in 'SystemManager\Login.pas' {fmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMainForm, fmMainForm);
  Application.CreateForm(TfmLicense, fmLicense);
  Application.CreateForm(TfmLogin, fmLogin);
  Application.Run;
end.

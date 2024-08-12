program RTTIExample;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {FrmPrincipal},
  Model.Pessoa in 'Model\Model.Pessoa.pas',
  Attribute.DB in 'Attribute\Attribute.DB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Run;
end.

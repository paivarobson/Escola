program ProjetoEscola;

uses
  Forms,
  unCadastroEscola in 'unCadastroEscola.pas' {frmCadastroEscola},
  unDados in 'unDados.pas' {fmdados: TDataModule},
  unCadastroEscolaController in 'unCadastroEscolaController.pas',
  UnCadEscola in 'UnCadEscola.pas' {frmCadEscola},
  unRelEscola in 'unRelEscola.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmdados, fmdados);
  Application.CreateForm(TfrmCadEscola, frmCadEscola);
  Application.CreateForm(TfrmRelEscola, frmRelEscola);
  Application.Run;
end.

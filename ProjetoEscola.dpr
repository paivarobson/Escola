program ProjetoEscola;

uses
  Forms,
  unCadastroEscola in 'unCadastroEscola.pas' {frmCadastroEscola},
  unDados in 'unDados.pas' {fmdados: TDataModule},
  unCadastroEscolaController in 'unCadastroEscolaController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmdados, fmdados);
  Application.CreateForm(TfrmCadastroEscola, frmCadastroEscola);
  Application.Run;
end.

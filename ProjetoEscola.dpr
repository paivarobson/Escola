program ProjetoEscola;

uses
  Forms,
  unDados in 'DAO\unDados.pas' {fmdados: TDataModule},
  unCadastroEscolaController in 'Controle\unCadastroEscolaController.pas',
  unFrmPrincipal in 'Visao\unFrmPrincipal.pas' {frmPrincipal},
  unFrmCadEscola in 'Visao\unFrmCadEscola.pas' {frmCadEscola},
  unFrmPesquisaEscola in 'Visao\unFrmPesquisaEscola.pas' {frmPesquisaEscola},
  unRelEscola in 'Visao\unRelEscola.pas' {frmRelEscola},
  unEscolaModelo in 'Modelo\unEscolaModelo.pas',
  unPesquisaEscolaController in 'Controle\unPesquisaEscolaController.pas',
  unEscolaDAO in 'DAO\unEscolaDAO.pas',
  unSistemaControle in 'Controle\unSistemaControle.pas',
  unConexao in 'DAO\unConexao.pas',
  unEnumerado in 'Modelo\unEnumerado.pas',
  unAlunoModelo in 'Modelo\unAlunoModelo.pas',
  unFrmAluno in 'Visao\unFrmAluno.pas' {frmCadAluno},
  unAlunoDAO in 'DAO\unAlunoDAO.pas',
  unAlunoControle in 'Controle\unAlunoControle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadAluno, frmCadAluno);
  Application.CreateForm(Tfmdados, fmdados);
  Application.Run;
end.

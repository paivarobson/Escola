unit unFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, dxGDIPlusClasses, ExtCtrls, unSistemaControle, unConexao,
  ComCtrls, DB, Classes, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfrmPrincipal = class(TForm)
    lblEscolaBoasVindas: TLabel;
    mmEscola: TMainMenu;
    menuArquivo: TMenuItem;
    menuArquivoSair: TMenuItem;
    menuVisualizarConsultar: TMenuItem;
    menuArquivoNovo: TMenuItem;
    menuArquivoNovoCadastro: TMenuItem;
    menuVisualizar: TMenuItem;
    menuVisualizarConsultarEscola: TMenuItem;
    Consultar1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    imgLogo: TImage;
    StatusBar1: TStatusBar;
    ActionManager1: TActionManager;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure menuArquivoCadastroEscolaClick(Sender: TObject);
    procedure menuVisualizarConsultarEscolaClick(Sender: TObject);
    procedure menuArquivoSairClick(Sender: TObject);
    procedure btnCadastroEscolaClick(Sender: TObject);
    procedure btnConsultaEscolaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unFrmCadEscola, unFrmPesquisaEscola, unFrmAluno, StrUtils;

{$R *.dfm}
//(Menu Arquivo>>Sair) Fechar todo o sistema
procedure TfrmPrincipal.menuArquivoSairClick(Sender: TObject);
begin
  if MessageDlg('O sistema ser� totalmente encerrado. Deseja continuar?', mtConfirmation,
    mbYesNo, 0) = mrYes then
    Close
end;
//(Menu Arquivo>>Cadastro>>Escola) Evento para abrir o Form CADASTRO ESCOLA
procedure TfrmPrincipal.Action1Execute(Sender: TObject);
begin
  Application.CreateForm(TfrmCadAluno, frmCadAluno);
  try
    frmCadAluno.ShowModal;
  finally
    frmCadAluno.Release;
  end;
end;

procedure TfrmPrincipal.btnCadastroEscolaClick(Sender: TObject);
var
  VConexao: TConexao;
begin
  try
    VConexao := TConexao.Create;
    VConexao.GetConnection.Connected := True;

    if VConexao.GetConnection.Connected then
      ShowMessage('Conectado!!! ');
  finally
    FreeAndNil(VConexao);
  end;
  menuArquivoCadastroEscolaClick(Sender);
end;

procedure TfrmPrincipal.btnConsultaEscolaClick(Sender: TObject);
begin
  menuVisualizarConsultarEscolaClick(Sender);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TSistemaControle.GetInstancia();
  TSistemaControle.GetInstancia().CarregarEscola(18);

  StatusBar1.Panels[0].Text :=
    IntToStr(TSistemaControle.GetInstancia().EscolaModelo.Codigo) + #13 + ' - ' +
    TSistemaControle.GetInstancia().EscolaModelo.Nome + #13 + ' - ' +
    DateToStr(TSistemaControle.GetInstancia().EscolaModelo.DataCadastro) + #13 + ' - ' +
    TSistemaControle.GetInstancia().EscolaModelo.Rua + #13 + ' - ' +
    TSistemaControle.GetInstancia().EscolaModelo.Numero + #13 + ' - ' +
    TSistemaControle.GetInstancia().EscolaModelo.Complemento + #13 + ' - ' +
    TSistemaControle.GetInstancia().EscolaModelo.Bairro + #13 + ' - ' +
    TSistemaControle.GetInstancia().EscolaModelo.Cidade;

end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  TSistemaControle.GetInstancia().Destroy;
end;

procedure TfrmPrincipal.menuArquivoCadastroEscolaClick(Sender: TObject);
begin
  if not Assigned(frmCadEscola) then //Verifica se o Form CADASTRO ESCOLA est� FECHADO para ser CRIADO
    frmCadEscola := TfrmCadEscola.Create(Self);
  frmCadEscola.Show;
  if Assigned(frmPesquisaEscola) then //Verifica se o Form PESQUISA ESCOLA est� ABERTO para que seja FECHADO
    frmPesquisaEscola.Close;
end;
//(Menu Visualizar>>Consultar>>Escola) Evento para abrir o Form PESQUISA ESCOLA
procedure TfrmPrincipal.menuVisualizarConsultarEscolaClick(Sender: TObject);
begin
  if not Assigned(frmPesquisaEscola) then //Verifica se o Form PESQUISA ESCOLA est� FECHADO para ser CRIADO
    frmPesquisaEscola := TfrmPesquisaEscola.Create(Self);
  frmPesquisaEscola.Show;
  if Assigned(frmCadEscola) then //Verifica se o Form CADASTRO ESCOLA est� ABERTO para que seja FECHADO
    frmCadEscola.Close;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.

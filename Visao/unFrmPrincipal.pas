unit unFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, dxGDIPlusClasses, ExtCtrls, unSistemaControle, unConexao,
  ComCtrls, DB, Classes, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls, unCadEscolaController;

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
    ActionManager1: TActionManager;
    Action1: TAction;
    procedure menuArquivoCadastroEscolaClick(Sender: TObject);
    procedure menuVisualizarConsultarEscolaClick(Sender: TObject);
    procedure menuArquivoSairClick(Sender: TObject);
    procedure btnCadastroEscolaClick(Sender: TObject);
    procedure btnConsultaEscolaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    FControladorEscola: TCadEscolaController;
    procedure SetControladorEscola(const Value: TCadEscolaController);
  published

  public
    property ControladorEscola: TCadEscolaController read FControladorEscola write SetControladorEscola;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unFrmCadEscola, unFrmPesquisaEscola, unFrmCadAluno, StrUtils;

{$R *.dfm}
//(Menu Arquivo>>Sair) Fechar todo o sistema
procedure TfrmPrincipal.menuArquivoSairClick(Sender: TObject);
begin
  if MessageDlg('O sistema ser� totalmente encerrado. Deseja continuar?', mtConfirmation,
    mbYesNo, 0) = mrYes then
    Close
end;
procedure TfrmPrincipal.Action1Execute(Sender: TObject);
begin
  Application.CreateForm(TfrmCadAluno, frmCadAluno);
  try
    frmCadAluno.ShowModal;
  finally
    frmCadAluno.Release;
  end;
end;
//(Menu Arquivo>>Cadastro>>Escola) Evento para abrir o Form CADASTRO ESCOLA
procedure TfrmPrincipal.btnCadastroEscolaClick(Sender: TObject);
//var
//  VConexao: TConexao;
begin
//  try
//    VConexao := TConexao.Create;
//    VConexao.GetConnection.Connected := True;
//
//    if VConexao.GetConnection.Connected then
//      ShowMessage('Conectado!!! ');
//  finally
//    FreeAndNil(VConexao);
//  end;
  menuArquivoCadastroEscolaClick(Sender);
end;

procedure TfrmPrincipal.btnConsultaEscolaClick(Sender: TObject);
begin
  menuVisualizarConsultarEscolaClick(Sender);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
//  FController := TCadEscolaController.Create;
//  FController.CarregarEscola(1);
//
//  StatusBar1.Panels[0].Text :=
//    IntToStr(FController.EscolaModelo.Codigo) + #13 + ' - ' +
//    FController.EscolaModelo.Nome + #13 + ' - ' +
//    DateToStr(FController.EscolaModelo.DataCadastro) + #13 + ' - ' +
//    FController.EscolaModelo.Cep + #13 + ' - ' +
//    FController.EscolaModelo.Rua + #13 + ' - ' +
//    FController.EscolaModelo.Numero + #13 + ' - ' +
//    FController.EscolaModelo.Complemento + #13 + ' - ' +
//    FController.EscolaModelo.Bairro + #13 + ' - ' +
//    FController.EscolaModelo.Cidade;

end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FControladorEscola);
//  TSistemaControle.GetInstancia().Destroy;
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

procedure TfrmPrincipal.SetControladorEscola(const Value: TCadEscolaController);
begin
  FControladorEscola := Value;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
unit unEscolaIndex;

interface

uses
  Windows, Messages, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, dxGDIPlusClasses, ExtCtrls, unSistemaControle, unConexao,
  ComCtrls, DB, Classes;

type
  TfrmEscolaIndex = class(TForm)
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
    btnCadastroEscola: TButton;
    btnConsultaEscola: TButton;
    StatusBar1: TStatusBar;
    procedure menuArquivoCadastroEscolaClick(Sender: TObject);
    procedure menuVisualizarConsultarEscolaClick(Sender: TObject);
    procedure menuArquivoSairClick(Sender: TObject);
    procedure btnCadastroEscolaClick(Sender: TObject);
    procedure btnConsultaEscolaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolaIndex: TfrmEscolaIndex;

implementation

uses
  UnCadEscola, unPesquisaEscola, StrUtils;

{$R *.dfm}
//(Menu Arquivo>>Sair) Fechar todo o sistema
procedure TfrmEscolaIndex.menuArquivoSairClick(Sender: TObject);
begin
  if MessageDlg('O sistema ser� totalmente encerrado. Deseja continuar?', mtConfirmation,
    mbYesNo, 0) = mrYes then
    Close
end;
//(Menu Arquivo>>Cadastro>>Escola) Evento para abrir o Form CADASTRO ESCOLA
procedure TfrmEscolaIndex.btnCadastroEscolaClick(Sender: TObject);
var
  VConexao: TConexao;
begin
  try
    VConexao := TConexao.Create;
    VConexao.GetConnection.Connected := True;

    if VConexao.GetConnection.Connected then
      ShowMessage('Conectado!!! HAHAHAHA');
  finally
    FreeAndNil(VConexao);
  end;
//  menuArquivoCadastroEscolaClick(Sender);
end;

procedure TfrmEscolaIndex.btnConsultaEscolaClick(Sender: TObject);
begin
  menuVisualizarConsultarEscolaClick(Sender);
end;

procedure TfrmEscolaIndex.FormCreate(Sender: TObject);
begin
  TSistemaControle.GetInstancia();
  TSistemaControle.GetInstancia().CarregarEscola(1);

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

procedure TfrmEscolaIndex.FormDestroy(Sender: TObject);
begin
  TSistemaControle.GetInstancia().Destroy;
end;

procedure TfrmEscolaIndex.menuArquivoCadastroEscolaClick(Sender: TObject);
begin
  if not Assigned(frmCadEscola) then //Verifica se o Form CADASTRO ESCOLA est� FECHADO para ser CRIADO
    frmCadEscola := TfrmCadEscola.Create(Self);
  frmCadEscola.Show;
  if Assigned(frmPesquisaEscola) then //Verifica se o Form PESQUISA ESCOLA est� ABERTO para que seja FECHADO
    frmPesquisaEscola.Close;
end;
//(Menu Visualizar>>Consultar>>Escola) Evento para abrir o Form PESQUISA ESCOLA
procedure TfrmEscolaIndex.menuVisualizarConsultarEscolaClick(Sender: TObject);
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

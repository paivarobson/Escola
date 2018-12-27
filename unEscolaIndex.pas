unit unEscolaIndex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

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
    procedure menuArquivoCadastroEscolaClick(Sender: TObject);
    procedure menuVisualizarConsultarEscolaClick(Sender: TObject);
    procedure menuArquivoSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolaIndex: TfrmEscolaIndex;

implementation

uses
  UnCadEscola, unPesquisaEscola;

{$R *.dfm}

procedure TfrmEscolaIndex.menuArquivoSairClick(Sender: TObject);
begin
  if MessageDlg('O sistema ser� totalmente encerrado. Deseja continuar?', mtConfirmation,
    mbYesNo, 0) = mrYes then
    Close
end;

procedure TfrmEscolaIndex.menuArquivoCadastroEscolaClick(Sender: TObject);
begin
  if not Assigned(frmCadEscola) then
    frmCadEscola := TfrmCadEscola.Create(Self);
  frmCadEscola.Show;
  if Assigned(frmPesquisaEscola) then
    frmPesquisaEscola.Close;
end;

procedure TfrmEscolaIndex.menuVisualizarConsultarEscolaClick(Sender: TObject);
begin
  if not Assigned(frmPesquisaEscola) then
    frmPesquisaEscola := TfrmPesquisaEscola.Create(Self);
  frmPesquisaEscola.Show;
  if Assigned(frmCadEscola) then
    frmCadEscola.Close;
end;

end.

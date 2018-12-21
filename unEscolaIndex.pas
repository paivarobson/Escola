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
    procedure menuVisualizarConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  Close;
end;

procedure TfrmEscolaIndex.menuVisualizarConsultarClick(Sender: TObject);
begin
  if frmCadEscola = nil then
  begin
    Application.CreateForm(TfrmCadEscola, frmCadEscola);
    FreeAndNil(frmEscolaIndex);
  end
  else
    Close;
  frmCadEscola.ShowModal;
end;

procedure TfrmEscolaIndex.menuVisualizarConsultarEscolaClick(Sender: TObject);
begin
  if frmPesquisaEscola = nil then
  begin
    Application.CreateForm(TfrmPesquisaEscola, frmPesquisaEscola);
    FreeAndNil(frmEscolaIndex);
  end
  else
    Close;
  frmPesquisaEscola.ShowModal;
end;

procedure TfrmEscolaIndex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(frmEscolaIndex);
end;

end.

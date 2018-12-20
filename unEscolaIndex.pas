unit unEscolaIndex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TfrmEscolaIndex = class(TForm)
    lblEscolaBoasVindas: TLabel;
    mmEscola: TMainMenu;
    Arquivo1: TMenuItem;
    Cadastro1: TMenuItem;
    escola1: TMenuItem;
    Novo1: TMenuItem;
    Cadastro2: TMenuItem;
    Pesquisar1: TMenuItem;
    Escola2: TMenuItem;
    Consultar1: TMenuItem;
    procedure escola1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cadastro1Click(Sender: TObject);
    procedure Escola2Click(Sender: TObject);
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

procedure TfrmEscolaIndex.Cadastro1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmEscolaIndex.escola1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadEscola, frmCadEscola);
  try
    frmCadEscola.ShowModal;
  finally
    frmCadEscola.Release;
  end;
end;

procedure TfrmEscolaIndex.Escola2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisaEscola, frmPesquisaEscola);
  frmPesquisaEscola.ShowModal;
end;

procedure TfrmEscolaIndex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  frmEscolaIndex := nil;
end;

end.

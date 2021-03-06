unit unCadastroEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient, StdCtrls, Grids, DBGrids, WideStrings, SqlExpr,
  FMTBcd, Provider, DBTables, SimpleDS, ComCtrls, unDados,
  unCadastroEscolaController, xmldom, Xmlxform;

type
  TfrmCadastroEscola = class(TForm)
    menuBarCadastro: TMainMenu;
    Cadastros1: TMenuItem;
    Cadastros2: TMenuItem;
    Escola1: TMenuItem;
    edtEscolaCodigo: TEdit;
    edtEscolaNome: TEdit;
    edtEscolaEndRua: TEdit;
    edtEscolaEndNumero: TEdit;
    edtEscolaEndComplemento: TEdit;
    edtEscolaEndBairro: TEdit;
    edtEscolaEndCidade: TEdit;
    edtEscolaEndCep: TEdit;

    lblEscolaCodigo: TLabel;
    lblEscolaNome: TLabel;
    lblEscolaEndRua: TLabel;
    lblEscolaEndNumero: TLabel;
    lblEscolaEndComplemento: TLabel;
    lblEscolaEndCidade: TLabel;
    lblEscolaendCep: TLabel;
    lblEscolaDataCadastro: TLabel;
    lblEscolaEndBairro: TLabel;
    
    dbgrdEscola: TDBGrid;
    dsEscola: TDataSource;
    lblEscolaTitulo: TLabel;
    btnEscolaCadastrar: TButton;
    btnEscolaAlterar: TButton;
    btnEscolaExcluir: TButton;
    btnEscolaImprimiir: TButton;
    dtpEscolaDataCadastro: TDateTimePicker;
    btnEscolaGravar: TButton;
    XMLTransform1: TXMLTransform;
    SQLQuery1: TSQLQuery;
    procedure btnEscolaCadastrarClick(Sender: TObject);
    procedure btnEscolaGravarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    FController: TCadastroEscolaController;
    procedure HabilitarComponentesDados;
    procedure LimparCampos;
    procedure AfterConstruction; override;
    destructor Destroy; override;
  end;

var
  frmCadastroEscola: TfrmCadastroEscola;

implementation

{$R *.dfm}

procedure TfrmCadastroEscola.AfterConstruction;
begin
  inherited;
  FController := TCadastroEscolaController.Create;
end;

procedure TfrmCadastroEscola.btnEscolaCadastrarClick(Sender: TObject);
begin
  HabilitarComponentesDados;
  LimparCampos;
end;

procedure TfrmCadastroEscola.btnEscolaGravarClick(Sender: TObject);
var
  DadosEscola: TDadosEscola;
begin
  DadosEscola.Nome := edtEscolaNome.Text;
//  DadosEscola.DataCadastro := dtpEscolaDataCadastro.Text;
  DadosEscola.CEP := edtEscolaEndCep.Text;
  DadosEscola.Rua := edtEscolaEndRua.Text;
  DadosEscola.Numero := edtEscolaEndNumero.Text;
  DadosEscola.Complemento := edtEscolaEndComplemento.Text;
  DadosEscola.Bairro := edtEscolaEndBairro.Text;
  DadosEscola.Cidade := edtEscolaEndCidade.Text;
  edtEscolaCodigo.Text := FController.Gravar(DadosEscola);
  FController.CarregarEscola(SQLQuery1);
  SQLQuery1.Open;
end;

destructor TfrmCadastroEscola.Destroy;
begin
  FreeAndNil(FController);
  inherited;
end;

procedure TfrmCadastroEscola.HabilitarComponentesDados;
begin
  edtEscolaNome.Enabled := True;
  dtpEscolaDataCadastro.Enabled := True;  
  edtEscolaEndRua.Enabled := True;
  edtEscolaEndNumero.Enabled := True;
  edtEscolaEndComplemento.Enabled := True;
  edtEscolaEndCidade.Enabled := True;
  edtEscolaEndCep.Enabled := True;
  edtEscolaEndBairro.Enabled := True;
  edtEscolaNome.SetFocus;
end;

procedure TfrmCadastroEscola.LimparCampos;
begin
  edtEscolaCodigo.Clear;
  edtEscolaNome.Clear;
  edtEscolaEndRua.Clear;
  edtEscolaEndNumero.Clear;
  edtEscolaEndComplemento.Clear;
  edtEscolaEndCidade.Clear;
  edtEscolaEndCep.Clear;
  edtEscolaEndBairro.Clear;
end;

end.

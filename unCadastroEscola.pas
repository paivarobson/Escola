unit unCadastroEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient, StdCtrls, Grids, DBGrids, WideStrings, SqlExpr,
  FMTBcd, Provider;

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
    edtEscolaEndCidade: TEdit;
    edtEscolaEndCep: TEdit;
    lblEscolaCodigo: TLabel;
    lblEscolaNome: TLabel;
    lblEscolaEndRua: TLabel;
    lblEscolaEndNumero: TLabel;
    lblEscolaEndComplemento: TLabel;
    lblEscolaEndCidade: TLabel;
    lblEscolaendCep: TLabel;
    edtEscolaDataCadastro: TEdit;
    lblEscolaDataCadastro: TLabel;
    edtEscolaEndBairro: TEdit;
    lblEscolaEndBairro: TLabel;
    dbgrdEscola: TDBGrid;
    dsEscola: TDataSource;
    lblEscolaTitulo: TLabel;
    btnEscolaCadastrar: TButton;
    btnEscolaAlterar: TButton;
    btnEscolaExcluir: TButton;
    btnEscolaImprimiir: TButton;
    conexaoBDEscola: TSQLConnection;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1ESCCOD: TIntegerField;
    ClientDataSet1ESCNOME: TStringField;
    ClientDataSet1ESCDATACAD: TDateTimeField;
    ClientDataSet1ESCENDRUA: TStringField;
    ClientDataSet1ESCENDNUM: TIntegerField;
    ClientDataSet1ESCENDCOMP: TStringField;
    ClientDataSet1ESCENDBAIRRO: TStringField;
    ClientDataSet1ESCENDCIDADE: TStringField;
    ClientDataSet1ESCENDCEP: TStringField;
    procedure btnEscolaCadastrarClick(Sender: TObject);
    procedure btnEscolaAlterarClick(Sender: TObject);
    procedure btnEscolaExcluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure EscolaDados;
    procedure LimparCampos;    
  end;

var
  frmCadastroEscola: TfrmCadastroEscola;

implementation

{$R *.dfm}

procedure TfrmCadastroEscola.btnEscolaAlterarClick(Sender: TObject);
begin
  sqlqryEscola.Edit;
  EscolaDados;
  end;

procedure TfrmCadastroEscola.btnEscolaCadastrarClick(Sender: TObject);
begin
  EscolaDados;
end;

procedure TfrmCadastroEscola.btnEscolaExcluirClick(Sender: TObject);
begin
  sqlqryEscola.Delete;
end;

procedure TfrmCadastroEscola.EscolaDados;
begin
  ClientDataSet1.Open;
  ClientDataSet1.Append;
  ClientDataSet1.FieldByName('ESCCOD').AsInteger := StrToInt(edtEscolaCodigo.Text);
  ClientDataSet1.FieldByName('ESCNOME').AsString := edtEscolaNome.Text;
  ClientDataSet1.FieldByName('ESCDATACAD').AsDateTime := StrToDateTime(edtEscolaDataCadastro.Text);
  ClientDataSet1.FieldByName('ESCENDRUA').AsString := edtEscolaEndRua.Text;
  ClientDataSet1.FieldByName('ESCENDNUM').AsInteger := StrToInt(edtEscolaEndNumero.Text);
  ClientDataSet1.FieldByName('ESCENDCOMP').AsString := edtEscolaEndComplemento.Text;
  ClientDataSet1.FieldByName('ESCENDBAIRRO').AsString := edtEscolaEndBairro.Text;
  ClientDataSet1.FieldByName('ESCENDCIDADE').AsString := edtEscolaEndCidade.Text;
  ClientDataSet1.FieldByName('ESCENDCEP').AsString := edtEscolaEndCep.Text;
  ClientDataSet1.Post;
  ClientDataSet1.Close;

  ShowMessage('Cadastro realizado com sucesso! FIIIIMM');
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
  edtEscolaDataCadastro.Clear;
  edtEscolaEndBairro.Clear;
end;

end.

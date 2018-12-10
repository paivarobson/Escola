unit UnCadEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, FMTBcd, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, StdCtrls, DB, SqlExpr, Grids, DBGrids, Provider, DBClient,
  ExtCtrls, DBCtrls, unDados, unCadastroEscolaController, ADODB;

type
  TfrmCadEscola = class(TForm)
    dsEscola: TDataSource;
    lblEscolaCodigo: TLabel;
    lblEscolaNome: TLabel;
    DBEditEscolaNome: TcxDBTextEdit;
    lblEscolaDataCadastro: TLabel;
    DBEditEscolaDataCadastro: TcxDBTextEdit;
    lblEscolaEndRua: TLabel;
    DBEditEscolaEndRua: TcxDBTextEdit;
    lblEscolaEndNumero: TLabel;
    lblEscolaEndComplemento: TLabel;
    DBEditEscolaEndComplemento: TcxDBTextEdit;
    lblEscolaEndBairro: TLabel;
    DBEditEscolaEndBairro: TcxDBTextEdit;
    lblEscolaEndCidade: TLabel;
    DBEditEscolaEndCidade: TcxDBTextEdit;
    lblEscolaendCep: TLabel;
    DBEditEscolaEndCep: TcxDBTextEdit;
    DBGridListaEscola: TDBGrid;
    DBEditEscolaEndNumero: TcxDBTextEdit;
    lblEscolaFrmTitulo: TLabel;
    btnEscolaNovoCadastro: TButton;
    btnEscolaGravar: TButton;
    btnEscolaAlterar: TButton;
    btnEscolaExcluir: TButton;
    btnEscolaImprimir: TButton;
    ADOTableEscola: TADOTable;
    ADOTableEscolaESCCOD: TIntegerField;
    ADOTableEscolaESCNOME: TStringField;
    ADOTableEscolaESCDATACAD: TStringField;
    ADOTableEscolaESCENDRUA: TStringField;
    ADOTableEscolaESCENDNUM: TStringField;
    ADOTableEscolaESCENDCOMP: TStringField;
    ADOTableEscolaESCENDBAIRRO: TStringField;
    ADOTableEscolaESCENDCIDADE: TStringField;
    ADOTableEscolaESCENDCEP: TStringField;
    btnEscolaCancelar: TButton;
    btnEscolaLimpar: TButton;
    DBEditEscolaCod: TcxDBTextEdit;
    edtEscolaBuscar: TEdit;
    btnEscolaBuscar: TButton;
    procedure HabilitarComponentesDados;
    procedure LimparCampos;
    procedure btnEscolaNovoCadastroClick(Sender: TObject);
    procedure btnEscolaGravarClick(Sender: TObject);
    procedure btnEscolaCancelarClick(Sender: TObject);
    procedure DesabilitarComponentesDados;
    procedure btnEscolaLimparClick(Sender: TObject);
    procedure btnEscolaExcluirClick(Sender: TObject);
    procedure btnEscolaAlterarClick(Sender: TObject);
    procedure btnEscolaBuscarClick(Sender: TObject);
    procedure btnEscolaImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController: TCadastroEscolaController;
  end;

var
  frmCadEscola: TfrmCadEscola;

implementation

uses
  unRelEscola;

{$R *.dfm}

procedure TfrmCadEscola.btnEscolaNovoCadastroClick(Sender: TObject);
begin
  HabilitarComponentesDados;
  LimparCampos;
  btnEscolaExcluir.Enabled := False;
  btnEscolaImprimir.Enabled := False;
  ADOTableEscola.Append;
end;

procedure TfrmCadEscola.btnEscolaAlterarClick(Sender: TObject);
begin
  ADOTableEscola.Edit;
  HabilitarComponentesDados;
  btnEscolaExcluir.Enabled := False;
  btnEscolaImprimir.Enabled := False;
end;

procedure TfrmCadEscola.btnEscolaBuscarClick(Sender: TObject);
begin
  ADOTableEscola.Locate('ESCNOME', edtEscolaBuscar.Text, [LopartialKey]);
end;

procedure TfrmCadEscola.btnEscolaCancelarClick(Sender: TObject);
begin
  ADOTableEscola.Cancel;
  DesabilitarComponentesDados;
  btnEscolaCancelar.Enabled := False;
  btnEscolaLimpar.Enabled := False;
  btnEscolaGravar.Enabled := False;
  btnEscolaImprimir.Enabled := True;
  btnEscolaExcluir.Enabled := True;
end;

procedure TfrmCadEscola.btnEscolaExcluirClick(Sender: TObject);
begin
  ADOTableEscola.Delete;
  ShowMessage('Exclu�do com sucesso!');
end;

procedure TfrmCadEscola.btnEscolaGravarClick(Sender: TObject);
var
  DadosEscola: TDadosEscola;
begin
  DadosEscola.Nome := DBEditEscolaNome.Text;
  DadosEscola.DataCadastro := DBEditEscolaDataCadastro.Text;
  DadosEscola.CEP := DBEditEscolaEndCep.Text;
  DadosEscola.Rua := DBEditEscolaEndRua.Text;
  DadosEscola.Numero := DBEditEscolaEndNumero.Text;
  DadosEscola.Complemento := DBEditEscolaEndComplemento.Text;
  DadosEscola.Bairro := DBEditEscolaEndBairro.Text;
  DadosEscola.Cidade := DBEditEscolaEndCidade.Text;
  ADOTableEscola.Post;
  DesabilitarComponentesDados;
  btnEscolaExcluir.Enabled := True;
  btnEscolaImprimir.Enabled := True;
  btnEscolaCancelar.Enabled := False;
  LimparCampos;
  ShowMessage('Gravado com sucesso!');
end;

procedure TfrmCadEscola.btnEscolaImprimirClick(Sender: TObject);
begin
  frmRelEscola := TfrmRelEscola.Create(Application);
  frmCadEscola.ShowModal;
end;

procedure TfrmCadEscola.btnEscolaLimparClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TfrmCadEscola.DesabilitarComponentesDados;
begin
  btnEscolaNovoCadastro.Enabled := True;
  btnEscolaGravar.Enabled := False;
  btnEscolaLimpar.Enabled := False;
  btnEscolaAlterar.Enabled := True;
  btnEscolaCancelar.Enabled := False;
  btnEscolaExcluir.Enabled := False;
  btnEscolaImprimir.Enabled := False;
  DBEditEscolaCod.Enabled := False;
  DBEditEscolaNome.Enabled := False;
  DBEditEscolaDataCadastro.Enabled := False;
  DBEditEscolaEndRua.Enabled := False;
  DBEditEscolaEndNumero.Enabled := False;
  DBEditEscolaEndComplemento.Enabled := False;
  DBEditEscolaEndCidade.Enabled := False;
  DBEditEscolaEndCep.Enabled := False;
  DBEditEscolaEndBairro.Enabled := False;
end;

procedure TfrmCadEscola.HabilitarComponentesDados;
begin
  btnEscolaNovoCadastro.Enabled := False;
  btnEscolaGravar.Enabled := True;
  btnEscolaLimpar.Enabled := True;
  btnEscolaAlterar.Enabled := False;
  btnEscolaCancelar.Enabled := True;    
  DBEditEscolaNome.Enabled := True;
  DBEditEscolaDataCadastro.Enabled := True;
  DBEditEscolaEndRua.Enabled := True;
  DBEditEscolaEndNumero.Enabled := True;
  DBEditEscolaEndComplemento.Enabled := True;
  DBEditEscolaEndCidade.Enabled := True;
  DBEditEscolaEndCep.Enabled := True;
  DBEditEscolaEndBairro.Enabled := True;
  DBEditEscolaNome.SetFocus;
end;

procedure TfrmCadEscola.LimparCampos;
begin
  DBEditEscolaCod.Clear;
  DBEditEscolaNome.Clear;
  DBEditEscolaDataCadastro.Clear;
  DBEditEscolaEndRua.Clear;
  DBEditEscolaEndNumero.Clear;
  DBEditEscolaEndComplemento.Clear;
  DBEditEscolaEndCidade.Clear;
  DBEditEscolaEndCep.Clear;
  DBEditEscolaEndBairro.Clear;
end;

end.
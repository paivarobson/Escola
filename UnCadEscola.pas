unit UnCadEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, FMTBcd, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, StdCtrls, DB, SqlExpr, Grids, DBGrids, Provider, DBClient, unCadastroEscola,
  ExtCtrls, DBCtrls, unDados, unCadastroEscolaController;

type
  TfrmCadEscola = class(TForm)
    dSetEscola: TSQLDataSet;
    dsProviderEscola: TDataSetProvider;
    cDSEscola: TClientDataSet;
    dSetEscolaESCCOD: TIntegerField;
    dSetEscolaESCNOME: TStringField;
    dSetEscolaESCDATACAD: TStringField;
    dSetEscolaESCENDRUA: TStringField;
    dSetEscolaESCENDCOMP: TStringField;
    dSetEscolaESCENDBAIRRO: TStringField;
    dSetEscolaESCENDCIDADE: TStringField;
    dSetEscolaESCENDCEP: TStringField;
    cDSEscolaESCCOD: TIntegerField;
    cDSEscolaESCNOME: TStringField;
    cDSEscolaESCDATACAD: TStringField;
    cDSEscolaESCENDRUA: TStringField;
    cDSEscolaESCENDCOMP: TStringField;
    cDSEscolaESCENDBAIRRO: TStringField;
    cDSEscolaESCENDCIDADE: TStringField;
    cDSEscolaESCENDCEP: TStringField;
    dsEscola: TDataSource;
    lblEscolaCodigo: TLabel;
    DBSpinEditEscolaCod: TcxDBSpinEdit;
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
    DBGrid1: TDBGrid;
    DBEditEscolaEndNumero: TcxDBTextEdit;
    cDSEscolaESCENDNUM: TStringField;
    dSetEscolaESCENDNUM: TStringField;
    lblEscolaFrmTitulo: TLabel;
    btnEscolaCadastrar: TButton;
    btnEscolaGravar: TButton;
    btnEscolaAlterar: TButton;
    btnEscolaExcluir: TButton;
    btnEscolaImprimiir: TButton;
    SQLQuery1: TSQLQuery;
    procedure HabilitarComponentesDados;
    procedure LimparCampos;
    procedure btnEscolaCadastrarClick(Sender: TObject);
    procedure btnEscolaGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController: TCadastroEscolaController;
  end;

var
  frmCadEscola: TfrmCadEscola;

implementation

{$R *.dfm}

procedure TfrmCadEscola.btnEscolaCadastrarClick(Sender: TObject);
begin
  HabilitarComponentesDados;
  LimparCampos;
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
  DBSpinEditEscolaCod.Text := FController.Gravar(DadosEscola);
  FController.CarregarEscola(SQLQuery1);
  SQLQuery1.Open;
end;

procedure TfrmCadEscola.HabilitarComponentesDados;
begin
  DBSpinEditEscolaCod.Enabled := True;
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
  DBSpinEditEscolaCod.Clear;
  DBEditEscolaNome.Clear;
  DBEditEscolaEndRua.Clear;
  DBEditEscolaEndNumero.Clear;
  DBEditEscolaEndComplemento.Clear;
  DBEditEscolaEndCidade.Clear;
  DBEditEscolaEndCep.Clear;
  DBEditEscolaEndBairro.Clear;
end;

end.

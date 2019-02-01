unit unFrmCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WideStrings, FMTBcd, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, DB, SqlExpr, Grids, DBGrids, Provider, DBClient,
  ExtCtrls, DBCtrls, unCadEscolaController, ADODB, ComCtrls, Mask,              
  JvExMask, JvToolEdit, JvDBControls, cxDropDownEdit, cxCalendar,
  dxCore, cxDateUtils, StrUtils, unCadPadraoController;

type
  TfrmCadPadrao = class(TForm)
    btnNovoCadastro: TButton;
    btnGravar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnLimpar: TButton;
    btnFechar: TButton;
    lbCodigo: TLabel;
    edtCodigo: TEdit;
    lblDataCadastro: TLabel;
    cxDateEditDataCadastro: TcxDateEdit;
    lblFrmTitulo: TLabel;
    lbDescricao: TLabel;
    edtNome: TEdit;
    lblEndRua: TLabel;
    lbEndNumero: TLabel;
    lbEndComplemento: TLabel;
    lblEndBairro: TLabel;
    lblEndCidade: TLabel;
    lblEndCep: TLabel;
    maskEditEndCEP: TMaskEdit;
    edtEndRua: TEdit;
    edtEndNumero: TEdit;
    edtEndComplemento: TEdit;
    edtEndBairro: TEdit;
    edtEndCidade: TEdit;
    procedure btnNovoCadastroClick(Sender: TObject); virtual;
    procedure btnGravarClick(Sender: TObject); virtual;
    procedure btnCancelarClick(Sender: TObject); virtual;
    procedure btnLimparClick(Sender: TObject); virtual;
    procedure btnExcluirClick(Sender: TObject); virtual;
    procedure btnAlterarClick(Sender: TObject); virtual;
    procedure btnPesquisarClick(Sender: TObject); virtual;
    procedure edtEndNumeroKeyPress(Sender: TObject; var Key: Char); virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction); virtual;
    procedure AvancarCampo(Sender: TObject; var Key: Char); virtual;
    procedure btnFecharClick(Sender: TObject); virtual;
  private
    FControladorPadrao: TCadPadraoController;
    procedure SetControladorPadrao(const Value: TCadPadraoController);

  protected
    procedure CarregarComponentesCadPadrao; virtual;
    procedure CarregarEntidadePadrao; virtual;
    procedure LimparCampos; virtual;
    procedure LimparCamposForm; virtual;
    procedure HabilitarDesabilitarComponentesDados; virtual;
    procedure CarregarEscola; virtual;


  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure CarregarEntidadeEscola; virtual;

    function ValidaCampos: Boolean; virtual;

    property ControladorPadrao: TCadPadraoController read FControladorPadrao write SetControladorPadrao;
//    property EntidadeModelo

  end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

{$R *.dfm}

procedure TfrmCadPadrao.CarregarComponentesCadPadrao;
begin
  edtCodigo.Text := IntToStr(ControladorPadrao.EntidadeModelo.Codigo);
  edtNome.Text := ControladorPadrao.EntidadeModelo.Nome;
//  cxDateEditDataCadastro.Date := ControladorPadrao.EntidadeModelo.DataCadastro;
//  maskEditEndCEP.Text := ControladorPadrao.EntidadeModelo.Cep;
  edtEndRua.Text := ControladorPadrao.EntidadeModelo.Rua;
  edtEndNumero.Text := ControladorPadrao.EntidadeModelo.Numero;
  edtEndComplemento.Text := ControladorPadrao.EntidadeModelo.Complemento;
  edtEndBairro.Text := ControladorPadrao.EntidadeModelo.Bairro;
  edtEndCidade.Text := ControladorPadrao.EntidadeModelo.Cidade;
end;

procedure TfrmCadPadrao.CarregarEntidade;
begin
  ControladorPadrao.CarregarEntidade;
  CarregarComponentesCadPadrao;
end;

procedure TfrmCadPadrao.CarregarEntidadePadrao;
begin
  ControladorPadrao.EntidadeModelo.Codigo := StrToInt(edtCodigo.Text);
  ControladorPadrao.EntidadeModelo.Nome := edtNome.Text;
  ControladorPadrao.EntidadeModelo.DataCadastro := cxDateEditDataCadastro.Date;
  ControladorPadrao.EntidadeModelo.Cep := maskEditEndCEP.Text;
  ControladorPadrao.EntidadeModelo.Rua := edtEndRua.Text;
  ControladorPadrao.EntidadeModelo.Numero := edtEndNumero.Text;
  ControladorPadrao.EntidadeModelo.Complemento := edtEndComplemento.Text;
  ControladorPadrao.EntidadeModelo.Bairro := edtEndBairro.Text;
  ControladorPadrao.EntidadeModelo.Cidade := edtEndCidade.Text;
end;

constructor TfrmCadPadrao.Create(AOwner: TComponent);
begin
  ControladorPadrao := TCadPadraoController.Create; //Inst�ncia da Classe Controller
  if ControladorPadrao.EstadoClientDS = dsBrowse then
  begin
    ControladorPadrao.CarregarEntidade;
    CarregarComponentesCadPadrao;
  end
  else
  begin
    CarregarComponentesCadPadrao;
    HabilitarDesabilitarComponentesDados;
    edtCodigo.Text := EmptyStr;
    cxDateEditDataCadastro.Text := EmptyStr;
  end;
end;

destructor TfrmCadPadrao.Destroy;
begin
  inherited;
  FreeAndNil(FControladorPadrao);
end;

procedure TfrmCadPadrao.HabilitarDesabilitarComponentesDados;
begin
  btnNovoCadastro.Enabled := (ControladorPadrao.EstadoClientDS in [dsInactive, dsBrowse]);
  btnGravar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
  btnLimpar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
  btnCancelar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//  btnEscolaPesquisar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInactive, dsBrowse]);
  btnFechar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInactive, dsBrowse]);
  edtNome.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndRua.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndNumero.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndComplemento.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndCidade.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
  maskEditEndCEP.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndBairro.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
end;

procedure TfrmCadPadrao.LimparCampos;
begin
  ControladorPadrao.LimparCampos;
  CarregarComponentesCadPadrao;
end;

procedure TfrmCadPadrao.SetControladorPadrao(const Value: TCadPadraoController);
begin
  FControladorPadrao := Value;
end;

procedure TfrmCadPadrao.LimparCamposForm;
begin
  edtNome.Text := EmptyStr;
  maskEditEndCEP.Text := EmptyStr;
  edtEndRua.Text := EmptyStr;
  edtEndNumero.Text := EmptyStr;
  edtEndComplemento.Text := EmptyStr;
  edtEndBairro.Text := EmptyStr;
  edtEndCidade.Text := EmptyStr;
end;

end.
unit UnCadEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, FMTBcd, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, StdCtrls, DB, SqlExpr, Grids, DBGrids, Provider, DBClient,
  ExtCtrls, DBCtrls, unDados, unCadastroEscolaController, ADODB, ComCtrls, Mask,
  JvExMask, JvToolEdit, JvDBControls, cxDropDownEdit, cxCalendar;

type
  TfrmCadEscola = class(TForm)
    lblEscolaCodigo: TLabel;
    lblEscolaNome: TLabel;
    DBEditEscolaNome: TcxDBTextEdit;
    lblEscolaDataCadastro: TLabel;
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
    btnEscolaCancelar: TButton;
    btnEscolaLimpar: TButton;
    DBEditEscolaCod: TcxDBTextEdit;
    edtEscolaBuscarCodigo: TEdit;
    btnEscolaBuscar: TButton;
    rgImpressao: TRadioGroup;
    rbTela: TRadioButton;
    rbImpressora: TRadioButton;
    btnEscolaImprimir: TButton;
    dtpEscolaBuscarData: TDateTimePicker;
    DBEditEscolaDataCadastro: TcxDBTextEdit;
    procedure btnEscolaNovoCadastroClick(Sender: TObject);
    procedure btnEscolaGravarClick(Sender: TObject);
    procedure btnEscolaCancelarClick(Sender: TObject);
    procedure DesabilitarComponentesDados;
    procedure btnEscolaLimparClick(Sender: TObject);
    procedure btnEscolaExcluirClick(Sender: TObject);
    procedure btnEscolaAlterarClick(Sender: TObject);
    procedure btnEscolaBuscarClick(Sender: TObject);
    procedure btnEscolaImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  frmCadEscola: TfrmCadEscola;

implementation

uses
  unRelEscola;

{$R *.dfm}

procedure TfrmCadEscola.AfterConstruction;
begin
  inherited;
  FController := TCadastroEscolaController.Create;
end;

procedure TfrmCadEscola.btnEscolaNovoCadastroClick(Sender: TObject);
begin
//  fmdados.ClientDataSet1.Open;
  fmdados.ClientDataSet1.Append;
  HabilitarComponentesDados;
  LimparCampos;      
  fmdados.ClientDataSet1ESCCOD.AsInteger := FController.DevolverUltimoCodigo;
  btnEscolaExcluir.Enabled := False;
  btnEscolaImprimir.Enabled := False;
  btnEscolaBuscar.Enabled := False;
  edtEscolaBuscarCodigo.Enabled := False;
  dtPEscolaBuscarData.Enabled := False;

end;

procedure TfrmCadEscola.btnEscolaAlterarClick(Sender: TObject);
begin
  fmdados.ClientDataSet1.Edit;
  HabilitarComponentesDados;
  btnEscolaExcluir.Enabled := False;
  btnEscolaImprimir.Enabled := False;
  btnEscolaBuscar.Enabled := False;
  edtEscolaBuscarCodigo.Enabled := False;
end;

procedure TfrmCadEscola.btnEscolaBuscarClick(Sender: TObject);
begin
//  fmdados.ClientDataSet1.Open;
  if edtEscolaBuscarCodigo.Text <> '' then
    fmdados.ClientDataSet1.Locate('ESCCOD', edtEscolaBuscarCodigo.Text, [LopartialKey])
  else
    fmdados.ClientDataSet1.Locate('ESCDATACAD', FormatDateTime('DD/MM/YYYY', dtpEscolaBuscarData.Date), [LopartialKey])
end;

procedure TfrmCadEscola.btnEscolaCancelarClick(Sender: TObject);
begin
  fmdados.ClientDataSet1.Cancel;
  DesabilitarComponentesDados;
  btnEscolaBuscar.Enabled := True;
  edtEscolaBuscarCodigo.Enabled := True;
  dtpEscolaBuscarData.Enabled := True;
  btnEscolaImprimir.Enabled := True;
  btnEscolaExcluir.Enabled := True;
end;

procedure TfrmCadEscola.btnEscolaExcluirClick(Sender: TObject);
begin
  //BOT�O EXCLUIR E ALTERAR N�O GRAVANDO NO BD
  fmdados.ClientDataSet1.Delete;
  ShowMessage('Exclu�do com sucesso!');
end;

procedure TfrmCadEscola.btnEscolaGravarClick(Sender: TObject);
begin
  fmdados.ClientDataSet1.Post;
  fmdados.ClientDataSet1.ApplyUpdates(0);                     
  DesabilitarComponentesDados;
  btnEscolaExcluir.Enabled := True;
  btnEscolaImprimir.Enabled := True;
  btnEscolaCancelar.Enabled := False;
  btnEscolaBuscar.Enabled := True;
  edtEscolaBuscarCodigo.Enabled := True;
  dtpEscolaBuscarData.Enabled := True;
  LimparCampos;

  ShowMessage('Gravado com sucesso!');
end;

destructor TfrmCadEscola.Destroy;
begin
  FreeAndNil(FController);
  inherited;
end;

procedure TfrmCadEscola.btnEscolaImprimirClick(Sender: TObject);
begin
  frmRelEscola := TfrmRelEscola.Create(Application);
  if rbTela.Checked then
    frmRelEscola.RLReportEscola.Preview()
  else
    frmRelEscola.RLReportEscola.Print
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

procedure TfrmCadEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fmdados.ClientDataSet1.Close;
end;

procedure TfrmCadEscola.FormShow(Sender: TObject);
begin
  fmdados.ClientDataSet1.Open;
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

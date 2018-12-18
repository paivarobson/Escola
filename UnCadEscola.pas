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
    DBDateEditEscolaDataCadastro: TcxDBDateEdit;
    DBMaskEditEscolaEndCEP: TcxDBMaskEdit;
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
    procedure ValidaCampoSomenteInteiro(Sender: TObject; var Key: Char);
    procedure edtEscolaBuscarCodigoChange(Sender: TObject);
  private
    procedure AtribuicaoCampoData(Sender: TField; const Text: string);
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
  fmdados.tbdsEscola.Append;
  HabilitarComponentesDados;
  LimparCampos;
  fmdados.tbdsEscolaESCCOD.AsInteger := FController.DevolverUltimoCodigo + 1;
  btnEscolaExcluir.Enabled := False;
  btnEscolaImprimir.Enabled := False;
  btnEscolaBuscar.Enabled := False;
  edtEscolaBuscarCodigo.Enabled := False;
  dtPEscolaBuscarData.Enabled := False;
  DBDateEditEscolaDataCadastro.Text := FormatDateTime('DD/MM/YYYY', Now);

end;

procedure TfrmCadEscola.btnEscolaAlterarClick(Sender: TObject);
begin
  fmdados.tbdsEscola.Edit;
  HabilitarComponentesDados;
  btnEscolaExcluir.Enabled := False;
  btnEscolaImprimir.Enabled := False;
  btnEscolaBuscar.Enabled := False;
  edtEscolaBuscarCodigo.Enabled := False;
end;

procedure TfrmCadEscola.btnEscolaBuscarClick(Sender: TObject);
begin
  fmdados.tbdsEscola.Filtered := False;
  if edtEscolaBuscarCodigo.Text <> '' then
  begin
    if fmdados.tbdsEscola.Locate('ESCCOD', edtEscolaBuscarCodigo.Text, [LopartialKey]) then
    begin
      fmdados.tbdsEscola.Filtered := False;
      fmdados.tbdsEscola.Filter := 'ESCCOD = ' + QuotedStr(edtEscolaBuscarCodigo.Text);
      fmdados.tbdsEscola.Filtered := True;
    end
    else
    begin
      ShowMessage('Registro n�o localizado. Verifique o c�digo digitado e tente novamente.');
      edtEscolaBuscarCodigo.SetFocus;
    end;
  end
  else
  begin
    if not fmdados.tbdsEscola.Locate('ESCDATACAD',
      FormatDateTime('DD/MM/YYYY', dtpEscolaBuscarData.Date), [LopartialKey]) then
    begin
      ShowMessage('Registro n�o localizado. Verifique a data consultada e tente novamente.');
      dtpEscolaBuscarData.SetFocus;
    end
    else
    begin
      fmdados.tbdsEscola.Filtered := False;
      fmdados.tbdsEscola.Filter := 'ESCDATACAD = ' + QuotedStr(
        FormatDateTime('DD/MM/YYYY', dtpEscolaBuscarData.Date));
      fmdados.tbdsEscola.Filtered := True;
    end;
  end;

end;

procedure TfrmCadEscola.btnEscolaCancelarClick(Sender: TObject);
begin
  fmdados.tbdsEscola.Cancel;
  DesabilitarComponentesDados;
  btnEscolaBuscar.Enabled := True;
  edtEscolaBuscarCodigo.Enabled := True;
  dtpEscolaBuscarData.Enabled := True;
  btnEscolaImprimir.Enabled := True;
  btnEscolaExcluir.Enabled := True;
end;

procedure TfrmCadEscola.btnEscolaExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    fmdados.tbdsEscola.Delete;
    fmdados.tbdsEscola.ApplyUpdates(0);
    fmdados.tbdsEscola.Refresh;
    ShowMessage('Registro exclu�do com sucesso!');
  end;
end;

procedure TfrmCadEscola.btnEscolaGravarClick(Sender: TObject);
begin
  fmdados.tbdsEscola.Post;
  fmdados.tbdsEscola.ApplyUpdates(0);
  DesabilitarComponentesDados;
  btnEscolaExcluir.Enabled := True;
  btnEscolaImprimir.Enabled := True;
  btnEscolaCancelar.Enabled := False;
  btnEscolaBuscar.Enabled := True;
  edtEscolaBuscarCodigo.Enabled := True;
  dtpEscolaBuscarData.Enabled := True;
  LimparCampos;

  ShowMessage('Registro gravado com sucesso!');
end;

destructor TfrmCadEscola.Destroy;
begin
  FreeAndNil(FController);
  inherited;
end;

procedure TfrmCadEscola.edtEscolaBuscarCodigoChange(Sender: TObject);
begin
  if (edtEscolaBuscarCodigo.Text = EmptyStr) then
    fmdados.tbdsEscola.Filtered := False;
end;

procedure TfrmCadEscola.ValidaCampoSomenteInteiro(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then
    key := #0
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

procedure TfrmCadEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fmdados.tbdsEscola.Close;
end;

procedure TfrmCadEscola.FormShow(Sender: TObject);
begin
  fmdados.tbdsEscola.Open;
  fmdados.tbdsEscolaESCDATACAD.OnSetText := AtribuicaoCampoData;
end;

procedure TfrmCadEscola.AtribuicaoCampoData(Sender: TField;
  const Text: string);
begin
  try
    StrToDate(DBDateEditEscolaDataCadastro.Text);
  except
    ShowMessage('Data Inv�lida');
    DBDateEditEscolaDataCadastro.SetFocus;
  end;
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
  //DBDateEditEscolaDataCadastro.Enabled := False;
  DBEditEscolaEndRua.Enabled := False;
  DBEditEscolaEndNumero.Enabled := False;
  DBEditEscolaEndComplemento.Enabled := False;
  DBEditEscolaEndCidade.Enabled := False;
  DBMaskEditEscolaEndCEP.Enabled := False;
  DBEditEscolaEndBairro.Enabled := False;
  DBGridListaEscola.Enabled := True;
end;

procedure TfrmCadEscola.HabilitarComponentesDados;
begin
  btnEscolaNovoCadastro.Enabled := False;
  btnEscolaGravar.Enabled := True;
  btnEscolaLimpar.Enabled := True;
  btnEscolaAlterar.Enabled := False;
  btnEscolaCancelar.Enabled := True;
  DBEditEscolaNome.Enabled := True;
  //DBDateEditEscolaDataCadastro.Enabled := True;
  DBEditEscolaEndRua.Enabled := True;
  DBEditEscolaEndNumero.Enabled := True;
  DBEditEscolaEndComplemento.Enabled := True;
  DBEditEscolaEndCidade.Enabled := True;
  DBMaskEditEscolaEndCEP.Enabled := True;
  DBEditEscolaEndBairro.Enabled := True;
  DBGridListaEscola.Enabled := False;
  DBEditEscolaNome.SetFocus;
end;

procedure TfrmCadEscola.LimparCampos;
begin
  DBEditEscolaCod.Clear;
  DBEditEscolaNome.Clear;
  DBDateEditEscolaDataCadastro.Clear;
  DBEditEscolaEndRua.Clear;
  DBEditEscolaEndNumero.Clear;
  DBEditEscolaEndComplemento.Clear;
  DBEditEscolaEndCidade.Clear;
  DBMaskEditEscolaEndCEP.Clear;
  DBEditEscolaEndBairro.Clear;
end;

end.

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
    DBEditEscolaEndNumero: TcxDBTextEdit;
    lblEscolaFrmTitulo: TLabel;
    btnEscolaNovoCadastro: TButton;
    btnEscolaGravar: TButton;
    btnEscolaAlterar: TButton;
    btnEscolaExcluir: TButton;
    btnEscolaCancelar: TButton;
    btnEscolaLimpar: TButton;
    DBEditEscolaCod: TcxDBTextEdit;
    btnEscolaPesquisar: TButton;
    DBDateEditEscolaDataCadastro: TcxDBDateEdit;
    DBMaskEditEscolaEndCEP: TcxDBMaskEdit;
    btnEscolaFechar: TButton;
    procedure btnEscolaNovoCadastroClick(Sender: TObject);
    procedure btnEscolaGravarClick(Sender: TObject);
    procedure btnEscolaCancelarClick(Sender: TObject);
    procedure DesabilitarComponentesDados;
    procedure btnEscolaLimparClick(Sender: TObject);
    procedure btnEscolaExcluirClick(Sender: TObject);
    procedure btnEscolaAlterarClick(Sender: TObject);
    procedure btnEscolaPesquisarClick(Sender: TObject);
    procedure DBEditEscolaEndNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AvancarCampo(Sender: TObject; var Key: Char);
    procedure btnEscolaFecharClick(Sender: TObject);
  private
    procedure AtribuicaoCampoData(Sender: TField; const Text: string);
    function HabilitarAlterarExcluirCasoPossuaDados: Boolean;
    { Private declarations }
  public
    { Public declarations }
    FController: TCadastroEscolaController;
    procedure HabilitarComponentesDados;
    procedure LimparCampos;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    function CamposValidados: Boolean;
  end;

var
  frmCadEscola: TfrmCadEscola;

implementation

uses
  unRelEscola, unPesquisaEscola, unEscolaIndex;

{$R *.dfm}

procedure TfrmCadEscola.AfterConstruction;
begin
  inherited;
  FController := TCadastroEscolaController.Create;
end;

procedure TfrmCadEscola.btnEscolaNovoCadastroClick(Sender: TObject);
begin
  fmdados.tbdsEscola.Open;
  fmdados.tbdsEscolaESCDATACAD.OnSetText := AtribuicaoCampoData;
  fmdados.tbdsEscola.Append;
  HabilitarComponentesDados;
  LimparCampos;
  fmdados.tbdsEscolaESCCOD.AsInteger := FController.DevolverUltimoCodigo + 1;
  btnEscolaExcluir.Enabled := False;
  btnEscolaPesquisar.Enabled := False;
  DBDateEditEscolaDataCadastro.Text := FormatDateTime('DD/MM/YYYY', Now);

end;

procedure TfrmCadEscola.btnEscolaAlterarClick(Sender: TObject);
begin  
  fmdados.tbdsEscola.Edit;
  HabilitarComponentesDados;
  btnEscolaExcluir.Enabled := False;
  btnEscolaPesquisar.Enabled := False;
end;

procedure TfrmCadEscola.btnEscolaPesquisarClick(Sender: TObject);
begin
  if not Assigned(frmPesquisaEscola) then
    frmPesquisaEscola := TfrmPesquisaEscola.Create(frmEscolaIndex);
  frmPesquisaEscola.Show;
  Close;
end;

procedure TfrmCadEscola.btnEscolaCancelarClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja cancelar a edi��o deste registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    HabilitarAlterarExcluirCasoPossuaDados;
    fmdados.tbdsEscola.Cancel;
    DesabilitarComponentesDados;
    btnEscolaPesquisar.Enabled := True;
  end;
end;

procedure TfrmCadEscola.btnEscolaExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    fmdados.tbdsEscola.Delete;
    fmdados.tbdsEscola.ApplyUpdates(0);
    fmdados.tbdsEscola.Refresh;
    fmdados.tbdsEscola.Close;
    HabilitarAlterarExcluirCasoPossuaDados;
    ShowMessage('Registro exclu�do com sucesso!');

  end
end;

procedure TfrmCadEscola.btnEscolaFecharClick(Sender: TObject);
begin
  Close;
end;

function TfrmCadEscola.CamposValidados: Boolean;
var
  i: Integer;
  Campos: TStrings;
begin
  Campos := TStringList.Create;
  try
    for i := 0 to fmdados.tbdsEscola.Fields.Count - 1 do
    begin
      if (fmdados.tbdsEscola.Fields[i].Tag = 1) and
        (fmdados.tbdsEscola.Fields[i].AsString = EmptyStr) then
        Campos.Add('- ' + fmdados.tbdsEscola.Fields[i].DisplayName)
    end;
    if (Campos.Count > 0) then
    begin
      Result := False;
      ShowMessage('Preencha os campos obrigat�rios:' + #13 + #13 + Campos.Text);
    end
    else
      Result := True;
  finally
    Campos.Free;
  end;
end;

procedure TfrmCadEscola.btnEscolaGravarClick(Sender: TObject);
begin
  if CamposValidados then
    if MessageDlg('Tem certeza que deseja gravar este registro?', mtConfirmation,
      mbYesNo, 0) = mrYes then
    begin
      fmdados.tbdsEscola.Post;
      fmdados.tbdsEscola.ApplyUpdates(0);
      DesabilitarComponentesDados;
      //VERIFICAR ENABLE DO BOT�O EXCLUIR QUE PERMAECEU ATIVO AP�S GRAVA��O DE NOVO REGISTROs
      btnEscolaExcluir.Enabled := True;
      btnEscolaCancelar.Enabled := False;
      btnEscolaPesquisar.Enabled := True;
      LimparCampos;
      ShowMessage('Registro gravado com sucesso!');
    end
end;

destructor TfrmCadEscola.Destroy;
begin
  FreeAndNil(FController);
  inherited;
end;

procedure TfrmCadEscola.btnEscolaLimparClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja limpar os campos?', mtConfirmation,
    mbYesNo, 0) = mrYes then
    LimparCampos
end;

procedure TfrmCadEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  frmCadEscola := nil;
end;

procedure TfrmCadEscola.FormShow(Sender: TObject);
begin
  HabilitarAlterarExcluirCasoPossuaDados;
end;

function TfrmCadEscola.HabilitarAlterarExcluirCasoPossuaDados: Boolean;
begin
  if fmdados.tbdsEscola.Active then
  begin
    if fmdados.tbdsEscola.Fields[0].AsInteger = (FController.DevolverUltimoCodigo + 1) then
    begin
      btnEscolaAlterar.Enabled := False;
      btnEscolaExcluir.Enabled := False;
      fmdados.tbdsEscola.Close;
      Result := False;
    end
    else
    begin
      btnEscolaAlterar.Enabled := True;
      btnEscolaExcluir.Enabled := True;
      Result := True;
    end;
  end
  else
  begin
    btnEscolaAlterar.Enabled := False;
    btnEscolaExcluir.Enabled := False;
    Result := False;
  end;
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

procedure TfrmCadEscola.DBEditEscolaEndNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
  begin
    AvancarCampo(Sender, Key);
    Key := #0;
  end;
end;

procedure TfrmCadEscola.AvancarCampo(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    Perform(WM_nextdlgctl,0,0)
  else
    if Key = #27 then
      Perform(WM_nextdlgctl,1,0)

end;

procedure TfrmCadEscola.DesabilitarComponentesDados;
begin
  btnEscolaNovoCadastro.Enabled := True;
  btnEscolaGravar.Enabled := False;
  btnEscolaLimpar.Enabled := False;
  btnEscolaCancelar.Enabled := False;
  btnEscolaExcluir.Enabled := False;
  DBEditEscolaCod.Enabled := False;
  DBEditEscolaNome.Enabled := False;
  DBEditEscolaEndRua.Enabled := False;
  DBEditEscolaEndNumero.Enabled := False;
  DBEditEscolaEndComplemento.Enabled := False;
  DBEditEscolaEndCidade.Enabled := False;
  DBMaskEditEscolaEndCEP.Enabled := False;
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
  DBEditEscolaEndRua.Enabled := True;
  DBEditEscolaEndNumero.Enabled := True;
  DBEditEscolaEndComplemento.Enabled := True;
  DBEditEscolaEndCidade.Enabled := True;
  DBMaskEditEscolaEndCEP.Enabled := True;
  DBEditEscolaEndBairro.Enabled := True;
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

unit unFrmPesquisaEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, unPesquisaEscolaController, unRelEscola;

type
  TfrmPesquisaEscola = class(TForm)
    DBGridListaEscola: TDBGrid;
    lblEscolaConsultaOrdenada: TLabel;
    ComboBoxEscolaConsultaOrdenada: TComboBox;
    rgEscolaPesquisar: TRadioGroup;
    dtpEscolaBuscarData: TDateTimePicker;
    edtEscolaBuscarCodigo: TEdit;
    btnEscolaBuscar: TButton;
    lblEscolaTituloLista: TLabel;
    rgImpressao: TRadioGroup;
    btnEscolaImprimir: TButton;
    btnEscolaNovoCadastro: TButton;
    btnEscolaConsultaFechar: TButton;
    procedure DBGridListaEscolaDblClick(Sender: TObject);
    procedure btnEscolaBuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtpEscolaBuscarDataKeyPress(Sender: TObject; var Key: Char);
    procedure edtEscolaBuscarCodigoChange(Sender: TObject);
    procedure edtEscolaBuscarCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxEscolaConsultaOrdenadaChange(Sender: TObject);
    procedure btnEscolaImprimirClick(Sender: TObject);
    procedure rgEscolaPesquisarClick(Sender: TObject);
    procedure btnEscolaNovoCadastroClick(Sender: TObject);
    procedure btnEscolaConsultaFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FControladorEscola: TPesquisaEscolaController;
    procedure ConsultaOrdenada(AIndiceComboBox: Integer);
    procedure SetControladorEscola(const Value: TPesquisaEscolaController);

  public
    FRelatorio: TfrmRelEscola;

    procedure AfterConstruction; override;
    destructor Destroy; override;

    property ControladorEscola: TPesquisaEscolaController read FControladorEscola write SetControladorEscola;
  end;

var
  frmPesquisaEscola: TfrmPesquisaEscola;

implementation

uses
  unFrmPrincipal, unFrmCadEscola;

{$R *.dfm}
//M�todo executado logo depois do Construtor
procedure TfrmPesquisaEscola.AfterConstruction;
begin
  inherited;
  ControladorEscola := TPesquisaEscolaController.Create; //Inst�ncia da Classe Controller
end;
//(BOT�O IMPRIMIR)
procedure TfrmPesquisaEscola.btnEscolaImprimirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmRelEscola, frmRelEscola);
  if rgImpressao.ItemIndex = 0 then
    frmRelEscola.RLReportEscola.Preview()
  else
    frmRelEscola.RLReportEscola.Print
end;
//(BOT�O NOVO CADASTRO)
procedure TfrmPesquisaEscola.btnEscolaNovoCadastroClick(Sender: TObject);
begin
  if not Assigned(frmCadEscola) then //Verifica se o Form CADASTRO ESCOLA est� FECHADO para ser CRIADO
    frmCadEscola := TfrmCadEscola.Create(frmPrincipal);
  frmCadEscola.Show;
  frmCadEscola.btnEscolaNovoCadastroClick(Sender); //Evento do bot�o NOVO CADASTRO do Form CADASTRO ESCOLA
  Close;
end;

procedure TfrmPesquisaEscola.FormShow(Sender: TObject);
begin
  rgEscolaPesquisar.SetFocus; //Inicia o Form setado a op��o de CONSULTA POR C�DIGO
  dtpEscolaBuscarData.DateTime := StrToDateTime(FormatDateTime('DD/MM/YYYY', Now)); //Seta data atual do SO
end;
//(COMBOBOX 'ORDENAR POR')
procedure TfrmPesquisaEscola.ComboBoxEscolaConsultaOrdenadaChange(
  Sender: TObject);
begin
  ConsultaOrdenada(ComboBoxEscolaConsultaOrdenada.ItemIndex); //M�todo ordenador conforme a sele��o da COMBOBOX
end;
//M�todo para ordena��o da lista de consulta por C�DIGO, DESCRI��O ou DATA DE CADASTRO
procedure TfrmPesquisaEscola.ConsultaOrdenada(AIndiceComboBox: Integer);
begin
  ControladorEscola.ConsultaOrdenada(AIndiceComboBox);
end;
//(BOT�O PESQUISAR)
procedure TfrmPesquisaEscola.btnEscolaBuscarClick(Sender: TObject);
begin
  ControladorEscola.AbrirConexaoClientDS;
  ControladorEscola.DesabilitarFilteredClientDS; //Desabilita filtro
  if rgEscolaPesquisar.ItemIndex = 0 then //Verifica se RadioButton selecionado para consulta � o C�DIGO
  begin
    edtEscolaBuscarCodigo.SelectAll; //Selecionar todo conte�do uqe Edit C�digo possuir
    if (edtEscolaBuscarCodigo.Text = '') then
    begin
      ControladorEscola.DesabilitarFilteredClientDS;;
      ControladorEscola.CarregarTodosRegistrosClientDS; //Exibe todos os registros se a consulta for vazia
      ControladorEscola.HabilitarFilteredClientDS; //Habilita filtro
    end
    else
    begin
      if not ControladorEscola.CarregarConsultaClientDS('ESCCOD', edtEscolaBuscarCodigo.Text) then
        ShowMessage('Registro n�o localizado. Verifique o c�digo digitado e tente novamente.')
    end;
    edtEscolaBuscarCodigo.SetFocus; //Sempre ser� setado foco ap�s a consulta por C�DIGO
  end
  else
  begin
    if not ControladorEscola.CarregarConsultaClientDS('ESCDATACAD',
      FormatDateTime('DD/MM/YYYY', dtpEscolaBuscarData.Date)) then
      ShowMessage('Registro n�o localizado. Verifique a data consultada e tente novamente.');

    dtpEscolaBuscarData.SetFocus; //Sempre ser� setado foco ap�s a consulta por DATA
  end;
end;
//(BOT�O TELA PRINCIPAL)
procedure TfrmPesquisaEscola.btnEscolaConsultaFecharClick(Sender: TObject);
begin
  Close;
end;
//Evento Click do DBGRID. Fecha o Form atual para abrir o Form CADASTRO ESCOLA
procedure TfrmPesquisaEscola.DBGridListaEscolaDblClick(Sender: TObject);
begin
  if not Assigned(frmCadEscola) then //Verifica se o Form CADASTRO ESCOLA est� FECHADO para ser CRIADO
    frmCadEscola := TfrmCadEscola.Create(frmPrincipal);
  Close;
  frmCadEscola.Show;
  frmCadEscola.CarregarEscola;
  ControladorEscola.AbrirConexaoClientDS; //Certifica se manter a conex�o aberta para que o dado clicado seja consultado
end;
//Evento para click do ENTER no campo de consulta por DATA DE CADASTRO
procedure TfrmPesquisaEscola.dtpEscolaBuscarDataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    btnEscolaBuscarClick(Sender)
end;
//Evento para carregar todos os registros quando limpar conte�do do Edit
procedure TfrmPesquisaEscola.edtEscolaBuscarCodigoChange(Sender: TObject);
begin
  if (edtEscolaBuscarCodigo.Text = EmptyStr) then
    ControladorEscola.DesabilitarFilteredClientDS;
end;
//Evento para permitir somente n�meros e click do ENTER no campo de consulta por C�DIGO
procedure TfrmPesquisaEscola.edtEscolaBuscarCodigoKeyPress(Sender: TObject;
  var Key: Char);
var
  keyAux: Char;
begin
  keyAux := Key; //Vari�vel auxiliar para fazer nova verifica��o depois de ser limpado na primeira verifica��o
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
  dtpEscolaBuscarDataKeyPress(Sender, KeyAux); //M�todo permite a��o da tecla ENTER
end;
//Habilitar campos de consulta C�DIGO ou DATA DE CADASTRO conforme sele��o correspondente dos RadioButtons
procedure TfrmPesquisaEscola.rgEscolaPesquisarClick(Sender: TObject);
begin
  if rgEscolaPesquisar.ItemIndex = 0 then //ItemIndex = 0 = C�digo
  begin
    edtEscolaBuscarCodigo.Enabled := True;
    dtpEscolaBuscarData.Enabled := False;
  end
  else
  begin
    dtpEscolaBuscarData.Enabled := True;
    edtEscolaBuscarCodigo.Enabled := False;
  end;
end;

procedure TfrmPesquisaEscola.SetControladorEscola(const Value: TPesquisaEscolaController);
begin
  FControladorEscola := Value;
end;

procedure TfrmPesquisaEscola.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Release; //Libera o Form da mem�ria permitindo a execu��o da fila antes que receba o Free
  frmPesquisaEscola := nil;
end;

destructor TfrmPesquisaEscola.Destroy;
begin
  inherited;
  FreeAndNil(FControladorEscola);
end;
end.

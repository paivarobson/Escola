unit unEscolaModelo;

interface

uses
  SysUtils, unEnumerado, Classes, Dialogs, DBClient;

type
  TEscolaModelo = class
  private

    FCodigo: Integer;
    FNome: string;
    FDataCadastro: TDateTime;
    FCep: string;
    FRua: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCidade: string;
    FAcao: TAcao;
    procedure SetCodigo(const Valor: Integer);
    procedure SetNome(const Valor: string);
    procedure SetDataCadastro(const Valor: TDateTime);
    procedure SetCep(const Valor: string);
    procedure SetRua(const Valor: string);
    procedure SetNumero(const Valor: string);
    procedure SetComplemento(const Valor: string);
    procedure SetBairro(const Valor: string);
    procedure SetCidade(const Valor: string);
    procedure SetAcao(const Value: TAcao);

    function GetCodigo: Integer;
    function GetNome: string;
    function GetDataCadastro: TDateTime;
    function GetCep: string;
    function GetRua: string;
    function GetNumero: string;
    function GetComplemento: string;
    function GetBairro: string;
    function GetCidade: string;



  public
    constructor Create;
    destructor Destroy; override;

    procedure Carregar(ACodigo: Integer);
    procedure NovoCadastroClientDS;
    procedure CancelarEdicaoClientDS;
    procedure AlterarClientDS;
    procedure ExcluirClientDS;
    procedure GravarEscolaClientDS;
    procedure LimparCampos;
    procedure LimparDadosClient;

    function ObterClientDS: TClientDataSet;
    function DevolverUltimoCodigo: Integer;
    function CarregarDadosParaClientDS: Boolean;
    function ValidarCampos: Boolean;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
    property DataCadastro: TDateTime read GetDataCadastro write SetDataCadastro;
    property Cep: string read GetCep write SetCep;
    property Rua: string read GetRua write SetRua;
    property Numero: string read GetNumero write SetNumero;
    property Complemento: string read GetComplemento write SetComplemento;
    property Bairro: string read GetBairro write SetBairro;
    property Cidade: string read GetCidade write SetCidade;
    property Acao: TAcao read FAcao write SetAcao;

    function Gravar: Boolean;
  end;


implementation

uses
  unEscolaDAO;
var
  FEscolaDao: TEscolaDAO = nil;

procedure TEscolaModelo.AlterarClientDS;
begin
  FEscolaDao.AlterarEscolaClientDS;
end;

procedure TEscolaModelo.CancelarEdicaoClientDS;
begin
  FEscolaDao.CancelarEdicaoClientDS;
end;

procedure TEscolaModelo.Carregar(ACodigo: Integer);
begin
  FEscolaDao.Carregar(Self, ACodigo);
end;

constructor TEscolaModelo.Create;
begin
  FEscolaDAO := TEscolaDAO.Create;
end;

destructor TEscolaModelo.Destroy;
begin
  FreeAndNil(FEscolaDao);
  inherited;
end;

function TEscolaModelo.DevolverUltimoCodigo: Integer;
begin
  Result := FEscolaDao.DevolverUltimoCodigo;
end;

procedure TEscolaModelo.ExcluirClientDS;
begin
  FEscolaDao.ExcluirClientDS;
end;

procedure TEscolaModelo.SetCodigo(const Valor: Integer);
begin
  FCodigo := Valor;
end;

procedure TEscolaModelo.SetNome(const Valor: string);
begin
  FNome := Valor;
end;

procedure TEscolaModelo.SetCep(const Valor: string);
begin
  FCep := Valor;
end;

procedure TEscolaModelo.SetDataCadastro(const Valor: TDateTime);
begin
  FDataCadastro := Valor;
end;

procedure TEscolaModelo.SetRua(const Valor: string);
begin
  FRua := Valor;
end;

function TEscolaModelo.ValidarCampos: Boolean;
begin
  Result := FEscolaDao.ValidarCampos;
end;

procedure TEscolaModelo.SetNumero(const Valor: string);
begin
  FNumero := Valor;
end;

procedure TEscolaModelo.SetComplemento(const Valor: string);
begin
  FComplemento := Valor;
end;

procedure TEscolaModelo.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;

procedure TEscolaModelo.SetBairro(const Valor: string);
begin
  FBairro := Valor;
end;

procedure TEscolaModelo.SetCidade(const Valor: string);
begin
  FCidade := Valor;
end;

function TEscolaModelo.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TEscolaModelo.GetNome: string;
begin
  Result := FNome;
end;

function TEscolaModelo.GetDataCadastro: TDateTime;
begin
  Result := FDataCadastro;
end;

function TEscolaModelo.GetRua: string;
begin
  Result := FRua;
end;

procedure TEscolaModelo.GravarEscolaClientDS;
begin
  FEscolaDao.GravarEscolaClientDS;
end;

function TEscolaModelo.Gravar: Boolean;
begin
  Result := FEscolaDao.Gravar(Self);
end;

procedure TEscolaModelo.LimparCampos;
begin
  Nome := '';
  Cep := '';
  Rua := '';
  Numero := '';
  Complemento := '';
  Bairro := '';
  Cidade := '';
end;

procedure TEscolaModelo.LimparDadosClient;
begin
  FEscolaDao.LimparDadosClient;
end;

function TEscolaModelo.CarregarDadosParaClientDS: Boolean;
begin
  Result := FEscolaDao.Gravar(Self);
end;

procedure TEscolaModelo.NovoCadastroClientDS;
begin
  FEscolaDao.NovoCadastroClientDS;
end;

function TEscolaModelo.ObterClientDS: TClientDataSet;
begin
  Result := FEscolaDao.ClientDS;
end;

function TEscolaModelo.GetNumero: string;
begin
  Result := FNumero;
end;

function TEscolaModelo.GetComplemento: string;
begin
  Result := FComplemento;
end;

function TEscolaModelo.GetBairro: string;
begin
  Result := FBairro;
end;

function TEscolaModelo.GetCep: string;
begin
  Result := FCep;
end;

function TEscolaModelo.GetCidade: string;
begin
  Result := FCidade;
end;

end.
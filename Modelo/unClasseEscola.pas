unit unClasseEscola;

interface

uses SysUtils;

type
  TEscola = class
  private
    FEscola: TEscola;
    FCodigo: Integer;
    FNome: string;
    FDataCadastro: TDateTime;
    FRua: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCidade: string;

    procedure SetCodigo(const Valor: Integer);
    procedure SetNome(const Valor: string);
    procedure SetDataCadastro(const Valor: TDateTime);
    procedure SetRua(const Valor: string);
    procedure SetNumero(const Valor: string);
    procedure SetComplemento(const Valor: string);
    procedure SetBairro(const Valor: string);
    procedure SetCidade(const Valor: string);
    
    function GetCodigo: Integer;
    function GetNome: string;
    function GetDataCadastro: TDateTime;
    function GetRua: string;
    function GetNumero: string;
    function GetComplemento: string;
    function GetBairro: string;
    function GetCidade: string;

  public
    constructor Create;
    destructor Destroy; override;
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
    property DataCadastro: TDateTime read GetDataCadastro write SetDataCadastro;
    property Rua: string read GetRua write SetRua;
    property Numero: string read GetNumero write SetNumero;
    property Complemento: string read GetComplemento write SetComplemento;
    property Bairro: string read GetBairro write SetBairro;
    property Cidade: string read GetCidade write SetCidade;
  end;

implementation

constructor TEscola.Create;
begin
  FEscola := TEscola.Create;
end;

destructor TEscola.Destroy;
begin
  FreeAndNil(FEscola);
  inherited;
end;

procedure TEscola.SetCodigo(const Valor: Integer);
begin
  FCodigo := Valor;
end;

procedure TEscola.SetNome(const Valor: string);
begin
  FNome := Valor;
end;

procedure TEscola.SetDataCadastro(const Valor: TDateTime);
begin
  FDataCadastro := Valor;
end;
procedure TEscola.SetRua(const Valor: string);
begin
  FRua := Valor;
end;

procedure TEscola.SetNumero(const Valor: string);
begin
  FNumero := Valor;
end;

procedure TEscola.SetComplemento(const Valor: string);
begin
  FComplemento := Valor;
end;

procedure TEscola.SetBairro(const Valor: string);
begin
  FBairro := Valor;
end;
procedure TEscola.SetCidade(const Valor: string);
begin
  FCidade := Valor;
end;

function TEscola.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TEscola.GetNome: string;
begin
  Result := FNome;
end;

function TEscola.GetDataCadastro: TDateTime;
begin
  Result := FDataCadastro;
end;

function TEscola.GetRua: string;
begin
  Result := FRua;
end;

function TEscola.GetNumero: string;
begin
  Result := FNumero;
end;

function TEscola.GetComplemento: string;
begin
  Result := FComplemento;
end;

function TEscola.GetBairro: string;
begin
  Result := FBairro;
end;

function TEscola.GetCidade: string;
begin
  Result := FCidade;
end;

end.

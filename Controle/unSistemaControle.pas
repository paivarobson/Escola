unit unSistemaControle;

interface

uses
  unConexao, SysUtils, SqlExpr, unEscolaModelo, unCadEscolaController;

type
  TSistemaControle = class
  private
    FConexao     : TConexao;
    FEscolaModelo: TEscolaModelo;

    class var FInstancia: TSistemaControle;
    class procedure LiberarInstancia();
  public
    constructor Create();
    destructor Destroy; override;

    class function GetInstancia: TSistemaControle;

    property Conexao: TConexao read FConexao write FConexao;
    property EscolaModelo: TEscolaModelo read FEscolaModelo write FEscolaModelo;
  end;

implementation

{ TSistemaControle }

constructor TSistemaControle.Create;
begin
//  FConexao := TConexao.Create;
//  FControlador := TCadEscolaController.Create; //Instanciar controlador de Cadastro Escola
  FEscolaModelo := TEscolaModelo.Create;
end;

destructor TSistemaControle.Destroy;
begin
  FreeAndNil(FEscolaModelo);
//  FreeAndNil(FControlador);
  inherited;
end;

class function TSistemaControle.GetInstancia: TSistemaControle;
begin
  if not Assigned(Self.FInstancia) then
    Self.FInstancia := TSistemaControle.Create();

  Result := Self.FInstancia;
end;

class procedure TSistemaControle.LiberarInstancia;
begin
  if Assigned(Self.FInstancia) then
    Self.FInstancia.Free;
end;

initialization
finalization
  TSistemaControle.LiberarInstancia();

end.
unit unConexao;

interface

uses
  SqlExpr, SysUtils, Provider;

type
  TConexao = class
  private
    FConnection: TSQLConnection;
    FQuery: TSQLQuery;

    procedure ConfigurarConexao;
    procedure SetQuery(const Value: TSQLQuery);
  public
    constructor Create;
    destructor Destroy; override;

    function CriarQuery: TSQLQuery;
    function CriarProvider: TDataSetProvider;

    function GetConnection: TSQLConnection;
    property Query: TSQLQuery read FQuery write SetQuery;
  end;

implementation

{ TConexao }

procedure TConexao.ConfigurarConexao;
begin
  FConnection.ConnectionName := 'MSSQLConnection';
  FConnection.DriverName := 'MSSQL';
  FConnection.GetDriverFunc := 'getSQLDriverMSSQL';
  FConnection.LibraryName := 'dbxmss30.dll';
  FConnection.Params.Values['SchemaOverride'] := 'sa.dbo';
  FConnection.Params.Values['HostName'] := 'NCDEV28';
  FConnection.Params.Values['DataBase'] := 'ESCOLA';
  FConnection.Params.Values['User_Name'] := 'sa';
  FConnection.Params.Values['Password'] := 'fcm123';
  FConnection.VendorLib := 'oledb';
  FConnection.LoginPrompt := False;
  FConnection.Connected := True;
end;
              
constructor TConexao.Create;
begin
  FConnection := TSQLConnection.Create(nil);

  Self.ConfigurarConexao();
end;

function TConexao.CriarProvider: TDataSetProvider;
var
  VProvider: TDataSetProvider;
begin
  VProvider := TDataSetProvider.Create(nil);
  VProvider.DataSet := CriarQuery;
  VProvider.Name := 'dspAluno';
  VProvider.Options:=[poAllowCommandText];

  Result := VProvider;
end;

function TConexao.CriarQuery: TSQLQuery;
var
  VQuery: TSQLQuery;
begin
  VQuery := TSQLQuery.Create(nil);
  VQuery.SQLConnection := FConnection;
//  VQuery.SQL.Text := 'select * from aluno';
//  VQuery.Open;

  Result := VQuery;
end;

destructor TConexao.Destroy;
begin
  FreeAndNil(FConnection);
  inherited;
end;

function TConexao.GetConnection: TSQLConnection;
begin
  Result := FConnection;
end;

procedure TConexao.SetQuery(const Value: TSQLQuery);
begin
  FQuery := Value;
end;

end.
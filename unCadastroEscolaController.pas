unit unCadastroEscolaController;

interface

uses DB, DBClient, SqlExpr, Windows, Dialogs, SysUtils, DateUtils;

type
  TDadosEscola = record
    Codigo: Integer;
    Nome: string;
    DataCadastro: string;
    CEP: string;
    Rua: string;
    Numero: string;
    Complemento: string;
    Bairro: string;
    Cidade: string;
  end;

  TCadastroEscolaController = class
  public
    function Gravar(ADadosEscola: TDadosEscola): string;
    procedure CarregarEscola(const AFontesDados: TSQLQuery);
  end;

implementation

uses
  unDados;

{ TCadastroEscolaController }
procedure TCadastroEscolaController.CarregarEscola(const AFontesDados: TSQLQuery);
begin
  AFontesDados.SQLConnection := fmdados.conexaoBDEscola;
  AFontesDados.SQL.Clear;
  AFontesDados.SQL.Add('select * from escola');
end;

function TCadastroEscolaController.Gravar(ADadosEscola: TDadosEscola): string;
var
  FQuery: TSQLQuery;
begin
  FQuery := TSQLQuery.Create(nil);
  try
    FQuery.SQLConnection := fmdados.conexaoBDEscola;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(Format(
        'INSERT INTO ESCOLA ' +
        '       (ESCNOME ' +
        '       ,ESCDATACAD ' +
        '       ,ESCENDRUA ' +
        '       ,ESCENDNUM ' +
        '       ,ESCENDCOMP ' +
        '       ,ESCENDBAIRRO ' +
        '       ,ESCENDCIDADE ' +
        '       ,ESCENDCEP) ' +
        ' VALUES ' +
        '       (%d, ''%s'', ''%s'', ''%s'', %s, ''%s'', ''%s'', ''%s'', ''%s'') ',
        [ADadosEscola.Nome, ADadosEscola.DataCadastro,
         ADadosEscola.Rua, ADadosEscola.Numero, ADadosEscola.Complemento, ADadosEscola.Bairro,
         ADadosEscola.Cidade, ADadosEscola.CEP]));
    if FQuery.ExecSQL(True) = 1 then
    begin
      FQuery.SQL.Clear;
      FQuery.SQL.Add('select max(ESCCOD) as codigo from escola');
      FQuery.Open;
      if FQuery.RecordCount > 0 then
        Result := FQuery.Fields[0].AsString;
    end
    else
      raise Exception.Create('Erro ao criar uma escola');
  finally
    FreeAndNil(FQuery);
  end;

end;

end.
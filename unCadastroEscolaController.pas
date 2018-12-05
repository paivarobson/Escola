unit unCadastroEscolaController;

interface

uses DB, DBClient, SqlExpr, Windows, Dialogs, SysUtils, DateUtils;

type
  TDadosEscola = record
    Nome: string;
    DataCadastro: TDateTime;
    CEP: string;
    Rua: string;
    Numero: Integer;
    Complemento: string;
    Bairro: string;
    Cidade: string;
  end;

  TCadastroEscolaController = class
  public
    function Gravar(ADadosEscola: TDadosEscola): string;
    procedure CarregarEscola(AFontesDados: TSQLQuery);
  end;

implementation

uses
  unDados;

{ TCadastroEscolaController }
procedure TCadastroEscolaController.CarregarEscola(AFontesDados: TSQLQuery);

begin

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
        '       (''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s'', ''%s'') ',
        [ADadosEscola.Nome, FormatDateTime('YYYY/MM/DD HH:MM:SS', ADadosEscola.DataCadastro),
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

unit unCadastroEscolaController;

interface

uses DB, DBClient, SqlExpr, Windows, Dialogs, SysUtils, DateUtils, StdCtrls;

type
  TDadosEscola = record
    Codigo: Integer;
    Nome: string;
    DataCadastro: TDateTime;
    CEP: string;
    Rua: string;
    Numero: string;
    Complemento: string;
    Bairro: string;
    Cidade: string;
  end;

  TCadastroEscolaController = class
  public
//    function Gravar(ADadosEscola: TDadosEscola): string;
    procedure CarregarEscola(const AFontesDados: TSQLQuery);
    function DevolverUltimoCodigo: Integer;
    procedure ConsultaEscola(ACampo: string; ADadoConsulta: string);
  end;

implementation

uses
  unDados;

{ TCadastroEscolaController }
procedure TCadastroEscolaController.CarregarEscola(const AFontesDados: TSQLQuery);
begin
  AFontesDados.SQLConnection := fmdados.conexaoBDEscola;
  AFontesDados.SQL.Clear;
  AFontesDados.SQL.Add('SELECT * FROM ESCOLA');
end;

function TCadastroEscolaController.DevolverUltimoCodigo: Integer;
begin
  fmdados.tbAux.Close;
  fmdados.tbAux.SQL.Clear;

  fmdados.tbAux.SQL.Text := 'SELECT MAX(ESCCOD) FROM ESCOLA';
  fmdados.tbAux.Open;
  Result := fmdados.tbAux.Fields[0].AsInteger;
end;

procedure TCadastroEscolaController.ConsultaEscola(ACampo: string; ADadoConsulta: string);
var
  AConsultaSQL: TSQLQuery;
begin
  AConsultaSQL := TSQLQuery.Create(nil);
  AConsultaSQL.SQLConnection := fmdados.conexaoBDEscola;
  AConsultaSQL.SQL.Clear;
  AConsultaSQL.SQL.Add('SELECT * FROM ESCOLA');
  //AConsultaSQL.ParamByName('pACampo').AsString := ACampo;
  //if StrToIntDef(ADadoConsulta, 0) = 0 then
    //AConsultaSQL.ParamByName('pADadoConsulta').AsDate := StrToDate(ADadoConsulta)
  //else
   // AConsultaSQL.ParamByName('pADadoConsulta').AsInteger := StrToInt(ADadoConsulta);

  //if CAMPO 1 PREENCHDIO then
  AConsultaSQL.Open;
  AConsultaSQL.Filtered := False;
  AConsultaSQL.Filter := ACampo + ' = ' + ADadoConsulta;
  AConsultaSQL.Filtered := True;
  FreeAndNil(AConsultaSQL);
end;



//function TCadastroEscolaController.Gravar(ADadosEscola: TDadosEscola): string;
//var
//  FQuery: TSQLQuery;
//begin
//  FQuery := TSQLQuery.Create(nil);
//  try
//   // ADadosEscola.Codigo :=
//    FQuery.SQLConnection := fmdados.conexaoBDEscola;
//    FQuery.SQL.Clear;
//    FQuery.SQL.Add(Format(
//        'INSERT INTO ESCOLA ' +
//          '(ESCNOME, ' +
//          'ESCDATACAD, ' +
//          'ESCENDRUA, ' +
//          'ESCENDNUM, ' +
//          'ESCENDCOMP, ' +
//          'ESCENDBAIRRO, ' +
//          'ESCENDCIDADE, ' +
//          'ESCENDCEP) ' +
//        ' VALUES ' +
//        '       (''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'') ',
//        [ADadosEscola.Nome, ADadosEscola.DataCadastro,
//         ADadosEscola.Rua, ADadosEscola.Numero, ADadosEscola.Complemento, ADadosEscola.Bairro,
//         ADadosEscola.Cidade, ADadosEscola.CEP]));
//    if FQuery.ExecSQL(True) = 1 then
//    begin
//      FQuery.SQL.Clear;
//      FQuery.SQL.Add('SELECT MAX(ESCCOD) AS CODIGO FROM ESCOLA');
//      FQuery.Open;
//      if FQuery.RecordCount > 0 then
//        Result := FQuery.Fields[0].AsString;
//    end
//    else
//      raise Exception.Create('Erro ao criar uma escola');
//  finally
//    FreeAndNil(FQuery);
//  end;
//
//end;

end.

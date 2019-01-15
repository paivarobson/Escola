unit unEscolaDAO;

interface

uses
  unEscolaModelo, unDados, SqlExpr, SysUtils, unSistemaControle, DBClient;

type
  TEscolaDAO = class
    FDataModule: Tfmdados;

  public
    procedure Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
    function Inserir(AEscolaModelo: TEscolaModelo): Boolean;
    procedure LimparDadosClient;

  end;

implementation

{ TEscolaDAO }

procedure TEscolaDAO.Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
var
  VQuery: TSQLQuery;
  VClientDS: TClientDataSet;
begin
  VQuery := fmdados.tbEscola;
  VClientDS := fmdados.cdsEscola;
  try
    VQuery.SQL.Text := Format('SELECT ' +
                 'ESCCOD, ' +
                 'ESCNOME, ' +
                 'ESCDATACAD, ' +
                 'ESCENDCEP, ' +
                 'ESCENDRUA, ' +
                 'ESCENDNUM, ' +
                 'ESCENDCOMP, ' +
                 'ESCENDBAIRRO, ' +
                 'ESCENDCIDADE ' +
               'FROM ' +
                 'ESCOLA ' +
               'WHERE ESCCOD = %d',
               [ACodigo]);
    VClientDS.Open;
    try
      AEscolaModelo.Codigo       := VClientDS.Fields[0].AsInteger;
      AEscolaModelo.Nome         := VClientDS.Fields[1].AsString;
      AEscolaModelo.DataCadastro := VClientDS.Fields[2].AsDateTime;
      AEscolaModelo.Cep          := VClientDS.Fields[3].AsString;
      AEscolaModelo.Rua          := VClientDS.Fields[4].AsString;
      AEscolaModelo.Numero       := VClientDS.Fields[5].AsString;
      AEscolaModelo.Complemento  := VClientDS.Fields[6].AsString;
      AEscolaModelo.Bairro       := VClientDS.Fields[7].AsString;
      AEscolaModelo.Cidade       := VClientDS.Fields[8].AsString;
    finally
      VClientDS.Close;
    end;
  finally
    FreeAndNil(VClientDS);
  end;
end;

function TEscolaDAO.Inserir(AEscolaModelo: TEscolaModelo): Boolean;
var
  VClientDS: TClientDataSet;
begin
  VClientDS := fmdados.cdsEscola;
  try
    VClientDS.Open;
    VClientDS.Append;

    VClientDS.FieldByName('ESCCOD').AsInteger := AEscolaModelo.Codigo;
    VClientDS.FieldByName('ESCNOME').AsString := AEscolaModelo.Nome;
    VClientDS.FieldByName('ESCDATACAD').AsDateTime := AEscolaModelo.DataCadastro;
    VClientDS.FieldByName('ESCENDCEP').AsString := AEscolaModelo.Cep;
    VClientDS.FieldByName('ESCENDRUA').AsString := AEscolaModelo.Rua;
    VClientDS.FieldByName('ESCENDNUM').AsString := AEscolaModelo.Numero;
    VClientDS.FieldByName('ESCENDCOMP').AsString := AEscolaModelo.Complemento;
    VClientDS.FieldByName('ESCENDBAIRRO').AsString := AEscolaModelo.Bairro;
    VClientDS.FieldByName('ESCENDCIDADE').AsString := AEscolaModelo.Cidade;

    VClientDS.Post;

    Result := True;
  finally
    FreeAndNil(VClientDS);
  end;
end;

procedure TEscolaDAO.LimparDadosClient;
begin
  fmdados.cdsEscola.ClearFields;
end;

end.

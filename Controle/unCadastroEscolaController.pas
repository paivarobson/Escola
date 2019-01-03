unit unCadastroEscolaController;

interface

uses
  DB, DBClient, SqlExpr, Windows, Dialogs, SysUtils, DateUtils, StdCtrls,
  Messages;

type
    TCadastroEscolaController = class
  public
    function DevolverUltimoCodigo: Integer;
    function DadosCDS: TClientDataSet;
    function DadosFieldCodigo: TIntegerField;
    function DadosFieldData: TSQLTimeStampField;
    procedure LimparFieldsCDS;
    procedure NovoCadastroEscola;
    procedure GravarEscola;
    procedure ExcluirEscola;
    procedure CancelarEdicaoEscola;
  end;

implementation

uses
  unDados, unClasseEscola;

procedure TCadastroEscolaController.NovoCadastroEscola;
begin
  fmdados.NovoCadastro;
end;
//M�todo GRAVAR
procedure TCadastroEscolaController.GravarEscola;
begin
  fmdados.Gravar;
end;
//M�todo CANCELAR
procedure TCadastroEscolaController.CancelarEdicaoEscola;
begin
  fmdados.CancelarEdicao;
end;
//M�todo EXCLUIR
procedure TCadastroEscolaController.ExcluirEscola;
begin
  fmdados.Excluir;
end;
//M�todo para o uso do ClientDataSet externamente
function TCadastroEscolaController.DadosCDS: TClientDataSet;
begin
  Result := fmdados.tbdsEscola;
end;

function TCadastroEscolaController.DadosFieldCodigo: TIntegerField;
begin
  Result := fmdados.tbdsEscolaESCCOD;
end;

function TCadastroEscolaController.DadosFieldData: TSQLTimeStampField;
begin
  Result := fmdados.tbdsEscolaESCDATACAD;
end;
//M�todo para limpar os dados direto no ClientDataSet
procedure TCadastroEscolaController.LimparFieldsCDS;
begin
  fmdados.tbdsEscolaESCNOME.Clear;
  fmdados.tbdsEscolaESCENDCEP.Clear;
  fmdados.tbdsEscolaESCENDRUA.Clear;
  fmdados.tbdsEscolaESCENDNUM.Clear;
  fmdados.tbdsEscolaESCENDCOMP.Clear;
  fmdados.tbdsEscolaESCENDBAIRRO.Clear;
  fmdados.tbdsEscolaESCENDCIDADE.Clear;
end;
//M�todo verificador do �ltimo C�DIGO registrado no BD 
function TCadastroEscolaController.DevolverUltimoCodigo: Integer;
begin
  fmdados.tbAux.Close;
  fmdados.tbAux.SQL.Clear;
  fmdados.tbAux.SQL.Text := 'SELECT MAX(ESCCOD) FROM ESCOLA';
  fmdados.tbAux.Open;
  Result := fmdados.tbAux.Fields[0].AsInteger;
end;
end.
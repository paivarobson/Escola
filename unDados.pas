unit unDados;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr;

type
  Tfmdados = class(TDataModule)
    conexaoBDEscola: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    function GetConexaoDB: TSQLConnection;
    { Private declarations }
  public
    { Public declarations }
    property ConexaoDB: TSQLConnection read GetConexaoDB;
  end;

var
  fmdados: Tfmdados;

implementation

{$R *.dfm}

procedure Tfmdados.DataModuleCreate(Sender: TObject);
begin
  conexaoBDEscola.Connected := True;
end;

procedure Tfmdados.DataModuleDestroy(Sender: TObject);
begin
  conexaoBDEscola.Connected := False;
end;

function Tfmdados.GetConexaoDB: TSQLConnection;
begin
  Result := conexaoBDEscola
end;

end.
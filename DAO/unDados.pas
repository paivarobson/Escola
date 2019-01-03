unit unDados;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, FMTBcd, Provider, DBClient,
  DBTables;

type
  Tfmdados = class(TDataModule)
    FConexaoBDEscola: TSQLConnection;
    dspEscola: TDataSetProvider;
    tbdsEscola: TClientDataSet;
    dsEscola: TDataSource;
    tbEscola: TSQLQuery;
    tbAux: TSQLQuery;
    tbEscolaESCCOD: TIntegerField;
    tbEscolaESCNOME: TStringField;
    tbEscolaESCENDRUA: TStringField;
    tbEscolaESCENDNUM: TStringField;
    tbEscolaESCENDCOMP: TStringField;
    tbEscolaESCENDBAIRRO: TStringField;
    tbEscolaESCENDCIDADE: TStringField;
    tbEscolaESCENDCEP: TStringField;
    tbdsEscolaESCCOD: TIntegerField;
    tbdsEscolaESCNOME: TStringField;
    tbdsEscolaESCENDRUA: TStringField;
    tbdsEscolaESCENDNUM: TStringField;
    tbdsEscolaESCENDCOMP: TStringField;
    tbdsEscolaESCENDBAIRRO: TStringField;
    tbdsEscolaESCENDCIDADE: TStringField;
    tbEscolaESCDATACAD: TSQLTimeStampField;
    tbdsEscolaESCDATACAD: TSQLTimeStampField;
    tbdsEscolaESCENDCEP: TStringField;
    tbEscolaConsultar: TSQLQuery;

  private
    function GetConexaoBDEscola: TSQLConnection;
    { Private declarations }
  public
    { Public declarations }
    property ConexaoBDEscola: TSQLConnection read GetConexaoBDEscola;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  end;

var
  fmdados: Tfmdados;

implementation

uses
  UnCadEscola;

{$R *.dfm}

procedure Tfmdados.DataModuleCreate(Sender: TObject);
begin
  FConexaoBDEscola.Connected := True;
end;

procedure Tfmdados.DataModuleDestroy(Sender: TObject);
begin
  FConexaoBDEscola.Connected := False;
end;

function Tfmdados.GetConexaoBDEscola: TSQLConnection;
begin
  Result := FConexaoBDEscola;
end;

end.

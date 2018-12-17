unit unDados;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, FMTBcd, Provider, DBClient,
  DBTables;

type
  Tfmdados = class(TDataModule)
    conexaoBDEscola: TSQLConnection;
    dspEscola: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
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
    ClientDataSet1ESCCOD: TIntegerField;
    ClientDataSet1ESCNOME: TStringField;
    ClientDataSet1ESCENDRUA: TStringField;
    ClientDataSet1ESCENDNUM: TStringField;
    ClientDataSet1ESCENDCOMP: TStringField;
    ClientDataSet1ESCENDBAIRRO: TStringField;
    ClientDataSet1ESCENDCIDADE: TStringField;
    tbEscolaESCDATACAD: TSQLTimeStampField;
    ClientDataSet1ESCDATACAD: TSQLTimeStampField;
    ClientDataSet1ESCENDCEP: TStringField;
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

unit unAlunoControle;

interface

uses
  unAlunoModelo, SysUtils, SqlExpr;

type
  TAlunoControle = class
  private
    FAlunoModelo: TAlunoModelo;
  public
    constructor Create;
    destructor Destroy; override;

    function Obter: TSQLQuery;

  end;

implementation


constructor TAlunoControle.Create;
begin
  FAlunoModelo := TAlunoModelo.Create;
end;

destructor TAlunoControle.Destroy;
begin
  FreeAndNil(FAlunoModelo);
  inherited;
end;

function TAlunoControle.Obter: TSQLQuery;
begin
  Result := FAlunoModelo.Obter;
end;

end.

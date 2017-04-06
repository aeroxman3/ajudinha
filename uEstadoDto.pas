unit uEstadoDto;

interface

uses
  System.SysUtils;

type
  TEstado = class
  private
    FIDEstado: Integer;
    FUf: String;
    FNome: String;

    procedure SetIDEstado(AValor: Integer);
    function GetIDEstado: Integer;

    procedure SetUF(AValor: String);
    function GetUF: String;

    procedure SetNome(AValor: String);
    function GetNome: String;
  public
    property IDEstado: Integer read GetIDEstado write SetIDEstado;
    property UF: String read GetUF write SetUF;
    property Nome: String read GetNome write SetNome;

    constructor Create;

  end;

implementation

{ TEstado }

constructor TEstado.Create;
begin
  FIDEstado := 0;
  FUf := EmptyStr; // é igual a: FUf := '';
  FNome := EmptyStr;
end;

function TEstado.GetIDEstado: Integer;
begin
  Result := FIDEstado;
end;

function TEstado.GetNome: String;
begin
  Result := FNome;
end;

function TEstado.GetUF: String;
begin
  Result := FUf;
end;

procedure TEstado.SetIDEstado(AValor: Integer);
begin
  FIDEstado := AValor;
end;

procedure TEstado.SetNome(AValor: String);
begin
  FNome := AValor;
end;

procedure TEstado.SetUF(AValor: String);
begin
  FUf := AValor;
end;

end.

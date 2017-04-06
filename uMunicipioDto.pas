unit uMunicipioDto;

interface
uses
  uEstadoDto, System.SysUtils;

type
  TMunicipio = class
  private
    FIDMunicipio: Integer;
    FNome: String;
    FEstado: TEstado;

    procedure SetIDMunicipio(AValor: Integer);
    function GetIDMunicipio: Integer;

    procedure SetNome(AValor: String);
    function GetNome: String;

    procedure SetEstado(iValor: TEstado);
    function GetEstado: TEstado;

  public
    property IDMunicipio: Integer  read GetIDMunicipio  write SetIDMunicipio;
    property Nome: String  read GetNome  write SetNome;
    property Estado : TEstado read GetEstado write SetEstado;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TMunicipio }

constructor TMunicipio.Create;
begin
  FIDMunicipio := 0;
  FNome := EmptyStr;

  FEstado:= TEstado.Create;
end;


destructor TMunicipio.Destroy;
begin
  if Assigned(FEstado) then
    FreeAndNil(FEstado);
  inherited;
end;

function TMunicipio.GetEstado: TEstado;
begin
 Result := FEstado;
end;

function TMunicipio.GetIDMunicipio: Integer;
begin
  Result := FIDMunicipio;
end;

function TMunicipio.GetNome: String;
begin
  Result := FNome;
end;

procedure TMunicipio.SetEstado(iValor: TEstado);
begin
  FEstado := iValor;
end;

procedure TMunicipio.SetIDMunicipio(AValor: Integer);
begin
  FIDMunicipio := AValor;
end;

procedure TMunicipio.SetNome(AValor: String);
begin
  FNome := AValor;
end;

end.

implementation

end.

unit uMunicipioController;

interface
uses
  System.SysUtils, uMunicipioDto, uEstadoModel, Dialogs, uMunicipioModel;
type
  TMuncipioController = class
  private
    oModelEstado : TEstadoModel;
    oModelMunicipio : TMunicipioModel;
  public
    constructor Create;
    destructor Destroy; override;
    function Salvar(var oMunicipio: TMunicipio): boolean;
    function ConverterUF(var oMunicipio: TMunicipio): boolean;
    function Checar(var oMunicipio: TMunicipio): boolean;
    function ConverterID(var oMunicipio: TMunicipio): boolean;
    function Delete(var oMunicipio: TMunicipio): boolean;
  end;

implementation

{ TMuncipioController }

function TMuncipioController.Checar(var oMunicipio: TMunicipio): boolean;
begin
  if(oModelMunicipio.Checar(oMunicipio))then
  begin
       ConverterID(oMunicipio);
       Result := True;
  end
  else
    Result := False;

end;

function TMuncipioController.ConverterID(var oMunicipio: TMunicipio): boolean;
begin
  Result := oModelEstado.SelecionarUF(oMunicipio);
end;

function TMuncipioController.ConverterUF(var oMunicipio: TMunicipio): boolean;
begin
 Result := oModelEstado.SelecionarID(oMunicipio);
end;

constructor TMuncipioController.Create;
begin
  oModelEstado := TEstadoModel.Create;
  oModelMunicipio := TMunicipioModel.Create;
end;

function TMuncipioController.Delete(var oMunicipio: TMunicipio): boolean;
begin
  Result := oModelMunicipio.Delete(oMunicipio);
end;

destructor TMuncipioController.Destroy;
begin

   if (assigned(oModelEstado)) then
    FreeAndNil(oModelEstado);

  if (assigned(oModelMunicipio)) then
    FreeAndNil(oModelMunicipio);
  inherited;
end;

function TMuncipioController.Salvar(var oMunicipio: TMunicipio): boolean;
begin
  if(ConverterUF(oMunicipio)=false)then
   begin
    ShowMessage('Essa UF n�o tem registro, v� para o cadastro de estado e cadastre ela!');
   end;

  if(oModelMunicipio.Read(oMunicipio))then
  begin
    oModelMunicipio.Alterar(oMunicipio);
    Result := True;
  end
  else
  begin
   oModelMunicipio.Salvar(oMunicipio);
   Result := False;
  end;


end;

end.

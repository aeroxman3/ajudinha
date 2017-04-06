unit uEstadoController;

interface

uses
  Dialogs, uEstadoDto, System.SysUtils,
  FireDAC.Comp.Client, uEstadoModel;

type
  TEstadoController = class
  private
    oModel: TEstadoModel;

  public
    constructor Create;
    destructor Destroy; override;
    function Salvar(var oEstado: TEstado): boolean;
    function Checar(var oEstado: TEstado): boolean;
    function Read(var oEstado: TEstado): boolean;
    function Delete(var oEstado: TEstado): boolean;
  end;

implementation

function TEstadoController.Checar(var oEstado: TEstado): boolean;
begin
  Result:= oModel.Checar(oEstado);
end;

constructor TEstadoController.Create;
begin
  if (not(assigned(oModel))) then
    oModel := TEstadoModel.Create;
end;

function TEstadoController.Delete(var oEstado: TEstado): boolean;
begin
  Result:= oModel.Delete(oEstado);
end;

destructor TEstadoController.Destroy;
begin

  if (assigned(oModel)) then
    FreeAndNil(oModel);

  inherited;

end;

function TEstadoController.Read(var oEstado: TEstado): boolean;
begin
Result := oModel.Read(oEstado);
end;

function TEstadoController.Salvar(var oEstado: TEstado): boolean;
begin
    if(Read(oEstado))then
    begin
      oModel.Alterar(oEstado);
      Result:= True;
    end
    else if(oModel.Salvar(oEstado)) then
    begin
       Result:= false;
    end;

end;

end.

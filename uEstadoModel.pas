unit uEstadoModel;

interface

uses
  uEstadoDto, System.Classes, FireDac.Comp.Client, Data.DB, uConexaoSingleTon,
  System.SysUtils, Dialogs, FireDac.DApt, FireDac.Stan.Async, uMunicipioDto;

type
  TEstadoModel = class
  private
    oQuery: TFDQuery;
  public
    function Salvar(var oestado: TEstado): boolean;
    function Checar(var oestado: TEstado): boolean;
    function Alterar(var oestado: TEstado): boolean;
    function Read(var oestado: TEstado): boolean;
    function Delete(var oestado: TEstado): boolean;
    function SelecionarID(var oMunicipio: TMunicipio): boolean;
    function SelecionarUF(var oMunicipio: TMunicipio): boolean;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEstadoModel }

function TEstadoModel.Alterar(var oestado: TEstado): boolean;
begin
  try
    oQuery.SQL.Clear;
    oQuery.SQL.Add('UPDATE estado SET nome =  ''' + oestado.Nome +'''  ,  uf=''' + oestado.UF + '''    WHERE idestado=' +IntToStr(oestado.IDEstado) + '    ');
    oQuery.ExecSQL;
    if (not(oQuery.IsEmpty)) then
    begin
      Result := True;
    end
    else if (oQuery.IsEmpty) then
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel Alterar o usu�rio');

  end;
end;

function TEstadoModel.Checar(var oestado: TEstado): boolean;
begin
  try
    oQuery.SQL.Clear;
    oQuery.Open('select idestado,nome,uf from estado WHERE uf=''' + oestado.UF
      + '''  ');
    if (not(oQuery.IsEmpty)) then
    begin
      oestado.IDEstado := oQuery.FieldByName('idestado').AsInteger;
      oestado.Nome := oQuery.FieldByName('nome').AsString;
      Result := True;
    end
    else if (oQuery.IsEmpty) then
    begin
      Result := False;
    end;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');

  end;
end;

constructor TEstadoModel.Create;
begin
  oQuery := TFDQuery.Create(nil);
  oQuery.Connection := TConexaoSigleton.GetInstancia;
end;

function TEstadoModel.Delete(var oestado: TEstado): boolean;
begin
  try
    oQuery.SQL.Clear;
    oQuery.SQL.Add('DELETE FROM estado WHERE idestado = ' +IntToStr(oEstado.IDEstado) + '');
    oQuery.ExecSQL;
    if (not(oQuery.IsEmpty)) then
     begin
            Result := True;
     end
    else if (oQuery.IsEmpty) then
      Result := False;
  except
    raise Exception.create('N�o Foi poss�vel excluir o usu�rio');

  end;
end;

destructor TEstadoModel.Destroy;
begin
  if (assigned(oQuery)) then
    FreeAndNil(oQuery);
  inherited;
end;

function TEstadoModel.Read(var oestado: TEstado): boolean;
begin
  try
    oQuery.SQL.Clear;
    oQuery.Open('select idestado,nome,uf from estado WHERE uf=''' + oestado.UF
      + '''  ');
    if (not(oQuery.IsEmpty)) then
    begin

      Result := True;
    end
    else if (oQuery.IsEmpty) then
    begin
      Result := False;
    end;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');

  end;
end;

function TEstadoModel.Salvar(var oestado: TEstado): boolean;
begin
  try
    oQuery.SQL.Clear;
    oQuery.SQL.Add('INSERT INTO estado (idestado, nome, uf) VALUES (' +
      IntToStr(oestado.IDEstado) + ', ''' + oestado.Nome + ''', ''' +
      oestado.UF + ''')');
    oQuery.ExecSQL;
    if (not(oQuery.IsEmpty)) then
    begin
      Result := True;
    end
    else if (oQuery.IsEmpty) then
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel inserir o usu�rio');
  end;
end;

function TEstadoModel.SelecionarID(var oMunicipio: TMunicipio): boolean;
begin
 try
    oQuery.SQL.Clear;
    oQuery.Open('select idestado,nome,uf from estado WHERE uf=''' + oMunicipio.Estado.UF+ '''  ');
    if (not(oQuery.IsEmpty)) then
    begin
      oMunicipio.Estado.IDEstado := oQuery.FieldByName('idestado').AsInteger;
      Result := True;
    end
    else if (oQuery.IsEmpty) then
    begin
      Result := False;
    end;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');

  end;
end;

function TEstadoModel.SelecionarUF(var oMunicipio: TMunicipio): boolean;
begin
  try
    oQuery.SQL.Clear;
    oQuery.Open('select nome,uf from estado WHERE idestado=' + IntToStr(oMunicipio.Estado.IDEstado)+ '  ');
    if (not(oQuery.IsEmpty)) then
    begin
      oMunicipio.Estado.UF := oQuery.FieldByName('uf').AsString;
      Result := True;
    end
    else if (oQuery.IsEmpty) then
    begin
      Result := False;
    end;
  except
    raise Exception.Create('N�o Foi poss�vel acessar o banco de dados');

  end;
end;

end.

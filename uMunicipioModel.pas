unit uMunicipioModel;

interface
uses
System.Classes, uConexaoSingleTon, FireDac.Comp.Client,Data.DB, System.SysUtils, Dialogs, uMunicipioDto;

type
  TMunicipioModel = class
  private
    oQuery : TFDQuery;
  public
    function Checar(var oMunicipio : TMunicipio):boolean;
    function Salvar(var oMunicipio : TMunicipio):boolean;
    function Read(var oMunicipio : TMunicipio):boolean;
    function Alterar(var oMunicipio : TMunicipio):boolean;
    function Delete(var oMunicipio : TMunicipio):boolean;
    destructor Destroy; override;
    constructor Create;
  end;

implementation

{ TMunicipioModel }

function TMunicipioModel.Alterar(var oMunicipio: TMunicipio): boolean;
begin
 try
    oQuery.SQL.Clear;
    oQuery.SQL.Add('UPDATE cidade SET nome =  ''' + oMunicipio.Nome +'''  ,  estado_idestado=' + IntToStr( oMunicipio.Estado.IDEstado)+ '    WHERE idcidade=' +IntToStr(oMunicipio.IDMunicipio) + '    ');
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

function TMunicipioModel.Checar(var oMunicipio: TMunicipio): boolean;
begin
try
    oQuery.SQL.Clear;
    oQuery.Open('select idcidade,nome,estado_idestado from cidade WHERE nome=''' + oMunicipio.Nome+ '''  ');
    if (not(oQuery.IsEmpty)) then
    begin
       oMunicipio.IDMunicipio := oQuery.FieldByName('idcidade').AsInteger;
      oMunicipio.Estado.IDEstado := oQuery.FieldByName('estado_idestado').AsInteger;
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

constructor TMunicipioModel.Create;
begin
    oQuery:= TFDQuery.Create(nil);
    oQuery.Connection:= TConexaoSigleton.GetInstancia;
end;

function TMunicipioModel.Delete(var oMunicipio: TMunicipio): boolean;
begin
  try
    oQuery.SQL.Clear;
    oQuery.SQL.Add('DELETE FROM cidade WHERE idcidade = ' +IntToStr(oMunicipio.IDMunicipio) + '');
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

destructor TMunicipioModel.Destroy;
begin
  if(assigned(oQuery))then
    FreeAndNil(oQuery);

  inherited;
end;

function TMunicipioModel.Read(var oMunicipio: TMunicipio): boolean;
begin
try
    oQuery.SQL.Clear;
    oQuery.Open('select idcidade,nome,estado_idestado from cidade WHERE idcidade=''' +IntToStr( oMunicipio.IDMunicipio)+ '''  ');
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

function TMunicipioModel.Salvar(var oMunicipio: TMunicipio): boolean;
begin
  try
    oQuery.SQL.Clear;
    oQuery.SQL.Add('INSERT INTO cidade (idcidade, nome, estado_idestado) VALUES (' +IntToStr(oMunicipio.IDMunicipio) + ', ''' + oMunicipio.Nome + ''', ' +IntToStr(oMunicipio.Estado.IDEstado) + ')');
    oQuery.ExecSQL;
    if (not(oQuery.IsEmpty)) then
    begin
      Result := True;
    end
    else if (oQuery.IsEmpty) then
      Result := False;
  except
    raise Exception.Create('N�o Foi poss�vel inserir o cadastro');
  end;
end;

end.

program Ajudinha;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uBase in 'uBase.pas' {frmBase},
  uEstado in 'uEstado.pas' {frmEstado},
  uEstadoDto in 'uEstadoDto.pas',
  uEstadoController in 'uEstadoController.pas',
  uConexao in 'uConexao.pas',
  uConexaoSingleTon in 'uConexaoSingleTon.pas',
  uEstadoModel in 'uEstadoModel.pas',
  uMunicipio in 'uMunicipio.pas' {frmMunicipio},
  uMunicipioDto in 'uMunicipioDto.pas',
  uMunicipioController in 'uMunicipioController.pas',
  uMunicipioModel in 'uMunicipioModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

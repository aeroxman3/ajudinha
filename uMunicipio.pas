 unit uMunicipio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uMunicipioDto, uMunicipioController;

type
  TfrmMunicipio = class(TfrmBase)
    edtIdMunicipio: TEdit;
    edtNomeMunicipio: TEdit;
    edtUFEStado: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtNomeMunicipioExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    oMunicipio : TMunicipio;
    oMunicipioController : TMuncipioController;
  public
    procedure AdicionarDto;
    destructor Destroy; override;
  end;

var
  frmMunicipio: TfrmMunicipio;

implementation

{$R *.dfm}

{ TfrmMunicipio }

procedure TfrmMunicipio.AdicionarDto;
begin
  oMunicipio.IDMunicipio := StrToInt(edtIdMunicipio.Text);
  oMunicipio.Nome := edtNomeMunicipio.Text;
  oMunicipio.Estado.UF := edtUFEStado.Text;
end;

procedure TfrmMunicipio.btnExcluirClick(Sender: TObject);
begin
  inherited;
   AdicionarDto;
  if (oMunicipioController.Delete(oMunicipio)) then
  begin
   ShowMessage('Falha Ao Deletar Cadastro!');

  end
  else
   ShowMessage('Cadastro Deletado Com Sucesso!');
   edtIdMunicipio.Text := '';
   edtNomeMunicipio.Text := '';
   edtUFEStado.Text := '';
end;

procedure TfrmMunicipio.btnSalvarClick(Sender: TObject);
begin
  inherited;
  AdicionarDto;

    if (oMunicipioController.Salvar(oMunicipio)) then
  begin
    ShowMessage('Cadastro Alterado Com Sucesso!');
  end
  else
    ShowMessage('Cadastro Inserido Com Sucesso!');


end;

destructor TfrmMunicipio.Destroy;
begin
  if(assigned(oMunicipio))then
    FreeAndNil(oMunicipio);

  if(assigned(oMunicipioController))then
    FreeAndNil(oMunicipioController);


  frmMunicipio := nil;
  inherited;
end;

procedure TfrmMunicipio.edtNomeMunicipioExit(Sender: TObject);
begin
  inherited;
  oMunicipio.Nome := edtNomeMunicipio.Text;
  if(oMunicipioController.Checar(oMunicipio))then
  begin
    edtIdMunicipio.Text := IntToStr(oMunicipio.IDMunicipio);
    edtUFEStado.Text := oMunicipio.Estado.UF;
  end;

end;

procedure TfrmMunicipio.FormCreate(Sender: TObject);
begin
  inherited;
  if(not(assigned(oMunicipio)))then
    oMunicipio := TMunicipio.Create;

  if(not(assigned(oMunicipioController)))then
    oMunicipioController := TMuncipioController.Create;
end;

end.

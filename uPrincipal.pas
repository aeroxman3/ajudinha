unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uEstado, uConexaoSingleTon, uMunicipio;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cdastros1: TMenuItem;
    Estado1: TMenuItem;
    Municipio1: TMenuItem;
    procedure Estado1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Municipio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Estado1Click(Sender: TObject);
begin
  if(not(assigned(frmEstado)))then
    frmEstado := TfrmEstado.Create(self);

    frmEstado.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

   try
    TConexaoSigleton.GetInstancia;

   except
    ShowMessage('Erro Ao conectar ao banco de dados!');

    Application.Terminate;
    exit
   end;
end;

procedure TfrmPrincipal.Municipio1Click(Sender: TObject);
begin
   if(not(assigned(frmMunicipio)))then
    frmMunicipio := TfrmMunicipio.Create(self);

    frmMunicipio.Show;
end;

end.

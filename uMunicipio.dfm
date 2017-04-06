inherited frmMunicipio: TfrmMunicipio
  Caption = 'Cadastro de Municipio'
  FormStyle = fsMDIChild
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
  end
  inherited Panel3: TPanel
    object edtIdMunicipio: TEdit
      Left = 192
      Top = 88
      Width = 209
      Height = 21
      TabOrder = 0
      TextHint = 'idMunicipio'
    end
    object edtNomeMunicipio: TEdit
      Left = 192
      Top = 128
      Width = 209
      Height = 21
      TabOrder = 1
      TextHint = 'Nome Munic'#237'pio'
      OnExit = edtNomeMunicipioExit
    end
    object edtUFEStado: TEdit
      Left = 192
      Top = 171
      Width = 209
      Height = 21
      TabOrder = 2
      TextHint = 'UF Estado'
    end
  end
end

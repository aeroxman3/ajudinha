inherited frmEstado: TfrmEstado
  Caption = 'Cadastro de Estado'
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
    object edtUf: TEdit
      Left = 32
      Top = 117
      Width = 209
      Height = 21
      TabOrder = 0
      TextHint = 'UF'
      OnExit = edtUfExit
    end
    object edtNome: TEdit
      Left = 32
      Top = 171
      Width = 209
      Height = 21
      TabOrder = 1
      TextHint = 'Nome'
    end
    object edtIdEstado: TEdit
      Left = 32
      Top = 61
      Width = 209
      Height = 21
      TabOrder = 2
      TextHint = 'Id Estado'
    end
  end
end

object frmEscolaIndex: TfrmEscolaIndex
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'GESCO'
  ClientHeight = 500
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmEscola
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 207
    Top = 128
    Width = 367
    Height = 129
    Caption = 'GESCO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -107
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblEscolaBoasVindas: TLabel
    Left = 200
    Top = 128
    Width = 367
    Height = 129
    Caption = 'GESCO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -107
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 213
    Top = 240
    Width = 344
    Height = 40
    Caption = 'G e s t '#227' o   E s c o l a r'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object mmEscola: TMainMenu
    Left = 104
    object menuArquivo: TMenuItem
      Caption = '&Arquivo'
      object menuArquivoNovo: TMenuItem
        Caption = 'Novo'
        object menuArquivoNovoCadastro: TMenuItem
          Caption = 'Cadastro'
          object menuVisualizarConsultar: TMenuItem
            Caption = '&Escola'
            OnClick = menuArquivoCadastroEscolaClick
          end
        end
      end
      object menuArquivoSair: TMenuItem
        Caption = 'Sair'
        OnClick = menuArquivoSairClick
      end
    end
    object menuVisualizar: TMenuItem
      Caption = 'Visualizar'
      object Consultar1: TMenuItem
        Caption = 'Consultar'
        object menuVisualizarConsultarEscola: TMenuItem
          Caption = 'Escola'
          OnClick = menuVisualizarConsultarEscolaClick
        end
      end
    end
  end
end

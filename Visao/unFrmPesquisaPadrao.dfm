object frmPesquisaPadrao: TfrmPesquisaPadrao
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pesquisar Padr'#227'o'
  ClientHeight = 500
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object lblConsultaOrdenada: TLabel
    Left = 200
    Top = 138
    Width = 63
    Height = 13
    Caption = 'Ordenar por:'
  end
  object lblTituloLista: TLabel
    Left = 251
    Top = 6
    Width = 193
    Height = 33
    Caption = 'Consulta Padr'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
  end
  object ComboBoxConsultaOrdenada: TComboBox
    Left = 200
    Top = 155
    Width = 110
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'C'#243'digo'
    Items.Strings = (
      'C'#243'digo'
      'Escola'
      'Data de cadastro')
  end
  object rgPesquisar: TRadioGroup
    Left = 21
    Top = 61
    Width = 161
    Height = 59
    Caption = 'Pesquisar'
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo'
      'Data de Cadastro')
    TabOrder = 1
  end
  object dtpBuscarData: TDateTimePicker
    Left = 77
    Top = 126
    Width = 105
    Height = 21
    Date = 43444.631400567130000000
    Time = 43444.631400567130000000
    Enabled = False
    TabOrder = 2
  end
  object edtBuscarCodigo: TEdit
    Left = 21
    Top = 126
    Width = 48
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object btnBuscar: TButton
    Left = 21
    Top = 153
    Width = 161
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 4
  end
  object rgImpressao: TRadioGroup
    Left = 680
    Top = 95
    Width = 90
    Height = 56
    Caption = 'Impress'#227'o'
    ItemIndex = 0
    Items.Strings = (
      'Tela'
      'Impressora')
    TabOrder = 5
  end
  object btnImprimir: TButton
    Left = 680
    Top = 153
    Width = 90
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 6
  end
  object btnNovoCadastro: TButton
    Left = 335
    Top = 153
    Width = 83
    Height = 25
    Caption = 'Novo cadastro'
    TabOrder = 7
  end
  object btnConsultaFechar: TButton
    Left = 688
    Top = 8
    Width = 82
    Height = 25
    Caption = 'Tela principal'
    TabOrder = 8
  end
  object DBGridLista: TDBGrid
    Left = 0
    Top = 184
    Width = 778
    Height = 316
    Align = alBottom
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end

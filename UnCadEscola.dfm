object frmCadEscola: TfrmCadEscola
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Escola'
  ClientHeight = 260
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblEscolaCodigo: TLabel
    Left = 35
    Top = 97
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lblEscolaNome: TLabel
    Left = 98
    Top = 97
    Width = 34
    Height = 13
    Caption = 'Escola:'
    FocusControl = DBEditEscolaNome
  end
  object lblEscolaDataCadastro: TLabel
    Left = 485
    Top = 97
    Width = 87
    Height = 13
    Caption = 'Data de cadastro:'
  end
  object lblEscolaEndRua: TLabel
    Left = 110
    Top = 142
    Width = 23
    Height = 13
    Caption = 'Rua:'
    FocusControl = DBEditEscolaEndRua
  end
  object lblEscolaEndNumero: TLabel
    Left = 541
    Top = 142
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object lblEscolaEndComplemento: TLabel
    Left = 35
    Top = 185
    Width = 69
    Height = 13
    Caption = 'Complemento:'
    FocusControl = DBEditEscolaEndComplemento
  end
  object lblEscolaEndBairro: TLabel
    Left = 266
    Top = 185
    Width = 32
    Height = 13
    Caption = 'Bairro:'
    FocusControl = DBEditEscolaEndBairro
  end
  object lblEscolaEndCidade: TLabel
    Left = 459
    Top = 185
    Width = 37
    Height = 13
    Caption = 'Cidade:'
    FocusControl = DBEditEscolaEndCidade
  end
  object lblEscolaendCep: TLabel
    Left = 35
    Top = 142
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object lblEscolaFrmTitulo: TLabel
    Left = 192
    Top = 8
    Width = 224
    Height = 33
    Caption = 'Cadastro de Escola'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBEditEscolaNome: TcxDBTextEdit
    Left = 98
    Top = 113
    DataBinding.DataField = 'ESCNOME'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = AvancarCampo
    Width = 381
  end
  object DBEditEscolaEndRua: TcxDBTextEdit
    Left = 110
    Top = 158
    DataBinding.DataField = 'ESCENDRUA'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 5
    OnKeyPress = AvancarCampo
    Width = 425
  end
  object DBEditEscolaEndComplemento: TcxDBTextEdit
    Left = 35
    Top = 201
    DataBinding.DataField = 'ESCENDCOMP'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 7
    OnKeyPress = AvancarCampo
    Width = 225
  end
  object DBEditEscolaEndBairro: TcxDBTextEdit
    Left = 266
    Top = 201
    DataBinding.DataField = 'ESCENDBAIRRO'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 8
    OnKeyPress = AvancarCampo
    Width = 187
  end
  object DBEditEscolaEndCidade: TcxDBTextEdit
    Left = 459
    Top = 201
    DataBinding.DataField = 'ESCENDCIDADE'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 9
    OnKeyPress = AvancarCampo
    Width = 147
  end
  object DBEditEscolaEndNumero: TcxDBTextEdit
    Left = 541
    Top = 158
    DataBinding.DataField = 'ESCENDNUM'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    TabOrder = 6
    OnKeyPress = AvancarCampo
    Width = 65
  end
  object btnEscolaNovoCadastro: TButton
    Left = 239
    Top = 66
    Width = 83
    Height = 25
    Caption = 'Novo cadastro'
    TabOrder = 10
    OnClick = btnEscolaNovoCadastroClick
  end
  object btnEscolaGravar: TButton
    Left = 328
    Top = 66
    Width = 46
    Height = 25
    Caption = 'Gravar'
    Enabled = False
    TabOrder = 11
    OnClick = btnEscolaGravarClick
  end
  object btnEscolaAlterar: TButton
    Left = 380
    Top = 66
    Width = 54
    Height = 25
    Caption = 'Alterar'
    TabOrder = 12
    OnClick = btnEscolaAlterarClick
  end
  object btnEscolaExcluir: TButton
    Left = 555
    Top = 66
    Width = 50
    Height = 25
    Caption = 'Excluir'
    TabOrder = 15
    OnClick = btnEscolaExcluirClick
  end
  object btnEscolaCancelar: TButton
    Left = 494
    Top = 66
    Width = 55
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 14
    OnClick = btnEscolaCancelarClick
  end
  object btnEscolaLimpar: TButton
    Left = 440
    Top = 66
    Width = 48
    Height = 25
    Caption = 'Limpar'
    Enabled = False
    TabOrder = 13
    OnClick = btnEscolaLimparClick
  end
  object DBEditEscolaCod: TcxDBTextEdit
    Left = 35
    Top = 113
    DataBinding.DataField = 'ESCCOD'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    ParentFont = False
    TabOrder = 1
    Width = 57
  end
  object btnEscolaPesquisar: TButton
    Left = 35
    Top = 66
    Width = 69
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 0
    OnClick = btnEscolaPesquisarClick
  end
  object DBDateEditEscolaDataCadastro: TcxDBDateEdit
    Left = 485
    Top = 113
    BeepOnEnter = False
    DataBinding.DataField = 'ESCDATACAD'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    TabOrder = 3
    Width = 121
  end
  object DBMaskEditEscolaEndCEP: TcxDBMaskEdit
    Left = 35
    Top = 158
    DataBinding.DataField = 'ESCENDCEP'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.EditMask = '00000\-999;1;_'
    TabOrder = 4
    OnKeyPress = AvancarCampo
    Width = 69
  end
end

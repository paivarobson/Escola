object frmCadEscola: TfrmCadEscola
  Left = 0
  Top = 0
  Caption = 'Cadastro de Escola'
  ClientHeight = 532
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblEscolaCodigo: TLabel
    Left = 104
    Top = 48
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lblEscolaNome: TLabel
    Left = 167
    Top = 48
    Width = 34
    Height = 13
    Caption = 'Escola:'
    FocusControl = DBEditEscolaNome
  end
  object lblEscolaDataCadastro: TLabel
    Left = 554
    Top = 48
    Width = 87
    Height = 13
    Caption = 'Data de cadastro:'
    FocusControl = DBEditEscolaDataCadastro
  end
  object lblEscolaEndRua: TLabel
    Left = 221
    Top = 93
    Width = 23
    Height = 13
    Caption = 'Rua:'
    FocusControl = DBEditEscolaEndRua
  end
  object lblEscolaEndNumero: TLabel
    Left = 610
    Top = 93
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object lblEscolaEndComplemento: TLabel
    Left = 104
    Top = 136
    Width = 69
    Height = 13
    Caption = 'Complemento:'
    FocusControl = DBEditEscolaEndComplemento
  end
  object lblEscolaEndBairro: TLabel
    Left = 335
    Top = 136
    Width = 32
    Height = 13
    Caption = 'Bairro:'
    FocusControl = DBEditEscolaEndBairro
  end
  object lblEscolaEndCidade: TLabel
    Left = 528
    Top = 136
    Width = 37
    Height = 13
    Caption = 'Cidade:'
    FocusControl = DBEditEscolaEndCidade
  end
  object lblEscolaendCep: TLabel
    Left = 104
    Top = 93
    Width = 23
    Height = 13
    Caption = 'CEP:'
    FocusControl = DBEditEscolaEndCep
  end
  object lblEscolaFrmTitulo: TLabel
    Left = 272
    Top = 16
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
    Left = 167
    Top = 64
    DataBinding.DataField = 'ESCNOME'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 0
    Width = 381
  end
  object DBEditEscolaDataCadastro: TcxDBTextEdit
    Left = 554
    Top = 64
    DataBinding.DataField = 'ESCDATACAD'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 1
    Width = 121
  end
  object DBEditEscolaEndRua: TcxDBTextEdit
    Left = 220
    Top = 109
    DataBinding.DataField = 'ESCENDRUA'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 2
    Width = 384
  end
  object DBEditEscolaEndComplemento: TcxDBTextEdit
    Left = 104
    Top = 152
    DataBinding.DataField = 'ESCENDCOMP'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 3
    Width = 225
  end
  object DBEditEscolaEndBairro: TcxDBTextEdit
    Left = 335
    Top = 152
    DataBinding.DataField = 'ESCENDBAIRRO'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 4
    Width = 187
  end
  object DBEditEscolaEndCidade: TcxDBTextEdit
    Left = 528
    Top = 152
    DataBinding.DataField = 'ESCENDCIDADE'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 5
    Width = 147
  end
  object DBEditEscolaEndCep: TcxDBTextEdit
    Left = 104
    Top = 109
    DataBinding.DataField = 'ESCENDCEP'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 6
    Width = 110
  end
  object DBGridListaEscola: TDBGrid
    Left = 11
    Top = 240
    Width = 777
    Height = 284
    DataSource = dsEscola
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ESCCOD'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCNOME'
        Title.Caption = 'Escola'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCDATACAD'
        Title.Caption = 'Data de cadastro'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDRUA'
        Title.Caption = 'Rua'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDNUM'
        Title.Caption = 'N'#250'mero'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCOMP'
        Title.Caption = 'Complemento'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDBAIRRO'
        Title.Caption = 'Bairro'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCIDADE'
        Title.Caption = 'Cidade'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCEP'
        Title.Caption = 'CEP'
        Visible = True
      end>
  end
  object DBEditEscolaEndNumero: TcxDBTextEdit
    Left = 610
    Top = 109
    DataBinding.DataField = 'ESCENDNUM'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 8
    Width = 65
  end
  object btnEscolaNovoCadastro: TButton
    Left = 361
    Top = 193
    Width = 83
    Height = 25
    Caption = 'Novo cadastro'
    TabOrder = 9
    OnClick = btnEscolaNovoCadastroClick
  end
  object btnEscolaGravar: TButton
    Left = 450
    Top = 193
    Width = 46
    Height = 25
    Caption = 'Gravar'
    Enabled = False
    TabOrder = 10
    OnClick = btnEscolaGravarClick
  end
  object btnEscolaAlterar: TButton
    Left = 502
    Top = 193
    Width = 54
    Height = 25
    Caption = 'Alterar'
    TabOrder = 11
    OnClick = btnEscolaAlterarClick
  end
  object btnEscolaExcluir: TButton
    Left = 677
    Top = 193
    Width = 50
    Height = 25
    Caption = 'Excluir'
    TabOrder = 12
    OnClick = btnEscolaExcluirClick
  end
  object btnEscolaImprimir: TButton
    Left = 733
    Top = 193
    Width = 55
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 13
    OnClick = btnEscolaImprimirClick
  end
  object btnEscolaCancelar: TButton
    Left = 616
    Top = 193
    Width = 55
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 14
    OnClick = btnEscolaCancelarClick
  end
  object btnEscolaLimpar: TButton
    Left = 562
    Top = 193
    Width = 48
    Height = 25
    Caption = 'Limpar'
    Enabled = False
    TabOrder = 15
    OnClick = btnEscolaLimparClick
  end
  object DBEditEscolaCod: TcxDBTextEdit
    Left = 104
    Top = 64
    DataBinding.DataField = 'ESCCOD'
    DataBinding.DataSource = dsEscola
    Enabled = False
    ParentFont = False
    TabOrder = 16
    Width = 57
  end
  object edtEscolaBuscar: TEdit
    Left = 92
    Top = 195
    Width = 263
    Height = 21
    TabOrder = 17
  end
  object btnEscolaBuscar: TButton
    Left = 11
    Top = 193
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 18
    OnClick = btnEscolaBuscarClick
  end
  object dsEscola: TDataSource
    DataSet = ADOTableEscola
    Left = 568
    Top = 16
  end
  object ADOTableEscola: TADOTable
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=fcm123;Persist Security Info=True;U' +
      'ser ID=sa;Initial Catalog=ESCOLA;Data Source=NCDEV28'
    CursorType = ctStatic
    TableName = 'ESCOLA'
    Left = 536
    Top = 16
    object ADOTableEscolaESCCOD: TIntegerField
      FieldName = 'ESCCOD'
    end
    object ADOTableEscolaESCNOME: TStringField
      FieldName = 'ESCNOME'
      Size = 100
    end
    object ADOTableEscolaESCDATACAD: TStringField
      FieldName = 'ESCDATACAD'
      Size = 50
    end
    object ADOTableEscolaESCENDRUA: TStringField
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object ADOTableEscolaESCENDNUM: TStringField
      FieldName = 'ESCENDNUM'
      Size = 10
    end
    object ADOTableEscolaESCENDCOMP: TStringField
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object ADOTableEscolaESCENDBAIRRO: TStringField
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object ADOTableEscolaESCENDCIDADE: TStringField
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
    object ADOTableEscolaESCENDCEP: TStringField
      FieldName = 'ESCENDCEP'
      Size = 10
    end
  end
end
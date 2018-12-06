object frmCadEscola: TfrmCadEscola
  Left = 0
  Top = 0
  Caption = 'Cadastro de Escola'
  ClientHeight = 575
  ClientWidth = 627
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
    Left = 24
    Top = 40
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
    FocusControl = DBSpinEditEscolaCod
  end
  object lblEscolaNome: TLabel
    Left = 87
    Top = 40
    Width = 34
    Height = 13
    Caption = 'Escola:'
    FocusControl = DBEditEscolaNome
  end
  object lblEscolaDataCadastro: TLabel
    Left = 474
    Top = 40
    Width = 87
    Height = 13
    Caption = 'Data de cadastro:'
    FocusControl = DBEditEscolaDataCadastro
  end
  object lblEscolaEndRua: TLabel
    Left = 141
    Top = 85
    Width = 23
    Height = 13
    Caption = 'Rua:'
    FocusControl = DBEditEscolaEndRua
  end
  object lblEscolaEndNumero: TLabel
    Left = 530
    Top = 85
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object lblEscolaEndComplemento: TLabel
    Left = 24
    Top = 128
    Width = 69
    Height = 13
    Caption = 'Complemento:'
    FocusControl = DBEditEscolaEndComplemento
  end
  object lblEscolaEndBairro: TLabel
    Left = 255
    Top = 128
    Width = 32
    Height = 13
    Caption = 'Bairro:'
    FocusControl = DBEditEscolaEndBairro
  end
  object lblEscolaEndCidade: TLabel
    Left = 448
    Top = 128
    Width = 37
    Height = 13
    Caption = 'Cidade:'
    FocusControl = DBEditEscolaEndCidade
  end
  object lblEscolaendCep: TLabel
    Left = 24
    Top = 85
    Width = 23
    Height = 13
    Caption = 'CEP:'
    FocusControl = DBEditEscolaEndCep
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
  object DBSpinEditEscolaCod: TcxDBSpinEdit
    Left = 24
    Top = 56
    DataBinding.DataField = 'ESCCOD'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 0
    Width = 57
  end
  object DBEditEscolaNome: TcxDBTextEdit
    Left = 87
    Top = 56
    DataBinding.DataField = 'ESCNOME'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 1
    Width = 381
  end
  object DBEditEscolaDataCadastro: TcxDBTextEdit
    Left = 474
    Top = 56
    DataBinding.DataField = 'ESCDATACAD'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 2
    Width = 121
  end
  object DBEditEscolaEndRua: TcxDBTextEdit
    Left = 140
    Top = 101
    DataBinding.DataField = 'ESCENDRUA'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 3
    Width = 384
  end
  object DBEditEscolaEndComplemento: TcxDBTextEdit
    Left = 24
    Top = 144
    DataBinding.DataField = 'ESCENDCOMP'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 4
    Width = 225
  end
  object DBEditEscolaEndBairro: TcxDBTextEdit
    Left = 255
    Top = 144
    DataBinding.DataField = 'ESCENDBAIRRO'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 5
    Width = 187
  end
  object DBEditEscolaEndCidade: TcxDBTextEdit
    Left = 448
    Top = 144
    DataBinding.DataField = 'ESCENDCIDADE'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 6
    Width = 147
  end
  object DBEditEscolaEndCep: TcxDBTextEdit
    Left = 24
    Top = 101
    DataBinding.DataField = 'ESCENDCEP'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 7
    Width = 110
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 280
    Width = 593
    Height = 247
    DataSource = dsEscola
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ESCCOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCNOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCDATACAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDRUA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDNUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCOMP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDBAIRRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCEP'
        Visible = True
      end>
  end
  object DBEditEscolaEndNumero: TcxDBTextEdit
    Left = 530
    Top = 101
    DataBinding.DataField = 'ESCENDNUM'
    DataBinding.DataSource = dsEscola
    Enabled = False
    TabOrder = 9
    Width = 65
  end
  object btnEscolaCadastrar: TButton
    Left = 207
    Top = 217
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 10
    OnClick = btnEscolaCadastrarClick
  end
  object btnEscolaGravar: TButton
    Left = 287
    Top = 217
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 11
    OnClick = btnEscolaGravarClick
  end
  object btnEscolaAlterar: TButton
    Left = 367
    Top = 217
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 12
  end
  object btnEscolaExcluir: TButton
    Left = 448
    Top = 217
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 13
  end
  object btnEscolaImprimiir: TButton
    Left = 527
    Top = 217
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 14
  end
  object dSetEscola: TSQLDataSet
    SchemaName = 'dbo'
    Active = True
    CommandText = 'select * from ESCOLA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = fmdados.conexaoBDEscola
    Left = 528
    Top = 8
    object dSetEscolaESCCOD: TIntegerField
      FieldName = 'ESCCOD'
      Required = True
    end
    object dSetEscolaESCNOME: TStringField
      FieldName = 'ESCNOME'
      Size = 100
    end
    object dSetEscolaESCDATACAD: TStringField
      FieldName = 'ESCDATACAD'
      Size = 50
    end
    object dSetEscolaESCENDRUA: TStringField
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object dSetEscolaESCENDNUM: TStringField
      FieldName = 'ESCENDNUM'
      Size = 10
    end
    object dSetEscolaESCENDCOMP: TStringField
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object dSetEscolaESCENDBAIRRO: TStringField
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object dSetEscolaESCENDCIDADE: TStringField
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
    object dSetEscolaESCENDCEP: TStringField
      FieldName = 'ESCENDCEP'
      Size = 10
    end
  end
  object dsProviderEscola: TDataSetProvider
    DataSet = dSetEscola
    Left = 496
    Top = 8
  end
  object cDSEscola: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProviderEscola'
    Left = 462
    Top = 8
    object cDSEscolaESCCOD: TIntegerField
      FieldName = 'ESCCOD'
      Required = True
    end
    object cDSEscolaESCNOME: TStringField
      FieldName = 'ESCNOME'
      Size = 100
    end
    object cDSEscolaESCDATACAD: TStringField
      FieldName = 'ESCDATACAD'
      Size = 50
    end
    object cDSEscolaESCENDRUA: TStringField
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object cDSEscolaESCENDNUM: TStringField
      FieldName = 'ESCENDNUM'
      Size = 10
    end
    object cDSEscolaESCENDCOMP: TStringField
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object cDSEscolaESCENDBAIRRO: TStringField
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object cDSEscolaESCENDCIDADE: TStringField
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
    object cDSEscolaESCENDCEP: TStringField
      FieldName = 'ESCENDCEP'
      Size = 10
    end
  end
  object dsEscola: TDataSource
    DataSet = cDSEscola
    Left = 432
    Top = 8
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 348
    Top = 172
  end
end

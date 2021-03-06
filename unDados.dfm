object fmdados: Tfmdados
  OldCreateOrder = False
  Height = 231
  Width = 411
  object FConexaoBDEscola: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbxmss30.dll'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=sa.dbo'
      'DriverName=MSSQL'
      'HostName=NCDEV28'
      'DataBase=ESCOLA'
      'User_Name=sa'
      'Password=fcm123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False'
      'Prepare SQL=False')
    VendorLib = 'oledb'
    Left = 197
    Top = 13
  end
  object dspEscola: TDataSetProvider
    DataSet = tbEscola
    Constraints = False
    Left = 192
    Top = 104
  end
  object tbdsEscola: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    Params = <>
    ProviderName = 'dspEscola'
    Left = 144
    Top = 151
    object tbdsEscolaESCCOD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ESCCOD'
      Required = True
    end
    object tbdsEscolaESCNOME: TStringField
      Tag = 1
      DisplayLabel = 'Escola'
      FieldName = 'ESCNOME'
      Size = 100
    end
    object tbdsEscolaESCDATACAD: TSQLTimeStampField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'ESCDATACAD'
    end
    object tbdsEscolaESCENDCEP: TStringField
      Tag = 1
      DisplayLabel = 'CEP'
      FieldName = 'ESCENDCEP'
      Size = 9
    end
    object tbdsEscolaESCENDRUA: TStringField
      Tag = 1
      DisplayLabel = 'Rua'
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object tbdsEscolaESCENDNUM: TStringField
      Tag = 1
      DisplayLabel = 'N'#250'mero'
      FieldName = 'ESCENDNUM'
      Size = 10
    end
    object tbdsEscolaESCENDCOMP: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object tbdsEscolaESCENDBAIRRO: TStringField
      Tag = 1
      DisplayLabel = 'Bairro'
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object tbdsEscolaESCENDCIDADE: TStringField
      Tag = 1
      DisplayLabel = 'Cidade'
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
  end
  object dsEscola: TDataSource
    DataSet = tbdsEscola
    Left = 96
    Top = 176
  end
  object tbEscola: TSQLQuery
    DataSource = dsEscola
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from ESCOLA')
    SQLConnection = FConexaoBDEscola
    Left = 152
    Top = 64
    object tbEscolaESCCOD: TIntegerField
      FieldName = 'ESCCOD'
      Required = True
    end
    object tbEscolaESCNOME: TStringField
      FieldName = 'ESCNOME'
      Size = 100
    end
    object tbEscolaESCENDCEP: TStringField
      FieldName = 'ESCENDCEP'
      Size = 9
    end
    object tbEscolaESCENDRUA: TStringField
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object tbEscolaESCENDNUM: TStringField
      FieldName = 'ESCENDNUM'
      Size = 10
    end
    object tbEscolaESCENDCOMP: TStringField
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object tbEscolaESCENDBAIRRO: TStringField
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object tbEscolaESCENDCIDADE: TStringField
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
    object tbEscolaESCDATACAD: TSQLTimeStampField
      FieldName = 'ESCDATACAD'
    end
  end
  object tbAux: TSQLQuery
    DataSource = dsEscola
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from ESCOLA')
    SQLConnection = FConexaoBDEscola
    Left = 232
    Top = 64
  end
end

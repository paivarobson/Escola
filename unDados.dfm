object fmdados: Tfmdados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 251
  Width = 723
  object conexaoBDEscola: TSQLConnection
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
    Connected = True
    Left = 21
    Top = 13
  end
  object dspEscola: TDataSetProvider
    DataSet = tbEscola
    Left = 96
    Top = 16
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    DisableStringTrim = True
    Params = <>
    ProviderName = 'dspEscola'
    Left = 96
    Top = 64
    object ClientDataSet1ESCCOD: TIntegerField
      FieldName = 'ESCCOD'
      Required = True
    end
    object ClientDataSet1ESCNOME: TStringField
      FieldName = 'ESCNOME'
      Size = 100
    end
    object ClientDataSet1ESCDATACAD: TStringField
      FieldName = 'ESCDATACAD'
      Size = 8
    end
    object ClientDataSet1ESCENDRUA: TStringField
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object ClientDataSet1ESCENDNUM: TStringField
      FieldName = 'ESCENDNUM'
      Size = 10
    end
    object ClientDataSet1ESCENDCOMP: TStringField
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object ClientDataSet1ESCENDBAIRRO: TStringField
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object ClientDataSet1ESCENDCIDADE: TStringField
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
    object ClientDataSet1ESCENDCEP: TStringField
      FieldName = 'ESCENDCEP'
      Size = 8
    end
  end
  object dsEscola: TDataSource
    DataSet = ClientDataSet1
    Left = 32
    Top = 64
  end
  object tbEscola: TSQLQuery
    Active = True
    DataSource = dsEscola
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from ESCOLA')
    SQLConnection = conexaoBDEscola
    Left = 160
    Top = 16
    object tbEscolaESCCOD: TIntegerField
      FieldName = 'ESCCOD'
      Required = True
    end
    object tbEscolaESCNOME: TStringField
      FieldName = 'ESCNOME'
      Size = 100
    end
    object tbEscolaESCDATACAD: TStringField
      FieldName = 'ESCDATACAD'
      Size = 8
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
    object tbEscolaESCENDCEP: TStringField
      FieldName = 'ESCENDCEP'
      Size = 8
    end
  end
  object tbAux: TSQLQuery
    Active = True
    DataSource = dsEscola
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from ESCOLA')
    SQLConnection = conexaoBDEscola
    Left = 160
    Top = 64
  end
end

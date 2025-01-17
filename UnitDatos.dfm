object d: Td
  OldCreateOrder = False
  Height = 473
  Width = 780
  object datprincipal: TDBISAMDatabase
    EngineVersion = '4.43 Build 1'
    Connected = True
    DatabaseName = 'datprincipal'
    Directory = 'M:\a2Softway\Empre001\Data'
    SessionName = 'Default'
    Left = 136
  end
  object data2: TDBISAMDatabase
    EngineVersion = '4.43 Build 1'
    Connected = True
    DatabaseName = 'data2'
    Directory = 'M:\a2Softway\Empre001\Data'
    SessionName = 'Default'
    Left = 16
    Top = 8
  end
  object sqconfig: TDBISAMQuery
    DatabaseName = 'datprincipal'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT * FROM CONFIG')
    Params = <>
    Left = 24
    Top = 128
  end
  object sqoperacioninv: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT * FROM CONFIG')
    Params = <>
    Left = 200
    Top = 72
  end
  object sqdetalleventa: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    Params = <>
    Left = 272
    Top = 8
  end
  object sqborrarfactura: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT * FROM CONFIG')
    Params = <>
    Left = 296
    Top = 64
  end
  object sqcontar: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT * FROM CONFIG')
    Params = <>
    Left = 360
    Top = 16
  end
  object sqborrarproductos: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT * FROM CONFIG')
    Params = <>
    Left = 400
    Top = 224
  end
  object squsuarios: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT * FROM Susuarios'
      'WHERE  Clave = :pclave AND Nombre = :pnombre')
    Params = <
      item
        DataType = ftUnknown
        Name = 'pclave'
      end
      item
        DataType = ftUnknown
        Name = 'pnombre'
      end>
    Left = 320
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pclave'
      end
      item
        DataType = ftUnknown
        Name = 'pnombre'
      end>
  end
  object datlocal: TDBISAMDatabase
    EngineVersion = '4.43 Build 1'
    Connected = True
    DatabaseName = 'datlocal'
    Directory = 'C:\Proyectos\Transaccionesa2\Win32\Debug\datos'
    SessionName = 'Default'
    Left = 112
    Top = 144
  end
  object sqserie: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT DUMMYKEY FROM Ssistema'
      'WHERE  DUMMYKEY <> '#39#39)
    Params = <>
    Left = 456
    Top = 160
  end
  object dsSERIE: TDataSource
    DataSet = sqserie
    Left = 448
    Top = 88
  end
  object sqFacturas: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      
        'SELECT S.FCC_SERIE, S.FCC_MONTOMONEDAEXT,  S.FCC_FACTORCAMBIO, S' +
        '.FCC_ULTFECHAABONO, S.FCC_FECHAPROXIMA, S.FCC_FECHAVENCIMIENTO, ' +
        'S.FCC_DESCRIPCIONMOV, S.FCC_SALDODOCUMENTO, S.FCC_MONTODOCUMENTO' +
        ', S.FCC_FECHAEMISION, S.FCC_TIPOTRANSACCION, S.FCC_NUMERO, S.FCC' +
        '_CODIGO, FCC_NROVENDEDOR, S1.FC_DESCRIPCION, S1.FC_RIF, S1.FC_CO' +
        'NTACTO, S1.FC_TELEFONO'
      'FROM SCuentasxcobrar S'
      ''
      'INNER JOIN Sclientes S1 ON (S.FCC_CODIGO=S1.FC_CODIGO)'
      
        'WHERE (S.FCC_SALDODOCUMENTO = 0)AND(S.FCC_TIPOTRANSACCION = 1)AN' +
        'D(S.FCC_ULTFECHAABONO BETWEEN  :FECHA1 AND :FECHA2)'
      'ORDER BY S.FCC_SERIE, FCC_NUMERO ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
      end>
    Left = 296
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
      end>
    object dtmfldFacturasFCC_FECHAVENCIMIENTO: TDateTimeField
      FieldName = 'FCC_FECHAVENCIMIENTO'
      Origin = 'SCuentasxcobrar.FCC_FECHAVENCIMIENTO'
    end
    object mfldFacturasFCC_DESCRIPCIONMOV: TMemoField
      FieldName = 'FCC_DESCRIPCIONMOV'
      Origin = 'SCuentasxcobrar.FCC_DESCRIPCIONMOV'
      BlobType = ftMemo
    end
    object sqFacturasFCC_SALDODOCUMENTO: TCurrencyField
      FieldName = 'FCC_SALDODOCUMENTO'
      Origin = 'SCuentasxcobrar.FCC_SALDODOCUMENTO'
    end
    object sqFacturasFCC_MONTODOCUMENTO: TCurrencyField
      FieldName = 'FCC_MONTODOCUMENTO'
      Origin = 'SCuentasxcobrar.FCC_MONTODOCUMENTO'
    end
    object dtmfldFacturasFCC_FECHAEMISION: TDateTimeField
      FieldName = 'FCC_FECHAEMISION'
      Origin = 'SCuentasxcobrar.FCC_FECHAEMISION'
    end
    object intgrfldFacturasFCC_TIPOTRANSACCION: TIntegerField
      FieldName = 'FCC_TIPOTRANSACCION'
      Origin = 'SCuentasxcobrar.FCC_TIPOTRANSACCION'
    end
    object fieldFacturasFCC_NUMERO: TStringField
      FieldName = 'FCC_NUMERO'
      Origin = 'SCuentasxcobrar.FCC_NUMERO'
      Size = 40
    end
    object fieldFacturasFCC_CODIGO: TStringField
      FieldName = 'FCC_CODIGO'
      Origin = 'SCuentasxcobrar.FCC_CODIGO'
      Size = 30
    end
    object fieldFacturasFCC_NROVENDEDOR: TStringField
      FieldName = 'FCC_NROVENDEDOR'
      Origin = 'SCuentasxcobrar.FCC_NROVENDEDOR'
      Size = 30
    end
    object fieldFacturasFC_DESCRIPCION: TStringField
      FieldName = 'FC_DESCRIPCION'
      Origin = 'Sclientes.FC_DESCRIPCION'
      Size = 100
    end
    object fieldFacturasFC_RIF: TStringField
      FieldName = 'FC_RIF'
      Origin = 'Sclientes.FC_RIF'
    end
    object fieldFacturasFC_CONTACTO: TStringField
      FieldName = 'FC_CONTACTO'
      Origin = 'Sclientes.FC_CONTACTO'
    end
    object fieldFacturasFC_TELEFONO: TStringField
      FieldName = 'FC_TELEFONO'
      Origin = 'Sclientes.FC_TELEFONO'
      Size = 40
    end
    object dtmfldFacturasFCC_ULTFECHAABONO: TDateTimeField
      FieldName = 'FCC_ULTFECHAABONO'
      Origin = 'SCuentasxcobrar.FCC_ULTFECHAABONO'
    end
    object fieldFacturasFCC_FACTORCAMBIO: TFloatField
      FieldName = 'FCC_FACTORCAMBIO'
      Origin = 'SCuentasxcobrar.FCC_FACTORCAMBIO'
    end
    object crncyfldFacturasFCC_MONTOMONEDAEXT: TCurrencyField
      FieldName = 'FCC_MONTOMONEDAEXT'
      Origin = 'SCuentasxcobrar.FCC_MONTOMONEDAEXT'
    end
    object fieldFacturasFCC_SERIE: TStringField
      FieldName = 'FCC_SERIE'
      Origin = 'SCuentasxcobrar.FCC_SERIE'
      Size = 30
    end
    object dtmfldFacturasFCC_FECHAPROXIMA: TDateTimeField
      FieldName = 'FCC_FECHAPROXIMA'
      Origin = 'SCuentasxcobrar.FCC_FECHAPROXIMA'
    end
  end
  object sqVendedores: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT * FROM Svendedores'
      
        'WHERE FV_CODIGO IN ( SELECT FCC_NROVENDEDOR FROM SCuentasxcobrar' +
        '  WHERE (FCC_SALDODOCUMENTO = 0)AND(FCC_TIPOTRANSACCION = 1)AND(' +
        'FCC_ULTFECHAABONO BETWEEN  :FECHA1 AND :FECHA2)) AND FV_STATUS =' +
        ' :STATUS')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
      end
      item
        DataType = ftUnknown
        Name = 'STATUS'
      end>
    Left = 72
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
      end
      item
        DataType = ftUnknown
        Name = 'STATUS'
      end>
    object fieldVendedoresFV_CODIGO: TStringField
      FieldName = 'FV_CODIGO'
      Origin = 'Svendedores.FV_CODIGO'
      Size = 30
    end
    object fieldVendedoresFV_DESCRIPCION: TStringField
      FieldName = 'FV_DESCRIPCION'
      Origin = 'Svendedores.FV_DESCRIPCION'
      Size = 40
    end
    object blnfldVendedoresFV_STATUS: TBooleanField
      FieldName = 'FV_STATUS'
      Origin = 'Svendedores.FV_STATUS'
    end
    object blnfldVendedoresFV_CLASIFICACION: TBooleanField
      FieldName = 'FV_CLASIFICACION'
      Origin = 'Svendedores.FV_CLASIFICACION'
    end
    object fieldVendedoresFV_CLAVE: TStringField
      FieldName = 'FV_CLAVE'
      Origin = 'Svendedores.FV_CLAVE'
    end
    object smlntfldVendedoresFV_TIPO: TSmallintField
      FieldName = 'FV_TIPO'
      Origin = 'Svendedores.FV_TIPO'
    end
    object mfldVendedoresFV_DESCRIPCIONDETALLADA: TMemoField
      FieldName = 'FV_DESCRIPCIONDETALLADA'
      Origin = 'Svendedores.FV_DESCRIPCIONDETALLADA'
      BlobType = ftMemo
    end
    object mfldVendedoresFV_DIRECCION: TMemoField
      FieldName = 'FV_DIRECCION'
      Origin = 'Svendedores.FV_DIRECCION'
      BlobType = ftMemo
    end
    object fieldVendedoresFV_TELEFONOS: TStringField
      FieldName = 'FV_TELEFONOS'
      Origin = 'Svendedores.FV_TELEFONOS'
      Size = 40
    end
    object fieldVendedoresFV_EMAIL: TStringField
      FieldName = 'FV_EMAIL'
      Origin = 'Svendedores.FV_EMAIL'
      Size = 40
    end
    object blnfldVendedoresFV_TIENEPRECIO: TBooleanField
      FieldName = 'FV_TIENEPRECIO'
      Origin = 'Svendedores.FV_TIENEPRECIO'
    end
    object blnfldVendedoresFV_TIENEVENTA: TBooleanField
      FieldName = 'FV_TIENEVENTA'
      Origin = 'Svendedores.FV_TIENEVENTA'
    end
    object blnfldVendedoresFV_TIENECOBRO: TBooleanField
      FieldName = 'FV_TIENECOBRO'
      Origin = 'Svendedores.FV_TIENECOBRO'
    end
    object blnfldVendedoresFV_TIENETABLAUTILIDAD: TBooleanField
      FieldName = 'FV_TIENETABLAUTILIDAD'
      Origin = 'Svendedores.FV_TIENETABLAUTILIDAD'
    end
    object blnfldVendedoresFV_TIENECATEGORIA: TBooleanField
      FieldName = 'FV_TIENECATEGORIA'
      Origin = 'Svendedores.FV_TIENECATEGORIA'
    end
    object blnfldVendedoresFV_FLAGTABLAUTILIDAD: TBooleanField
      FieldName = 'FV_FLAGTABLAUTILIDAD'
      Origin = 'Svendedores.FV_FLAGTABLAUTILIDAD'
    end
    object blnfldVendedoresFV_TIENETOLERANCIA: TBooleanField
      FieldName = 'FV_TIENETOLERANCIA'
      Origin = 'Svendedores.FV_TIENETOLERANCIA'
    end
    object blnfldVendedoresFV_FLAGTOLERANCIA: TBooleanField
      FieldName = 'FV_FLAGTOLERANCIA'
      Origin = 'Svendedores.FV_FLAGTOLERANCIA'
    end
    object intgrfldVendedoresFV_INDEXPORCENT: TIntegerField
      FieldName = 'FV_INDEXPORCENT'
      Origin = 'Svendedores.FV_INDEXPORCENT'
    end
    object crncyfldVendedoresFV_COMISIONVTA1: TCurrencyField
      FieldName = 'FV_COMISIONVTA1'
      Origin = 'Svendedores.FV_COMISIONVTA1'
    end
    object crncyfldVendedoresFV_COMISIONVTA2: TCurrencyField
      FieldName = 'FV_COMISIONVTA2'
      Origin = 'Svendedores.FV_COMISIONVTA2'
    end
    object crncyfldVendedoresFV_COMISIONVTA3: TCurrencyField
      FieldName = 'FV_COMISIONVTA3'
      Origin = 'Svendedores.FV_COMISIONVTA3'
    end
    object crncyfldVendedoresFV_COMISIONVTA4: TCurrencyField
      FieldName = 'FV_COMISIONVTA4'
      Origin = 'Svendedores.FV_COMISIONVTA4'
    end
    object crncyfldVendedoresFV_COMISIONVTA5: TCurrencyField
      FieldName = 'FV_COMISIONVTA5'
      Origin = 'Svendedores.FV_COMISIONVTA5'
    end
    object crncyfldVendedoresFV_COMISIONVTA6: TCurrencyField
      FieldName = 'FV_COMISIONVTA6'
      Origin = 'Svendedores.FV_COMISIONVTA6'
    end
    object crncyfldVendedoresFV_COMISIONVTAMIN: TCurrencyField
      FieldName = 'FV_COMISIONVTAMIN'
      Origin = 'Svendedores.FV_COMISIONVTAMIN'
    end
    object crncyfldVendedoresFV_COMISIONCOB1: TCurrencyField
      FieldName = 'FV_COMISIONCOB1'
      Origin = 'Svendedores.FV_COMISIONCOB1'
    end
    object crncyfldVendedoresFV_COMISIONCOB2: TCurrencyField
      FieldName = 'FV_COMISIONCOB2'
      Origin = 'Svendedores.FV_COMISIONCOB2'
    end
    object crncyfldVendedoresFV_COMISIONCOB3: TCurrencyField
      FieldName = 'FV_COMISIONCOB3'
      Origin = 'Svendedores.FV_COMISIONCOB3'
    end
    object crncyfldVendedoresFV_COMISIONCOB4: TCurrencyField
      FieldName = 'FV_COMISIONCOB4'
      Origin = 'Svendedores.FV_COMISIONCOB4'
    end
    object crncyfldVendedoresFV_COMISIONCOB5: TCurrencyField
      FieldName = 'FV_COMISIONCOB5'
      Origin = 'Svendedores.FV_COMISIONCOB5'
    end
    object crncyfldVendedoresFV_COMISIONCOB6: TCurrencyField
      FieldName = 'FV_COMISIONCOB6'
      Origin = 'Svendedores.FV_COMISIONCOB6'
    end
    object crncyfldVendedoresFV_COMISIONCOBMIN: TCurrencyField
      FieldName = 'FV_COMISIONCOBMIN'
      Origin = 'Svendedores.FV_COMISIONCOBMIN'
    end
    object blbfldVendedoresFV_TOLERANCIA: TBlobField
      FieldName = 'FV_TOLERANCIA'
      Origin = 'Svendedores.FV_TOLERANCIA'
    end
    object blbfldVendedoresFV_TABLACOMVOLUMEN: TBlobField
      FieldName = 'FV_TABLACOMVOLUMEN'
      Origin = 'Svendedores.FV_TABLACOMVOLUMEN'
    end
    object blbfldVendedoresFV_TABLATOLERANCIA: TBlobField
      FieldName = 'FV_TABLATOLERANCIA'
      Origin = 'Svendedores.FV_TABLATOLERANCIA'
    end
    object blbfldVendedoresFV_TABLAUTILIDAD: TBlobField
      FieldName = 'FV_TABLAUTILIDAD'
      Origin = 'Svendedores.FV_TABLAUTILIDAD'
    end
    object fieldVendedoresFV_ZONAVENTA: TStringField
      FieldName = 'FV_ZONAVENTA'
      Origin = 'Svendedores.FV_ZONAVENTA'
      Size = 50
    end
    object blnfldVendedoresFV_SUPERVISOR: TBooleanField
      FieldName = 'FV_SUPERVISOR'
      Origin = 'Svendedores.FV_SUPERVISOR'
    end
    object fieldVendedoresFV_GRUPO: TStringField
      FieldName = 'FV_GRUPO'
      Origin = 'Svendedores.FV_GRUPO'
      Size = 50
    end
    object atncfldVendedoresBASE_AUTOINCREMENT: TAutoIncField
      FieldName = 'BASE_AUTOINCREMENT'
      Origin = 'Svendedores.BASE_AUTOINCREMENT'
    end
    object fieldVendedoresFV_SERIE: TStringField
      FieldName = 'FV_SERIE'
      Origin = 'Svendedores.FV_SERIE'
    end
    object fieldVendedoresFV_MSGTEXTO1: TStringField
      FieldName = 'FV_MSGTEXTO1'
      Origin = 'Svendedores.FV_MSGTEXTO1'
    end
    object fieldVendedoresFV_MSGTEXTO2: TStringField
      FieldName = 'FV_MSGTEXTO2'
      Origin = 'Svendedores.FV_MSGTEXTO2'
    end
    object fieldVendedoresFV_MSGTEXTO3: TStringField
      FieldName = 'FV_MSGTEXTO3'
      Origin = 'Svendedores.FV_MSGTEXTO3'
    end
    object fieldVendedoresFV_MSGTEXTO4: TStringField
      FieldName = 'FV_MSGTEXTO4'
      Origin = 'Svendedores.FV_MSGTEXTO4'
    end
    object fieldVendedoresFV_MSGTEXTO5: TStringField
      FieldName = 'FV_MSGTEXTO5'
      Origin = 'Svendedores.FV_MSGTEXTO5'
    end
    object fieldVendedoresFV_CODENOMINA: TStringField
      FieldName = 'FV_CODENOMINA'
      Origin = 'Svendedores.FV_CODENOMINA'
      Size = 30
    end
    object fieldVendedoresFV_PATHNOMINA: TStringField
      FieldName = 'FV_PATHNOMINA'
      Origin = 'Svendedores.FV_PATHNOMINA'
      Size = 250
    end
    object fieldVendedoresFV_INTEGRANTE: TStringField
      FieldName = 'FV_INTEGRANTE'
      Origin = 'Svendedores.FV_INTEGRANTE'
      Size = 30
    end
    object fieldVendedoresFV_CONSTANTECOM: TStringField
      FieldName = 'FV_CONSTANTECOM'
      Origin = 'Svendedores.FV_CONSTANTECOM'
      Size = 30
    end
    object crncyfldVendedoresFV_PORCENTMETAUP: TCurrencyField
      FieldName = 'FV_PORCENTMETAUP'
      Origin = 'Svendedores.FV_PORCENTMETAUP'
    end
    object crncyfldVendedoresFV_PORCENTMETADOWN: TCurrencyField
      FieldName = 'FV_PORCENTMETADOWN'
      Origin = 'Svendedores.FV_PORCENTMETADOWN'
    end
    object crncyfldVendedoresFV_METAVENTAS1: TCurrencyField
      FieldName = 'FV_METAVENTAS1'
      Origin = 'Svendedores.FV_METAVENTAS1'
    end
    object crncyfldVendedoresFV_METAVENTAS2: TCurrencyField
      FieldName = 'FV_METAVENTAS2'
      Origin = 'Svendedores.FV_METAVENTAS2'
    end
    object crncyfldVendedoresFV_METAVENTAS3: TCurrencyField
      FieldName = 'FV_METAVENTAS3'
      Origin = 'Svendedores.FV_METAVENTAS3'
    end
    object crncyfldVendedoresFV_METAVENTAS4: TCurrencyField
      FieldName = 'FV_METAVENTAS4'
      Origin = 'Svendedores.FV_METAVENTAS4'
    end
    object crncyfldVendedoresFV_METAVENTAS5: TCurrencyField
      FieldName = 'FV_METAVENTAS5'
      Origin = 'Svendedores.FV_METAVENTAS5'
    end
    object crncyfldVendedoresFV_METAVENTAS6: TCurrencyField
      FieldName = 'FV_METAVENTAS6'
      Origin = 'Svendedores.FV_METAVENTAS6'
    end
    object crncyfldVendedoresFV_METAVENTAS7: TCurrencyField
      FieldName = 'FV_METAVENTAS7'
      Origin = 'Svendedores.FV_METAVENTAS7'
    end
    object crncyfldVendedoresFV_METAVENTAS8: TCurrencyField
      FieldName = 'FV_METAVENTAS8'
      Origin = 'Svendedores.FV_METAVENTAS8'
    end
    object crncyfldVendedoresFV_METAVENTAS9: TCurrencyField
      FieldName = 'FV_METAVENTAS9'
      Origin = 'Svendedores.FV_METAVENTAS9'
    end
    object crncyfldVendedoresFV_METAVENTAS10: TCurrencyField
      FieldName = 'FV_METAVENTAS10'
      Origin = 'Svendedores.FV_METAVENTAS10'
    end
    object crncyfldVendedoresFV_METAVENTAS11: TCurrencyField
      FieldName = 'FV_METAVENTAS11'
      Origin = 'Svendedores.FV_METAVENTAS11'
    end
    object crncyfldVendedoresFV_METAVENTAS12: TCurrencyField
      FieldName = 'FV_METAVENTAS12'
      Origin = 'Svendedores.FV_METAVENTAS12'
    end
    object crncyfldVendedoresFV_PORCENTSVENTA: TCurrencyField
      FieldName = 'FV_PORCENTSVENTA'
      Origin = 'Svendedores.FV_PORCENTSVENTA'
    end
  end
  object sqLista: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT'
      '  Sinvlote.FL_CODIGO,        '
      '  SInventario.FI_DESCRIPCION,'
      '  SInvLote.FL_LOTE,'
      '  Sinvlote.FL_COSTO,'
      '  Sinvlote.FL_PRECIOIMPORTADO,'
      '  Sinvlote.FL_PRECIOSINIMPUESTO,'
      '  Sinvlote.FL_MONTOIMPUESTO1,'
      '  Sinvlote.FL_MONTOIMPUESTO2,'
      '  Sinvlote.FL_VENCIMIENTO,'
      '  SinvDep.FT_CODIGOPRODUCTO,'
      
        '  SinvDep.FT_EXISTENCIA As Existencia                           ' +
        '       '
      'FROM'
      ' sInvDep'
      
        ' INNER JOIN SinvLote ON (SInvDep.FT_CODIGOPRODUCTO=Sinvlote.FL_C' +
        'ODIGO)AND(SInvLote.FL_LOTE=sInvDep.FT_LOTE)'
      
        ' INNER JOIN Sinventario ON (SInvDep.FT_CODIGOPRODUCTO=Sinventari' +
        'o.FI_CODIGO)'
      'WHERE  Sinvlote. FL_STATUS = True and SInvDep.FT_EXISTENCIA >=1'
      'ORDER BY  SInventario.FI_DESCRIPCION asc')
    Params = <>
    Left = 176
    Top = 256
    object fieldListaFL_CODIGO: TStringField
      FieldName = 'FL_CODIGO'
      Origin = 'SinvLote.FL_CODIGO'
      Size = 30
    end
    object fieldListaFI_DESCRIPCION: TStringField
      FieldName = 'FI_DESCRIPCION'
      Origin = 'Sinventario.FI_DESCRIPCION'
      Size = 250
    end
    object fieldListaFL_LOTE: TStringField
      FieldName = 'FL_LOTE'
      Origin = 'SinvLote.FL_LOTE'
      Size = 50
    end
    object crncyfldListaFL_COSTO: TCurrencyField
      FieldName = 'FL_COSTO'
      Origin = 'SinvLote.FL_COSTO'
    end
    object crncyfldListaFL_PRECIOSINIMPUESTO: TCurrencyField
      FieldName = 'FL_PRECIOSINIMPUESTO'
      Origin = 'SinvLote.FL_PRECIOSINIMPUESTO'
    end
    object crncyfldListaFL_MONTOIMPUESTO1: TCurrencyField
      FieldName = 'FL_MONTOIMPUESTO1'
      Origin = 'SinvLote.FL_MONTOIMPUESTO1'
    end
    object crncyfldListaFL_MONTOIMPUESTO2: TCurrencyField
      FieldName = 'FL_MONTOIMPUESTO2'
      Origin = 'SinvLote.FL_MONTOIMPUESTO2'
    end
    object fieldListaFT_CODIGOPRODUCTO: TStringField
      FieldName = 'FT_CODIGOPRODUCTO'
      Origin = 'sInvDep.FT_CODIGOPRODUCTO'
      Size = 30
    end
    object crncyfldListaExistencia: TCurrencyField
      FieldName = 'Existencia'
      Origin = 'sInvDep.FT_EXISTENCIA'
    end
    object crncyfldListaFL_PRECIOIMPORTADO: TCurrencyField
      FieldName = 'FL_PRECIOIMPORTADO'
      Origin = 'SinvLote.FL_PRECIOIMPORTADO'
    end
    object sqListaFL_VENCIMIENTO: TDateField
      FieldName = 'FL_VENCIMIENTO'
      Origin = 'SinvLote.FL_VENCIMIENTO'
    end
    object fieldListaZZCAMPO_001: TStringField
      FieldName = 'ZZCAMPO_001'
      Origin = 'Sinventario.ZZCAMPO_001'
      Size = 60
    end
  end
  object sqbuscarProducto: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      
        'SELECT FI_CODIGO,  FI_DESCRIPCION, FIC_P01PRECIOTOTALEXT FROM Si' +
        'nventario'
      'INNER JOIN a2InvCostosPrecios on FI_CODIGO = FIC_CODEITEM '
      'WHERE FI_CODIGO = :PCODIGO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'PCODIGO'
      end>
    Left = 392
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PCODIGO'
      end>
    object fieldProductoFI_CODIGO: TStringField
      FieldName = 'FI_CODIGO'
      Origin = 'Sinventario.FI_CODIGO'
      Size = 30
    end
    object fieldProductoFI_DESCRIPCION: TStringField
      FieldName = 'FI_DESCRIPCION'
      Origin = 'Sinventario.FI_DESCRIPCION'
      Size = 250
    end
    object fieldProductoFIC_P01PRECIOTOTALEXT: TFloatField
      FieldName = 'FIC_P01PRECIOTOTALEXT'
      Origin = 'a2InvCostosPrecios.FIC_P01PRECIOTOTALEXT'
    end
  end
  object sqCambiarCodigo: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      
        'SELECT S.FCC_SERIE, S.FCC_MONTOMONEDAEXT,  S.FCC_FACTORCAMBIO, S' +
        '.FCC_ULTFECHAABONO, S.FCC_FECHAPROXIMA, S.FCC_FECHAVENCIMIENTO, ' +
        'S.FCC_DESCRIPCIONMOV, S.FCC_SALDODOCUMENTO, S.FCC_MONTODOCUMENTO' +
        ', S.FCC_FECHAEMISION, S.FCC_TIPOTRANSACCION, S.FCC_NUMERO, S.FCC' +
        '_CODIGO, FCC_NROVENDEDOR, S1.FC_DESCRIPCION, S1.FC_RIF, S1.FC_CO' +
        'NTACTO, S1.FC_TELEFONO'
      'FROM SCuentasxcobrar S'
      ''
      'INNER JOIN Sclientes S1 ON (S.FCC_CODIGO=S1.FC_CODIGO)'
      
        'WHERE (S.FCC_SALDODOCUMENTO = 0)AND(S.FCC_TIPOTRANSACCION = 1)AN' +
        'D(S.FCC_ULTFECHAABONO BETWEEN  :FECHA1 AND :FECHA2)'
      'ORDER BY S.FCC_SERIE, FCC_NUMERO ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
      end>
    Left = 120
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
      end>
  end
  object sqVerificarCodigo: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      
        'SELECT S.FCC_SERIE, S.FCC_MONTOMONEDAEXT,  S.FCC_FACTORCAMBIO, S' +
        '.FCC_ULTFECHAABONO, S.FCC_FECHAPROXIMA, S.FCC_FECHAVENCIMIENTO, ' +
        'S.FCC_DESCRIPCIONMOV, S.FCC_SALDODOCUMENTO, S.FCC_MONTODOCUMENTO' +
        ', S.FCC_FECHAEMISION, S.FCC_TIPOTRANSACCION, S.FCC_NUMERO, S.FCC' +
        '_CODIGO, FCC_NROVENDEDOR, S1.FC_DESCRIPCION, S1.FC_RIF, S1.FC_CO' +
        'NTACTO, S1.FC_TELEFONO'
      'FROM SCuentasxcobrar S'
      ''
      'INNER JOIN Sclientes S1 ON (S.FCC_CODIGO=S1.FC_CODIGO)'
      
        'WHERE (S.FCC_SALDODOCUMENTO = 0)AND(S.FCC_TIPOTRANSACCION = 1)AN' +
        'D(S.FCC_ULTFECHAABONO BETWEEN  :FECHA1 AND :FECHA2)'
      'ORDER BY S.FCC_SERIE, FCC_NUMERO ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
      end>
    Left = 664
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
      end>
  end
  object sqLicores: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      
        'SELECT  SUM(S.FDI_CANTIDAD *  S2.FI_CAPACIDAD AS TOTAL ),S1.FTI_' +
        'RIFCLIENTE, S1.FTI_DOCUMENTO AS DOCUMENTO, S1.FTI_FECHAEMISION, ' +
        'S1.FTI_TIPO, S1.FTI_STATUS, S2.FI_SUBCATEGORIA AS ESPECIE, S1.FT' +
        'I_PERSONACONTACTO, S1.FTI_ZONAVENTA, S1.FTI_SERIE, S.FDI_CODIGO,' +
        ' S.FDI_DEPOSITOSOURCE,'
      
        'S.FDI_CANTIDAD, S2.FI_DESCRIPCION, S2.FI_CATEGORIA, S2.FI_UNIDAD' +
        ' AS LTS, S2.FI_MARCA, S2.FI_REFERENCIA AS GRADOALCOHOLICO, S2.FI' +
        '_CAPACIDAD AS CAPACIDAD,'
      
        'S2.FI_MODELO AS NACIONALIMPORTADO, S2.FI_MONTOCOMISION AS COMISI' +
        'ON, S4.FZ_DESCRIPCION AS DESTINO'
      'FROM SOperacionInv S1'
      
        'INNER JOIN sDetalleventa S ON (S1.FTI_AUTOINCREMENT=S.FDI_OPERAC' +
        'ION_AUTOINCREMENT)'
      'INNER JOIN SInventario S2 ON (S.FDI_CODIGO=S2.FI_CODIGO)'
      'INNER JOIN Scategoria S3 ON (S2.FI_CATEGORIA=S3.FD_CODIGO)'
      'LEFT OUTER JOIN SZonas S4 ON (S1.FTI_ZONAVENTA=S4.FZ_CODIGO)'
      
        'WHERE (S2.FI_CATEGORIA = '#39'00002'#39') AND (S1.FTI_TIPO=11) AND (S1.F' +
        'TI_STATUS=1)AND(S1.FTI_FECHAEMISION BETWEEN '#39'2023-01-01'#39' AND '#39'20' +
        '23-10-24'#39')AND(S1.FTI_SERIE='#39'FISCAL'#39')AND(S2.FI_UNIDAD <> '#39#39')'
      'ORDER BY S1.FTI_FECHAEMISION')
    Params = <>
    Left = 568
    Top = 152
  end
  object sqLicoresEntrada: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      
        'SELECT S1.FTI_RIFCLIENTE, S1.FTI_DOCUMENTO AS DOCUMENTO, S1.FTI_' +
        'FECHAEMISION, S1.FTI_TIPO, S1.FTI_STATUS, S2.FI_SUBCATEGORIA AS ' +
        'ESPECIE, S1.FTI_PERSONACONTACTO, S1.FTI_ZONAVENTA, S1.FTI_SERIE,' +
        ' S.FDI_CODIGO, S.FDI_DEPOSITOSOURCE,'
      
        'S.FDI_CANTIDAD, S2.FI_DESCRIPCION, S2.FI_CATEGORIA, S2.FI_UNIDAD' +
        ' AS LTS, S2.FI_MARCA, S2.FI_REFERENCIA AS GRADOALCOHOLICO, S2.FI' +
        '_CAPACIDAD AS CAPACIDAD,'
      
        'S2.FI_MODELO AS NACIONALIMPORTADO, S2.FI_MONTOCOMISION AS COMISI' +
        'ON, S4.FZ_DESCRIPCION AS DESTINO'
      'FROM SOperacionInv S1'
      
        'INNER JOIN sDetalleventa S ON (S1.FTI_AUTOINCREMENT=S.FDI_OPERAC' +
        'ION_AUTOINCREMENT)'
      'INNER JOIN SInventario S2 ON (S.FDI_CODIGO=S2.FI_CODIGO)'
      'INNER JOIN Scategoria S3 ON (S2.FI_CATEGORIA=S3.FD_CODIGO)'
      'LEFT OUTER JOIN SZonas S4 ON (S1.FTI_ZONAVENTA=S4.FZ_CODIGO)'
      
        'WHERE (S2.FI_CATEGORIA = '#39'00002'#39') AND (S1.FTI_TIPO=6) AND (S1.FT' +
        'I_STATUS=1)AND(S1.FTI_FECHAEMISION BETWEEN '#39'2023-01-01'#39' AND '#39'202' +
        '3-10-24'#39')AND(S1.FTI_SERIE='#39'FISCAL'#39')AND(S2.FI_UNIDAD <> '#39#39')'
      'ORDER BY S1.FTI_FECHAEMISION')
    Params = <>
    Left = 696
    Top = 80
  end
  object ds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtsp1'
    Left = 616
    Top = 328
    object fieldds1FTI_RIFCLIENTE: TStringField
      FieldName = 'FTI_RIFCLIENTE'
      Size = 50
    end
    object fieldds1DOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object dtmfldds1FTI_FECHAEMISION: TDateTimeField
      FieldName = 'FTI_FECHAEMISION'
    end
    object intgrfldds1FTI_TIPO: TIntegerField
      FieldName = 'FTI_TIPO'
    end
    object intgrfldds1FTI_STATUS: TIntegerField
      FieldName = 'FTI_STATUS'
    end
    object fieldds1ESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 50
    end
    object fieldds1FTI_PERSONACONTACTO: TStringField
      FieldName = 'FTI_PERSONACONTACTO'
      Size = 100
    end
    object fieldds1FTI_ZONAVENTA: TStringField
      FieldName = 'FTI_ZONAVENTA'
      Size = 25
    end
    object fieldds1FTI_SERIE: TStringField
      FieldName = 'FTI_SERIE'
    end
    object fieldds1FDI_CODIGO: TStringField
      FieldName = 'FDI_CODIGO'
      Size = 40
    end
    object intgrfldds1FDI_DEPOSITOSOURCE: TIntegerField
      FieldName = 'FDI_DEPOSITOSOURCE'
    end
    object fieldds1FDI_CANTIDAD: TFloatField
      FieldName = 'FDI_CANTIDAD'
    end
    object fieldds1FI_DESCRIPCION: TStringField
      FieldName = 'FI_DESCRIPCION'
      Size = 250
    end
    object fieldds1FI_CATEGORIA: TStringField
      FieldName = 'FI_CATEGORIA'
      Size = 30
    end
    object fieldds1LTS: TStringField
      FieldName = 'LTS'
      Size = 30
    end
    object fieldds1FI_MARCA: TStringField
      FieldName = 'FI_MARCA'
      Size = 30
    end
    object fieldds1GRADOALCOHOLICO: TStringField
      FieldName = 'GRADOALCOHOLICO'
      Size = 30
    end
    object crncyfldds1CAPACIDAD: TCurrencyField
      FieldName = 'CAPACIDAD'
    end
    object fieldds1NACIONALIMPORTADO: TStringField
      FieldName = 'NACIONALIMPORTADO'
      Size = 50
    end
    object crncyfldds1COMISION: TCurrencyField
      FieldName = 'COMISION'
    end
    object fieldds1DESTINO: TStringField
      FieldName = 'DESTINO'
      Size = 40
    end
    object crncyfldds1totallitros: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'totallitros'
      Calculated = True
    end
  end
  object dtsp1: TDataSetProvider
    DataSet = sqLicores
    Left = 544
    Top = 304
  end
  object tmemSalidas: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'FTI_RIFCLIENTE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 21
      end
      item
        Name = 'FTI_FECHAEMISION'
        DataType = ftDate
      end
      item
        Name = 'FTI_TIPO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'FTI_STATUS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ESPECIE'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'FTI_PERSONACONTACTO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'FDI_CODIGO'
        DataType = ftString
        Size = 21
      end
      item
        Name = 'FDI_CANTIDAD'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'FI_DESCRIPCION'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'GRADOALCOHOLICO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CAPACIDAD'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'NACIONALIMPORTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TOTALVENTA'
        DataType = ftCurrency
        Precision = 19
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 632
    Top = 152
    object fieldSalidasFTI_RIFCLIENTE: TStringField
      FieldName = 'FTI_RIFCLIENTE'
      Size = 15
    end
    object fieldSalidasFTI_DOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 21
    end
    object tmemSalidasFTI_FECHAEMISION: TDateField
      FieldName = 'FTI_FECHAEMISION'
    end
    object fieldSalidasFTI_TIPO: TStringField
      FieldName = 'FTI_TIPO'
      Size = 4
    end
    object fieldSalidasFTI_STATUS: TStringField
      FieldName = 'FTI_STATUS'
      Size = 4
    end
    object fieldSalidasESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 120
    end
    object fieldSalidasFTI_PERSONACONTACTO: TStringField
      FieldName = 'FTI_PERSONACONTACTO'
      Size = 255
    end
    object fieldSalidasFDI_CODIGO: TStringField
      FieldName = 'FDI_CODIGO'
      Size = 21
    end
    object crncyfldSalidasFDI_CANTIDAD: TCurrencyField
      FieldName = 'FDI_CANTIDAD'
    end
    object fieldSalidasFI_DESCRIPCION: TStringField
      FieldName = 'FI_DESCRIPCION'
      Size = 255
    end
    object fieldSalidasGRADOALCOHOLICO: TStringField
      FieldName = 'GRADOALCOHOLICO'
      Size = 6
    end
    object crncyfldSalidasCAPACIDAD: TCurrencyField
      FieldName = 'CAPACIDAD'
    end
    object fieldSalidasNACIONALIMPORTADO: TStringField
      FieldName = 'NACIONALIMPORTADO'
    end
    object crncyfldSalidasTOTALVENTA: TCurrencyField
      FieldName = 'TOTALVENTA'
    end
    object fieldSalidasFI_CATEGORIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'FI_CATEGORIA'
      Size = 21
      Calculated = True
    end
  end
  object tmemEntradas: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 712
    Top = 168
    object field: TStringField
      FieldName = 'FTI_RIFCLIENTE'
      Size = 15
    end
    object field1: TStringField
      FieldName = 'DOCUMENTO'
      Size = 21
    end
    object DateField1: TDateField
      FieldName = 'FTI_FECHAEMISION'
    end
    object field2: TStringField
      FieldName = 'FTI_TIPO'
      Size = 4
    end
    object field3: TStringField
      FieldName = 'FTI_STATUS'
      Size = 4
    end
    object field4: TStringField
      FieldName = 'ESPECIE'
      Size = 120
    end
    object field5: TStringField
      FieldName = 'FTI_PERSONACONTACTO'
      Size = 255
    end
    object field6: TStringField
      FieldName = 'FDI_CODIGO'
      Size = 21
    end
    object crncyfld: TCurrencyField
      FieldName = 'FDI_CANTIDAD'
    end
    object field7: TStringField
      FieldName = 'FI_DESCRIPCION'
      Size = 255
    end
    object field8: TStringField
      FieldName = 'GRADOALCOHOLICO'
      Size = 6
    end
    object crncyfld1: TCurrencyField
      FieldName = 'CAPACIDAD'
    end
    object field9: TStringField
      FieldName = 'NACIONALIMPORTADO'
    end
    object crncyfld2: TCurrencyField
      FieldName = 'TOTALCOMPRAS'
    end
    object field10: TStringField
      FieldKind = fkCalculated
      FieldName = 'FI_CATEGORIA'
      Size = 21
      Calculated = True
    end
  end
  object sqCompras: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'Select * from SOPERACIONINV A'
      'LEFT OUTER JOIN SRETENCIONCLIENTE B'
      
        'ON (A.FTI_DOCUMENTO=B.FCC_NUMERO2)AND(B.FCC_CODIGO=A.FTI_RESPONS' +
        'ABLE)AND(B.FCC_MONTORETENCION>0)AND(B.FCC_TIPOOPERACION = '#39#39#39#39#39#39 +
        ')')
    Params = <>
    Left = 680
    Top = 384
  end
  object sqVentas: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'Select * from SOPERACIONINV A'
      'LEFT OUTER JOIN SRETENCIONCLIENTE B'
      
        'ON (A.FTI_DOCUMENTO=B.FCC_NUMERO2)AND(B.FCC_CODIGO=A.FTI_RESPONS' +
        'ABLE)AND(B.FCC_MONTORETENCION>0)AND(B.FCC_TIPOOPERACION = '#39#39#39#39#39#39 +
        ')')
    Params = <>
    Left = 544
    Top = 392
  end
end

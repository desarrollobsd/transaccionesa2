object formProductosVendidos: TformProductosVendidos
  Left = 0
  Top = 0
  Caption = 'formProductosVendidos'
  ClientHeight = 410
  ClientWidth = 546
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 323
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 853
    object et3: TLabel
      Left = 16
      Top = 277
      Width = 84
      Height = 23
      Caption = 'Cant. SKU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object rgProductos: TRadioGroup
      Left = 16
      Top = 16
      Width = 249
      Height = 105
      Caption = 'Productos    '
      ItemIndex = 0
      Items.Strings = (
        'Mas Vendidos       '
        'Fallas')
      TabOrder = 0
      OnClick = rgProductosClick
    end
    object grp1: TGroupBox
      Left = 271
      Top = 16
      Width = 266
      Height = 105
      Caption = 'Periodo   '
      TabOrder = 1
      object et1: TLabel
        Left = 11
        Top = 24
        Width = 105
        Height = 19
        Caption = 'FECHA INICIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object et2: TLabel
        Left = 11
        Top = 69
        Width = 98
        Height = 19
        Caption = 'FECHA FINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object fechadesde: TDateTimePicker
        Left = 127
        Top = 18
        Width = 122
        Height = 31
        Date = 45496.872570625000000000
        Time = 45496.872570625000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object fechahasta: TDateTimePicker
        Left = 127
        Top = 63
        Width = 122
        Height = 31
        Date = 45496.872570625000000000
        Time = 45496.872570625000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object rgFiltros: TRadioGroup
      Left = 16
      Top = 127
      Width = 521
      Height = 130
      Caption = 'Filtros'
      ItemIndex = 0
      Items.Strings = (
        'General'
        'Por Departamento'
        'Por Proveedor')
      TabOrder = 2
      OnClick = rgFiltrosClick
    end
    object lkDepartamento: TDBLookupComboBox
      Left = 152
      Top = 168
      Width = 368
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'FD_CODIGO'
      ListField = 'FD_DESCRIPCION'
      ListSource = dsDepartamento
      ParentFont = False
      TabOrder = 3
    end
    object edtItems: TEdit
      Left = 124
      Top = 269
      Width = 80
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = '10'
    end
    object lkProveedor: TDBLookupComboBox
      Left = 152
      Top = 216
      Width = 368
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'FP_CODIGO'
      ListField = 'FP_DESCRIPCION'
      ListSource = dsProveedor
      ParentFont = False
      TabOrder = 5
    end
    object pb1: TProgressBar
      Left = 16
      Top = 306
      Width = 521
      Height = 17
      TabOrder = 6
      Visible = False
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 329
    Width = 546
    Height = 81
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 305
    ExplicitWidth = 552
    object btn1: TButton
      Left = 418
      Top = 0
      Width = 128
      Height = 81
      Align = alRight
      Caption = 'Mostrar'
      TabOrder = 0
      OnClick = btn1Click
      ExplicitLeft = 424
    end
    object btn2: TButton
      Left = 306
      Top = 0
      Width = 112
      Height = 81
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btn2Click
      ExplicitLeft = 312
    end
  end
  object sqProductos: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      
        'SELECT SUM(S3.FT_EXISTENCIA) AS TotalExistencia,  S.FDI_DOCUMENT' +
        'O, S.FDI_OPERACION_AUTOINCREMENT, S.FDI_COSTO, S.FDI_COSTOOPERAC' +
        'ION, S.FDI_MONTOIMPUESTO1, S.FDI_PRECIOSINDESCUENTO, '
      
        'S.FDI_PRECIOCONDESCUENTO,S.FDI_COSTODEVENTAS, S.FDI_PRECIODEVENT' +
        'A, S.FDI_TIPOOPERACION, S.FDI_CODIGO, S.FDI_CLIENTEPROVEEDOR, S1' +
        '.FI_CATEGORIA, S1.FI_SUBCATEGORIA,'
      
        'S.FDI_DESCUENTOPARCIAL, S.FDI_PORCENTDESCUENTO1, S.FDI_STATUS, S' +
        '2.FC_DESCRIPCION AS NOMBRECLIENTE, S2.FC_ZONA AS ZONACLIENTE, S2' +
        '.FC_CODIGO AS CODIGOCLIENTE,'
      
        'S1.FI_MARCA, S1.FI_CODIGO, S1.FI_DESCRIPCION, S.FDI_CANTIDAD AS ' +
        'TOTALCANTIDAD, FDI_CANTIDADPENDIENTE AS CANTIDADPENDIENTE, S.FDI' +
        '_FECHAOPERACION'
      'FROM SDetalleVenta S'
      'INNER JOIN sInventario S1 ON S.FDI_CODIGO=S1.FI_CODIGO'
      'INNER JOIN sClientes S2 ON S.FDI_CLIENTEPROVEEDOR=S2.FC_CODIGO'
      'INNER JOIN SInvDep S3 ON S1.FI_CODIGO=S3.FT_CODIGOPRODUCTO'
      'GROUP BY S1.FI_CODIGO')
    Params = <>
    Left = 196
    Top = 248
    object fieldProductosFDI_DOCUMENTO: TStringField
      FieldName = 'FDI_DOCUMENTO'
      Origin = 'SDetalleVenta.FDI_DOCUMENTO'
      Size = 30
    end
    object intgrfldProductosFDI_OPERACION_AUTOINCREMENT: TIntegerField
      FieldName = 'FDI_OPERACION_AUTOINCREMENT'
      Origin = 'SDetalleVenta.FDI_OPERACION_AUTOINCREMENT'
    end
    object crncyfldProductosFDI_COSTO: TCurrencyField
      FieldName = 'FDI_COSTO'
      Origin = 'SDetalleVenta.FDI_COSTO'
    end
    object crncyfldProductosFDI_COSTOOPERACION: TCurrencyField
      FieldName = 'FDI_COSTOOPERACION'
      Origin = 'SDetalleVenta.FDI_COSTOOPERACION'
    end
    object crncyfldProductosFDI_MONTOIMPUESTO1: TCurrencyField
      FieldName = 'FDI_MONTOIMPUESTO1'
      Origin = 'SDetalleVenta.FDI_MONTOIMPUESTO1'
    end
    object crncyfldProductosFDI_PRECIOSINDESCUENTO: TCurrencyField
      FieldName = 'FDI_PRECIOSINDESCUENTO'
      Origin = 'SDetalleVenta.FDI_PRECIOSINDESCUENTO'
    end
    object crncyfldProductosFDI_PRECIOCONDESCUENTO: TCurrencyField
      FieldName = 'FDI_PRECIOCONDESCUENTO'
      Origin = 'SDetalleVenta.FDI_PRECIOCONDESCUENTO'
    end
    object crncyfldProductosFDI_COSTODEVENTAS: TCurrencyField
      FieldName = 'FDI_COSTODEVENTAS'
      Origin = 'SDetalleVenta.FDI_COSTODEVENTAS'
    end
    object crncyfldProductosFDI_PRECIODEVENTA: TCurrencyField
      FieldName = 'FDI_PRECIODEVENTA'
      Origin = 'SDetalleVenta.FDI_PRECIODEVENTA'
    end
    object intgrfldProductosFDI_TIPOOPERACION: TIntegerField
      FieldName = 'FDI_TIPOOPERACION'
      Origin = 'SDetalleVenta.FDI_TIPOOPERACION'
    end
    object fieldProductosFDI_CODIGO: TStringField
      FieldName = 'FDI_CODIGO'
      Origin = 'SDetalleVenta.FDI_CODIGO'
      Size = 40
    end
    object fieldProductosFDI_CLIENTEPROVEEDOR: TStringField
      FieldName = 'FDI_CLIENTEPROVEEDOR'
      Origin = 'SDetalleVenta.FDI_CLIENTEPROVEEDOR'
      Size = 40
    end
    object fieldProductosFI_CATEGORIA: TStringField
      FieldName = 'FI_CATEGORIA'
      Origin = 'sInventario.FI_CATEGORIA'
      Size = 30
    end
    object fieldProductosFI_SUBCATEGORIA: TStringField
      FieldName = 'FI_SUBCATEGORIA'
      Origin = 'sInventario.FI_SUBCATEGORIA'
      Size = 50
    end
    object crncyfldProductosFDI_DESCUENTOPARCIAL: TCurrencyField
      FieldName = 'FDI_DESCUENTOPARCIAL'
      Origin = 'SDetalleVenta.FDI_DESCUENTOPARCIAL'
    end
    object crncyfldProductosFDI_PORCENTDESCUENTO1: TCurrencyField
      FieldName = 'FDI_PORCENTDESCUENTO1'
      Origin = 'SDetalleVenta.FDI_PORCENTDESCUENTO1'
    end
    object intgrfldProductosFDI_STATUS: TIntegerField
      FieldName = 'FDI_STATUS'
      Origin = 'SDetalleVenta.FDI_STATUS'
    end
    object fieldProductosFI_MARCA: TStringField
      FieldName = 'FI_MARCA'
      Origin = 'sInventario.FI_MARCA'
      Size = 30
    end
    object fieldProductosFI_CODIGO: TStringField
      FieldName = 'FI_CODIGO'
      Origin = 'sInventario.FI_CODIGO'
      Size = 30
    end
    object fieldProductosFI_DESCRIPCION: TStringField
      FieldName = 'FI_DESCRIPCION'
      Origin = 'sInventario.FI_DESCRIPCION'
      Size = 250
    end
    object fieldProductosTOTALCANTIDAD: TFloatField
      FieldName = 'TOTALCANTIDAD'
      Origin = 'SDetalleVenta.FDI_CANTIDAD'
    end
    object fieldProductosCANTIDADPENDIENTE: TFloatField
      FieldName = 'CANTIDADPENDIENTE'
      Origin = 'SDetalleVenta.FDI_CANTIDADPENDIENTE'
    end
    object sqProductosFDI_FECHAOPERACION: TDateField
      FieldName = 'FDI_FECHAOPERACION'
      Origin = 'SDetalleVenta.FDI_FECHAOPERACION'
    end
    object crncyfldProductosTotalExistencia: TCurrencyField
      FieldName = 'TotalExistencia'
    end
  end
  object repProductos1: TfrxReport
    Version = '6.9.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Por defecto'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38688.859747893500000000
    ReportOptions.LastChange = 45498.342598553240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '{*******************************************}'
      '{*  CODIGO PROPIEDAD DE:                   *}'
      '{*  SMARTSOFT, C.A. Y/O JOSE L. BARRIOS R. *}'
      '{*  DISE'#209'O Y PROGRAMACI'#211'N:                 *}'
      '{*             JOSE L. BARRIOS R.          *}'
      '{*******************************************}'
      'Var'
      '  FechaInicio,'
      '  FechaFin         : TDateTime;'
      '  TablePrefix,'
      '  strPeriodoActual : String;'
      '  Precio,'
      '  Dscto,'
      '  PrecioNeto,'
      '  Costo,'
      '  PorcUtilidad     : Double;'
      ''
      '//*******************************}'
      'begin'
      ''
      'end.')
    Left = 40
    Top = 240
    Datasets = <
      item
        DataSet = fsqProdutos
        DataSetName = 'Productos'
      end>
    Variables = <
      item
        Name = ' Variables'
        Value = Null
      end
      item
        Name = 'Empresa'
        Value = ''
      end
      item
        Name = 'Departamento'
        Value = ''
      end
      item
        Name = 'FechaInicio'
        Value = ''
      end
      item
        Name = 'FechaFin'
        Value = ''
      end
      item
        Name = 'Usuario'
        Value = ''
      end
      item
        Name = 'FechaHora'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object ReporteVentasProductos: TfrxReportPage
      VGuides.Strings = (
        '773')
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 5.099999999999999000
      RightMargin = 5.099999999999999000
      TopMargin = 5.099999999999999000
      BottomMargin = 15.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object CabeceraPagina: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 108.456153330000000000
        Top = 18.897650000000000000
        Width = 777.449321000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Top = 17.918120000000000000
          Width = 771.500000000000000000
          Height = 16.515770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte Productos Vendidos ')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 680.833333330000000000
          Top = 37.800000000000000000
          Width = 92.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [PAGE#]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 616.833333330000000000
          Top = 22.800000000000000000
          Width = 156.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DATE] - [TIME]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 37.918120000000000000
          Width = 264.492270000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Desde: [FechaInicio]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 52.918120000000000000
          Width = 264.492270000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Hasta: [FechaFin]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object mmFiltroDepto: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 68.315770000000000000
          Width = 423.500000000000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Departamentos: [Departamento]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 56.173160000000000000
          Top = 84.602350000000000000
          Width = 63.200000000000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Producto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 120.173160000000000000
          Top = 84.602350000000000000
          Width = 515.603340000000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Descripci'#243'n Producto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 703.790043340000000000
          Top = 84.602350000000000000
          Width = 69.209956660000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Existencia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Top = 84.602350000000000000
          Width = 54.266666670000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            'Documento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Width = 771.500000000000000000
          Height = 20.295300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Empresa]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 643.317563340000000000
          Top = 84.602350000000000000
          Width = 57.871366660000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Cantidad')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PiePagina: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.000000000000000000
        Top = 272.126160000000000000
        Width = 777.449321000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 188.976500000000000000
        Width = 777.449321000000000000
        DataSet = fsqProdutos
        DataSetName = 'Productos'
        RowCount = 0
        object ProductosFDI_DOCUMENTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 1.500000000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'FDI_DOCUMENTO'
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Productos."FDI_DOCUMENTO"]')
        end
        object ProductosFDI_CODIGO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 58.668830000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'FDI_CODIGO'
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Productos."FDI_CODIGO"]')
        end
        object ProductosFI_DESCRIPCION: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 130.479900000000000000
          Width = 502.677490000000000000
          Height = 18.897650000000000000
          DataField = 'FI_DESCRIPCION'
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Productos."FI_DESCRIPCION"]')
        end
        object ProductosTOTALCANTIDAD: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 640.716450000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[Productos."TOTALCANTIDAD"]')
        end
        object ProductosTotalExistencia: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 704.968460000000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[Productos."TotalExistencia"]')
        end
      end
    end
  end
  object fsqProdutos: TfrxDBDataset
    UserName = 'Productos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FDI_DOCUMENTO=FDI_DOCUMENTO'
      'FDI_OPERACION_AUTOINCREMENT=FDI_OPERACION_AUTOINCREMENT'
      'FDI_COSTO=FDI_COSTO'
      'FDI_COSTOOPERACION=FDI_COSTOOPERACION'
      'FDI_MONTOIMPUESTO1=FDI_MONTOIMPUESTO1'
      'FDI_PRECIOSINDESCUENTO=FDI_PRECIOSINDESCUENTO'
      'FDI_PRECIOCONDESCUENTO=FDI_PRECIOCONDESCUENTO'
      'FDI_COSTODEVENTAS=FDI_COSTODEVENTAS'
      'FDI_PRECIODEVENTA=FDI_PRECIODEVENTA'
      'FDI_TIPOOPERACION=FDI_TIPOOPERACION'
      'FDI_CODIGO=FDI_CODIGO'
      'FDI_CLIENTEPROVEEDOR=FDI_CLIENTEPROVEEDOR'
      'FI_CATEGORIA=FI_CATEGORIA'
      'FI_SUBCATEGORIA=FI_SUBCATEGORIA'
      'FDI_DESCUENTOPARCIAL=FDI_DESCUENTOPARCIAL'
      'FDI_PORCENTDESCUENTO1=FDI_PORCENTDESCUENTO1'
      'FDI_STATUS=FDI_STATUS'
      'FI_MARCA=FI_MARCA'
      'FI_CODIGO=FI_CODIGO'
      'FI_DESCRIPCION=FI_DESCRIPCION'
      'TOTALCANTIDAD=TOTALCANTIDAD'
      'CANTIDADPENDIENTE=CANTIDADPENDIENTE'
      'FDI_FECHAOPERACION=FDI_FECHAOPERACION'
      'TotalExistencia=TotalExistencia')
    DataSet = sqProductos
    BCDToCurrency = False
    Left = 112
    Top = 240
  end
  object sqDepartamento: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT FD_CODIGO, FD_DESCRIPCION FROM Scategoria')
    Params = <>
    Left = 204
    Top = 16
  end
  object dsDepartamento: TDataSource
    DataSet = sqDepartamento
    Left = 88
    Top = 48
  end
  object repProductos: TfrxReport
    Version = '6.9.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Por defecto'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38688.859747893500000000
    ReportOptions.LastChange = 45498.345181423610000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '{*******************************************}'
      '{*  CODIGO PROPIEDAD DE:                   *}'
      '{*  SMARTSOFT, C.A. Y/O JOSE L. BARRIOS R. *}'
      '{*  DISE'#209'O Y PROGRAMACI'#211'N:                 *}'
      '{*             JOSE L. BARRIOS R.          *}'
      '{*******************************************}'
      'Var'
      '  FechaInicio,'
      '  FechaFin         : TDateTime;'
      '  TablePrefix,'
      '  strPeriodoActual : String;'
      '  Precio,'
      '  Dscto,'
      '  PrecioNeto,'
      '  Costo,'
      '  PorcUtilidad     : Double;'
      ''
      '//*******************************}'
      'begin'
      ''
      'end.')
    Left = 128
    Top = 112
    Datasets = <
      item
        DataSet = fsqProdutos
        DataSetName = 'Productos'
      end>
    Variables = <
      item
        Name = ' Variables'
        Value = Null
      end
      item
        Name = 'Empresa'
        Value = Null
      end
      item
        Name = 'Departamento'
        Value = Null
      end
      item
        Name = 'FechaInicio'
        Value = Null
      end
      item
        Name = 'FechaFin'
        Value = Null
      end
      item
        Name = 'Usuario'
        Value = Null
      end
      item
        Name = 'FechaHora'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object ReporteVentasProductos: TfrxReportPage
      VGuides.Strings = (
        '773')
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 5.100000000000000000
      RightMargin = 5.100000000000000000
      TopMargin = 5.100000000000000000
      BottomMargin = 15.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object CabeceraPagina: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 108.456153330000000000
        Top = 18.897650000000000000
        Width = 777.449321000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Top = 17.918120000000000000
          Width = 771.500000000000000000
          Height = 16.515770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte Productos Vendidos ')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 680.833333330000000000
          Top = 37.800000000000000000
          Width = 92.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [PAGE#]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 616.833333330000000000
          Top = 22.800000000000000000
          Width = 156.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DATE] - [TIME]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 37.918120000000000000
          Width = 264.492270000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Desde: [FechaInicio]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 52.918120000000000000
          Width = 264.492270000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Hasta: [FechaFin]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object mmFiltroDepto: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 68.315770000000000000
          Width = 423.500000000000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Departamentos: [Departamento]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 56.173160000000000000
          Top = 84.602350000000000000
          Width = 63.200000000000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Producto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 120.173160000000000000
          Top = 84.602350000000000000
          Width = 515.603340000000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Descripci'#243'n Producto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 703.790043340000000000
          Top = 84.602350000000000000
          Width = 69.209956660000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Existencia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Top = 84.602350000000000000
          Width = 54.266666670000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            'Documento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Width = 771.500000000000000000
          Height = 20.295300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Empresa]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 643.317563340000000000
          Top = 84.602350000000000000
          Width = 57.871366660000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Cantidad')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PiePagina: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.000000000000000000
        Top = 272.126160000000000000
        Width = 777.449321000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 188.976500000000000000
        Width = 777.449321000000000000
        DataSet = fsqProdutos
        DataSetName = 'Productos'
        RowCount = 0
        object ProductosFDI_DOCUMENTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 1.500000000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'FDI_DOCUMENTO'
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Productos."FDI_DOCUMENTO"]')
        end
        object ProductosFDI_CODIGO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 58.668830000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'FDI_CODIGO'
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Productos."FDI_CODIGO"]')
        end
        object ProductosFI_DESCRIPCION: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 130.479900000000000000
          Width = 502.677490000000000000
          Height = 18.897650000000000000
          DataField = 'FI_DESCRIPCION'
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Productos."FI_DESCRIPCION"]')
        end
        object ProductosTOTALCANTIDAD: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 640.716450000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[Productos."TOTALCANTIDAD"]')
        end
        object ProductosTotalExistencia: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 704.968460000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[Productos."TotalExistencia"]')
        end
      end
    end
  end
  object repFallas: TfrxReport
    Version = '6.9.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Por defecto'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38688.859747893500000000
    ReportOptions.LastChange = 45498.407529490740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'Var'
      '  FechaInicio,'
      '  FechaFin         : TDateTime;'
      '  TablePrefix,'
      '  strPeriodoActual : String;'
      '  Precio,'
      '  Dscto,'
      '  PrecioNeto,'
      '  Costo,'
      '  PorcUtilidad     : Double;'
      ''
      '//*******************************}'
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 248
    Top = 128
    Datasets = <
      item
        DataSet = fsqFallas
        DataSetName = 'FALLA'
      end>
    Variables = <
      item
        Name = ' Variables'
        Value = Null
      end
      item
        Name = 'Empresa'
        Value = Null
      end
      item
        Name = 'Departamento'
        Value = Null
      end
      item
        Name = 'FechaInicio'
        Value = Null
      end
      item
        Name = 'FechaFin'
        Value = Null
      end
      item
        Name = 'Usuario'
        Value = Null
      end
      item
        Name = 'FechaHora'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object ReporteVentasProductos: TfrxReportPage
      VGuides.Strings = (
        '773')
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 5.100000000000000000
      RightMargin = 5.100000000000000000
      TopMargin = 5.100000000000000000
      BottomMargin = 15.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object CabeceraPagina: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 108.456153330000000000
        Top = 18.897650000000000000
        Width = 777.449321000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Top = 17.918120000000000000
          Width = 771.500000000000000000
          Height = 16.515770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte Fallas')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 680.833333330000000000
          Top = 37.800000000000000000
          Width = 92.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [PAGE#]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 616.833333330000000000
          Top = 22.800000000000000000
          Width = 156.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DATE] - [TIME]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 37.918120000000000000
          Width = 264.492270000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Desde: [FechaInicio]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 52.918120000000000000
          Width = 264.492270000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Hasta: [FechaFin]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object mmFiltroDepto: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 68.315770000000000000
          Width = 423.500000000000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Departamentos: [Departamento]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 37.173160000000000000
          Top = 84.602350000000000000
          Width = 63.200000000000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Producto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 105.055040000000000000
          Top = 84.602350000000000000
          Width = 364.422140000000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Descripci'#243'n Producto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 530.790043340000000000
          Top = 84.602350000000000000
          Width = 69.209956660000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Existencia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Top = 84.602350000000000000
          Width = 31.589486670000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            'Item')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Width = 771.500000000000000000
          Height = 20.295300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Empresa]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 470.317563340000000000
          Top = 84.602350000000000000
          Width = 57.871366660000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Cantidad')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 602.333333340000000000
          Top = 84.602350000000000000
          Width = 57.871366660000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Exist. Minima')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 663.128633340000000000
          Top = 84.602350000000000000
          Width = 57.871366660000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Exist. Minima')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 721.890230000000000000
          Top = 84.602350000000000000
          Width = 50.312306660000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Diferencia')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PiePagina: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.000000000000000000
        Top = 268.346630000000000000
        Width = 777.449321000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 188.976500000000000000
        Width = 777.449321000000000000
        DataSet = fsqFallas
        DataSetName = 'FALLA'
        RowCount = 0
        object ProductosFDI_DOCUMENTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 1.500000000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object ProductosFDI_CODIGO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 36.668830000000000000
          Width = 68.031540000000010000
          Height = 15.118120000000000000
          DataField = 'FDI_CODIGO'
          DataSet = fsqFallas
          DataSetName = 'FALLA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FALLA."FDI_CODIGO"]')
          ParentFont = False
        end
        object ProductosFI_DESCRIPCION: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 108.479900000000000000
          Width = 359.055350000000000000
          Height = 15.118120000000000000
          DataField = 'FI_DESCRIPCION'
          DataSet = fsqFallas
          DataSetName = 'FALLA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FALLA."FI_DESCRIPCION"]')
          ParentFont = False
        end
        object ProductosTOTALCANTIDAD: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 468.771490000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'TOTALCANTIDAD'
          DataSet = fsqFallas
          DataSetName = 'FALLA'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FALLA."TOTALCANTIDAD"]')
          ParentFont = False
        end
        object ProductosTotalExistencia: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 533.023500000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'TotalExistencia'
          DataSet = fsqFallas
          DataSetName = 'FALLA'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FALLA."TotalExistencia"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 601.055040000000000000
          Width = 56.692950000000010000
          Height = 15.118120000000000000
          DataField = 'FX_EXISTENCIAMINIMA'
          DataSet = fsqFallas
          DataSetName = 'FALLA'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FALLA."FX_EXISTENCIAMINIMA"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 665.307050000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'FX_EXISTENCIAMAXIMA'
          DataSet = fsqFallas
          DataSetName = 'FALLA'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FALLA."FX_EXISTENCIAMAXIMA"]')
          ParentFont = False
        end
        object MemoSugerido: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 724.068646660000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'MemoSugeridoOnBeforePrint'
          DataSet = fsqFallas
          DataSetName = 'FALLA'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[<FALLA."TotalExistencia">-<FALLA."FX_EXISTENCIAMINIMA">]')
          ParentFont = False
        end
      end
    end
  end
  object sqFallas: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      
        'SELECT SUM(S3.FT_EXISTENCIA) AS TotalExistencia,  S.FDI_DOCUMENT' +
        'O, S.FDI_OPERACION_AUTOINCREMENT, S.FDI_COSTO, S.FDI_COSTOOPERAC' +
        'ION, S.FDI_MONTOIMPUESTO1, S.FDI_PRECIOSINDESCUENTO, '
      
        'S.FDI_PRECIOCONDESCUENTO,S.FDI_COSTODEVENTAS, S.FDI_PRECIODEVENT' +
        'A, S.FDI_TIPOOPERACION, S.FDI_CODIGO, S.FDI_CLIENTEPROVEEDOR, S1' +
        '.FI_CATEGORIA, S1.FI_SUBCATEGORIA,'
      
        'S.FDI_DESCUENTOPARCIAL, S.FDI_PORCENTDESCUENTO1, S.FDI_STATUS, S' +
        '2.FX_EXISTENCIAMINIMA, S2.FX_EXISTENCIAMAXIMA,'
      
        'S1.FI_MARCA, S1.FI_CODIGO, S1.FI_DESCRIPCION, S.FDI_CANTIDAD AS ' +
        'TOTALCANTIDAD, FDI_CANTIDADPENDIENTE AS CANTIDADPENDIENTE, S.FDI' +
        '_FECHAOPERACION'
      'FROM SDetalleVenta S'
      'INNER JOIN sInventario S1 ON S.FDI_CODIGO=S1.FI_CODIGO'
      'INNER JOIN sFixed S2 ON S.FDI_CODIGO=S2.FX_CODIGO '
      'INNER JOIN SInvDep S3 ON S1.FI_CODIGO=S3.FT_CODIGOPRODUCTO'
      'GROUP BY S1.FI_CODIGO')
    Params = <>
    Left = 132
    Top = 16
    object crncyfldFallasTotalExistencia: TCurrencyField
      FieldName = 'TotalExistencia'
    end
    object fieldFallasFDI_DOCUMENTO: TStringField
      FieldName = 'FDI_DOCUMENTO'
      Size = 30
    end
    object intgrfldFallasFDI_OPERACION_AUTOINCREMENT: TIntegerField
      FieldName = 'FDI_OPERACION_AUTOINCREMENT'
    end
    object crncyfldFallasFDI_COSTO: TCurrencyField
      FieldName = 'FDI_COSTO'
    end
    object crncyfldFallasFDI_COSTOOPERACION: TCurrencyField
      FieldName = 'FDI_COSTOOPERACION'
    end
    object crncyfldFallasFDI_MONTOIMPUESTO1: TCurrencyField
      FieldName = 'FDI_MONTOIMPUESTO1'
    end
    object crncyfldFallasFDI_PRECIOSINDESCUENTO: TCurrencyField
      FieldName = 'FDI_PRECIOSINDESCUENTO'
    end
    object crncyfldFallasFDI_PRECIOCONDESCUENTO: TCurrencyField
      FieldName = 'FDI_PRECIOCONDESCUENTO'
    end
    object crncyfldFallasFDI_COSTODEVENTAS: TCurrencyField
      FieldName = 'FDI_COSTODEVENTAS'
    end
    object crncyfldFallasFDI_PRECIODEVENTA: TCurrencyField
      FieldName = 'FDI_PRECIODEVENTA'
    end
    object intgrfldFallasFDI_TIPOOPERACION: TIntegerField
      FieldName = 'FDI_TIPOOPERACION'
    end
    object fieldFallasFDI_CODIGO: TStringField
      FieldName = 'FDI_CODIGO'
      Size = 40
    end
    object fieldFallasFDI_CLIENTEPROVEEDOR: TStringField
      FieldName = 'FDI_CLIENTEPROVEEDOR'
      Size = 40
    end
    object fieldFallasFI_CATEGORIA: TStringField
      FieldName = 'FI_CATEGORIA'
      Size = 30
    end
    object fieldFallasFI_SUBCATEGORIA: TStringField
      FieldName = 'FI_SUBCATEGORIA'
      Size = 50
    end
    object crncyfldFallasFDI_DESCUENTOPARCIAL: TCurrencyField
      FieldName = 'FDI_DESCUENTOPARCIAL'
    end
    object crncyfldFallasFDI_PORCENTDESCUENTO1: TCurrencyField
      FieldName = 'FDI_PORCENTDESCUENTO1'
    end
    object intgrfldFallasFDI_STATUS: TIntegerField
      FieldName = 'FDI_STATUS'
    end
    object crncyfldFallasFX_EXISTENCIAMINIMA: TCurrencyField
      FieldName = 'FX_EXISTENCIAMINIMA'
    end
    object crncyfldFallasFX_EXISTENCIAMAXIMA: TCurrencyField
      FieldName = 'FX_EXISTENCIAMAXIMA'
    end
    object fieldFallasFI_MARCA: TStringField
      FieldName = 'FI_MARCA'
      Size = 30
    end
    object fieldFallasFI_CODIGO: TStringField
      FieldName = 'FI_CODIGO'
      Size = 30
    end
    object fieldFallasFI_DESCRIPCION: TStringField
      FieldName = 'FI_DESCRIPCION'
      Size = 250
    end
    object fieldFallasTOTALCANTIDAD: TFloatField
      FieldName = 'TOTALCANTIDAD'
    end
    object fieldFallasCANTIDADPENDIENTE: TFloatField
      FieldName = 'CANTIDADPENDIENTE'
    end
    object sqFallasFDI_FECHAOPERACION: TDateField
      FieldName = 'FDI_FECHAOPERACION'
    end
  end
  object fsqFallas: TfrxDBDataset
    UserName = 'FALLA'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TotalExistencia=TotalExistencia'
      'FDI_DOCUMENTO=FDI_DOCUMENTO'
      'FDI_OPERACION_AUTOINCREMENT=FDI_OPERACION_AUTOINCREMENT'
      'FDI_COSTO=FDI_COSTO'
      'FDI_COSTOOPERACION=FDI_COSTOOPERACION'
      'FDI_MONTOIMPUESTO1=FDI_MONTOIMPUESTO1'
      'FDI_PRECIOSINDESCUENTO=FDI_PRECIOSINDESCUENTO'
      'FDI_PRECIOCONDESCUENTO=FDI_PRECIOCONDESCUENTO'
      'FDI_COSTODEVENTAS=FDI_COSTODEVENTAS'
      'FDI_PRECIODEVENTA=FDI_PRECIODEVENTA'
      'FDI_TIPOOPERACION=FDI_TIPOOPERACION'
      'FDI_CODIGO=FDI_CODIGO'
      'FDI_CLIENTEPROVEEDOR=FDI_CLIENTEPROVEEDOR'
      'FI_CATEGORIA=FI_CATEGORIA'
      'FI_SUBCATEGORIA=FI_SUBCATEGORIA'
      'FDI_DESCUENTOPARCIAL=FDI_DESCUENTOPARCIAL'
      'FDI_PORCENTDESCUENTO1=FDI_PORCENTDESCUENTO1'
      'FDI_STATUS=FDI_STATUS'
      'FX_EXISTENCIAMINIMA=FX_EXISTENCIAMINIMA'
      'FX_EXISTENCIAMAXIMA=FX_EXISTENCIAMAXIMA'
      'FI_MARCA=FI_MARCA'
      'FI_CODIGO=FI_CODIGO'
      'FI_DESCRIPCION=FI_DESCRIPCION'
      'TOTALCANTIDAD=TOTALCANTIDAD'
      'CANTIDADPENDIENTE=CANTIDADPENDIENTE'
      'FDI_FECHAOPERACION=FDI_FECHAOPERACION')
    DataSet = sqFallas
    BCDToCurrency = False
    Left = 160
    Top = 48
  end
  object sqProveedor: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      'SELECT FP_CODIGO, FP_DESCRIPCION FROM sproveedor'
      'ORDER BY FP_DESCRIPCION ASC')
    Params = <>
    Left = 420
    Top = 208
    object fieldProveedorFP_CODIGO: TStringField
      FieldName = 'FP_CODIGO'
      Size = 30
    end
    object fieldProveedorFP_DESCRIPCION: TStringField
      FieldName = 'FP_DESCRIPCION'
      Size = 50
    end
  end
  object sqProdProveedor: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    SQL.Strings = (
      
        'SELECT S.FTP_CODEPRODUCTO, FTP_CODPROVEEDOR, S1.FI_CODIGO, S1.FI' +
        '_DESCRIPCION, S3.FT_EXISTENCIA, S2.FX_CODIGO, S2.FX_EXISTENCIAMI' +
        'NIMA, S3.FT_EXISTENCIA'
      'FROM SPROVINVENT AS S'
      
        'INNER JOIN Sinventario as S1 ON (S.FTP_CODEPRODUCTO = S1.FI_CODI' +
        'GO)'
      
        'INNER JOIN SInvDep as S3 ON (S.FTP_CODEPRODUCTO = S3.FT_CODIGOPR' +
        'ODUCTO)'
      'INNER JOIN Sfixed as S2 ON (S.FTP_CODEPRODUCTO = S2.FX_CODIGO)')
    Params = <>
    Left = 236
    Top = 72
    object fieldProdProveedorFTP_CODEPRODUCTO: TStringField
      FieldName = 'FTP_CODEPRODUCTO'
      Size = 30
    end
    object fieldProdProveedorFTP_CODPROVEEDOR: TStringField
      FieldName = 'FTP_CODPROVEEDOR'
      Size = 30
    end
    object fieldProdProveedorFI_CODIGO: TStringField
      FieldName = 'FI_CODIGO'
      Size = 30
    end
    object fieldProdProveedorFI_DESCRIPCION: TStringField
      FieldName = 'FI_DESCRIPCION'
      Size = 250
    end
    object crncyfldProdProveedorFT_EXISTENCIA: TCurrencyField
      FieldName = 'FT_EXISTENCIA'
    end
  end
  object repProdProveedor: TfrxReport
    Version = '6.9.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Por defecto'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38688.859747893500000000
    ReportOptions.LastChange = 45498.455672187500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '{*******************************************}'
      '{*  CODIGO PROPIEDAD DE:                   *}'
      '{*  SMARTSOFT, C.A. Y/O JOSE L. BARRIOS R. *}'
      '{*  DISE'#209'O Y PROGRAMACI'#211'N:                 *}'
      '{*             JOSE L. BARRIOS R.          *}'
      '{*******************************************}'
      'Var'
      '  FechaInicio,'
      '  FechaFin         : TDateTime;'
      '  TablePrefix,'
      '  strPeriodoActual : String;'
      '  Precio,'
      '  Dscto,'
      '  PrecioNeto,'
      '  Costo,'
      '  PorcUtilidad     : Double;'
      ''
      '//*******************************}'
      'begin'
      ''
      'end.')
    Left = 248
    Top = 296
    Datasets = <
      item
        DataSet = fsqProdProveedor
        DataSetName = 'ProdProveedor'
      end>
    Variables = <
      item
        Name = ' Variables'
        Value = Null
      end
      item
        Name = 'Empresa'
        Value = Null
      end
      item
        Name = 'Departamento'
        Value = Null
      end
      item
        Name = 'FechaInicio'
        Value = Null
      end
      item
        Name = 'FechaFin'
        Value = Null
      end
      item
        Name = 'Usuario'
        Value = Null
      end
      item
        Name = 'FechaHora'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object ReporteVentasProductos: TfrxReportPage
      VGuides.Strings = (
        '773')
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 5.100000000000000000
      RightMargin = 5.100000000000000000
      TopMargin = 5.100000000000000000
      BottomMargin = 15.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object CabeceraPagina: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 108.456153330000000000
        Top = 18.897650000000000000
        Width = 777.449321000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Top = 17.918120000000000000
          Width = 771.500000000000000000
          Height = 16.515770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte Productos Vendidos ')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 680.833333330000000000
          Top = 37.800000000000000000
          Width = 92.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [PAGE#]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 616.833333330000000000
          Top = 22.800000000000000000
          Width = 156.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DATE] - [TIME]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 37.918120000000000000
          Width = 264.492270000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Desde: [FechaInicio]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 52.918120000000000000
          Width = 264.492270000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Hasta: [FechaFin]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object mmFiltroDepto: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.333333330000000000
          Top = 68.315770000000000000
          Width = 423.500000000000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Proveedor: [Departamento]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 34.275510000000000000
          Top = 84.602350000000000000
          Width = 85.877180000000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Producto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 120.173160000000000000
          Top = 84.602350000000000000
          Width = 576.075820000000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Descripci'#243'n Producto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 703.790043340000000000
          Top = 84.602350000000000000
          Width = 69.209956660000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Existencia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Top = 84.602350000000000000
          Width = 31.589486670000000000
          Height = 20.160000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            'Item')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.500000000000000000
          Width = 771.500000000000000000
          Height = 20.295300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Empresa]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
      end
      object PiePagina: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.000000000000000000
        Top = 272.126160000000000000
        Width = 777.449321000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 188.976500000000000000
        Width = 777.449321000000000000
        DataSet = fsqProdProveedor
        DataSetName = 'ProdProveedor'
        RowCount = 0
        object ProductosFDI_DOCUMENTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 1.500000000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataSet = fsqProdutos
          DataSetName = 'Productos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Line#]')
        end
        object ProductosFDI_CODIGO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 32.212120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'FI_CODIGO'
          DataSet = fsqProdProveedor
          DataSetName = 'ProdProveedor'
          Frame.Typ = []
          Memo.UTF8W = (
            '[ProdProveedor."FI_CODIGO"]')
        end
        object ProductosFI_DESCRIPCION: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 130.479900000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          DataField = 'FI_DESCRIPCION'
          DataSet = fsqProdProveedor
          DataSetName = 'ProdProveedor'
          Frame.Typ = []
          Memo.UTF8W = (
            '[ProdProveedor."FI_DESCRIPCION"]')
        end
        object ProductosTotalExistencia: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 704.968460000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'FT_EXISTENCIA'
          DataSet = fsqProdProveedor
          DataSetName = 'ProdProveedor'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[ProdProveedor."FT_EXISTENCIA"]')
        end
      end
    end
  end
  object fsqProdProveedor: TfrxDBDataset
    UserName = 'ProdProveedor'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FTP_CODEPRODUCTO=FTP_CODEPRODUCTO'
      'FTP_CODPROVEEDOR=FTP_CODPROVEEDOR'
      'FI_CODIGO=FI_CODIGO'
      'FI_DESCRIPCION=FI_DESCRIPCION'
      'FT_EXISTENCIA=FT_EXISTENCIA'
      'FX_CODIGO=FX_CODIGO'
      'FX_EXISTENCIAMINIMA=FX_EXISTENCIAMINIMA'
      'FT_EXISTENCIA_1=FT_EXISTENCIA_1')
    DataSet = sqProdProveedor
    BCDToCurrency = False
    Left = 376
    Top = 136
  end
  object dsProveedor: TDataSource
    DataSet = sqProveedor
    Left = 488
    Top = 208
  end
end

object formEtiquetas: TformEtiquetas
  Left = 0
  Top = 0
  Caption = 'formEtiquetas'
  ClientHeight = 189
  ClientWidth = 336
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 336
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -264
    ExplicitTop = 60
    object lbl1: TLabel
      Left = 88
      Top = 16
      Width = 77
      Height = 23
      Caption = 'CODIGO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 8
      Top = 92
      Width = 92
      Height = 23
      Caption = 'FORMATO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 8
      Top = 45
      Width = 265
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btn2: TButton
      Left = 279
      Top = 46
      Width = 51
      Height = 31
      Caption = '...'
      TabOrder = 1
      OnClick = btn2Click
    end
    object rg1: TRadioGroup
      Left = 120
      Top = 83
      Width = 210
      Height = 32
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'CUADRADO'
        'RECTANGULAR')
      TabOrder = 2
    end
  end
  object pnl21: TPanel
    Left = 0
    Top = 121
    Width = 336
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object btn1: TButton
      Left = 0
      Top = 0
      Width = 336
      Height = 64
      Align = alClient
      Caption = 'IMPRIMIR'
      TabOrder = 0
      OnClick = btn1Click
    end
  end
  object frEtiqueta: TfrxReport
    Version = '6.9.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45363.482666122700000000
    ReportOptions.LastChange = 45363.509369733800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 24
    Top = 8
    Datasets = <
      item
        DataSet = fsqEtiqueta
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 50.000000000000000000
      PaperHeight = 25.000000000000000000
      PaperSize = 256
      LeftMargin = 2.500000000000000000
      RightMargin = 2.500000000000000000
      TopMargin = 2.500000000000000000
      BottomMargin = 2.500000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 75.913420000000000000
        Top = 18.897650000000000000
        Width = 170.078850000000000000
        Stretched = True
        object frxDBDataset1FI_DESCRIPCION: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 11.220470000000000000
          Width = 170.078850000000000000
          Height = 22.677180000000000000
          DataField = 'FI_DESCRIPCION'
          DataSet = fsqEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."FI_DESCRIPCION"]')
          ParentFont = False
        end
        object frxDBDataset1FI_CODIGO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 117.165430000000000000
          Height = 11.338590000000000000
          DataField = 'FI_CODIGO'
          DataSet = fsqEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."FI_CODIGO"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 57.015770000000010000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'REF: ')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 49.133890000000000000
          Top = 57.015770000000010000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = fsqEtiqueta
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[<frxDBDataset1."FIC_P01PRECIOTOTALEXT">*1.16]')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Top = 34.015770000000000000
          Width = 80.000000000000000000
          Height = 18.897650000000000000
          BarType = bcCode128
          Expression = '<frxDBDataset1."FI_CODIGO">'
          Frame.Typ = []
          Rotation = 0
          ShowText = False
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ColorBar = clBlack
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 117.165430000000000000
          Top = 58.692950000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataSet = fsqEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Incluye IVA')
          ParentFont = False
        end
      end
    end
  end
  object fsqEtiqueta: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FI_CODIGO=FI_CODIGO'
      'FI_DESCRIPCION=FI_DESCRIPCION'
      'FIC_P01PRECIOTOTALEXT=FIC_P01PRECIOTOTALEXT')
    DataSet = d.sqbuscarProducto
    BCDToCurrency = False
    Left = 200
    Top = 8
  end
  object frEtiqueta2: TfrxReport
    Version = '6.9.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45363.482666122700000000
    ReportOptions.LastChange = 45363.509369733790000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 80
    Top = 8
    Datasets = <
      item
        DataSet = fsqEtiqueta
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 30.000000000000000000
      PaperHeight = 25.000000000000000000
      PaperSize = 256
      LeftMargin = 2.500000000000000000
      RightMargin = 2.500000000000000000
      TopMargin = 2.500000000000000000
      BottomMargin = 2.500000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 72.574830000000000000
        Top = 18.897650000000000000
        Width = 94.488250000000000000
        Stretched = True
        object frxDBDataset1FI_DESCRIPCION: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 10.440940000000000000
          Width = 90.708720000000000000
          Height = 26.456710000000000000
          DataField = 'FI_DESCRIPCION'
          DataSet = fsqEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."FI_DESCRIPCION"]')
          ParentFont = False
        end
        object frxDBDataset1FI_CODIGO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 90.708720000000000000
          Height = 11.338590000000000000
          DataField = 'FI_CODIGO'
          DataSet = fsqEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."FI_CODIGO"]')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Top = 38.795300000000000000
          Width = 80.000000000000000000
          Height = 15.118120000000000000
          BarType = bcCode128
          Expression = '<frxDBDataset1."FI_CODIGO">'
          Frame.Typ = []
          Rotation = 0
          ShowText = False
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ColorBar = clBlack
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 55.897650000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'REF: ')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 34.015770000000010000
          Top = 55.897650000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataSet = fsqEtiqueta
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[<frxDBDataset1."FIC_P01PRECIOTOTALEXT">*1.16]')
          ParentFont = False
        end
      end
    end
  end
end

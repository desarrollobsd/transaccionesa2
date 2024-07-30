object formbuscarProducto: TformbuscarProducto
  Left = 0
  Top = 0
  Caption = 'formbuscarProducto'
  ClientHeight = 359
  ClientWidth = 495
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
    Width = 495
    Height = 49
    Align = alTop
    Caption = 'pnl1'
    Color = clWhite
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowCaption = False
    ShowHint = False
    TabOrder = 0
    object rg1: TRadioGroup
      Left = 1
      Top = 1
      Width = 272
      Height = 40
      Caption = 'Selecciones el Criterio     '
      Columns = 2
      Items.Strings = (
        'Por Orden Alfabetico'
        'Por Palabra Clave')
      TabOrder = 0
      OnClick = rg1Click
    end
    object edtpalabraClave: TEdit
      Left = 279
      Top = 7
      Width = 210
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'edtpalabraClave'
      OnKeyPress = edtpalabraClaveKeyPress
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 49
    Width = 495
    Height = 310
    Align = alClient
    TabOrder = 1
    object grid1: TDBGrid
      Left = 1
      Top = 1
      Width = 493
      Height = 308
      Align = alClient
      DataSource = dsqProductos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'FI_CODIGO'
          Title.Caption = 'CODIGO'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FI_DESCRIPCION'
          Title.Caption = 'PRODUCTO'
          Width = 295
          Visible = True
        end>
    end
  end
  object sqProducto: TFDQuery
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    ResourceOptions.CmdExecMode = amAsync
    SQL.Strings = (
      'SELECT '#9'codigoart FROM ofertasmv')
    Left = 40
    Top = 129
  end
  object dsqProductos: TDataSource
    DataSet = sqbuscarproducto
    Left = 128
    Top = 129
  end
  object sqbuscarProductos: TFDQuery
    Left = 232
    Top = 129
  end
  object sqfactor: TFDQuery
    SQL.Strings = (
      'SELECT tasacambio from config')
    Left = 328
    Top = 137
  end
  object sqbuscarproducto: TDBISAMQuery
    DatabaseName = 'data2'
    EngineVersion = '4.43 Build 1'
    Params = <>
    Left = 232
    Top = 257
  end
end

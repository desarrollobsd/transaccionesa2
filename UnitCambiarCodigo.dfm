object CambiarCo: TCambiarCo
  Left = 0
  Top = 0
  Caption = 'CambiarCo'
  ClientHeight = 225
  ClientWidth = 334
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
    Width = 334
    Height = 153
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
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
      Left = 64
      Top = 82
      Width = 136
      Height = 23
      Caption = 'NUEVO CODIGO'
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
    object edtNCodigo: TEdit
      Left = 8
      Top = 111
      Width = 265
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object pnl21: TPanel
    Left = 0
    Top = 153
    Width = 334
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object btn1: TButton
      Left = 0
      Top = 0
      Width = 334
      Height = 64
      Align = alClient
      Caption = 'CAMBIAR CODIGO'
      TabOrder = 0
      OnClick = btn1Click
      ExplicitTop = -5
    end
  end
end

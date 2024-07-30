object formautorizado: Tformautorizado
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Este Acceso Requiere Clave de Supervisor'
  ClientHeight = 168
  ClientWidth = 311
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
  object lbl1: TLabel
    Left = 80
    Top = 24
    Width = 161
    Height = 19
    Caption = 'Clave de Supervisor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtclave: TEdit
    Left = 80
    Top = 65
    Width = 161
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
    Text = 'edtclave'
  end
  object btn1: TButton
    Left = 80
    Top = 102
    Width = 161
    Height = 43
    Caption = 'Autorizar'
    TabOrder = 1
    OnClick = btn1Click
  end
end

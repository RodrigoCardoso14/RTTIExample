object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RTTI Example'
  ClientHeight = 289
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 178
    Height = 25
    Caption = 'Method'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 39
    Width = 178
    Height = 25
    Caption = 'Field'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 70
    Width = 178
    Height = 25
    Caption = 'Property'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 101
    Width = 178
    Height = 25
    Caption = 'Property, Types and Values'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 132
    Width = 178
    Height = 25
    Caption = 'Set Value'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 163
    Width = 178
    Height = 25
    Caption = 'Method, Parameters and Return'
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 194
    Width = 178
    Height = 25
    Caption = 'Invoke Method'
    TabOrder = 6
    OnClick = Button7Click
  end
  object memoResults: TMemo
    Left = 192
    Top = 8
    Width = 422
    Height = 273
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object Button8: TButton
    Left = 8
    Top = 225
    Width = 178
    Height = 25
    Caption = 'Validate Field Value'
    TabOrder = 8
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 8
    Top = 256
    Width = 178
    Height = 25
    Caption = 'Get Table Name'
    TabOrder = 9
    OnClick = Button9Click
  end
end

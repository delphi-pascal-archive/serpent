object FNom: TFNom
  Left = 198
  Top = 110
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'FNom'
  ClientHeight = 79
  ClientWidth = 203
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LBL_Nom: TLabel
    Left = 9
    Top = 16
    Width = 56
    Height = 13
    Caption = 'Votre Nom :'
  end
  object E_Nom: TEdit
    Left = 73
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object OK: TButton
    Left = 65
    Top = 42
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end

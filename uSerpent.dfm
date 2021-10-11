object FGame: TFGame
  Left = 261
  Top = 134
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Serpent'
  ClientHeight = 373
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object LBL_ScoreValue: TLabel
    Left = 456
    Top = 7
    Width = 122
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clMaroon
    Font.Height = -23
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object LBL_ScoreTitel: TLabel
    Left = 384
    Top = 7
    Width = 73
    Height = 29
    AutoSize = False
    Caption = 'Score:'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object LBL_LevelTitel: TLabel
    Left = 384
    Top = 38
    Width = 65
    Height = 28
    AutoSize = False
    Caption = 'Level:'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object LBL_LevelValue: TLabel
    Left = 456
    Top = 38
    Width = 122
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = '1'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clMaroon
    Font.Height = -23
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Terrin: TPanel
    Left = 0
    Top = -1
    Width = 375
    Height = 375
    BorderStyle = bsSingle
    Ctl3D = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clRed
    Font.Height = -45
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object Appat: TShape
      Left = 660
      Top = 118
      Width = 18
      Height = 19
      Brush.Color = clRed
      Shape = stCircle
    end
  end
  object GB_Proies: TGroupBox
    Left = 384
    Top = 75
    Width = 188
    Height = 110
    Caption = ' Les Proies '
    TabOrder = 1
    object LBL_ProieRouge: TLabel
      Left = 32
      Top = 81
      Width = 80
      Height = 19
      Caption = ': 30 Points'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SRed: TShape
      Left = 7
      Top = 81
      Width = 19
      Height = 19
      Brush.Color = clRed
      Shape = stCircle
    end
    object LBL_PorieBlue: TLabel
      Left = 32
      Top = 22
      Width = 80
      Height = 19
      Caption = ': 10 Points'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SBlue: TShape
      Left = 7
      Top = 22
      Width = 19
      Height = 19
      Brush.Color = clBlue
      Shape = stCircle
    end
    object SGreen: TShape
      Left = 7
      Top = 52
      Width = 19
      Height = 18
      Brush.Color = clGreen
      Shape = stCircle
    end
    object LBL_ProieVerte: TLabel
      Left = 32
      Top = 52
      Width = 80
      Height = 19
      Caption = ': 20 Points'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 384
    Top = 193
    Width = 188
    Height = 171
    Caption = ' Meilleurs scores '
    TabOrder = 2
    object LBL_Nom1: TLabel
      Left = 10
      Top = 21
      Width = 168
      Height = 16
      Alignment = taCenter
      AutoSize = False
    end
    object LBL_Score1: TLabel
      Left = 10
      Top = 41
      Width = 168
      Height = 16
      Alignment = taCenter
      AutoSize = False
    end
    object LBL_Nom2: TLabel
      Left = 10
      Top = 70
      Width = 168
      Height = 16
      Alignment = taCenter
      AutoSize = False
    end
    object LBL_Score2: TLabel
      Left = 10
      Top = 90
      Width = 168
      Height = 16
      Alignment = taCenter
      AutoSize = False
    end
    object LBL_Nom3: TLabel
      Left = 10
      Top = 126
      Width = 168
      Height = 16
      Alignment = taCenter
      AutoSize = False
    end
    object LBL_Score3: TLabel
      Left = 10
      Top = 145
      Width = 168
      Height = 16
      Alignment = taCenter
      AutoSize = False
    end
    object Panel1: TPanel
      Left = 0
      Top = 63
      Width = 187
      Height = 2
      BevelOuter = bvLowered
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 0
      Top = 118
      Width = 187
      Height = 2
      BevelOuter = bvLowered
      TabOrder = 1
    end
  end
  object Timer: TTimer
    Interval = 400
    OnTimer = TimerTimer
    Left = 240
    Top = 256
  end
end

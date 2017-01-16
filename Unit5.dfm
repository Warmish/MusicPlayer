object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Wizualizacja'
  ClientHeight = 352
  ClientWidth = 217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 89
    Height = 79
    Caption = 'Wizualizacja'
    ItemIndex = 2
    Items.Strings = (
      'Ko'#322'o'
      'Oscyloskop'
      'Spektrum')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 103
    Top = 8
    Width = 106
    Height = 79
    Caption = 'Typ Rysowania'
    ItemIndex = 0
    Items.Strings = (
      'Linia'
      'Wype'#322'nienie'
      'Pixel')
    TabOrder = 1
    OnClick = RadioGroup2Click
  end
  object gbUstawienia: TGroupBox
    Left = 8
    Top = 86
    Width = 201
    Height = 128
    Caption = 'Ustawienia'
    TabOrder = 2
    object Label3: TLabel
      Left = 14
      Top = 70
      Width = 31
      Height = 13
      Caption = 'Offset'
    end
    object Label6: TLabel
      Left = 134
      Top = 46
      Width = 40
      Height = 13
      Caption = 'Kolor t'#322'a'
    end
    object Label7: TLabel
      Left = 10
      Top = 15
      Width = 79
      Height = 13
      Caption = 'Kolor Rysowania'
    end
    object TrackOff: TTrackBar
      Left = 14
      Top = 89
      Width = 169
      Height = 33
      Max = 120
      Frequency = 5
      Position = 20
      TabOrder = 0
      ThumbLength = 12
      TickMarks = tmBoth
      OnChange = TrackOffChange
    end
    object PanelBkg: TPanel
      Left = 95
      Top = 47
      Width = 33
      Height = 25
      BevelOuter = bvLowered
      Color = clSilver
      ParentBackground = False
      TabOrder = 1
      OnClick = PanelBkgClick
    end
    object PanelPen: TPanel
      Left = 95
      Top = 16
      Width = 33
      Height = 25
      BevelOuter = bvLowered
      Color = clRed
      ParentBackground = False
      TabOrder = 2
      OnClick = PanelPenClick
    end
  end
  object gbKolo: TGroupBox
    Left = 8
    Top = 220
    Width = 201
    Height = 124
    Caption = 'Ustawienia Ko'#322'a'
    TabOrder = 3
    object Label5: TLabel
      Left = 8
      Top = 20
      Width = 51
      Height = 13
      Caption = #346'rednica : '
    end
    object lbsrednica: TLabel
      Left = 65
      Top = 20
      Width = 12
      Height = 13
      Caption = '30'
    end
    object TrackRad: TTrackBar
      Left = 13
      Top = 39
      Width = 169
      Height = 33
      Max = 50
      Min = 10
      Position = 30
      TabOrder = 0
      ThumbLength = 12
      TickMarks = tmBoth
      OnChange = TrackRadChange
    end
    object kolox: TTrackBar
      Left = 13
      Top = 71
      Width = 169
      Height = 33
      Max = 360
      Min = 120
      Position = 240
      TabOrder = 1
      ThumbLength = 12
      TickMarks = tmBoth
      OnChange = TrackRadChange
    end
  end
  object gbspektrum: TGroupBox
    Left = 8
    Top = 220
    Width = 201
    Height = 124
    Caption = 'Ustawienia Spektrum'
    TabOrder = 4
    object Label9: TLabel
      Left = 36
      Top = 39
      Width = 77
      Height = 13
      Caption = 'Kolor Szczytk'#243'w'
    end
    object Label10: TLabel
      Left = 10
      Top = 66
      Width = 55
      Height = 13
      Caption = 'Spadek Linii'
    end
    object Label11: TLabel
      Left = 101
      Top = 66
      Width = 88
      Height = 13
      Caption = 'Spadek Szczytk'#243'w'
    end
    object PanelPeakColor: TPanel
      Left = 119
      Top = 39
      Width = 33
      Height = 25
      BevelOuter = bvLowered
      Color = clBlue
      ParentBackground = False
      TabOrder = 0
      OnClick = PanelPeakColorClick
    end
    object CheckSpecPeaks: TCheckBox
      Left = 8
      Top = 16
      Width = 105
      Height = 17
      Caption = 'Pokazuj Szczytki'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckSpecPeaksClick
    end
    object SpinLineFall: TUpDown
      Left = 49
      Top = 85
      Width = 16
      Height = 21
      Associate = EditLineFall
      Min = 1
      Max = 10
      Position = 3
      TabOrder = 4
      OnClick = SpinLineFallClick
    end
    object SpinPeakFall: TUpDown
      Left = 142
      Top = 85
      Width = 16
      Height = 21
      Associate = EditPeakFall
      Min = 1
      Max = 10
      Position = 1
      TabOrder = 5
      OnClick = SpinPeakFallClick
    end
    object EditLineFall: TEdit
      Left = 16
      Top = 85
      Width = 33
      Height = 21
      Color = clBtnShadow
      ReadOnly = True
      TabOrder = 1
      Text = '3'
    end
    object EditPeakFall: TEdit
      Left = 109
      Top = 85
      Width = 33
      Height = 21
      Color = clBtnShadow
      ReadOnly = True
      TabOrder = 2
      Text = '1'
    end
  end
  object ColorDialog: TColorDialog
    Left = 224
    Top = 16
  end
end

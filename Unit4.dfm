object Form4: TForm4
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Mixer'
  ClientHeight = 236
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 40
    Width = 39
    Height = 13
    Caption = 'Tempo |'
  end
  object Label2: TLabel
    Left = 8
    Top = 87
    Width = 30
    Height = 13
    Caption = 'Pitch |'
  end
  object Label3: TLabel
    Left = 8
    Top = 134
    Width = 29
    Height = 13
    Caption = 'Freq |'
  end
  object Label4: TLabel
    Left = 8
    Top = 181
    Width = 42
    Height = 13
    Caption = 'Reverb |'
  end
  object Label7: TLabel
    Left = 131
    Top = 87
    Width = 43
    Height = 13
    Caption = 'Flanger |'
  end
  object Label8: TLabel
    Left = 131
    Top = 134
    Width = 30
    Height = 13
    Caption = 'Echo |'
  end
  object Label9: TLabel
    Left = 131
    Top = 40
    Width = 41
    Height = 13
    Caption = 'Chorus |'
  end
  object lbtempo: TLabel
    Left = 56
    Top = 40
    Width = 17
    Height = 13
    Caption = '0%'
  end
  object lbpitch: TLabel
    Left = 44
    Top = 87
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lbfreq: TLabel
    Left = 43
    Top = 134
    Width = 42
    Height = 13
    Caption = '44100Hz'
  end
  object lbreverb: TLabel
    Left = 60
    Top = 181
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lbchorus: TLabel
    Left = 178
    Top = 40
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lbflanger: TLabel
    Left = 180
    Top = 87
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lbecho: TLabel
    Left = 167
    Top = 134
    Width = 6
    Height = 13
    Caption = '0'
  end
  object tbTempo: TTrackBar
    Left = 8
    Top = 59
    Width = 109
    Height = 22
    Max = 30
    Min = -30
    PageSize = 1
    TabOrder = 0
    OnChange = tbTempoChange
  end
  object tbPitch: TTrackBar
    Left = 8
    Top = 106
    Width = 109
    Height = 22
    Max = 30
    Min = -30
    PageSize = 1
    TabOrder = 1
    OnChange = tbPitchChange
  end
  object tbFreq: TTrackBar
    Left = 8
    Top = 153
    Width = 109
    Height = 22
    Max = 57330
    Min = 30870
    PageSize = 441
    Position = 44100
    TabOrder = 2
    OnChange = tbFreqChange
  end
  object tbReverb: TTrackBar
    Left = 8
    Top = 200
    Width = 109
    Height = 22
    Max = 20
    Position = 20
    TabOrder = 3
    OnChange = tbReverbChange
  end
  object tbChorus: TTrackBar
    Left = 131
    Top = 59
    Width = 109
    Height = 22
    Max = 20
    TabOrder = 4
    OnChange = tbChorusChange
  end
  object tbflanger: TTrackBar
    Left = 131
    Top = 106
    Width = 109
    Height = 22
    Max = 20
    TabOrder = 5
    OnChange = tbflangerChange
  end
  object tbEcho: TTrackBar
    Left = 131
    Top = 153
    Width = 109
    Height = 22
    Max = 20
    TabOrder = 6
    OnChange = tbEchoChange
  end
  object btReset: TButton
    Left = 143
    Top = 197
    Width = 75
    Height = 25
    Caption = 'Resetuj'
    TabOrder = 7
    OnClick = btResetClick
  end
  object cbMixer: TCheckBox
    Left = 8
    Top = 8
    Width = 97
    Height = 17
    Caption = 'W'#322#261'cz/Wyl'#261'cz'
    TabOrder = 8
    OnClick = cbMixerClick
  end
end

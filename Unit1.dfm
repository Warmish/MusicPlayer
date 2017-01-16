object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Playlista'
  ClientHeight = 230
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object playlistBox: TListBox
    Left = 8
    Top = 8
    Width = 345
    Height = 185
    Color = clScrollBar
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = playlistBoxDblClick
  end
  object otworz: TButton
    Left = 8
    Top = 199
    Width = 75
    Height = 25
    Caption = 'Otw'#243'rz'
    TabOrder = 1
    OnClick = otworzClick
  end
  object otworzpl: TButton
    Left = 89
    Top = 199
    Width = 75
    Height = 25
    Caption = 'Otw'#243'rz pl..'
    TabOrder = 2
    OnClick = otworzplClick
  end
  object zapiszpl: TButton
    Left = 170
    Top = 199
    Width = 75
    Height = 25
    Caption = 'Zapisz pl..'
    TabOrder = 3
    OnClick = zapiszplClick
  end
  object Usunplik: TButton
    Left = 251
    Top = 199
    Width = 75
    Height = 25
    Caption = 'Usu'#324' P..'
    TabOrder = 4
    OnClick = UsunplikClick
  end
  object PopupMenu1: TPopupMenu
    Left = 328
    Top = 200
    object UsuPiosenkzlisty1: TMenuItem
      Caption = 'Usu'#324' Piosenk'#281' z listy'
      OnClick = UsuPiosenkzlisty1Click
    end
    object WyczyList1: TMenuItem
      Caption = 'Wyczy'#347#263' List'#281
      OnClick = WyczyList1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object DodajDoPlaylisty1: TMenuItem
      Caption = 'Dodaj Do Playlisty'
      OnClick = DodajDoPlaylisty1Click
    end
  end
end

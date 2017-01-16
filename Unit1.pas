unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BASS, ShellAPI, Vcl.Menus;

type
  TForm1 = class(TForm)
    playlistBox: TListBox;
    otworz: TButton;
    otworzpl: TButton;
    zapiszpl: TButton;
    Usunplik: TButton;
    PopupMenu1: TPopupMenu;
    UsuPiosenkzlisty1: TMenuItem;
    WyczyList1: TMenuItem;
    N1: TMenuItem;
    DodajDoPlaylisty1: TMenuItem;
    procedure playlistBoxDblClick(Sender: TObject);
    procedure otworzClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpuszczeniePlikow(var msg:TWMDropFiles); message WM_DROPFILES;
    procedure UsunplikClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure otworzplClick(Sender: TObject);
    procedure zapiszplClick(Sender: TObject);
    procedure UsuPiosenkzlisty1Click(Sender: TObject);
    procedure DodajDoPlaylisty1Click(Sender: TObject);
    procedure WyczyList1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

Uses Unit2;
{$R *.dfm}


function ExtractFileNameEX(const AFileName:String): String;
var i: integer;
begin
  i := LastDelimiter('.'+PathDelim+DriveDelim,AFileName);
  if (i=0) or (AFileName[i] <> '.') then
  i := MaxInt;
  Result := ExtractFileName(Copy(AFileName,1,i-1));
end;

procedure TForm1.otworzplClick(Sender: TObject);
begin
  if not Form2.OpenDialog2.Execute then Exit;
  Form2.WczytajPlayliste;
  Form1.playlistBox.ItemIndex:=0;
  Form2.Timer1.Enabled:=True;
end;

procedure TForm1.zapiszplClick(Sender: TObject);
begin
  if not Form2.SaveDialog1.Execute then Exit;
  Form2.ZapiszPlayliste;
end;

procedure TForm1.DodajDoPlaylisty1Click(Sender: TObject);
begin
	if not Form2.OpenDialog1.Execute then Exit;
	Form2.wczytajplik(PChar(Form2.OpenDialog1.FileName));
  playlistBox.ItemIndex:=0;
  Form2.Timer1.Enabled:=True;
end;

procedure TForm1.UpuszczeniePlikow(var msg:TWMDropFiles);
var hDrop: THandle;
    FileCount: Integer;
    FileNameLength, i, k: Integer;
    FileName: array[0..MAX_PATH] of char;
    FileNameStr : string;
begin
  hDrop := msg.Drop;
  FileCount:= DragQueryFile(hDrop, $FFFFFFFF, nil, 0); // Zwraca ilosc przeciaganych plikow
  for i:=0 to FileCount-1 do
  begin
    // Odczytuje d³ugosc nazwy naszego pliku
    FileNameLength:=DragQueryFile(hDrop, i, nil, 0);
    // Zwraca do bufora nazwê pliku
    DragQueryFile(hDrop, i, FileName, Length(FileName));
    // Bufor jest wiêkszy ni¿ nazwa pliku, dlatego wycinamy string o d³ugosci FileNameLength z bufora
    FileNameStr := '';
    for k:=0 to FileNameLength-1 do FileNameStr := FileNameStr + FileName[k];
    Form2.wczytajplik(PChar(FileNameStr));
    playlistBox.ItemIndex:=0;
    Form2.Timer1.Enabled:=True;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form2.playlistButton.Enabled:=True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DragAcceptFiles(Self.Handle, True);
end;

procedure TForm1.otworzClick(Sender: TObject);
begin
	if not Form2.OpenDialog1.Execute then Exit;
  Form2.wczytajplik(PChar(Form2.OpenDialog1.FileName));
  playlistBox.ItemIndex:=0;
  Form2.Timer1.Enabled:=True;
end;

procedure TForm1.playlistBoxDblClick(Sender: TObject);
begin
    Form2.UsunEqualizer;
    Form2.UsunFX;
		BASS_ChannelPlay(Form2.strs[Form2.Uchwyt], True);
    BASS_ChannelStop(Form2.strs[Form2.Uchwyt]);
    Form2.Uchwyt := playlistBox.ItemIndex;
    Form2.WczytajEqualizer;
    Form2.WczytajFX;
		if not BASS_ChannelPlay(Form2.strs[Form2.Uchwyt], False) then
			Form2.Error('Blad Podczas Odtwarzania!');
end;

procedure TForm1.UsunplikClick(Sender: TObject);
var a, i: Integer;
begin
	i := PlaylistBox.ItemIndex;
	if i >= 0 then
  begin
		BASS_StreamFree(Form2.strs[i]);
		if i < Form2.strc then
			for a := i to Form2.strc - 1 do
				Form2.strs[a] := Form2.strs[a + 1];
		Dec(Form2.strc);
		PlaylistBox.Items.Delete(i);
	end;
end;

procedure TForm1.UsuPiosenkzlisty1Click(Sender: TObject);
var a, i: Integer;
begin
	i := PlaylistBox.ItemIndex;
	if i >= 0 then
  begin
    Form2.UsunEqualizer;
    Form2.UsunFX;
		BASS_StreamFree(Form2.strs[i]);
		if i < Form2.strc then
			for a := i to Form2.strc - 1 do
				Form2.strs[a] := Form2.strs[a + 1];
		Dec(Form2.strc);
		PlaylistBox.Items.Delete(i);
	end;
end;

procedure TForm1.WyczyList1Click(Sender: TObject);
begin
   PlaylistBox.ItemIndex:=0;
   if Form2.strc > 0 then
   begin
    repeat
    Form2.UsunEqualizer;
    Form2.UsunFX;
    BASS_StreamFree(Form2.strs[Form2.strc-1]);
		PlaylistBox.Items.Delete(Form2.strc-1);
    Dec(Form2.strc);
    until Form2.strc = 0;
    Form2.Timer1.Enabled:=false;
   end;
end;

end.

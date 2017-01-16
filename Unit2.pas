unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BASS, BASS_FX, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Unit1, Unit3, Unit4, Unit5, ShellAPI,Math,
  System.Actions, Vcl.ActnList,
  CommonTypes, circle_vis, osc_vis, spectrum_vis;

type
  TForm2 = class(TForm)
    playButton: TButton;
    stopButton: TButton;
    pauseButton: TButton;
    prevButton: TButton;
    nextButton: TButton;
    tbGlosnosc: TTrackBar;
    cbWycisz: TCheckBox;
    lbGlosnosc: TLabel;
    OpenDialog1: TOpenDialog;
    Timer1: TTimer;
    lbPostep: TLabel;
    lbPostep2: TLabel;
    playlistButton: TButton;
    mixerButton: TButton;
    equalizerButton: TButton;
    visualizationButton: TButton;
    MainMenu1: TMainMenu;
    Plik1: TMenuItem;
    Narzdzia1: TMenuItem;
    Pomoc1: TMenuItem;
    Otwrz1: TMenuItem;
    Zapisz1: TMenuItem;
    Zamknij1: TMenuItem;
    Playlista1: TMenuItem;
    Equalizer1: TMenuItem;
    Wizualizacja1: TMenuItem;
    Mixer1: TMenuItem;
    Informacje1: TMenuItem;
    tbPostep: TScrollBar;
    SaveDialog1: TSaveDialog;
    OtwrzPl1: TMenuItem;
    OpenDialog2: TOpenDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbUchwyt: TLabel;
    lbstrc: TLabel;
    lbplayindex: TLabel;
    TimerDebug: TTimer;
    PaintBox1: TPaintBox;
    TimerWizualizacja: TTimer;
    TimerMixer: TTimer;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbodtwarzam: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbwizx: TLabel;
    lbwizy: TLabel;
    lbczywyczisz: TLabel;
    lbpplay: TLabel;
    lbkplay: TLabel;
    PopupMenu1: TPopupMenu;
    Ustawienia1: TMenuItem;
    Language1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbWyciszClick(Sender: TObject);
    procedure tbGlosnoscChange(Sender: TObject);
    procedure stopButtonClick(Sender: TObject);
    procedure pauseButtonClick(Sender: TObject);
    procedure playButtonClick(Sender: TObject);
    procedure nextButtonClick(Sender: TObject);
    procedure prevButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure playlistButtonClick(Sender: TObject);
    procedure equalizerButtonClick(Sender: TObject);
    procedure mixerButtonClick(Sender: TObject);
    procedure visualizationButtonClick(Sender: TObject);
    procedure Playlista1Click(Sender: TObject);
    procedure Equalizer1Click(Sender: TObject);
    procedure Wizualizacja1Click(Sender: TObject);
    procedure Mixer1Click(Sender: TObject);
    procedure Otwrz1Click(Sender: TObject);
    procedure UpuszczeniePlikow(var msg:TWMDropFiles); message WM_DROPFILES;
    procedure Informacje1Click(Sender: TObject);
    procedure Zamknij1Click(Sender: TObject);
    procedure Zapisz1Click(Sender: TObject);
    procedure OtwrzPl1Click(Sender: TObject);
    procedure tbPostepScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure TimerDebugTimer(Sender: TObject);
    procedure TimerWizualizacjaTimer(Sender: TObject);
    procedure Ustawienia1Click(Sender: TObject);
    procedure Error(msg: string);
    procedure WczytajEqualizer;
    procedure UsunEqualizer;
    procedure WczytajPlik(f: Pchar);
    procedure WczytajPlayliste;
    procedure ZapiszPlayliste;
    procedure WczytajFX;
    procedure UsunFX;
    procedure ZmienJezyk;
    procedure Language1Click(Sender: TObject);
  private

  public
    Uchwyt: Integer;  //Obecnie odtwarzana piosenka
    strs: array[0..MAX_PATH] of HSTREAM;
    str: array[0..MAX_PATH] of string;
    strc: Integer;  //Licznik Dodanych piosenek

    pReverb: BASS_DX8_REVERB; //Reverb
    fxReverb : HFX;

    pChorus: BASS_DX8_CHORUS;  //Chorus
    fxChorus : HFX;

    pEcho: BASS_DX8_ECHO;   //Echo
    fxEcho : HFX;

    pFlanger: BASS_DX8_FLANGER;  //Flanger
    fxFlanger: HFX;

    pEqualizer: BASS_DX8_PARAMEQ;  //Equalizer
    fxEqualizer: array[1..10] of integer;

    czywiz:boolean;

    info: BASS_CHANNELINFO;
    freq,oldfreq: double;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Error(msg: string);
var s: string;
begin
	s := msg + #13#10 + '(Kod B³êdu: ' + IntToStr(BASS_ErrorGetCode) + ')';
	MessageBox(Handle, PChar(s), nil, 0);
  Exit;
end;

procedure TForm2.ZmienJezyk;
begin
  //Form2
  Caption:='Music Player';
  visualizationButton.Caption:='Visualyzation';
  mixerButton.Caption:='Mixer';
  playlistButton.Caption:='Playlist';
  equalizerButton.Caption:='Equalizer';
  playButton.Caption:='Play';
  prevButton.Caption:='Previous';
  nextButton.Caption:='Next';
  stopButton.Caption:='Stop';
  pauseButton.Caption:='Pause';
  Ustawienia1.Caption:='Visualyzation Settings';
  Narzdzia1.Caption:='Tools';
  Playlista1.Caption:='Playlist';
  Wizualizacja1.Caption:='Visualization';
  Mixer1.Caption:='Mixer';
  Equalizer1.Caption:='Equalizer';
  Plik1.Caption:='File';
  Otwrz1.Caption:='Open';
  Zapisz1.Caption:='Save Playlist';
  OtwrzPl1.Caption:='Open Playlist';
  Zamknij1.Caption:='Close';
  Pomoc1.Caption:='Help';
  Informacje1.Caption:='Author';
  //Form1
  Form1.Caption:='Playlist';
  Form1.otworz.Caption:='Open';
  Form1.otworzpl.Caption:='Open Playlist';
  Form1.zapiszpl.Caption:='Save Playlist';
  Form1.usunplik.Caption:='Delete File';
  Form1.usupiosenkzlisty1.Caption:='Delete file from playlist';
  Form1.wyczylist1.Caption:='Clear playlist';
  Form1.dodajdoplaylisty1.Caption:='Add to playlist';
  //Form3
  Form3.Caption:='Equalizer';
  Form3.cbEqualizer.Caption:='On/Off';
  Form3.btReset.Caption:='Reset';
  //Form4
  Form4.Caption:='Mixer';
  Form4.cbMixer.Caption:='On/Off';
  Form4.btReset.Caption:='Reset';
  //Form5
  Form5.Caption:='Visualyzation Settings';
  Form5.gbKolo.Caption:='Circlescope Properties';
  Form5.label5.Caption:='Radius';
  Form5.gbspektrum.Caption:='Spectrum Properties';
  Form5.checkspecpeaks.Caption:='Show Peaks';
  Form5.label9.Caption:='Peak Color';
  Form5.label10.Caption:='Line Falloff';
  Form5.label11.Caption:='Peak Falloff';
  Form5.gbUstawienia.Caption:='';
  Form5.label3.Caption:='Offset';
  Form5.label6.Caption:='Background Color';
  Form5.label7.Caption:='Draw Color';
  Form5.Radiogroup1.Caption:='Visualyzation';
  Form5.Radiogroup1.Items[0]:='Circle';
  Form5.Radiogroup1.Items[1]:='Oscilloscope';
  Form5.Radiogroup1.Items[2]:='Spectrum';
  Form5.Radiogroup2.Caption:='Draw Mode';
  Form5.Radiogroup2.Items[0]:='Line';
  Form5.Radiogroup2.Items[1]:='Solid';
  Form5.Radiogroup2.Items[2]:='Pixel';
end;

procedure TForm2.WczytajFX;
var v:integer;
begin
  if Form4.cbMixer.Checked = false then exit;

  fxReverb := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_REVERB, 0);
  v := Form4.tbReverb.position;
  BASS_FXGetParameters(fxReverb, @pReverb);
  pReverb.fReverbMix := -0.012*v*v*v;
  BASS_FXSetParameters(fxReverb, @pReverb);

  fxEcho := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_ECHO, 0);
  v := Form4.tbEcho.position;
  BASS_FXGetParameters(fxEcho, @pEcho);
  pEcho.fWetDryMix:=v*5;
  pEcho.fFeedback:=60;
  pEcho.lPanDelay:=True;
  BASS_FXSetParameters(fxEcho, @pEcho);

  fxFlanger := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_Flanger, 0);
  v := Form4.tbFlanger.position;
  BASS_FXGetParameters(fxFlanger, @pFlanger);
  pFlanger.fWetDryMix:=v*5;
  BASS_FXSetParameters(fxFlanger, @pFlanger);

  fxChorus := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_Chorus, 0);
  v := Form4.tbChorus.position;
  BASS_FXGetParameters(fxChorus, @pChorus);
  pChorus.fWetDryMix:=v*5;
  BASS_FXSetParameters(fxChorus, @pChorus);

  BASS_ChannelSetAttribute(strs[uchwyt], BASS_ATTRIB_TEMPO_PITCH, Form4.tbPitch.position);
  BASS_ChannelSetAttribute(strs[uchwyt], BASS_ATTRIB_TEMPO_FREQ, Form4.tbFreq.position);
  BASS_ChannelSetAttribute(strs[uchwyt], BASS_ATTRIB_TEMPO, Form4.tbTempo.position);
end;

procedure TForm2.UsunFX;
begin
  BASS_ChannelSetAttribute(strs[uchwyt], BASS_ATTRIB_TEMPO_PITCH, 0);
  BASS_ChannelSetAttribute(strs[uchwyt], BASS_ATTRIB_TEMPO_FREQ, 44100);
  BASS_ChannelSetAttribute(strs[uchwyt], BASS_ATTRIB_TEMPO, 0);
  BASS_ChannelRemoveFX(strs[Uchwyt], fxReverb);
  BASS_ChannelRemoveFX(strs[Uchwyt], fxEcho);
  BASS_ChannelRemoveFX(strs[Uchwyt], fxChorus);
  BASS_ChannelRemoveFX(strs[Uchwyt], fxFlanger);
end;

procedure TForm2.WczytajEqualizer;
var v:integer;
begin
//BASS_ChannelGetInfo(strs[Uchwyt], info);
  //freq := info.freq;
  //oldfreq := freq;
    if Form3.cbEqualizer.Checked = false then exit;

    fxEqualizer[1] := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_PARAMEQ, 1);
    fxEqualizer[2] := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_PARAMEQ, 1);
    fxEqualizer[3] := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_PARAMEQ, 1);
    fxEqualizer[4] := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_PARAMEQ, 1);
    fxEqualizer[5] := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_PARAMEQ, 1);
    fxEqualizer[6] := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_PARAMEQ, 1);
    fxEqualizer[7] := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_PARAMEQ, 1);
    fxEqualizer[8] := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_PARAMEQ, 1);
    fxEqualizer[9] := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_PARAMEQ, 1);
    fxEqualizer[10] := BASS_ChannelSetFX(strs[Uchwyt], BASS_FX_DX8_PARAMEQ, 1);

    v:=Form3.TrackBar1.Position;
    BASS_FXGetParameters(fxEqualizer[1], @pEqualizer);
    pEqualizer.fGain := 15-v;
    pEqualizer.fBandwidth := 18;
    pEqualizer.fCenter := 80;
    BASS_FXSetParameters(fxEqualizer[1], @pEqualizer);

    v:=Form3.TrackBar2.Position;
    BASS_FXGetParameters(fxEqualizer[2], @pEqualizer);
    pEqualizer.fGain := 15-v;
    pEqualizer.fBandwidth := 18;
    pEqualizer.fCenter := 170;
    BASS_FXSetParameters(fxEqualizer[2], @pEqualizer);

    v:=Form3.TrackBar3.Position;
    BASS_FXGetParameters(fxEqualizer[3], @pEqualizer);
    pEqualizer.fGain := 15-v;
    pEqualizer.fBandwidth := 18;
    pEqualizer.fCenter := 310;
    BASS_FXSetParameters(fxEqualizer[3], @pEqualizer);

    v:=Form3.TrackBar4.Position;
    BASS_FXGetParameters(fxEqualizer[4], @pEqualizer);
    pEqualizer.fGain := 15-v;
    pEqualizer.fBandwidth := 18;
    pEqualizer.fCenter := 600;
    BASS_FXSetParameters(fxEqualizer[4], @pEqualizer);

    v:=Form3.TrackBar5.Position;
    BASS_FXGetParameters(fxEqualizer[5], @pEqualizer);
    pEqualizer.fGain := 15-v;
    pEqualizer.fBandwidth := 18;
    pEqualizer.fCenter := 1000;
    BASS_FXSetParameters(fxEqualizer[5], @pEqualizer);

    v:=Form3.TrackBar6.Position;
    BASS_FXGetParameters(fxEqualizer[6], @pEqualizer);
    pEqualizer.fGain := 15-v;
    pEqualizer.fBandwidth := 18;
    pEqualizer.fCenter := 3000;
    BASS_FXSetParameters(fxEqualizer[6], @pEqualizer);

    v:=Form3.TrackBar7.Position;
    BASS_FXGetParameters(fxEqualizer[7], @pEqualizer);
    pEqualizer.fGain := 15-v;
    pEqualizer.fBandwidth := 18;
    pEqualizer.fCenter := 6000;
    BASS_FXSetParameters(fxEqualizer[7], @pEqualizer);

    v:=Form3.TrackBar8.Position;
    BASS_FXGetParameters(fxEqualizer[8], @pEqualizer);
    pEqualizer.fGain := 15-v;
    pEqualizer.fBandwidth := 18;
    pEqualizer.fCenter := 8000;
    BASS_FXSetParameters(fxEqualizer[8], @pEqualizer);

    v:=Form3.TrackBar9.Position;
    BASS_FXGetParameters(fxEqualizer[9], @pEqualizer);
    pEqualizer.fGain := 15-v;
    pEqualizer.fBandwidth := 18;
    pEqualizer.fCenter := 12000;
    BASS_FXSetParameters(fxEqualizer[9], @pEqualizer);

    v:=Form3.TrackBar10.Position;
    BASS_FXGetParameters(fxEqualizer[10], @pEqualizer);
    pEqualizer.fGain := 15-v;
    pEqualizer.fBandwidth := 18;
    pEqualizer.fCenter := 16000;
    BASS_FXSetParameters(fxEqualizer[10], @pEqualizer);
end;

procedure TForm2.UsunEqualizer;
begin
Form3.TrackBar1.OnChange(Self);
BASS_ChannelRemoveFX(strs[Uchwyt], fxEqualizer[1]);
Form3.TrackBar2.OnChange(Self);
BASS_ChannelRemoveFX(strs[Uchwyt], fxEqualizer[2]);
Form3.TrackBar3.OnChange(Self);
BASS_ChannelRemoveFX(strs[Uchwyt], fxEqualizer[3]);
Form3.TrackBar4.OnChange(Self);
BASS_ChannelRemoveFX(strs[Uchwyt], fxEqualizer[4]);
Form3.TrackBar5.OnChange(Self);
BASS_ChannelRemoveFX(strs[Uchwyt], fxEqualizer[5]);
Form3.TrackBar6.OnChange(Self);
BASS_ChannelRemoveFX(strs[Uchwyt], fxEqualizer[6]);
Form3.TrackBar7.OnChange(Self);
BASS_ChannelRemoveFX(strs[Uchwyt], fxEqualizer[7]);
Form3.TrackBar8.OnChange(Self);
BASS_ChannelRemoveFX(strs[Uchwyt], fxEqualizer[8]);
Form3.TrackBar9.OnChange(Self);
BASS_ChannelRemoveFX(strs[Uchwyt], fxEqualizer[9]);
Form3.TrackBar10.OnChange(Self);
BASS_ChannelRemoveFX(strs[Uchwyt], fxEqualizer[10]);
end;

function ExtractFileNameEX(const AFileName:String): String;
var i: integer;
begin
  i:=LastDelimiter('.'+PathDelim+DriveDelim,AFileName);
  if (i=0) or (AFileName[i] <> '.') then i:=MaxInt;
  Result:=ExtractFileName(Copy(AFileName,1,i-1));
end;

procedure TForm2.WczytajPlik(f: Pchar);
begin
  if strc = MAX_PATH then exit;
  strs[strc] := BASS_StreamCreateFile(False, f, 0, 0,  BASS_SAMPLE_FX or BASS_STREAM_DECODE {$IFDEF UNICODE} or BASS_UNICODE {$ENDIF});//0 {$IFDEF UNICODE} or BASS_UNICODE {$ENDIF});
  strs[strc] := BASS_FX_TempoCreate(strs[strc], BASS_SAMPLE_LOOP or BASS_FX_FREESOURCE);
	if strs[strc] <> 0 then
	begin
    str[strc]:=f;
    Form1.playlistBox.Items.Add(ExtractFileNameEX(f));
	 	Inc(strc);
	end else Error('Blad Podczas dodawania piosenki!');
end;

procedure TForm2.WczytajPlayliste;
var Plik: TextFile; odczyt:string;
begin
  AssignFile(Plik, OpenDialog2.FileName);
  Reset(Plik);
  while not seekeof(Plik) do
  begin
    readln(Plik, odczyt);
    WczytajPlik(PChar(odczyt));
  end;
  CloseFile(Plik);
end;

procedure TForm2.ZapiszPlayliste;
Var Plik: TextFile; i:integer;
begin
  AssignFile(Plik, SaveDialog1.FileName);
  ReWrite(Plik);
  for i := 0 to strc-1 do
  Writeln(Plik, str[i]);
  CloseFile(Plik);
end;

procedure TForm2.UpuszczeniePlikow(var msg:TWMDropFiles);
var
  hDrop: THandle;
  FileCount: Integer;
  FileNameLength: Integer;
  FileName: array[0..MAX_PATH] of char;
  FileNameStr : string;
  i,k : integer;
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
    WczytajPlik(PChar(FileNameStr));
  end;
  Form1.playlistBox.ItemIndex:=0;
  Timer1.Enabled:=True;
end;

procedure TForm2.FormCreate(Sender: TObject);
var v:double; i:integer;
begin
    strc:=0;
    tbPostep.Position := 0;
    BASS_Init(-1, 44100, 0, Application.Handle, nil);
    DragAcceptFiles(Self.Handle, True);
    //--------------------------------------
    v:=RoundTo(BASS_GetVolume(), -2);
    v:=v*100;
    lbGlosnosc.Caption:=FloatToStr(v)+'%';
    //lbGlosnosc.Caption:=FloatToStrF(v, ffFixed,1,2);
    i:=Round(v);
    tbGlosnosc.Position:=i;
    //--------------------------------
    CircleScope := TCircleScope.Create(PaintBox1.Width, PaintBox1.Height);
    OcilloScope := TOcilloScope.Create(PaintBox1.Width, PaintBox1.Height);
    Spectrum    := TSpectrum.Create(PaintBox1.Width, PaintBox1.Height);
    //----------------------------------
    czywiz:=false;
    //----------------------------------

    //----------------------------------
    freq := 44100;
    //----------------------------------
    BASS_Start;
    BASS_SetConfig(BASS_CONFIG_BUFFER,1000);
end;

procedure TForm2.FormDestroy(Sender: TObject);
var a: Integer;
begin
   if strc > 0 then
    for a := 0 to strc - 1 do BASS_StreamFree(strs[a]);
   BASS_Stop;
   BASS_Free;
end;


{###################################################################
################################################################### }
                       //Menu

procedure TForm2.Equalizer1Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm2.Wizualizacja1Click(Sender: TObject);
begin
 Form5.Show;

end;

procedure TForm2.Mixer1Click(Sender: TObject);
begin
 Form4.Show;
end;

procedure TForm2.Playlista1Click(Sender: TObject);
begin
    Form1.Show;
    playlistButton.Enabled:=False;
end;

procedure TForm2.Otwrz1Click(Sender: TObject);
begin
	if not OpenDialog1.Execute then Exit;
  WczytajPlik(PChar(OpenDialog1.FileName));
  Form1.playlistBox.ItemIndex:=0;
  Timer1.Enabled:=True;
end;

procedure TForm2.Informacje1Click(Sender: TObject);
begin
   Application.MessageBox('Program Wykonal Rafal Parafiniuk','Autor');
end;

procedure TForm2.Language1Click(Sender: TObject);
begin
ZmienJezyk;
end;

procedure TForm2.Zamknij1Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.Zapisz1Click(Sender: TObject);
begin
  if not SaveDialog1.Execute then Exit;
  ZapiszPlayliste;
end;

procedure TForm2.OtwrzPl1Click(Sender: TObject);
begin
  if not OpenDialog2.Execute then Exit;
  WczytajPlayliste;
  Form1.playlistBox.ItemIndex:=0;
  Timer1.Enabled:=True;
end;

procedure TForm2.Ustawienia1Click(Sender: TObject);
begin
  Form5.Show;
end;


{###################################################################
################################################################### }
                       //Kontrola glosnosci
var glos:integer;
procedure TForm2.cbWyciszClick(Sender: TObject);
begin
   if cbWycisz.Checked = true then
   begin
      glos:=tbGlosnosc.Position;
      tbGlosnosc.Position :=0
   end
   else if cbWycisz.Checked = false then tbGlosnosc.Position :=glos;
end;

procedure TForm2.tbGlosnoscChange(Sender: TObject);
var glos:integer;
begin
  glos:=tbGlosnosc.Position;
  if tbGlosnosc.Position > 0 then cbWycisz.Checked := false else
  cbWycisz.Checked := true;
  if tbGlosnosc.Position = glos then
  begin
  lbGlosnosc.Caption := IntToStr(glos)+'%';
  //BASS_SetVolume(tbGlosnosc.Position / 100);
  BASS_ChannelSetAttribute(strs[uchwyt], BASS_ATTRIB_VOL, tbGlosnosc.position / 100);
  end;
end;


{###################################################################
################################################################### }
                       //Przyciski funkcjne

procedure TForm2.playlistButtonClick(Sender: TObject);
begin
    Form1.Show;
    playlistButton.Enabled:=False;
end;

procedure TForm2.mixerButtonClick(Sender: TObject);
begin
    Form4.Show;
end;

procedure TForm2.equalizerButtonClick(Sender: TObject);
begin
    Form3.Show;
end;

procedure TForm2.visualizationButtonClick(Sender: TObject);
begin
    if czywiz = false then
    begin
    ClientHeight:=275;
    czywiz:=true;
    end else
    begin
    ClientHeight:=100;
    czywiz:=false;
    end;
end;

{###################################################################
################################################################### }
                       //Podstawowe funkcje

procedure TForm2.pauseButtonClick(Sender: TObject);
begin
    if BASS_ChannelIsActive(strs[Uchwyt]) = BASS_ACTIVE_PAUSED then
    BASS_ChannelPlay(strs[Uchwyt], False)
    else
    BASS_ChannelPause(strs[Uchwyt]);
end;

procedure TForm2.stopButtonClick(Sender: TObject);
begin
  BASS_ChannelPlay(strs[Uchwyt], True);
  BASS_ChannelStop(strs[Uchwyt]);
  tbPostep.Position:=0;
end;

procedure TForm2.playButtonClick(Sender: TObject);
begin
  if Uchwyt = strc then Error('Nie wczytano Pliku') else
  begin
    UsunEqualizer;
    UsunFX;
    BASS_ChannelPlay(strs[Uchwyt], True);
    BASS_ChannelStop(strs[Uchwyt]);
    Uchwyt := Form1.playlistBox.ItemIndex;
    WczytajEqualizer;
    WczytajFX;
    if not BASS_ChannelPlay(strs[Uchwyt], False) then
    Error('Blad podczas odtwarzania!');
  end;
end;

procedure TForm2.nextButtonClick(Sender: TObject);
begin
  if Uchwyt = strc then Error('Nie wczytano Pliku') else
  if Uchwyt = strc-1 then
  begin
			//Error('Koniec listy');
      UsunEqualizer;
      UsunFX;
      BASS_ChannelPlay(strs[Uchwyt], True);
      BASS_ChannelStop(strs[Uchwyt]);
      Uchwyt:=0;
      Form1.playlistBox.ItemIndex:=0;
  end else
  begin
    UsunEqualizer;
    UsunFX;
		BASS_ChannelPlay(strs[Uchwyt], True);
    BASS_ChannelStop(strs[Uchwyt]);
    Inc(Uchwyt);
    Form1.playlistBox.ItemIndex:=Uchwyt;
    WczytajEqualizer;
    WczytajFX;
    if not BASS_ChannelPlay(strs[Uchwyt], False) then
    Error('Blad Podczas odtwarzania!');
  end;
end;

procedure TForm2.prevButtonClick(Sender: TObject);
begin
  if Uchwyt = strc then Error('Nie wczytano Pliku') else
 	if Uchwyt = 0 then
  begin
    //Error('Koniec listy');
    UsunEqualizer;
    UsunFX;
		BASS_ChannelPlay(strs[Uchwyt], True);
    BASS_ChannelStop(strs[Uchwyt]);
  end else
  begin
  UsunEqualizer;
  UsunFx;
  BASS_ChannelPlay(strs[Uchwyt], True);
  BASS_ChannelStop(strs[Uchwyt]);
  Dec(Uchwyt);
  Form1.playlistBox.ItemIndex:=Uchwyt;
  WczytajEqualizer;
  WczytajFX;
  if not BASS_ChannelPlay(strs[Uchwyt], False) then
    Error('Blad podczas odtwarzania!');
  end;
end;

procedure TForm2.tbPostepScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  BASS_ChannelStop(strs[Uchwyt]);
  BASS_ChannelSetPosition(strs[Uchwyt],tbPostep.Position,BASS_POS_BYTE);
  BASS_ChannelPlay(strs[Uchwyt], False);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
var
  pozycja1,pozycja2 : cardinal;
  czas1,czas2 : integer;
  sec,min,hr: integer;
  strsec,strmin,strhr:string;
begin
  if BASS_ChannelIsActive(strs[Uchwyt]) <> BASS_ACTIVE_PLAYING then Exit;

  BASS_ChannelSetAttribute(strs[uchwyt], BASS_ATTRIB_VOL, tbGlosnosc.position / 100);

  caption:=Form1.playlistBox.Items[Uchwyt];

  pozycja1:=BASS_ChannelGetPosition(strs[Uchwyt],BASS_POS_BYTE);
  pozycja2:=BASS_ChannelGetLength(strs[Uchwyt],BASS_POS_BYTE);

  czas1:=Round(BASS_ChannelBytes2Seconds(strs[Uchwyt], pozycja1));
  czas2:=Round(BASS_ChannelBytes2Seconds(strs[Uchwyt], pozycja2));

  tbPostep.Position := pozycja1;
  tbPostep.Max := pozycja2;

  if czas1 = czas2 then
  begin
    if Uchwyt = strc-1 then
    begin
      UsunEqualizer;
      UsunFX;
      BASS_ChannelPlay(strs[Uchwyt], True);
      BASS_ChannelStop(strs[Uchwyt]);
      Uchwyt:=0;
      Form1.playlistBox.ItemIndex:=0;
    end else
    begin
      UsunEqualizer;
      UsunFX;
      BASS_ChannelPlay(strs[Uchwyt], True);
      BASS_ChannelStop(strs[Uchwyt]);
      Inc(Uchwyt);
      Form1.playlistBox.ItemIndex:=Uchwyt;
      WczytajEqualizer;
      WczytajFX;
      if not BASS_ChannelPlay(strs[Uchwyt], False) then
      Error('Blad Podczas odtwarzania!');
    end;
  end;

  sec:=czas1;

  hr := sec div 3600;
  min := sec div 60;
  sec := sec - min*60;

  strhr:=IntToStr(hr);
  strmin:=IntToStr(min);
  strsec:=IntToStr(sec);

  if hr < 10 then strhr:='0'+strhr;
  if min < 10 then strmin:='0'+strmin;
  if sec < 10 then strsec:='0'+strsec;
  lbPostep.Caption := strhr+':'+strmin+':'+strsec;

  sec:=czas2;
  hr := sec div 3600;
  min := sec div 60;
  sec := sec - min*60;

  strhr:=IntToStr(hr);
  strmin:=IntToStr(min);
  strsec:=IntToStr(sec);

  if hr < 10 then strhr:='0'+strhr;
  if min < 10 then strmin:='0'+strmin;
  if sec < 10 then strsec:='0'+strsec;
  lbPostep2.Caption := strhr+':'+strmin+':'+strsec;
end;

procedure TForm2.TimerDebugTimer(Sender: TObject);
begin
    lbUchwyt.Caption:=IntToStr(Uchwyt);
    lbstrc.Caption:=IntToStr(strc);
   // lbplayindex.Caption:=IntToStr(Form1.playlistBox.ItemIndex);
    if uchwyt = strc-1 then lbkplay.Caption:='True' else lbkplay.Caption:='False';
    if uchwyt = 0 then lbpplay.Caption:='True' else lbpplay.Caption:='False';
    if cbwycisz.Checked = true then lbczywyczisz.Caption:='True' else lbczywyczisz.Caption:='False';
    if BASS_ChannelIsActive(strs[Uchwyt]) <> BASS_ACTIVE_PLAYING then lbodtwarzam.Caption:='False' else lbodtwarzam.Caption:='True';
    //lbwizx.Caption:=info.filename;
end;

procedure TForm2.TimerWizualizacjaTimer(Sender: TObject);
var FFTFata : TFFTData; WaveData  : TWaveData;
begin
  if BASS_ChannelIsActive(strs[Uchwyt]) <> BASS_ACTIVE_PLAYING then Exit;
    case Form5.RadioGroup1.ItemIndex of
    0 :
    begin
      BASS_ChannelGetData(strs[Uchwyt], @WaveData, 2048);
      CircleScope.Draw (PaintBox1.Canvas.Handle, WaveData, Form5.kolox.Position, 80);
    end;
    1 :
    begin
      BASS_ChannelGetData(strs[Uchwyt], @WaveData, 2048);
      OcilloScope.Draw (PaintBox1.Canvas.Handle, WaveData, 0, 80);
    end;
    2 :
    begin
      BASS_ChannelGetData(strs[Uchwyt], @FFTFata, BASS_DATA_FFT1024);
      Spectrum.Draw (PaintBox1.Canvas.Handle, FFTFata, 1, -1);
    end;
  end;
end;



end.

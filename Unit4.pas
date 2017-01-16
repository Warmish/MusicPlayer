unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, BASS, BASS_FX;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbtempo: TLabel;
    lbpitch: TLabel;
    lbfreq: TLabel;
    lbreverb: TLabel;
    lbchorus: TLabel;
    lbflanger: TLabel;
    lbecho: TLabel;
    tbTempo: TTrackBar;
    tbPitch: TTrackBar;
    tbFreq: TTrackBar;
    tbReverb: TTrackBar;
    tbChorus: TTrackBar;
    tbflanger: TTrackBar;
    tbEcho: TTrackBar;
    btReset: TButton;
    cbMixer: TCheckBox;
    procedure tbPitchChange(Sender: TObject);
    procedure tbTempoChange(Sender: TObject);
    procedure tbFreqChange(Sender: TObject);
    procedure btResetClick(Sender: TObject);
    procedure tbReverbChange(Sender: TObject);
    procedure cbMixerClick(Sender: TObject);
    procedure tbEchoChange(Sender: TObject);
    procedure tbChorusChange(Sender: TObject);
    procedure tbflangerChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
Uses Unit2;
{$R *.dfm}

procedure TForm4.btResetClick(Sender: TObject);
begin
  tbTempo.position := 0;
  tbTempo.OnChange(Self);
  tbFreq.position := Round(Form2.freq);
  tbFreq.OnChange(Self);
  tbPitch.position := 0;
  tbPitch.OnChange(Self);
  tbReverb.position := 20;
  tbReverb.OnChange(Self);
  tbEcho.position := 0;
  tbEcho.OnChange(Self);
  tbChorus.position := 0;
  tbChorus.OnChange(Self);
  tbFlanger.position := 0;
  tbFlanger.OnChange(Self);
end;

procedure TForm4.cbMixerClick(Sender: TObject);
begin
If cbMixer.checked = true Then Form2.WczytajFX;
if cbMixer.Checked = false then Form2.UsunFX;
end;

procedure TForm4.tbFreqChange(Sender: TObject);
var i:DWORD;
begin
  lbFreq.Caption :=IntToStr(tbFreq.position) + 'Hz';
  If (BASS_ChannelIsActive(Form2.strs[Form2.uchwyt]) = 0) Then Exit;
  If cbMixer.Checked = false then exit;
  BASS_ChannelSetAttribute(Form2.strs[Form2.uchwyt], BASS_ATTRIB_TEMPO_FREQ, tbFreq.position);

  for i := 0 to 2 do begin
  //  eq.lBand := i;
  //  BASS_FXGetParameters(fxEQ, @eq);
  //    eq.fCenter := eq.fCenter * tbFreq.position / Form2.oldfreq;
  //  BASS_FXSetParameters(fxEQ, @eq);
  end;

  Form2.oldfreq := tbFreq.position;
end;

procedure TForm4.tbPitchChange(Sender: TObject);
begin
  lbPitch.Caption := IntToStr(tbPitch.position);
  If (BASS_ChannelIsActive(Form2.strs[Form2.uchwyt]) = 0) Then Exit;
  If cbMixer.Checked = false then exit;
  BASS_ChannelSetAttribute(Form2.strs[Form2.uchwyt], BASS_ATTRIB_TEMPO_PITCH, tbPitch.position);
end;

procedure TForm4.tbTempoChange(Sender: TObject);
begin
  lbTempo.Caption :=IntToStr(tbTempo.position) + '%';
  If (BASS_ChannelIsActive(Form2.strs[Form2.uchwyt]) = 0) Then Exit;
  If cbMixer.Checked = false then exit;
  BASS_ChannelSetAttribute(Form2.strs[Form2.uchwyt], BASS_ATTRIB_TEMPO, tbTempo.position);
end;

procedure TForm4.tbChorusChange(Sender: TObject);
var v:integer;
begin
  lbChorus.Caption := IntToStr(tbChorus.position);
  If cbMixer.Checked = false then exit;
  v := Form4.tbChorus.position;
  BASS_FXGetParameters(Form2.fxChorus, @Form2.pChorus);
  Form2.pChorus.fWetDryMix:=v*5;
  BASS_FXSetParameters(Form2.fxChorus, @Form2.pChorus);
end;

procedure TForm4.tbEchoChange(Sender: TObject);
var v:integer;
begin
  lbEcho.Caption := IntToStr(tbEcho.position);
  If cbMixer.Checked = false then exit;
  v := Form4.tbEcho.position;
  BASS_FXGetParameters(Form2.fxEcho, @Form2.pEcho);
  Form2.pEcho.fWetDryMix:=v*5;
  BASS_FXSetParameters(Form2.fxEcho, @Form2.pEcho);
end;

procedure TForm4.tbflangerChange(Sender: TObject);
var v:integer;
begin
  lbflanger.Caption := IntToStr(tbflanger.position);
  If cbMixer.Checked = false then exit;
  v := Form4.tbFlanger.position;
  BASS_FXGetParameters(Form2.fxFlanger, @Form2.pFlanger);
  Form2.pFlanger.fWetDryMix:=v*5;
  BASS_FXSetParameters(Form2.fxFlanger, @Form2.pFlanger);
end;

procedure TForm4.tbReverbChange(Sender: TObject);
var v: integer;
begin
  lbReverb.Caption := IntToStr(20-tbReverb.position);
  If cbMixer.Checked = false then exit;
  v := tbReverb.position;
  BASS_FXGetParameters(Form2.fxReverb, @Form2.pReverb);
  Form2.pReverb.fReverbMix := -0.012*v*v*v;
  BASS_FXSetParameters(Form2.fxReverb, @Form2.pReverb);
end;

end.

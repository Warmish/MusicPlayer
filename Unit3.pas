unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Bass;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    GroupBox1: TGroupBox;
    TrackBar4: TTrackBar;
    TrackBar5: TTrackBar;
    TrackBar6: TTrackBar;
    TrackBar7: TTrackBar;
    TrackBar8: TTrackBar;
    TrackBar9: TTrackBar;
    TrackBar10: TTrackBar;
    Label4: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    btReset: TButton;
    cbEqualizer: TCheckBox;
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure TrackBar7Change(Sender: TObject);
    procedure TrackBar8Change(Sender: TObject);
    procedure TrackBar9Change(Sender: TObject);
    procedure TrackBar10Change(Sender: TObject);
    procedure btResetClick(Sender: TObject);
    procedure cbEqualizerClick(Sender: TObject);
    
  private
    { Private declarations }
    //chan: DWORD;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;


implementation
Uses Unit2;
{$R *.dfm}

procedure TForm3.cbEqualizerClick(Sender: TObject);
begin
If cbEqualizer.checked = true Then Form2.WczytajEqualizer;
if cbEqualizer.Checked = false then Form2.UsunEqualizer;
end;

procedure TForm3.TrackBar1Change(Sender: TObject);
begin
  TrackBar1.Hint:= IntToStr(15-TrackBar1.position)+'db';
  If cbEqualizer.Checked = false then exit;
  BASS_FXGetParameters(Form2.fxEqualizer[1], @Form2.pEqualizer);
  Form2.pEqualizer.fgain :=15-TrackBar1.position;
  BASS_FXSetParameters(Form2.fxEqualizer[1], @Form2.pEqualizer);
end;

procedure TForm3.TrackBar2Change(Sender: TObject);
begin
  TrackBar2.Hint:= IntToStr(15-TrackBar2.position)+'db';
  If cbEqualizer.Checked = false then exit;
  BASS_FXGetParameters(Form2.fxEqualizer[2], @Form2.pEqualizer);
  Form2.pEqualizer.fgain := 15-TrackBar2.position;
  BASS_FXSetParameters(Form2.fxEqualizer[2], @Form2.pEqualizer);
end;

procedure TForm3.TrackBar3Change(Sender: TObject);
begin
  TrackBar3.Hint:= IntToStr(15-TrackBar3.position)+'db';
  If cbEqualizer.Checked = false then exit;
  BASS_FXGetParameters(Form2.fxEqualizer[3], @Form2.pEqualizer);
  Form2.pEqualizer.fgain := 15-TrackBar3.position;
  BASS_FXSetParameters(Form2.fxEqualizer[3], @Form2.pEqualizer);
end;

procedure TForm3.TrackBar4Change(Sender: TObject);
begin
  TrackBar4.Hint:= IntToStr(15-TrackBar4.position)+'db';
  If cbEqualizer.Checked = false then exit;
  BASS_FXGetParameters(Form2.fxEqualizer[4], @Form2.pEqualizer);
  Form2.pEqualizer.fgain := 15-TrackBar4.position;
  BASS_FXSetParameters(Form2.fxEqualizer[4], @Form2.pEqualizer);
end;

procedure TForm3.TrackBar5Change(Sender: TObject);
begin
  TrackBar5.Hint:= IntToStr(15-TrackBar5.position)+'db';
  If cbEqualizer.Checked = false then exit;
  BASS_FXGetParameters(Form2.fxEqualizer[5], @Form2.pEqualizer);
  Form2.pEqualizer.fgain := 15-TrackBar5.position;
  BASS_FXSetParameters(Form2.fxEqualizer[5], @Form2.pEqualizer);
end;

procedure TForm3.TrackBar6Change(Sender: TObject);
begin
  TrackBar6.Hint:= IntToStr(15-TrackBar6.position)+'db';
  If cbEqualizer.Checked = false then exit;
  BASS_FXGetParameters(Form2.fxEqualizer[6], @Form2.pEqualizer);
  Form2.pEqualizer.fgain := 15-TrackBar6.position;
  BASS_FXSetParameters(Form2.fxEqualizer[6], @Form2.pEqualizer);
end;

procedure TForm3.TrackBar7Change(Sender: TObject);
begin
  TrackBar7.Hint:= IntToStr(15-TrackBar7.position)+'db';
  If cbEqualizer.Checked = false then exit;
  BASS_FXGetParameters(Form2.fxEqualizer[7], @Form2.pEqualizer);
  Form2.pEqualizer.fgain := 15-TrackBar7.position;
  BASS_FXSetParameters(Form2.fxEqualizer[7], @Form2.pEqualizer);
end;

procedure TForm3.TrackBar8Change(Sender: TObject);
begin
  TrackBar8.Hint:= IntToStr(15-TrackBar8.position)+'db';
  If cbEqualizer.Checked = false then exit;
  BASS_FXGetParameters(Form2.fxEqualizer[8], @Form2.pEqualizer);
  Form2.pEqualizer.fgain := 15-TrackBar8.position;
  BASS_FXSetParameters(Form2.fxEqualizer[8], @Form2.pEqualizer);
end;

procedure TForm3.TrackBar9Change(Sender: TObject);
begin
  TrackBar9.Hint:= IntToStr(15-TrackBar9.position)+'db';
  If cbEqualizer.Checked = false then exit;
  BASS_FXGetParameters(Form2.fxEqualizer[9], @Form2.pEqualizer);
  Form2.pEqualizer.fgain := 15-TrackBar9.position;
  BASS_FXSetParameters(Form2.fxEqualizer[9], @Form2.pEqualizer);
end;

procedure TForm3.TrackBar10Change(Sender: TObject);
begin
  TrackBar10.Hint:= IntToStr(15-TrackBar10.position)+'db';
  If cbEqualizer.Checked = false then exit;
  BASS_FXGetParameters(Form2.fxEqualizer[10], @Form2.pEqualizer);
  Form2.pEqualizer.fgain := 15-TrackBar10.position;
  BASS_FXSetParameters(Form2.fxEqualizer[10], @Form2.pEqualizer);
end;

procedure TForm3.btResetClick(Sender: TObject);
begin
  TrackBar1.position := 15;
  TrackBar1.OnChange(Self);
  TrackBar2.position := 15;
  TrackBar2.OnChange(Self);
  TrackBar3.position := 15;
  TrackBar3.OnChange(Self);
  TrackBar4.position := 15;
  TrackBar4.OnChange(Self);
  TrackBar5.position := 15;
  TrackBar5.OnChange(Self);
  TrackBar6.position := 15;
  TrackBar6.OnChange(Self);
  TrackBar7.position := 15;
  TrackBar7.OnChange(Self);
  TrackBar8.position := 15;
  TrackBar8.OnChange(Self);
  TrackBar9.position := 15;
  TrackBar9.OnChange(Self);
  TrackBar10.position := 15;
  TrackBar10.OnChange(Self);
end;

end.

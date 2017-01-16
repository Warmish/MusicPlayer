unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BASS, CommonTypes, circle_vis, osc_vis, spectrum_vis,
  Vcl.ComCtrls;

type
  TForm5 = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    gbUstawienia: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TrackOff: TTrackBar;
    PanelBkg: TPanel;
    PanelPen: TPanel;
    gbKolo: TGroupBox;
    Label5: TLabel;
    TrackRad: TTrackBar;
    gbspektrum: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    PanelPeakColor: TPanel;
    CheckSpecPeaks: TCheckBox;
    SpinLineFall: TUpDown;
    SpinPeakFall: TUpDown;
    EditLineFall: TEdit;
    EditPeakFall: TEdit;
    ColorDialog: TColorDialog;
    lbsrednica: TLabel;
    kolox: TTrackBar;
    procedure RadioGroup2Click(Sender: TObject);
    procedure TrackOffChange(Sender: TObject);
    procedure TrackRadChange(Sender: TObject);
    procedure PanelBkgClick(Sender: TObject);
    procedure PanelPenClick(Sender: TObject);
    procedure PanelPeakColorClick(Sender: TObject);
    procedure CheckSpecPeaksClick(Sender: TObject);
    procedure SpinLineFallClick(Sender: TObject; Button: TUDBtnType);
    procedure SpinPeakFallClick(Sender: TObject; Button: TUDBtnType);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
Uses Unit2;
{$R *.dfm}

procedure TForm5.CheckSpecPeaksClick(Sender: TObject);
begin
Spectrum.DrawPeak := CheckSpecPeaks.Checked;
end;


procedure TForm5.PanelBkgClick(Sender: TObject);
begin
  ColorDialog.Color := PanelBkg.Color;
  if not ColorDialog.Execute then Exit;
   PanelBkg.Color := ColorDialog.Color;
    CircleScope.BackColor := ColorDialog.Color;
    OcilloScope.BackColor := ColorDialog.Color;
    Spectrum.BackColor := ColorDialog.Color;
end;

procedure TForm5.PanelPeakColorClick(Sender: TObject);
begin
ColorDialog.Color := PanelPeakColor.Color;
  if not ColorDialog.Execute then Exit;
   PanelPeakColor.Color := ColorDialog.Color;
    Spectrum.Peak := ColorDialog.Color;
end;

procedure TForm5.PanelPenClick(Sender: TObject);
begin
  ColorDialog.Color := PanelPen.Color;
  if not ColorDialog.Execute then Exit;
   PanelPen.Color := ColorDialog.Color;
    CircleScope.Pen := ColorDialog.Color;
    OcilloScope.Pen := ColorDialog.Color;
    Spectrum.Pen := ColorDialog.Color;
end;

procedure TForm5.RadioGroup1Click(Sender: TObject);
begin
//  if RadioGroup1.ItemIndex = 2  then
//  begin
//     RadioGroup2.Controls[0].Enabled:=False;
//     RadioGroup2.Controls[2].Enabled:=False;
//  end else
//  begin
//    RadioGroup2.Controls[0].Enabled:=True;
//    RadioGroup2.Controls[2].Enabled:=True;
//  end;

  if RadioGroup1.ItemIndex = 0 then
  begin
  gbkolo.Visible := True;
  gbspektrum.Visible := False;
  ClientHeight:=353;
  end;

  if RadioGroup1.ItemIndex = 1 then
  begin
  gbkolo.Visible := False;
  gbspektrum.Visible := False;
  ClientHeight:=221;
  end;

  if RadioGroup1.ItemIndex = 2 then
  begin
  gbspektrum.Visible := True;
  gbkolo.Visible := False;
  ClientHeight:=353;
  end;

end;

procedure TForm5.RadioGroup2Click(Sender: TObject);
begin
 // if (RadioGroup2.ItemIndex = 2) or (RadioGroup2.ItemIndex = 0) then
 //   RadioGroup1.Controls[2].Enabled:=False
 // else
 //   RadioGroup1.Controls[2].Enabled:=True;

  CircleScope.Mode := RadioGroup2.ItemIndex;
  OcilloScope.Mode := RadioGroup2.ItemIndex;
  Spectrum.Mode := RadioGroup2.ItemIndex;
end;

procedure TForm5.SpinLineFallClick(Sender: TObject; Button: TUDBtnType);
begin
  Spectrum.LineFallOff := SpinLineFall.Position;
end;

procedure TForm5.SpinPeakFallClick(Sender: TObject; Button: TUDBtnType);
begin
  Spectrum.PeakFallOff := SpinPeakFall.Position;
end;

procedure TForm5.TrackOffChange(Sender: TObject);
begin
  CircleScope.Offset := TrackOff.Position;
  OcilloScope.Offset := TrackOff.Position;
  Spectrum.Height := TrackOff.Position;
end;

procedure TForm5.TrackRadChange(Sender: TObject);
begin
  CircleScope.Radius := TrackRad.Position;
  lbsrednica.Caption := IntToStr(TrackRad.Position);
end;

end.

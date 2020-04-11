unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,NcddMobile,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, Winapi.Windows,
  FMXTee.Engine, FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.EditBox,
  FMX.SpinBox;

type
  TFrmPrincipal = class(TForm)
    Layout_Esquerdo: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    Rct0: TRectangle;
    Label1: TLabel;
    Rct1: TRectangle;
    Label2: TLabel;
    Rct2: TRectangle;
    Label3: TLabel;
    Rct3: TRectangle;
    Label5: TLabel;
    Rct4: TRectangle;
    Label14: TLabel;
    Rct5: TRectangle;
    Label12: TLabel;
    Rct6: TRectangle;
    Label11: TLabel;
    Rct7: TRectangle;
    Label10: TLabel;
    Rct8: TRectangle;
    Label9: TLabel;
    Rct9: TRectangle;
    Label8: TLabel;
    Rct10: TRectangle;
    Label19: TLabel;
    Rct11: TRectangle;
    Label20: TLabel;
    Rct12: TRectangle;
    Label18: TLabel;
    Rct13: TRectangle;
    Label17: TLabel;
    Rct14: TRectangle;
    Label16: TLabel;
    Rct15: TRectangle;
    Label21: TLabel;
    Rct16: TRectangle;
    Label13: TLabel;
    Rct17: TRectangle;
    Label15: TLabel;
    Rct18: TRectangle;
    Label6: TLabel;
    Rct19: TRectangle;
    Label4: TLabel;
    Rct20: TRectangle;
    Label36: TLabel;
    Rct21: TRectangle;
    Label35: TLabel;
    Rct22: TRectangle;
    Label34: TLabel;
    Rct23: TRectangle;
    Label33: TLabel;
    Rct24: TRectangle;
    Label32: TLabel;
    Rct25: TRectangle;
    Label31: TLabel;
    Rct26: TRectangle;
    Label30: TLabel;
    Rct27: TRectangle;
    Label29: TLabel;
    Rct28: TRectangle;
    Label27: TLabel;
    Rct29: TRectangle;
    Label26: TLabel;
    Rct30: TRectangle;
    Label37: TLabel;
    Rct31: TRectangle;
    Label28: TLabel;
    Rct32: TRectangle;
    Label25: TLabel;
    Rct33: TRectangle;
    Label24: TLabel;
    Rct34: TRectangle;
    Label23: TLabel;
    Rct35: TRectangle;
    Label22: TLabel;
    Rct36: TRectangle;
    Label7: TLabel;
    Layout_Centro: TLayout;
    Layout_Top: TLayout;
    Edit1: TEdit;
    BtnConfirma: TCornerButton;
    CornerButton2: TCornerButton;
    Barra0: TRectangle;
    Barra1: TRectangle;
    Barra2: TRectangle;
    Barra3: TRectangle;
    Barra4: TRectangle;
    Barra5: TRectangle;
    Barra6: TRectangle;
    Barra7: TRectangle;
    Barra8: TRectangle;
    Barra9: TRectangle;
    Barra10: TRectangle;
    Barra11: TRectangle;
    Barra12: TRectangle;
    Barra13: TRectangle;
    Barra14: TRectangle;
    Barra15: TRectangle;
    Barra16: TRectangle;
    Barra17: TRectangle;
    Barra18: TRectangle;
    Barra19: TRectangle;
    Barra20: TRectangle;
    Barra21: TRectangle;
    Barra22: TRectangle;
    Barra23: TRectangle;
    Barra24: TRectangle;
    Barra25: TRectangle;
    Barra26: TRectangle;
    Barra27: TRectangle;
    Barra28: TRectangle;
    Barra29: TRectangle;
    Barra30: TRectangle;
    Barra31: TRectangle;
    Barra32: TRectangle;
    Barra33: TRectangle;
    Barra34: TRectangle;
    Barra35: TRectangle;
    Barra36: TRectangle;
    ChartDuzia: TChart;
    Series1: TBarSeries;
    GridDireito: TGridPanelLayout;
    ChartColunas: TChart;
    BarSeries1: TBarSeries;
    ChartRua: TChart;
    BarSeries2: TBarSeries;
    ChartMetade: TChart;
    BarSeries3: TBarSeries;
    SpinBox1: TSpinBox;
    procedure CornerButton2Click(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CalculaHistograma(valor : Integer);
    procedure PlotaBarra;
    procedure PlotaDuzia;
    procedure PlotaColunas;
    procedure PlotaMetade;
    procedure PlotaRuas;
    procedure Zerar;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  histograma: array[0..36] of Integer;
  duzia1, duzia2, duzia3 : Integer;
  coluna1, coluna2, coluna3 : Integer;
  metade1, metade2 : Integer;
  r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12 : Integer;

implementation

{$R *.fmx}
const
    max_bar = 30;

procedure TFrmPrincipal.CalculaHistograma(valor: Integer);
begin
    if (valor > 36) then
    begin
        ShowMessage('Number must be less than 36');
        Abort;
    end;

    if (valor < 0) then
    begin
        ShowMessage('Number must be positive');
        Abort;
    end;
    
    
    histograma[valor] := histograma[valor] + max_bar;
end;

procedure TFrmPrincipal.BtnConfirmaClick(Sender: TObject);
begin
    if Edit1.Text = '' then
    begin
        ShowMessage('Only number');
        Abort;
    end;

    CalculaHistograma(StrToInt(Edit1.Text));
    PlotaBarra;
    PlotaDuzia;
    PlotaColunas;
    PlotaMetade;
    PlotaRuas;
end;

procedure TFrmPrincipal.CornerButton2Click(Sender: TObject);
var
    I : Integer;
begin
    Edit1.Text := EmptyStr;
    for I := 0 to 36 do
    begin
        histograma[I] := 0;
    end;

    Barra0.Width :=    1;
    Barra1.Width :=    1;
    Barra2.Width :=    1;
    Barra3.Width :=    1;
    Barra4.Width :=    1;
    Barra5.Width :=    1;
    Barra6.Width :=    1;
    Barra7.Width :=    1;
    Barra8.Width :=    1;
    Barra9.Width :=    1;
    Barra10.Width :=   1;
    Barra11.Width :=   1;
    Barra12.Width :=   1;
    Barra13.Width :=   1;
    Barra14.Width :=   1;
    Barra15.Width :=   1;
    Barra16.Width :=   1;
    Barra17.Width :=   1;
    Barra18.Width :=   1;
    Barra19.Width :=   1;
    Barra20.Width :=   1;
    Barra21.Width :=   1;
    Barra22.Width :=   1;
    Barra23.Width :=   1;
    Barra24.Width :=   1;
    Barra25.Width :=   1;
    Barra26.Width :=   1;
    Barra27.Width :=   1;
    Barra28.Width :=   1;
    Barra29.Width :=   1;
    Barra30.Width :=   1;
    Barra31.Width :=   1;
    Barra32.Width :=   1;
    Barra33.Width :=   1;
    Barra34.Width :=   1;
    Barra35.Width :=   1;
    Barra36.Width :=   1;

    ChartDuzia.Series[0].Clear;
    ChartColunas.Series[0].Clear;
    ChartMetade.Series[0].Clear;
    ChartRua.Series[0].Clear;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
    Zerar;
end;

procedure TFrmPrincipal.PlotaMetade;
var
    n : Integer;
begin
     n := StrToInt(Edit1.Text);

     if (n >= 1) and (n <= 18)then
     begin
        metade1 := metade1 + 1;

     end;

     if (n >=19) and (n <= 36) then
     begin
        metade2 := metade2 + 1;
     end;

    ChartMetade.Series[0].Clear;
    ChartMetade.Series[0].Add(metade1);
    ChartMetade.Series[0].Add(metade2);
end;

procedure TFrmPrincipal.PlotaRuas;
var
    n : Integer;
begin
    n := StrToInt(Edit1.Text);

    if (n >= 1) and (n <= 3)  then
    begin
        r1 := r1 + 1;
    end;

    if (n >= 4) and (n <= 6) then
    begin
        r2 := r2 + 1;
    end;

    if (n >= 7) and (n <= 9)  then
    begin
        r3 := r3 + 1;
    end;

    if (n >= 10) and (n <= 12) then
    begin
        r4 := r4 + 1;
    end;

    if (n >= 13) and (n <= 15) then
    begin
        r5 := r5 + 1;
    end;

    if (n >= 16) and (n <= 18) then
    begin
        r6 := r6 + 1;
    end;

    if (n >= 19) and (n <= 21) then
    begin
        r7 := r7 + 1;
    end;

    if (n >= 22) and (n <= 24) then
    begin
        r8 := r8 + 1;
    end;

    if (n >= 25) and (n <= 27) then
    begin
        r9 := r9 + 1;
    end;

    if (n >= 28) and (n <= 30) then
    begin
        r10 := r10 + 1;
    end;

    if (n >= 31) and (n <= 33) then
    begin
        r11 := r11 + 1;
    end;

    if (n >= 34) and (n <= 36)then
    begin
        r12 := r12 + 1;
    end;

    ChartRua.Series[0].Clear;
    ChartRua.Series[0].Add(r1);
    ChartRua.Series[0].Add(r2);
    ChartRua.Series[0].Add(r3);
    ChartRua.Series[0].Add(r4);
    ChartRua.Series[0].Add(r5);
    ChartRua.Series[0].Add(r6);
    ChartRua.Series[0].Add(r7);
    ChartRua.Series[0].Add(r8);
    ChartRua.Series[0].Add(r9);
    ChartRua.Series[0].Add(r10);
    ChartRua.Series[0].Add(r11);
    ChartRua.Series[0].Add(r12);
end;

procedure TFrmPrincipal.PlotaBarra;
begin
    Barra0.Width :=    histograma[0];
    Barra1.Width :=    histograma[1];
    Barra2.Width :=    histograma[2];
    Barra3.Width :=    histograma[3];
    Barra4.Width :=    histograma[4];
    Barra5.Width :=    histograma[5];
    Barra6.Width :=    histograma[6];
    Barra7.Width :=    histograma[7];
    Barra8.Width :=    histograma[8];
    Barra9.Width :=    histograma[9];
    Barra10.Width :=    histograma[10];
    Barra11.Width :=    histograma[11];
    Barra12.Width :=    histograma[12];
    Barra13.Width :=    histograma[13];
    Barra14.Width :=    histograma[14];
    Barra15.Width :=    histograma[15];
    Barra16.Width :=    histograma[16];
    Barra17.Width :=    histograma[17];
    Barra18.Width :=    histograma[18];
    Barra19.Width :=    histograma[19];
    Barra20.Width :=    histograma[20];
    Barra21.Width :=    histograma[21];
    Barra22.Width :=    histograma[22];
    Barra23.Width :=    histograma[23];
    Barra24.Width :=    histograma[24];
    Barra25.Width :=    histograma[25];
    Barra26.Width :=    histograma[26];
    Barra27.Width :=    histograma[27];
    Barra28.Width :=    histograma[28];
    Barra29.Width :=    histograma[29];
    Barra30.Width :=    histograma[30];
    Barra31.Width :=    histograma[31];
    Barra32.Width :=    histograma[32];
    Barra33.Width :=    histograma[33];
    Barra34.Width :=    histograma[34];
    Barra35.Width :=    histograma[35];
    Barra36.Width :=    histograma[36];
end;

procedure TFrmPrincipal.PlotaColunas;
var
    n : Integer;
begin
    n := StrToInt(Edit1.Text);

    if (n=1) or (n=4) or (n=7) or (n=10) or (n=13) or (n=16) or (n=19) or
    (n=22) or (n=25) or (n=28) or (n=31) or (n=34) then
    begin
        coluna1 := coluna1 + 1;
    end;

    if (n=2) or (n=5) or (n=8) or (n=11) or (n=14) or (n=17) or (n=20)
        or (n=23) or (n=26) or (n=29) or (n=32) or (n=35) then
    begin
        coluna2 := coluna2 + 1;
    end;

    if (n=3) or (n=6) or (n=9) or (n=12) or (n=15) or (n=18) or (n=21)
        or (n=24) or (n=27) or (n=30) or (n=33) or (n=36)  then
    begin

        coluna3 := coluna3 + 1;
    end;

    ChartColunas.Series[0].Clear;
    ChartColunas.Series[0].Add(coluna1);
    ChartColunas.Series[0].Add(coluna2);
    ChartColunas.Series[0].Add(coluna3);
end;

procedure TFrmPrincipal.PlotaDuzia;
var
    n : Integer;
begin
    {Vamos tratar o grafico das duzias}
    n := StrToInt(Edit1.Text);

    if (n >= 1) and (n <= 12) then
    begin
        duzia1 := duzia1 + 1;
    end;

    if (n >= 13) and (n <=24) then
    begin
        duzia2 := duzia2 + 1;
    end;

    if (n >= 25) and (n <=36) then
    begin
        duzia3 := duzia3 + 1;
    end;

    ChartDuzia.Series[0].Clear;
    ChartDuzia.Series[0].Add(duzia1);
    ChartDuzia.Series[0].Add(duzia2);
    ChartDuzia.Series[0].Add(duzia3);
end;

procedure TFrmPrincipal.Zerar;
begin
    duzia1 := 0;
    duzia2 := 0;
    duzia3 := 0;
    coluna1 := 0;
    coluna2 := 0;
    coluna3 := 0;
    metade1 := 0;
    metade2 := 0;
    r1 := 0;
    r2 := 0;
    r3 := 0;
    r4 := 0;
    r5 := 0;
    r6 := 0;
    r7 := 0;
    r8 := 0;
    r9 := 0;
    r10 := 0;
    r11 := 0;
    r12 := 0;
end;

end.

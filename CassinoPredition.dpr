program CassinoPredition;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

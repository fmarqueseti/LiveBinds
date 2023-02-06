program LiveBinds;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Principal in 'View.Principal.pas' {ViewPrincipal},
  Modelo.Cliente in 'Modelo.Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.

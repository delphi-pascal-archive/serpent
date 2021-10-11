program Serpent;

uses
  Forms,
  uSerpent in 'uSerpent.pas' {FGame},
  uNom in 'uNom.pas' {FNom};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFGame, FGame);
  Application.CreateForm(TFNom, FNom);
  Application.Run;
end.

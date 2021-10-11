unit uNom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFNom = class(TForm)
    LBL_Nom: TLabel;
    E_Nom: TEdit;
    OK: TButton;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FNom: TFNom;

implementation

{$R *.dfm}

end.

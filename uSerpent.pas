unit uSerpent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math, Registry;

type TDirection = (Gauche,Haut,Droite,Bas);
     TSerpon = Array of TShape;

type
  TFGame = class(TForm)
    Terrin: TPanel;
    Appat: TShape;
    Timer: TTimer;
    LBL_ScoreValue: TLabel;
    LBL_ScoreTitel: TLabel;
    LBL_LevelTitel: TLabel;
    LBL_LevelValue: TLabel;
    GB_Proies: TGroupBox;
    LBL_ProieRouge: TLabel;
    SRed: TShape;
    LBL_PorieBlue: TLabel;
    SBlue: TShape;
    SGreen: TShape;
    LBL_ProieVerte: TLabel;
    GroupBox1: TGroupBox;
    LBL_Nom1: TLabel;
    LBL_Score1: TLabel;
    Panel1: TPanel;
    LBL_Nom2: TLabel;
    LBL_Score2: TLabel;
    Panel2: TPanel;
    LBL_Nom3: TLabel;
    LBL_Score3: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Déclarations privées }
    Procedure CreerMaillon(Color: TColor; T, L: integer);
    Procedure PositionnerAppat();
    Function Collision(Maillon: TShape; i: SmallInt): Boolean;
    Procedure BougerSerpon();
    Procedure UpdateScore();
    procedure CreateScore();
    Procedure ShowScore();
  public
    { Déclarations publiques }
  end;

var
  FGame: TFGame;
  Serpent : TSerpon;
  Direction: TDirection;
  Niveau: integer;
  Score : Integer;

implementation

uses uNom;

{$R *.dfm}

Procedure TFGame.ShowScore();
var
  Reg: TRegistry;
begin
  Reg := Tregistry.Create();
  Reg.RootKey := HKEY_LOCAL_MACHINE;

  Reg.OpenKey('\Software\Serpent\Score1\',True);
  LBL_Nom1.Caption := Reg.ReadString('Nom');
  LBL_Score1.Caption := IntToStr(Reg.ReadInteger('Score'));
  Reg.OpenKey('\Software\Serpent\Score2\',True);
  LBL_Nom2.Caption := Reg.ReadString('Nom');
  LBL_Score2.Caption := IntToStr(Reg.ReadInteger('Score'));
  Reg.OpenKey('\Software\Serpent\Score3\',True);
  LBL_Nom3.Caption := Reg.ReadString('Nom');
  LBL_Score3.Caption := IntToStr(Reg.ReadInteger('Score'));

  Reg.CloseKey();
  Reg.Free();
end;

procedure TFGame.CreateScore();
var
  Reg: TRegistry;
begin
  Reg := Tregistry.Create();
  Reg.RootKey := HKEY_LOCAL_MACHINE;

  if (not Reg.KeyExists('\Software\Serpent\')) then begin
    Reg.OpenKey('\Software\Serpent\Score1\',True);
    Reg.WriteInteger('Score',0);
    Reg.WriteString('Nom','Anonyme');
    Reg.OpenKey('\Software\Serpent\Score2\',True);
    Reg.WriteInteger('Score',0);
    Reg.WriteString('Nom','Anonyme');
    Reg.OpenKey('\Software\Serpent\Score3\',True);
    Reg.WriteInteger('Score',0);
    Reg.WriteString('Nom','Anonyme');
  end;

  Reg.CloseKey();
  Reg.Free();
end;

Procedure TFGame.UpdateScore();
var
  Reg: TRegistry;
  BestScore: Boolean;
begin
  Reg := Tregistry.Create();
  Reg.RootKey := HKEY_LOCAL_MACHINE;

  Reg.OpenKey('\Software\Serpent\Score1\',False);
  BestScore := Score >= Reg.ReadInteger('Score');


  if (not BestScore) then begin
    Reg.OpenKey('\Software\Serpent\Score2\',False);
    BestScore := Score >= Reg.ReadInteger('Score');
  end;

  if (not BestScore) then begin
    Reg.OpenKey('\Software\Serpent\Score3\',False);
    BestScore := Score >= Reg.ReadInteger('Score');
  end;

  if (BestScore)and(Score<>Reg.ReadInteger('Score')) then begin
    FNom.ShowModal();
    Reg.WriteString('Nom',FNom.E_Nom.Text);
    Reg.WriteInteger('Score',Score);
  end;

  Reg.CloseKey();
  Reg.Free();
end;

Function TFGame.Collision(Maillon: TShape; i: SmallInt): Boolean;
begin
  Result := False;
  while (i <= High(serpent))and(not Result) do begin
    Result := (Maillon.Top = serpent[i].Top)and(Maillon.Left = serpent[i].Left);
    inc(i);
  end;
end;

Procedure TFGame.PositionnerAppat();
begin
  Randomize();
  Appat.Tag := 10 * (Random(3) + 1);
  case Appat.Tag of
    10: Appat.Brush.Color := clBlue;
    20: Appat.Brush.Color := clGreen;
    30: Appat.Brush.Color := clRed;
  end;
  Repeat
    Appat.Top := 15 * Random(Terrin.Height div 15);
    Appat.Left := 15 * Random(Terrin.Width div 15);
  Until (not Collision(Appat,0));
end;

Procedure TFGame.CreerMaillon(Color: TColor; T, L: integer);
var
  Len : Integer;
begin
  Len := Length(Serpent);
  SetLength(serpent,Len+1);
  Serpent[Len] := TShape.Create(self);
  with Serpent[Len] do begin
    Top := T; Left := L;
    Shape := stCircle;
    Height := 15; Width := 15;
    Brush.Color := Color;
    Parent := Terrin;
  end;
end;

procedure TFGame.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Test: Boolean;
begin
  //MessageDlg(IntToStr(Key),mtInformation,[mbOK],0);
  case Key of
    27 : begin
           Timer.Enabled := False;
           Test := MessageDlg('Voulez vous vraiment quittez le jeux ?',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes;
           if (Test) then begin
             UpdateScore();
             Application.Terminate()
           end else if (Timer.Tag = 0) then Timer.Enabled := True;
         end;
    37 : if (Direction <> Droite) then Direction := Gauche;
    38 : if (Direction <> Bas)    then Direction := Haut;
    39 : if (Direction <> Gauche) then Direction := Droite;
    40 : if (Direction <> Haut)   then Direction := Bas;
  end;
end;

procedure TFGame.FormShow(Sender: TObject);
begin
  Direction := Droite;
  Niveau := 1;  Score := 0;
  CreerMaillon(clBlack, 0, 0);
  PositionnerAppat();
  Timer.Enabled := True;
  CreateScore();
  ShowScore()
end;

Procedure TFGame.BougerSerpon();
var
  i : SmallInt;
begin
  for i := High(serpent) downto Low(serpent) + 1 do begin
    Serpent[i].Top  := Serpent[i-1].Top;
    Serpent[i].Left := Serpent[i-1].Left;
  end;
  case Direction of
    Gauche : Serpent[0].Left := Serpent[0].Left - 15;
    Haut   : serpent[0].Top  := serpent[0].Top  - 15;
    Droite : serpent[0].Left := serpent[0].Left + 15;
    Bas    : serpent[0].Top  := serpent[0].Top  + 15;
  end;
  if (Serpent[0].Left < 0) then Serpent[0].Left := Terrin.Width - 20;
  if (Serpent[0].Left >= Terrin.Width - 5) then Serpent[0].Left := 0;
  if (Serpent[0].Top >= Terrin.Height - 5) then Serpent[0].Top := 0;
  if (Serpent[0].Top < 0) then Serpent[0].Top := Terrin.Height - 20;
end;

procedure TFGame.TimerTimer(Sender: TObject);
begin
  BougerSerpon();

  if Collision(Serpent[0],1) then begin
    Timer.Enabled := False;
    Timer.Tag := 1;
    Terrin.Caption := 'GAME OVER';
    UpdateScore();
    ShowScore();
  end;
  if (Serpent[0].Left = appat.Left)and(Serpent[0].top = appat.top) then begin
    CreerMaillon(clGray,-15,-15);
    Score := Score + Appat.Tag * Niveau;
    Timer.Interval := Timer.Interval - 10;
    PositionnerAppat();
    if (Timer.Interval mod 100 = 0) then Niveau := Niveau + 1;
  end;
  if Timer.Interval <= 100 then Timer.Interval := 500;
  LBL_ScoreValue.Caption := IntToStr(Score);
  LBL_LevelValue.Caption := IntToStr(Niveau);
end;

end.

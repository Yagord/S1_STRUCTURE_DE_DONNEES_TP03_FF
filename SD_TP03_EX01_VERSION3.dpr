program SD_TP03_EX01_VERSION3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Type
  tabOfReal = array of Real;


Procedure allouer (tab : tabOfReal);

Var
  nb : Integer;
  i : Integer;

begin

  writeln('Saisir la taille du tableau de réels :');
  readln(nb);

  for i := 0 to nb - 1 do
  begin
    setlength(tab, i + 1);
  end;

end;



Procedure allouerEtInitialiser (var tab : tabOfReal);

Var
  nb : Integer;
  i : Integer;

begin

  writeln('Saisir la taille du tableau de réels :');
  readln(nb);

  for i := 0 to nb - 1 do
  begin
    setlength(tab, i + 1);
    tab[i] := 0;
  end;

end;



Procedure afficher (tab : tabOfReal);

Var
  i : Integer;

begin

  for i := low(tab) to high(tab) do
  begin
    writeln(tab[i]);
  end;

end;



Function estContenu (tab : tabOfReal ; reel : Real) : Boolean;

Var
  quit : Boolean;
  cptReel : Integer;
  res : Boolean;

begin

  quit := False;
  cptReel := 0;
  res := False;

  while quit = False do

  begin

    if cptReel > length(tab) then
    begin
      quit := True;
      res := False;
    end

    else
    begin
      if tab[cptReel] = reel then
      begin
        quit := True;
        res := True;
      end

      else
      begin
        cptReel := cptReel + 1;
      end;

    end;

  end;

  Result := res;

end;



Function estContenuPerso (tab : tabOfReal ; reel : Real) : Real;

Var
  quit : Boolean;
  cptReel : Integer;
  res : Real;

begin

  quit := False;
  cptReel := 0;
  res := 0;

  while quit = False do

  begin

    if cptReel > length(tab) then
    begin
      quit := True;
      res := -1;
    end

    else
    begin
      if tab[cptReel] = reel then
      begin
        quit := True;
        res := cptReel;
      end

      else
      begin
        cptReel := cptReel + 1;
      end;

    end;

  end;

  Result := res;

end;






Var
  tab : tabOfReal;
  reel : Real;


begin

  alloueretInitialiser(tab);

  writeln('Affichage :');

  tab[0] := 1;

  afficher(tab);

  reel := 1;

  writeln('Le reel ', reel, ' est contenu :');

  if estContenu(tab, reel) = True then
  begin
    writeln('True');
  end

  else
  begin
    writeln('False');
  end;

  writeln('L''indice de ce reel est :');

  writeln(estContenuPerso(tab, reel));

  readln;

end.

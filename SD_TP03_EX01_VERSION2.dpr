program SD_TP03_EX01_VERSION2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Type
  tab_1to10 = array [0..9] of Integer;

Function estContenuPerso (tab : tab_1to10 ; entier : Integer) : Integer;

Var
  quit : Boolean;
  cptEntier : Integer;
  res : Integer;

begin

  quit := False;
  cptEntier := 0;
  res := -1;

  while quit = False do

  begin

    if cptEntier > 9 then
    begin
      quit := True;
      res := -1;
    end

    else
    begin
      if tab[cptEntier] = entier then
      begin
        quit := True;
        res := cptEntier;
      end

      else
      begin
        cptEntier := cptEntier + 1;
      end;

    end;

  end;

  Result := res;

end;

Var
  tab : tab_1to10 = (1,4,5,7,9,56,85,560,581,1);
  entier : Integer;

begin

  entier := 85;

  writeln(estContenuPerso(tab, entier));

  readln;

end.

program SD_TP03_EX01;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Type
  tab_1to10 = array [0..9] of Integer;

Function estContenu (tab : tab_1to10 ; entier : Integer) : Boolean;

Var
  quit : Boolean;
  cptEntier : Integer;
  res : Boolean;

begin

  quit := False;
  cptEntier := 0;
  res := False;

  while quit = False do

  begin

    if cptEntier > 9 then
    begin
      quit := True;
      res := False;
    end

    else
    begin
      if tab[cptEntier] = entier then
      begin
        quit := True;
        res := True;
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

  if estContenu(tab, entier) = True then
  begin
    writeln('True');
  end

  else
  begin
    writeln('False');
  end;

  readln;

end.

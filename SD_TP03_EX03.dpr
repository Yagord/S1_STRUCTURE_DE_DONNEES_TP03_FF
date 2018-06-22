program SD_TP03_EX03;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;


Procedure decaler (chIn : String ; var chOut : String ; cle : Char ; sens : Integer);

Var
  cptCaractere : Integer;
  caractereDecale : Char;

begin

  chOut := '';

  for cptCaractere := 1 to length(chIn) do
  begin

    if chIn[cptCaractere] <> ' ' then
    begin

      caractereDecale := chr(ord(chIn[cptCaractere]) + ((ord(cle) - (ord('A') - 1)) * sens));

      if ord(caractereDecale) < ord('A') then
      begin
        caractereDecale := chr(ord(caractereDecale) + 26)
      end

      else if ord(caractereDecale) > ord('Z') then
      begin
        caractereDecale := chr(ord(caractereDecale) - 26)
      end;

      chOut := chOut + caractereDecale;

    end

    else
    begin
      chOut := chOut + ' ';
    end;

  end;

end;


Function carLePlusPresent (chaine : String) : Char;

Var
  cptCaractere : Integer;
  i : Integer;
  cptAlphabet : Integer;
  tab : array [1..26] of Integer;
  caractere : Char;
  max : Integer;


begin

  max := 1;

  for i := 1 to 26 do
  begin
    tab[i] := 0;
  end;

  for cptCaractere := 1 to length(chaine) do
  begin

    if chaine[cptCaractere] <> ' ' then
    begin
      tab[ord(chaine[cptCaractere])-64] := tab[ord(chaine[cptCaractere])-64] + 1;
    end;

  end;

  for cptAlphabet := 1 to 26 do
  begin
    if tab[max] < tab[cptAlphabet] then
    begin
      max := cptAlphabet;
    end;
    //writeln(tab[cptAlphabet]);
  end;

  writeln(max);
  caractere := chr(max + 64);

  Result := caractere;

end;



Procedure decoder (chIn : String ; var chOut : String);

Var
  caractere : Char;
  cle : Char;
  decal : Integer;

begin

  caractere := carlePlusPresent(chIn);
  writeln(caractere);
  decal := ord(caractere) - ord('E');

  if decal < 0 then
  begin
    decal := decal + 26;
  end;

  cle := chr(ord('A') + decal - 1);

  decaler(chIn, chOut, cle, -1);

end;




Var
  chIn : String;
  chOut : String;
  chOutDecode : String;

begin


  chIn := 'ELLEDDDDDDDFFFFFFFFEEEEEEEEEEEEEEEEEEEEEEEE EST LA COMMENT CA MARCHE';
  chOut := '';
  chOutDecode := '';

  decaler(chIn,chOut,'A',1);

  writeln(chOut);

  writeln(carLePlusPresent(chIn));

  decoder(chOut, chOutDecode);

  writeln(chOutDecode);

  readln;

end.

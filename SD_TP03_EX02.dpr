program SD_TP03_EX02;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Type
  image = array [0..9, 0..9] of Integer;
  histogramme = array [0..255] of Integer;

Function faireHistogramme (img : image) : histogramme;

Var
  h : histogramme;
  i : Integer;
  j : Integer;

begin

  for i := 0 to 255 do
  begin
    h[i] := 0;
  end;

  for i := 0 to 9 do
  begin

    for j := 0 to 9 do
    begin
      h[img[i,j]] := h[img[i,j]] + 1;
    end;

  end;

  Result := h;

end;



Function entropie (img : image) : Real;

Var
   i : Integer;
   entropie : Real;
   h : histogramme;


begin

  entropie := 0;
  h := faireHistogramme(img);

  for i := low(h) to high(h) do
  begin

    if h[i] > 0 then
    begin
      entropie := entropie + (h[i]/(10 * 10)) + ln((h[i]/(10 * 10)));
    end;

  end;

  Result := entropie;

end;



Var
  img : image =
  ((0, 255, 255, 255, 255, 255, 255, 255, 255, 255),
   (0, 255, 255, 255, 255, 255, 255, 255, 255, 255),
   (0, 255, 255, 255, 255, 255, 255, 255, 255, 255),
   (0, 255, 255, 255, 255, 255, 255, 255, 255, 255),
   (0, 255, 255, 255, 255, 255, 255, 255, 255, 255),
   (0, 255, 255, 255, 255, 255, 255, 255, 255, 255),
   (0, 255, 255, 255, 255, 255, 255, 255, 255, 255),
   (0, 255, 255, 255, 255, 255, 255, 255, 255, 255),
   (0, 255, 255, 255, 255, 255, 255, 255, 255, 255),
   (0, 255, 255, 255, 255, 255, 255, 255, 255, 255));

  h : histogramme;

  i : Integer;



begin


  h :=  faireHistogramme(img);

  writeln('Histogramme de l''image (10x10 pixels) :');
  for i := low(h) to high(h) do
  begin
    writeln(h[i]);
  end;

  writeln('Entropie : ', entropie(img) : 3 : 2);

  readln;


end.

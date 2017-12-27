program project1;
type
  Pstudent = ^student;
  student = record
    imie : string[25];
    nazwisko: string[25];
    kierunek_studiow : string[40];
    rok_studiow: byte;
    nastepny : Pstudent;
  end;
//pierwszy sposob sortowania
procedure dodaj_sortujac(var poczatek : Pstudent);
var nowy, pom : Pstudent;
begin
  new(nowy);
  writeln('Podaj imie: ');
  readln(nowy^.imie);
  writeln('Podaj nazwisko: ');
  readln(nowy^.nazwisko);
  writeln('Podaj kierunek studiow: ');
  readln(nowy^.kierunek_studiow);
  writeln('Podaj rok studiow: ');
  readln(nowy^.rok_studiow);
  nowy^.nastepny:=NIL;
  if poczatek=NIL then
     poczatek:=nowy
  else begin
      pom:=poczatek;
      if (nowy^.nazwisko<pom^.nazwisko) then
        begin
        poczatek:=nowy;
        nowy^.nastepny:=pom;
        end else begin
        while (nowy^.nazwisko<=pom^.nazwisko) and (pom^.nastepny <> NIL) do
              pom:=pom^.nastepny;
        nowy^.nastepny:=pom^.nastepny;
        pom^.nastepny:=nowy;
        end;
  end;
end;

//drugi sposob sortowania
procedure dodaj_sortujac2(var poczatek : Pstudent);
var nowy, poprzedni, pom : Pstudent;
begin
  new(nowy);
  writeln('Podaj imie: ');
  readln(nowy^.imie);
  writeln('Podaj nazwisko: ');
  readln(nowy^.nazwisko);
  writeln('Podaj kierunek studiow: ');
  readln(nowy^.kierunek_studiow);
  writeln('Podaj rok studiow: ');
  readln(nowy^.rok_studiow);
  nowy^.nastepny:=NIL;
  if poczatek=NIL then
     poczatek:=nowy
  else begin
    poprzedni:=poczatek;
    while (nowy^.nazwisko>=poprzedni^.nazwisko) and (poprzedni^.nastepny <> NIL) do
          poprzedni:=poprzedni^.nastepny;
    pom:=poprzedni^.nastepny;
    poprzedni^.nastepny:=nowy;
    nowy^.nastepny:=pom;
  end;
end;

//wyswietlanie
procedure wyswietl(var poczatek : Pstudent);
begin
  if poczatek = NIL then
     write('LISTA PUSTA')
  else begin
    while (poczatek <> NIL) do
    begin
         writeln(poczatek^.imie, ' ', poczatek^.nazwisko,' ',poczatek^.kierunek_studiow,' ',poczatek^.rok_studiow);
         poczatek:= poczatek^.nastepny;
    end;
  end;
  readln;
end;

//program glowny
var poczatek : Pstudent;
begin
poczatek:=NIL;
dodaj_sortujac(poczatek);
dodaj_sortujac(poczatek);
wyswietl(poczatek);
end.


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
var obecny, pom : Pstudent;
begin
  new(obecny);
  writeln('Podaj imie: ');
  readln(obecny^.imie);
  writeln('Podaj nazwisko: ');
  readln(obecny^.nazwisko);
  writeln('Podaj kierunek studiow: ');
  readln(obecny^.kierunek_studiow);
  writeln('Podaj rok studiow: ');
  readln(obecny^.rok_studiow);
  obecny^.nastepny:=NIL;
  if poczatek=NIL then
     poczatek:=obecny
  else begin
      pom:=poczatek;
      if (obecny^.nazwisko<pom^.nazwisko) then
        begin
        poczatek:=obecny;
        obecny^.nastepny:=pom;
        end else begin
        while (pom^.nastepny <> NIL) and (obecny^.nazwisko<=pom^.nazwisko) do
              pom:=pom^.nastepny;
        obecny^.nastepny:=pom^.nastepny;
        pom^.nastepny:=obecny;
        end;
  end;
end;
}
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

procedure wyswietl(var head : Pstudent);
begin
  if head = NIL then
     write('LISTA PUSTA')
  else begin
    while (head <> NIL) do
    begin
         writeln(head^.imie, ' ', head^.nazwisko,' ',head^.kierunek_studiow,' ',head^.rok_studiow);
         head := head^.nastepny;
    end;
  end;
  readln;
end;

var poczatek : Pstudent;
begin
poczatek:=NIL;
dodaj_sortujac(poczatek);
dodaj_sortujac(poczatek);
wyswietl(poczatek);
end.


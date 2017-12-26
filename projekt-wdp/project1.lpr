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
  else
  begin
      pom:=poczatek;
      if (obecny^.nazwisko<pom^.nazwisko) then
        begin
        poczatek:=obecny;
        obecny^.nastepny:=pom^.nastepny;
        end else begin
        while (pom^.nastepny <> NIL) and (obecny^.nazwisko<=pom^.nazwisko) do
              pom:=pom^.nastepny;
        obecny^.nastepny:=pom^.nastepny;
        pom^.nastepny:=obecny;
        end;
      end;
end;

procedure wyswietl(head : Pstudent);
begin
  if head = nil then
     write('brak elementow')
  else begin
    while head <> nil do
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
dodaj_sortujac(poczatek);
wyswietl(poczatek);
end.


program project1;
uses crt;
type
  Pstudent = ^student;
  student = record
    imie : string[25];
    nazwisko: string[25];
    kierunek_studiow : string[40];
    rok_studiow: byte;
    nastepny : Pstudent;
  end;

//dodaje element sortujac po nazwisku
procedure dodaj_sortujac(var poczatek : Pstudent);
var nowy, pomocniczy : Pstudent;
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
  if (poczatek=NIL) or (nowy^.nazwisko<poczatek^.nazwisko) then //czy dodajemy na poczatek
  begin
     if(poczatek<>NIL) then nowy^.nastepny:=poczatek; //czy cos bylo na poczatku
     poczatek:=nowy;
  end else
  begin
       pomocniczy:=poczatek;
       while (pomocniczy^.nastepny <> NIL) and (pomocniczy^.nastepny^.nazwisko<nowy^.nazwisko)do
            pomocniczy:=pomocniczy^.nastepny;
       nowy^.nastepny:=pomocniczy^.nastepny;
       pomocniczy^.nastepny:=nowy;
  end;
end;

//wyswietlanie
procedure wyswietl(var poczatek : Pstudent);
var pomocniczy : Pstudent;
begin
     clrscr;
     pomocniczy:=poczatek;
     if pomocniczy = NIL then writeln('LISTA PUSTA')
     else begin
       while (pomocniczy<> NIL) do
             begin
                 writeln(pomocniczy^.imie, ' ', pomocniczy^.nazwisko,' ',pomocniczy^.kierunek_studiow,' ',pomocniczy^.rok_studiow);
                 pomocniczy:=pomocniczy^.nastepny;
             end;
     end;
     readln;
end;
//usuwanie calej listy
procedure usun_liste(var poczatek : Pstudent);
var
  pomocniczy : Pstudent;
begin
     if poczatek=NIL then writeln('LISTA PUSTA')
     else begin
       while poczatek<>NIL do begin
          pomocniczy:=poczatek;
          poczatek:=poczatek^.nastepny;
          dispose(pomocniczy);
       end;
     end;
end;

//usuwanie wybranego
procedure usun_wybrany(var poczatek : Pstudent);
var
  pomocniczy, pom2 : Pstudent;
  sz_nazwisko : string[25];
begin
     if poczatek=NIL then writeln('LISTA PUSTA') else
     begin
         writeln('Podaj nazwisko do usuniecia');
         readln(sz_nazwisko);
         if poczatek^.nazwisko=sz_nazwisko then //czy usuwamy pierwszy element
           begin
               pomocniczy:=poczatek;
               poczatek:=poczatek^.nastepny;
               dispose(pomocniczy);
           end else
           begin
               pomocniczy:=poczatek;
               while (pomocniczy^.nastepny<>NIL) do
               begin
                    if pomocniczy^.nastepny^.nazwisko=sz_nazwisko then
                    begin
                         pom2:=pomocniczy^.nastepny^.nastepny;
                         dispose(pomocniczy^.nastepny);
                         pomocniczy^.nastepny:=pom2;
                    end;
                    pomocniczy:=pomocniczy^.nastepny;
               end;
           end;
       end;
     end;

//program glowny
var poczatek : Pstudent;
begin
  poczatek:=NIL;
  dodaj_sortujac(poczatek);
  dodaj_sortujac(poczatek);
  dodaj_sortujac(poczatek);
  dodaj_sortujac(poczatek);
  wyswietl(poczatek);
  usun_wybrany(poczatek);
  wyswietl(poczatek);
  usun_liste(poczatek);
  wyswietl(poczatek);
end.


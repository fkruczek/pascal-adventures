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
  clrscr;
  new(nowy);
  writeln('Podaj imie: ');
  readln(nowy^.imie);
  writeln('Podaj nazwisko: ');
  readln(nowy^.nazwisko);
  writeln('Podaj kierunek studiow: ');
  readln(nowy^.kierunek_studiow);
  writeln('Podaj rok studiow: ');
  readln(nowy^.rok_studiow);
  nowy^.nastepny:=NIL;   //adres nastepnego domyslnie na NIL
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

//wyswietlanie calej listy
procedure wyswietl(var poczatek : Pstudent);
var pomocniczy : Pstudent;
begin
     clrscr;
     pomocniczy:=poczatek;
     if pomocniczy = NIL then writeln('Brak elementow na liscie. Nacisnij dowolny klawisz.')
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
     clrscr;
     if poczatek=NIL then writeln('Brak elementow na liscie. Nacisnij dowolny klawisz.')
     else begin
       while poczatek<>NIL do begin
          pomocniczy:=poczatek;
          poczatek:=poczatek^.nastepny;
          dispose(pomocniczy);
       end;
       writeln('Lista usunieta. Nacisnij dowolny klawisz.')
     end;
     readln;
end;

//usuwanie wybranego
procedure usun_wybrany(var poczatek : Pstudent);
var
  pomocniczy, pom2 : Pstudent;
  sz_nazwisko : string[25];
  czy_usunieto : boolean;
begin
     clrscr;
     czy_usunieto:=false;
     if poczatek=NIL then writeln('Brak elementow na liscie.') else
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
               while (pomocniczy <> NIL) and (pomocniczy^.nastepny<>NIL) do
               begin
                    if pomocniczy^.nastepny^.nazwisko=sz_nazwisko then //czy nastepny to szukany?
                    begin //usun nastepny i przejdz dalej
                         pom2:=pomocniczy^.nastepny;
                         pomocniczy^.nastepny:=pomocniczy^.nastepny^.nastepny;
                         dispose(pom2);
                         czy_usunieto:=true;
                    end else pomocniczy:=pomocniczy^.nastepny; //tylko przejdz dalej
               end;
           end;
         if czy_usunieto then writeln('Usunieto: ', sz_nazwisko);
     end;
     writeln('Aby przejsc dalej nacisnij dowolny klawisz');
     readln;
end;

//program glowny
var poczatek : Pstudent;
    wybor : char;
begin
  poczatek:=NIL;
  repeat
      clrscr;
      writeln('Menu:');
      writeln('1. Dodaj element');
      writeln('2. Usun element');
      writeln('3. Wyswietl liste');
      writeln('4. Usun liste');
      writeln('5. Wyjscie');
      write('WYBOR: ');
      wybor:=ReadKey;
    case wybor of
         '1' : dodaj_sortujac(poczatek);
         '2' : usun_wybrany(poczatek);
         '3' : wyswietl(poczatek);
         '4' : usun_liste(poczatek);
    end;
    until wybor='5';
end.


program dodawanie_pisemne41;
const MaxN=4;
type TLiczba=array [ 0..MaxN-1 ] of 0..9;
     TLiczbaWynik= array [ 0..MaxN ] of 0..9;

function CzytajA:TLiczba;
var liczby: string[4];
    i,l: integer;
    taba: TLiczba;
begin
     writeln('podaj liczbe a');
     readln(liczby);
     for i:=0 to (MaxN-1) do
     begin
          l := Integer(liczby[i+1])-48;
          taba[i]:=l;
     end;
     result:= taba;
end;

function CzytajB:TLiczba;
var liczby: string[4];
    i,l: integer;
    tabb: TLiczba;
begin
     writeln('podaj liczbe b');
     readln(liczby);
     for i:=0 to (MaxN-1) do
     begin
          l := Integer(liczby[i+1])-48;
          tabb[i]:=l;
     end;
     result:= tabb;
end;

function dod(a, b :TLiczba) :TLiczbaWynik;
var c:TLiczbaWynik;
    i,d:integer;
begin
    d:=0;
    for i:=(MaxN-1) downto 0 do
    begin
         if (d+a[i]+b[i])<10 then
         begin
              c[i+1]:=d+a[i]+b[i];
              d:=0;
         end else
         begin
              c[i+1]:=(d+a[i]+b[i])-10;
              d:=1;
         end;
    end;
    c[0]:=d;

    result:= c;
end;

procedure Pisz(c :TLiczbaWynik);
var i:integer;
begin
    writeln('Wynik: ');
    for i:=0 to MaxN do
    begin
         write(c[i]);
    end;
end;
begin
     Pisz(dod(CzytajA, CzytajB));
     readln();
end.


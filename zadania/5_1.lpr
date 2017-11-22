program zamianaznakow;
var plik1:Text;
    linia:string;
    i:integer;
function stringToUpper(linia:string):string;
var i:integer;
begin
  for i:=1 to length(linia) do
  begin
    linia[i]:=upcase(linia[i]);
  end;
  result:=linia;
end;
begin
Assign(plik1, 'plik1.txt');
Reset(plik1);
i:=1;
while not eof(plik1) do
begin
  readln(plik1, linia);
  writeln(i,': ',stringToUpper(linia));
  i:=i+1;
end;
Close(plik1);
readln();
end.


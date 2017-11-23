program project1;
function sprawdzKod():boolean;
var plik:textfile;
    stanNawiasow:integer;
    linia:string;
    i:integer;
begin
    assign(plik, 'kod.txt');
    Reset(plik);
    stanNawiasow:=0;
    while not EOF(plik) do
    begin
     readln(plik, linia);
     writeln(linia);
     for i:=0 to length(linia) do
     begin
      if(stanNawiasow<0) then Result:=FALSE;
      if(linia[i]='(') then stanNawiasow+=1
      else if(linia[i]=')') then stanNawiasow-=1;
     end;
     if(stanNawiasow=0) then Result:=TRUE
     else Result:=FALSE;
    end;
end;
begin
  if(sprawdzKod)then writeln('OK')
  else writeln('NOT OK');
  readln();
end.


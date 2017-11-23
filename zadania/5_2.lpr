program Project1;
var liczby,wieksze0,mniejsze0:text;
  a,b:double;
  i,j:integer;

begin
  assign(liczby,'liczby.txt');
  assign(wieksze0,'wieksze0.txt');
  assign(mniejsze0,'mniejsze0.txt');
  reset(liczby);
  rewrite(wieksze0);
  rewrite(mniejsze0);
  i:=1; j:=1;
  while not eof(liczby) do
  begin
    while not eoln(liczby) do
    begin
      read(liczby, a);read(liczby, b);
      if(a*b)>0 then
      begin
        writeln(wieksze0,i,': ',a*b:2:5);
        i:=i+1;
      end else
      begin
        writeln(mniejsze0,j,': ',a*b:2:5);
        j:=j+1;
      end;
    end;
      readln(liczby);
  end;
  close(liczby);
  close(wieksze0);
  close(mniejsze0);
  writeln('ok');
  readln;
end.

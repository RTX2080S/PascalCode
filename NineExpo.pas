const
 maxn=1000;
var
 tt,n,i,l:integer;
 d:array[1..maxn]of 0..20;
procedure times(a:integer);
var
 i,tmp:integer;
begin
 l:=0;
 for i:=1 to tt do begin
  tmp:=d[i];
  d[i]:=(d[i]*a) mod 10+l;
  l:=tmp*a div 10;
  if d[i]>=10 then begin
   tmp:=d[i];
   d[i]:=d[i] mod 10;
   l:=tmp div 10+l;
  end;
 end;
 if l>0 then begin
  inc(tt);
  d[tt]:=l;
 end;
end;
begin
 readln(n);
 tt:=1;
 d[1]:=1;
 for i:=1 to n do times(9);
 for i:=tt downto 1 do write(d[i]);
 writeln;
end.

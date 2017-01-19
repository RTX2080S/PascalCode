var
 tt,a,b:longint;
 f:array[1..1000000]of boolean;
procedure doing(l,r:longint);
var
 i,j:longint;
begin
 for i:=2 to round(sqrt(r)) do
  if not f[i] then
   for j:=2 to r div i do f[i*j]:=true;
  f[1]:=true;
  for i:=l to r do
   if not f[i] then inc(tt);
end;
begin
 readln(a,b);
 fillchar(f,sizeof(f),false);
 doing(a,b);
 writeln(tt);
end.

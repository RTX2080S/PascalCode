const
 maxn=100;
var
 r,k,i,j,n:integer;
 x,y:array[1..maxn]of integer;
 f:array[1..maxn]of boolean;
 map:array[1..maxn,1..maxn]of real;
 min,d:real;
begin
 readln(n);
 for i:=1 to n do readln(x[i],y[i]);
 for i:=1 to n do
  for j:=1 to n do
   map[i,j]:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]));
 fillchar(f,n,false);
 f[1]:=true;
 for k:=1 to n-1 do begin
  min:=maxint;
  for i:=1 to n do
   if f[i] then
    for j:=1 to n do
     if not(f[j])and(min>map[i,j])and(map[i,j]>0) then begin
      min:=map[i,j];
      r:=j;
     end;
  d:=d+min;
  f[r]:=true;
 end;
 writeln(d:0:2);
end.

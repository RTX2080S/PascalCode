const
 maxn=100;
var
 dist:array[1..maxn]of integer;
 f:array[1..maxn]of boolean;
 map:array[1..maxn,1..maxn]of longint;
 m,s,t,n,r,i,j,k:integer;
begin
 readln(n,s);
 for i:=1 to n do
  for j:=1 to n do
   read(map[i,j]);
 fillchar(f,sizeof(f),false);
 for i:=1 to n do dist[i]:=maxint;
 dist[s]:=0;
 for i:=1 to n-1 do begin
  m:=maxint;
  for j:=1 to n do
   if not(f[j])and(dist[j]<m) then begin
    m:=dist[j];
    r:=j;
   end;
  f[r]:=true;
  for j:=1 to n do
   if not(f[j])and(map[r,j]>0)and(map[r,j]+dist[r]<dist[j]) then
    dist[j]:=map[r,j]+dist[r];
 end;
 for i:=1 to n do write(dist[i],' ');
 writeln;
end.

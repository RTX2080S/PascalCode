var
 m,t,i,j,k:integer;
 f:array[0..1000,0..1000]of integer;
 w,c:array[0..100]of integer;
function max(x,y:integer):integer;
begin
 if x>y then max:=x else max:=y;
end;
begin
 readln(t,m);
 for i:=1 to m do readln(w[i],c[i]);
 for i:=1 to m do
  for j:=1 to t do begin
   if j>=w[i] then
    f[i,j]:=max(f[i-1,j-w[i]]+c[i],f[i-1,j])
   else f[i,j]:=f[i-1,j];
  end;
 writeln(f[m,t]);
end.

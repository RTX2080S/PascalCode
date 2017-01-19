const
 maxn=100000;
var
 cost,s:real;
 len:array[0..maxn]of real;
 f,x,y:array[0..maxn]of longint;
 i,a,b,n,m,tt:longint;
procedure swap(var x,y:longint);
var
 tmp:longint;
begin
 if x<>y then begin
  tmp:=x;
  x:=y;
  y:=tmp;
 end;
end;
procedure qsort(l,r:longint);
var
 i,j:longint;
 mid,tmp:real;
begin
 i:=l;
 j:=r;
 mid:=len[(i+j)div 2];
 while len[i]<mid do inc(i);
 while mid<len[j] do dec(j);
 if i<=j then begin
  swap(x[i],x[j]);
  swap(y[i],y[j]);
  tmp:=len[i];
  len[i]:=len[j];
  len[j]:=tmp;
  inc(i);
  dec(j);
 end;
 if l<j then qsort(l,j);
 if i<r then qsort(i,r);
end;
function check(t:longint):longint;
begin
 if f[t]=0 then check:=t
 else begin
  f[t]:=check(f[t]);
  check:=f[t];
 end;
end;
begin
 readln(s);
 readln(n);
 while not(eof) do begin
  inc(m);
  readln(x[m],y[m],len[m]);
 end;
 qsort(1,m);
 for i:=1 to m do begin
  a:=check(x[i]);
  b:=check(y[i]);
  if a=b then continue;
  inc(tt);
  f[a]:=b;
  cost:=cost+len[i];
  if tt=n-1 then break;
 end;
 if (tt<n-1)or(cost>s) then writeln('Impossible')
  else begin
   write('Need ');
   write(cost:0:2);
   writeln(' miles of cable');
  end;
end.

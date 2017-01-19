const
 max=10000;
var
 a:array[1..max]of longint;
 s,t,i,HP,n:longint;
procedure swap(var x,y:longint);
var
 t:longint;
begin
 if x<>y then begin
  t:=x; x:=y; y:=t;
 end;
end;
procedure minheap(p,hl:longint);
var
 l,r,lst:longint;
begin
 lst:=p;
 l:=p*2;
 r:=l+1;
 if (l<=hl)and(a[l]<a[lst]) then lst:=l;
 if (r<=hl)and(a[r]<a[lst]) then lst:=r;
 if lst<>p then begin
  swap(a[p],a[lst]);
  minheap(lst,hl);
 end;
end;
procedure buildheap;
var
 i:longint;
begin
 for i:=n div 2 downto 1 do minheap(i,n);
end;
begin
 readln(n);
 for i:=1 to n do read(a[i]);
 if n=1 then begin
  writeln(a[1]);
  exit;
 end;
 buildheap;
 hp:=0;
 for i:=n downto 2 do begin
  s:=a[1];
  swap(a[1],a[n]);
  dec(n);
  minheap(1,n);
  inc(a[1],s);
  inc(hp,a[1]);
  minheap(1,n);
 end;
 writeln(hp);
end.

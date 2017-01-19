const
 maxn=1001;
var
 tt,n,i,l:integer;
 th,d:array[1..maxn]of -20..20;
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
procedure cut;
var
 i,tmp:integer;
begin
 for i:=1 to n do begin
  d[i]:=th[i]-d[i]-l;
  if d[i]<0 then begin
   inc(d[i],10);
   l:=1;
  end;
 end;
 if d[n]=0 then dec(n);
end;
begin
 readln(n);
 tt:=1;
 d[1]:=1;
 for i:=1 to n do times(9);
 inc(n);
 th[n]:=1;
 l:=0;
 cut;
 for i:=n downto 1 do write(d[i]);
 writeln;
end.

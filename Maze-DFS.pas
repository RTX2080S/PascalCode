const
 maxn=20;
 step:array[1..8,1..2]of integer=((-1,-1),(-1,0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1));
var
 ep:boolean;
 bt,t,tmp,i,j,m,n:integer;
 bx,by,sx,sy:array[1..maxn*maxn]of integer;
 map:array[0..maxn+1,0..maxn+1]of boolean;
procedure print;
begin
 if bt>t then begin
  for i:=1 to t do bx[i]:=sx[i];
  for j:=1 to t do by[j]:=sy[j];
  bt:=t;
  ep:=true;
 end;
end;
procedure go(x,y:integer);
var
 i:integer;
begin
 if (x=m)and(y=n) then begin
  print;
  exit;
 end;
 for i:=1 to 8 do
  if map[x+step[i,1],y+step[i,2]] then begin
   inc(t);
   sx[t]:=x+step[i,1];
   sy[t]:=y+step[i,2];
   map[sx[t],sy[t]]:=false;
   go(sx[t],sy[t]);
   map[sx[t],sy[t]]:=true;
   dec(t);
  end;
end;
begin
 readln(m,n);
 fillchar(map,sizeof(map),false);
 for i:=1 to m do
  for j:=1 to n do begin
   read(tmp);
   if tmp<1 then map[i,j]:=true;
  end;
 inc(t);
 sx[1]:=1;
 sy[1]:=1;
 map[1,1]:=false;
 bt:=maxint;
 ep:=false;
 go(1,1);
 if not ep then writeln('error')
 else begin
  for i:=bt downto 1 do write('(',bx[i],',',by[i],')<--');
  writeln;
 end;
end.

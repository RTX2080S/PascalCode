var
 arr:array[1..1000]of integer;
 n,i:integer;
procedure qsort(l,r:integer);
var
 i,j,x,y:integer;
begin
 i:=l;
 j:=r;
 x:=arr[(l+r) div 2];
 repeat
   while arr[i]<x do
    inc(i);
   while x<arr[j] do
    dec(j);
   if (i<=j) then
    begin
      y:=arr[i];
      arr[i]:=arr[j];
      arr[j]:=y;
      inc(i);
      dec(j);
    end;
 until i>j;
 if l<j then
   qsort(l,j);
 if i<r then
   qsort(i,r);
end;
begin
  assign(input,'sort.txt');
  reset(input);
  assign(output,'sorted.txt');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    read(arr[i]);
  qsort(1,n);
  for i:=1 to n do
    write(arr[i], ' ');
  writeln;
  close(input);
  close(output);
end.

program teoria3;

{Realice un módulo que reciba un arreglo y un valor num,
 y de ser possible elimine del arreglo el valor num}

uses crt;
type
	vector=array [1..15] of integer;

procedure Generar (var v:vector; var dl:integer);
var i,r:integer;
begin
	for i:=1 to 15 do begin
		r:=random(11);
		v[i]:=r;
		dl:=dl+1;
	end;
end;

procedure Leer (v:vector);
var i:integer;
begin
	for i:=1 to 15 do
		writeln('Pos ', i,' num ',v[i]);
end;


function posicion (num:integer; v:vector; dl:integer): integer;
var i:integer;
begin
	i:=1;
	while (i<=dl) AND (v[i]<>num) do
		i:=i+1;
	if (i>dl) then i:=-1
	else posicion:=i;
end;

procedure Eliminar (var v:vector; var exito:boolean; var dl:integer);
var i,num,pos:integer;
begin
	writeln ('Ingrese num a eliminar');
	readln(num);
	pos:=posicion(num,v,dl);
	if (pos=-1) then exito:=false
	else begin
		for i:=pos to dl do
			v[i]:=v[i+1];
		exito:=true;
		dl:=dl-1;
	end;
end;


procedure Ordenar (var v:vector; dimL:integer); //No ordena, por que???
var i,j:integer; actual:integer;
begin
	for i:=2 to dimL do begin
		actual:=v[i];
		j:=i-1;
		while (j<0) AND (v[j]>actual) do begin
			v[j+1]:=v[j];
			j:=j+1;
		end;
		v[j+1]:=actual;
	end;
	writeln ('Arreglo ordenado');
end;



var v:vector; e:boolean; dl:integer;
begin
dl:=0;
randomize;
e:=false;
Generar (v,dl);
Ordenar(v,dl);
Leer(v);
Eliminar (v,e,dl);
if (e=true) then
	writeln ('Se elimino el numero')
else
	writeln('El numero no esta en el arreglo');
end.

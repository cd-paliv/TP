program t1;

{Realice un módulo que genere y devuelva un arreglo de enteros.
 La carga del arreglo debe realizarse hasta que se lee el número 0 o se hayan leído 20 números}

uses crt;
const
	fin=20;
type
	vector=array[1..fin] of integer;


procedure Generar (var v:vector; var dl:integer);
var
	r,i:integer;
begin
	i:=1;
	r:=random(50);
	while (r<>0) AND (i<fin) do begin
		v[i]:=r;
		i:=i+1;
		dl:=dl+1;
		r:=random(50);
	end;
end;

procedure Leer (v:vector; dl:integer);
var i:integer;
begin
	for i:=1 to dl+1 do
		writeln('Pos ', i,' num ',v[i]);
end;



var
	v:vector; dl:integer;
begin
	randomize;
	dl:=0;
	Generar (v,dl);
	Leer(v,dl);
end.

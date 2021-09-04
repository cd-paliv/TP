program teoria2;

{Realice un módulo que reciba un arreglo e imprima todo su contenido}

uses crt;
type
	vector=array [1..20] of integer;

procedure Generar (var v:vector);
var r,i:integer;
begin
	for i:=1 to 20 do begin
		r:=random(50)+1;
		v[i]:=r;
	end;
end;

procedure Leer (v:vector);
var i:integer;
begin
	for i:=1 to 20 do
		writeln('Pos ', i,' num ',v[i]);
end;

var
	v:vector;

begin
	randomize;
	Generar(v);
	Leer(v);


end.

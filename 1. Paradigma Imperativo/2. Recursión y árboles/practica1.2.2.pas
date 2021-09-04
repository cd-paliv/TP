program ej5;

{Escribir un programa que: 
 a. Implemente un módulo que genere un vector de 20 números enteros.  
 b. Implemente un módulo recursivo que devuelva el máximo valor del vector.  
 c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en 
el vector. 
}


const
	df=20;
type
	vector=array[1..df] of integer;


procedure Imprimir(v:vector);
var i:integer;
begin
	for i:=1 to df do begin
		writeln ('Posicion ',i,' numero ',v[i]);
	end;
end;   //chequear nros en vector

//PUNTO A.
procedure CargarVector (var v:vector);
var i,n:integer;
begin
	for i:=1 to df do begin
		n:=random(100);
		v[i]:=n;
	end;
end;

//PUNTO B.
function Max (v:vector; i:integer; dl:integer):integer;
var m:integer;
begin
	if (dl>df) then Max:=-1
	else begin
		m:=Max(v,i+1,dl+1);
		if (m<v[i]) then
			m:=v[i];
		Max:=m;
	end;
end;

//PUNTO C.
function Suma (v:vector; i:integer):integer;
begin
	if (i>df) then Suma:=0
	else
		Suma:=Suma(v,i+1) + v[i];
end;

//PP.
var v:vector; ma,su,i,dl:integer;
begin
	randomize;
	i:=1; dl:=0;
	CargarVector(v);
	Imprimir(v);
	ma:=Max(v,i,dl);
	writeln('----------------------------------------');
	writeln('Numero maximo de la lista: ',ma);
	su:=Suma(v,i);
	writeln('----------------------------------------');
	writeln('El total de la suma de todos los elementos del vector es: ',su);
	writeln('----------------------------------------');
end.

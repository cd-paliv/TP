program teoria5;

{Implementar un programa que procese la información de los participantes a un concurso de preguntas y respuestas (como máximo 20).
De cada participante se lee el código de participante y su edad. El ingreso de los participantes finaliza cuando se lee el código -1.

a. Almacenar la información que se lee en un vector. 
b. Mostrar la información almacenada.
c. Ordenar el vector de participantes por edad.
d. Mostrar el vector ordenado.
e. Eliminar del vector ordenado los participantes con edades entre 20 y 22. 
f. Mostrar el vector resultante.
g. Generar una lista ordenada de menor a mayor con los participantes que quedaron el el vector después de realizar el inciso e}

uses crt;
const
	fin=20;
type
	participante=record
		cod:integer;
		edad:integer;
	end;
	vector=array[1..fin] of participante;
	lista=^nodo;
	nodo=record
		dato:participante;
		sig:lista;
	end;

//A.
procedure LeerP (var par:participante);
begin
	par.cod:=random(101)-1;
	if (par.cod<>-1) then begin
		par.edad:=random(45)+15;
	end;
end;

procedure CargarVector (var v:vector; var i:integer);
var p:participante;
begin
	i:=1;
	LeerP (p);
	while (p.cod<>-1)AND (i<fin) do begin
		v[i]:=p;
		LeerP(p);
		i:=i+1;
	end;
end;


//C.
procedure ordenar(var v : vector; dimL :integer);
var i,j : integer; actual : participante;
begin
	for i:= 2 to dimL do begin
		actual := v[i];
		j := i-1;
		while (j >0) and (v[j].edad>actual.edad) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= actual;
	end;
end;


//E.
procedure Eliminar (var v:vector;var dl:integer);
var i,pos,cant:integer;
begin
	i:=1; cant:=0;
	while (v[i].edad<20) AND (i<=dl) do
		i:=i+1;
	pos:=i;
	while (i<=dl) and (v[i].edad<=22) do
		i:=i+1;
	cant:=i-pos;
	for i:=(pos+cant) to dl do
		v[i-cant]:=v[i];
	dl:=dl-cant;
end;


//B,D,F.
procedure Imprimir (v:vector; dimL:integer);
var i:integer;
begin
	for i:=1 to dimL do
		writeln('Participante codigo: ', v[i].cod, ' edad: ', v[i].edad);
end;


//G.
procedure AgregarAtras (var pri,ult:lista; p:participante);
var aux:lista;
begin
	new(aux);
	aux^.dato:=p;
	aux^.sig:=NIL;
	if (pri=NIL) then pri:=aux
	else ult^.sig:=aux;
	ult:=aux;
end;

procedure CargarLista (var l:lista; v:vector; dl:integer);
var ult:lista; i:integer;
begin
	l:=NIL;
	for i:=1 to dl do
		AgregarAtras(l,ult,v[i]);
end;

procedure ImprimirLista (l:lista);
begin
	while (l<>NIL) do begin
		writeln ('Codigo: ', l^.dato.cod, ' Edad: ',l^.dato.edad);
		l:=l^.sig;
	end;
end;


//PROGRAMA PRINCIPAL
var v:vector; dl:integer; l:lista;
begin
	randomize;
	dl:=0;
	CargarVector(v,dl);
	if (dl=0) then writeln ('El arreglo no tiene elementos')
	else begin
		writeln('Vector de participantes luego de completar la lectura de datos');
		Imprimir (v,dl);
		writeln('----------------------------------------');
		Ordenar (v,dl);
		writeln('Vector de participantes luego de ordenarlo por edad');
		Imprimir(v,dl);
		writeln('----------------------------------------');
		Eliminar (v,dl);
		writeln ('Se eliminaron los estudiantes con edades entre 20 y 22');
		Imprimir(v,dl);
		writeln('----------------------------------------');
		writeln ('Generando lista');
		writeln('----------------------------------------');
		CargarLista(l,v,dl);
		writeln('Lista de participantes:');
		ImprimirLista(l);
	end;
end.

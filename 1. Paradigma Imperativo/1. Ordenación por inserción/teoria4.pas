program t4;

{Realice un módulo que genere una lista de enteros de manera aleatoria hasta leer el número 15.
 Se sugiere que la función ramdom genere números entre 0 y 15.
 Los elementos deben quedar almacenados en la lista en el mismo orden en que fueron leídos}

uses crt;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;


procedure AgregarAlFinal (var pri,ult:lista; r:integer);
var aux:lista;
begin
	new (aux);
	aux^.dato:=r;
	aux^.sig:=NIL;
	if (pri<>NIL) then
		ult^.sig:=aux
	else pri:=aux;
	ult:=aux;
end;


procedure CrearLista (var l:lista);
var ult:lista; r:integer;
begin
	ult:=NIL;
	r:=random (20)+1;
	while (r<>20) do begin
		AgregarAlFinal(l,ult,r);
		r:=random(20)+1;
	end;
end;

var l:lista;
begin
	randomize;
	l:=NIL;
	CrearLista(l);
end.

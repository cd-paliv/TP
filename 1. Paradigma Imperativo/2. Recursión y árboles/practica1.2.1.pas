program ej4;

{Escribir un programa que: 
 a. Implemente un módulo que genere una lista a partir de la lectura de números enteros. 
La lectura finaliza con el número 0. 
 b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.  
 c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.  
 d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se 
encuentra en la lista o falso en caso contrario.  
}

const
	fin=0;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;

//PUNTO A.
procedure AgregarAtras (var pri,ult:lista; n:integer);
var aux:lista;
begin
	new(aux);
	aux^.dato:=n;
	aux^.sig:=NIL;
	if (pri=NIL) then pri:=aux
	else ult^.sig:=aux;
	ult:=aux;
end;

procedure CargarLista(var l:lista);
var  ult:lista; n:integer;
begin
	ult:=NIL;
	randomize;
	n:=random(100);
	while (n<>fin) do begin
		AgregarAtras(l,ult,n);
		n:=random(100);
	end;
	writeln('----------------------------------------');
	writeln('Lista cargada');
	readln();
end;

procedure Imprimir (l:lista);
begin
	if (l<>NIL) then begin
		writeln ('Numero: ',l^.dato);
		Imprimir(l^.sig);
	end;
end;


//PUNTO B.
function Min (l:lista):integer;
var m:integer;
begin
	if (l=NIL) then Min:=999
	else begin
		m:=Min(l^.sig);
		if (m>l^.dato) then
			m:=l^.dato;
		Min:=m;
	end;
end;

//PUNTO C.
function Max (l:lista):integer;
var m:integer;
begin
	if (l=NIL) then Max:=-1
	else begin
		m:=Max(l^.sig);
		if (m<l^.dato) then
			m:=l^.dato;
		Max:=m;
	end;
end;


//PUNTO D.
function Buscar (l:lista; x:integer):boolean;
begin
	if (l=NIL) then Buscar:=false
	else
		if (x=l^.dato) then Buscar:=true
		else Buscar:=Buscar(l^.sig, x);
end;


//PP.
var l:lista; mi,ma,x:integer; exito:boolean;
begin

	l:=NIL;
	CargarLista (l);
	Imprimir(l);
	mi:=Min(l);
	writeln('----------------------------------------');
	writeln('Numero minimo de la lista: ',mi);
	ma:=Max(l);
	writeln('----------------------------------------');
	writeln('Numero maximo de la lista: ',ma);
	writeln('----------------------------------------');
	writeln ('Ingresar nro entre 0 y 99 para buscar en la lista');
	readln(x);
	exito:=Buscar(l,x);
	writeln('El numero esta? ',exito);
	writeln('----------------------------------------');
end.

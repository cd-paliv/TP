program ej13;

{Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las 
entradas vendidas. Se desea procesar la información de una semana.  
Implementar un programa que: 
  a. Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 
1 a 7), código de la obra, asiento y monto. La lectura finaliza con el código de obra igual a 
0. Las listas deben estar ordenadas por código de obra de forma ascendente.  
  b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta 
lista debe estar ordenada por código de obra de forma ascendente. 
}

const
	df=7;
	fin=0;
type
	rango=1..df;
	entrada=record
		dia:rango;
		cod:integer;
		asie:integer;
		mon:real;
	end;
	ent=record
		cod:integer;
		asie:integer;
		mon:real;
	end;
	lista=^nodo;
	nodo=record
		dato:ent;
		sig:lista;
	end;
	vector=array[rango] of lista;


//PUNTO A
procedure CargarVector(var v:vector);  //Creo vector de listas

	procedure Inicializar (var v:vector);
	var i:integer;
	begin
		for i:=1 to df do
			v[i]:=NIL;
	end;

	procedure LeerDatos (var p:entrada);
	begin
		with p do begin
			cod:=random(51);
			if (cod<>fin) then begin
				dia:=random(7)+1;
				asie:=random(100)+1;
				mon:=random(100)+random();
			end;
		end;
	end;

	procedure CrearNuevo(var p1:ent; p:entrada); //GUARDO EN NUEVO RECORD
	begin                                              //PARA VECTOR
		p1.asie:=p.asie;
		p1.cod:=p.cod;
		p1.mon:=p.mon;
	end;

	procedure InsertarOrdenado (var l:lista; p:ent);
	var ant,act,aux:lista;
	begin
		new(aux);
		aux^.dato:=p;
		aux^.sig:=l;
		if (l=NIL) then
			l:=aux
		  else begin
			  ant:=l; act:=l;
			  while (act<>NIL) AND (act^.dato.cod<aux^.dato.cod) do begin //ordenadas por código de forma ascendente
				  ant:=act;
				  act:=act^.sig;
			  end;
			  if (ant=act) then
				  l:=aux
				else
					ant^.sig:=aux;
			  aux^.sig:=act;
		  end;
	end;


var  p:entrada; p1:ent;
begin
	Inicializar (v);
	LeerDatos(p);
	while (p.cod<>fin) do begin
		CrearNuevo(p1,p);
		InsertarOrdenado(v[p.dia],p1);  //GUARDO LO QUE ME INTERESA (p1) EN LA POSICION DEL VECTOR QUE ME INDICA p.cod
		LeerDatos(p);
	end;
end;

//PUNTO B
procedure Merge (v:vector; var l:lista);

	{AGREGARATRAS}
	procedure AgregarAtras (var pri,ult:lista; g:ent);
	var aux:lista;
	begin
		new(aux);
		aux^.dato:=g;
		aux^.sig:=NIL;
		if (pri=NIL) then pri:=aux
		else ult^.sig:=aux;
		ult:=aux;
	end; 

	{MINIMO}
	procedure Min (var v:vector; var min:ent; var ok:boolean);
	var i,indice:integer; aux:lista;
	begin
		min.cod:=999;
		for i:=1 to df do
			if (v[i]<>NIL) then //si la lista no está vacía
				if (v[i]^.dato.cod<min.cod) then begin //busco el indice y dato minimo y me lo guardo
					indice:=i;
					min:=v[indice]^.dato;
				end;
		if (min.cod<>999) then begin //si no están todas las listas vacías
			aux:=v[indice];
			v[indice]:=v[indice]^.sig;
			dispose(aux); //paso de nodo en la lista
		end
		else ok:=false
	end;

var act,e:ent; ult:lista; ok:boolean;
begin
	l:=NIL; ult:=NIL;
	ok:=true;
	Min(v,e,ok);
	while (ok) do begin //mientras las listas tengan elementos
		act.cod:=e.cod; act.mon:=0; act.asie:=0;
		while (ok) AND (act.cod=e.cod) do begin //mientras ^ y el cod sea el mismo
			act.mon:=act.mon + e.mon;
			act.asie:=act.asie + e.asie;
			Min(v,e,ok);
		end;
		AgregarAtras(l,ult,act);
	end;
end;

//Imprimir
procedure ImprimirL(l:lista);
begin
	if (l<>NIL) then begin
		writeln('| Obra #',l^.dato.cod, '| Entradas vendidas (asientos ocupados): ',l^.dato.asie, '| Monto total: $',l^.dato.mon:2:2);
		ImprimirL(l^.sig);
	end;
end;

procedure ImprimirV(v:vector);
var i:integer;
begin
	for i:=1 to df do begin
		writeln('----------------------------------------');
		writeln('Lista ',i);
		writeln(' ');
		ImprimirL(v[i]);
	end;
end;




//PP
var v:vector; l:lista;
begin
	randomize;
	CargarVector(v);
	ImprimirV(v);
	Merge(v,l);
	writeln('----------------------------------------');
	writeln('Lista merge');
	writeln(' ');
	ImprimirL(l);
end.

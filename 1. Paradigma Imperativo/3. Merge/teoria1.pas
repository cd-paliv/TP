program t1;

{Suponiendo que 4 integrantes de una familia, llevan sus gastos de manera similar a Juan y Paula (teoría). Se pide:
 a.Generar la estructura para almacenar los gastos de cada uno de los integrantes. Cada estructura debe generarse de manera ordenada por nombre de gasto.
   Cada estructura se carga hasta leer el nombre ‘ZZ’.
 b.Imprimir las estructuras generadas en a.
 c.Realizar el merge de manera de generar una única estructura que contenga los montos totales por impuesto con la estructura generada en a.
 d.A partir de la estructura generada en c. arme un ABB ordenado por monto total y luego imprima el nombre del gasto que menos costo}

const
	fin='ZZZ';
	df=4;
type
	str=string[20];
	gasto=record
		tipo:str;
		mon:real;
	end;
	lista=^nodo;
	nodo=record
		dato:gasto;
		sig:lista;
	end;
	vector=array[1..df] of lista;
	v2=array[1..10] of str;
	arbol=^nodo2;
	nodo2=record
		dato:gasto;
		HI:arbol;
		HD:arbol;
	end;



//PUNTO A
procedure CargarGastos(var v:vector);

	procedure Inicializar (var v:vector);
	var i:integer;
	begin
		for i:=1 to df do
			v[i]:=NIL;
	end;

	procedure InsertarOrdenado (var l:lista; g:gasto);        //ordenado por nombre de gasto de AAA a ZZZ
	var ant,act,aux:lista;
	begin
		new(aux);
		aux^.dato:=g;
		aux^.sig:=l;
		if (l=NIL) then
			l:=aux
		else begin
			ant:=l; act:=l;
			while (act<>NIL) AND (act^.dato.tipo<aux^.dato.tipo) do begin
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

	procedure generarTiposDeGastos (var nom:v2);
	begin
		nom[1]:='Impuestos';
		nom[2]:='Ropa';
		nom[3]:='Almacen';
		nom[4]:='Verduleria';
		nom[5]:='Panaderia';
		nom[6]:='Peluqueria';
		nom[7]:='Combustible';
		nom[8]:='Gimnasio';
		nom[9]:='Extras';
		nom[10]:=fin;
	end;

var vector2:v2; g:gasto;
begin
	Inicializar(v);
	generarTiposDeGastos(vector2);
	g.tipo:=vector2[random(10)+1];
	while (g.tipo <> fin) do begin
		g.mon:=random(1000)+random();
		InsertarOrdenado(v[random(df)+1],g);
		g.tipo:=vector2[random(10)+1];
	end;
end;


//PUNTO B
procedure ImprimirL(l:lista);
begin
	if (l<>NIL) then begin
		writeln('Gasto: ', l^.dato.tipo, '| Monto: $', l^.dato.mon:2:2);
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


//PUNTO C
procedure Merge (v:vector; var l:lista);

	procedure AgregarAtras (var pri,ult:lista; g:gasto);
	var aux:lista;
	begin
		new(aux);
		aux^.dato:=g;
		aux^.sig:=NIL;
		if (pri=NIL) then pri:=aux
		else ult^.sig:=aux;
		ult:=aux;
	end; 

	procedure Min (var v:vector; var min:gasto);
	var i,indice:integer; aux:lista;
	begin
		min.tipo:=fin;
		for i:=1 to df do
			if (v[i]<>NIL) then
				if (v[i]^.dato.tipo<min.tipo) then begin
					indice:=i;
					min:=v[indice]^.dato;
				end;
		if (min.tipo<>fin) then begin
			aux:=v[indice];
			v[indice]:=v[indice]^.sig;
			dispose(aux);
		end;
	end;

var act,g:gasto; ult:lista;
begin
	l:=NIL; ult:=NIL;
	Min(v,g);
	while (g.tipo<>fin) do begin
		act.tipo:=g.tipo; act.mon:=0;
		while (g.tipo<>fin) AND (act.tipo=g.tipo) do begin
			act.mon:=act.mon+g.mon;
			Min(v,g);
		end;
		AgregarAtras(l,ult,act);
	end;
end;

//PUNTO D
procedure GenerarArbol (var a:arbol; l:lista);

	procedure CrearNodo (var a:arbol; n:gasto);
	begin
		if (a=NIL) then begin
			new (a);
			a^.dato:=n; a^.HI:=NIL; a^.HD:=NIL;
			end
		else
			if (n.mon<a^.dato.mon) then CrearNodo(a^.HI,n)
			else CrearNodo(a^.HD,n);
	end;

begin
	if (l=NIL) then a:=NIL
	else begin
		GenerarArbol(a,l^.sig);
		CrearNodo(a,l^.dato);
	end;
end;

procedure MinA(a:arbol; var g:gasto); //luego imprima el nombre del gasto que menos costo
begin
	if (a=NIL) then g.mon:=999
	else begin
		MinA(a^.HI,g);
		if (a^.dato.mon<g.mon) then
			g:=a^.dato;
	end;
end;



//PP
var v:vector; LN:lista; a:arbol; gA:gasto;
begin
	randomize;
	CargarGastos(v);
	ImprimirV(v);
	Merge(v,LN);
	readln();
	writeln('----------------------------------------');
	writeln('Lista merge');
	writeln(' ');
	ImprimirL(LN);
	GenerarArbol(a,LN);
	MinA(a,gA);
	writeln('----------------------------------------');
	if (gA.mon<>999) then
		writeln('El gasto que menos costo ($',gA.mon:2:2,') es: ',gA.tipo);
end.

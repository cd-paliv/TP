program DuplicarDatos;

{Hacer un modulo que duplique todos los elementos de los nodos}

const
	fin=10;
type
	arbol=^nodo;
	nodo=record
		dato:integer;
		HI:arbol;
		HD:arbol;
	end;


procedure CrearNodo (var a:arbol; n:integer);
begin
	if (a=NIL) then begin
		new (a);
		a^.dato:=n; a^.HI:=NIL; a^.HD:=NIL;
		end
	else
		if (n<a^.dato) then CrearNodo(a^.HI,n)
		else CrearNodo(a^.HD,n);
end;


procedure GenerarArbol (var a:arbol);
var n,i:integer;
begin
	n:=random(100)+1;
	for i:=1 to fin do begin
		CrearNodo(a,n);
		n:=random(100)+1;
	end;
end;

procedure ImprimirEnOrden(a:arbol);
begin
	if (a<>NIL) then begin
		ImprimirEnOrden(a^.HI);
		writeln(' |',a^.dato);
		ImprimirEnOrden(a^.HD);
	end;
end;

//DUPLICO DATOS
procedure Duplicar (a:arbol);
begin
	if (a<>NIL) then begin
		a^.dato:=a^.dato*2;
		Duplicar(a^.HI);
		Duplicar(a^.HD);
	end;
end;

//PP.
var a:arbol;
begin
	GenerarArbol(a);
	ImprimirEnOrden(a);
	writeln('----------------------------------------');
	Duplicar(a);
	writeln('Datos duplicados');
	ImprimirEnOrden(a);
	writeln('----------------------------------------');
end.

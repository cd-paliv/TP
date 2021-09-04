program EntreValores;

{Dado un ABB, imprimir los valores entre el 10 y el 20 inclusive}

const
	fin=30;
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
	n:=random(50)+1;
	for i:=1 to fin do begin
		CrearNodo(a,n);
		n:=random(50)+1;
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



//IMPRIMO VALORES
procedure Entre10y20 (a:arbol);
begin
	if (a<>NIL) then
		if (a^.dato>=10) then
			if (a^.dato<=20) then begin //si cumple las dos condiciones me sirve
				writeln('Numero ', a^.dato);
				Entre10y20(a^.HI);
				Entre10y20(a^.HD);
			end
			else Entre10y20(a^.HI)  	//si es mayor a 20 el hijo izq puede estar entre 10y20
		else Entre10y20(a^.HD); 	////si es menor a 10 el hijo der puede estar entre 10y20
end;



//PP.
var a:arbol;
begin
	GenerarArbol(a);
	writeln('Vector:');
	ImprimirEnOrden(a);
	writeln('----------------------------------------');
	writeln('Valores entre 10 y 20:');
	Entre10y20(a);
end.

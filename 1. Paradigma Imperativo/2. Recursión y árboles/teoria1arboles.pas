program teoria1;


{1. Realice un módulo que lea 10 números enteros y los almacene en un ABB
 2. Dada la estructura generada en 1. realice un programa que sume todos los elementos del arbol
 3. Dada la estructura generada en 1. realice un programa que informe el valor máximo almacenado en la estructura}


const
	fin=10;
type
	arbol=^nodo;
	nodo=record
		dato:integer;
		HI:arbol;
		HD:arbol;
	end;

//1.
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


//2.
function Sumar (a:arbol):integer;
begin
	if (a=NIL) then Sumar:=0
	else
		Sumar:=Sumar(a^.HI) + Sumar(a^.HD) + a^.dato;
end;

//3.
procedure Max (a:arbol; var m:integer);
begin
	if (a=NIL) then m:=0
	else begin
		Max (a^.HD,m);
		if (m<a^.dato) then
			m:=a^.dato;
	end;
end;


//PROGRAMA PRINCIPAL
var a:arbol; m:integer;
begin
	randomize;
	GenerarArbol(a);
	ImprimirEnOrden(a);
	writeln('El arbol tiene en total: ', Sumar(a));
	Max(a,m);
	writeln ('El valor maximo del arbol es: ',m);
end.

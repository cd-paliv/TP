program ej8;

{ Escribir un programa que: 
 a. Implemente un módulo que lea números enteros y los almacene en un árbol binario 
de búsqueda. La lectura finaliza con el valor 0. 
 b. Una vez generado el árbol, realice módulos independientes para:  
	i. Obtener el número más grande.  
	ii. Obtener el número más chico.  
	iii. Obtener la cantidad de elementos.  
	iv.  Informar los números en orden creciente.  
	v.  Informar los números pares en orden decreciente.  
Nota: Tener en cuenta que cada número debe aparecer una única vez en el árbol.  
}

const
	fin=0;
type
	arbol=^nodo;
	nodo=record
		dato:integer;
		HI:arbol;
		HD:arbol;
	end;

//PUNTO A.
procedure GenerarArbol (var a:arbol);
	procedure CrearNodo (var a:arbol; n:integer);
	begin
		if (a=NIL) then begin
			new (a);
			a^.dato:=n; a^.HI:=NIL; a^.HD:=NIL;
			end
		else
			if (n<a^.dato) then CrearNodo(a^.HI,n)
			else if (n>a^.dato) then CrearNodo(a^.HD,n);
	end;


var n:integer;
begin
	n:=random(100);
	while (n<>fin) do begin
		CrearNodo(a,n);
		n:=random(100);
	end;
end;

//PUNTO Bi.
{function Max (a:arbol):integer;
var m:integer;
begin
	if (a=NIL) then Max:=-1
	else begin
		m:=Max(a^.HD);
		if (m<a^.dato) then
			m:=a^.dato;
		Max:=m;
	end;
end;}


function Max (a:arbol):integer;
begin
	if (a^.HD=NIL) then Max:=a^.dato
	else Max:=Max(a^.HD);
end;


//PUNTO Bii.
{function Min (a:arbol):integer;
var m:integer;
begin
	if (a=NIL) then Min:=999
	else begin
		m:=Min(a^.HI);
		if (m>a^.dato) then
			m:=a^.dato;
		Min:=m;
	end;
end;}

function Min (a:arbol):integer;
begin
	if (a^.HI=NIL) then Min:=a^.dato
	else Min:=Min(a^.HI);
end;

//PUNTO Biii.
function Sumar (a:arbol):integer;
begin
	if (a=NIL) then Sumar:=0
	else
		Sumar:=Sumar(a^.HI) + Sumar(a^.HD) + 1;
end;

//PUNTO Biv.
procedure EnOrden(a:arbol);
begin
  if(a<>NIL)then begin
       EnOrden(a^.HI);
       write(' ',a^.dato,'|');
       EnOrden(a^.HD);
  end;
end;

//PUNTO Bv.
procedure Par (a:arbol);
var dig:integer;
begin
	if (a<>NIL) then begin
		Par(a^.HI);
		if (a^.dato<>0) then begin
			dig:=a^.dato MOD 10;
			if ((dig MOD 2)=0) then
				write(' ',a^.dato,'|');
		end;
		Par(a^.HD);
	end;
end;


//PP.
var a:arbol; ma,mi,s:integer;
begin
	randomize;
	GenerarArbol(a);
	writeln('----------------------------------------');
	ma:=Max(a);
	writeln('El numero mas grande del arbol: ', ma);
	mi:=Min(a);
	writeln('El numero mas chico del arbol: ', mi);
	s:=Sumar(a);
	writeln('La cantidad de elementos del vector es: ',s);
	writeln('----------------------------------------');
	EnOrden(a);
	writeln(' ');
	writeln('----------------------------------------');
	writeln('Numeros pares');
	Par(a);
end.

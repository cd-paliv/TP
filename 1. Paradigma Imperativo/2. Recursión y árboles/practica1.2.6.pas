program ej9;

{ Implemente un programa que invoque a un módulo que genere un árbol binario de 
búsqueda con nombres de personas que se leen desde teclado. La lectura finaliza con el 
nombre ‘ZZZ’. También debe invocar a otro módulo que reciba el árbol generado y un 
nombre, y retorne verdadero si existe dicho nombre en el árbol o falso en caso contrario.  
}

const
	fin='ZZZ';
type
	arbol=^nodo;
	nodo=record
		dato:string;
		HI:arbol;
		HD:arbol;
	end;

//GENERAR ARBOL.
procedure CrearNodo (var a:arbol; n:string);
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
var n:string;
begin
	writeln('Ingresar nombre');
	readln(n);
	while (n<>fin) do begin
		CrearNodo(a,n);
		writeln('Ingresar nombre');
		readln(n);
	end;
end;

//BUSCAR NOMBRE
function Buscar (a:arbol; x:string):boolean;
begin
	if (a=NIL) then Buscar:=false
	else
		if (x=a^.dato) then Buscar:=true
		else begin
			if (x<a^.dato) then Buscar:=Buscar(a^.HI, x)
			else Buscar:=Buscar(a^.HD, x);
		end;
end;


procedure EnOrden(a:arbol);
begin
  if(a<>NIL)then begin
       EnOrden(a^.HD);
       write(' ',a^.dato,'|');
       EnOrden(a^.HI);
  end;
end;

//PP.
var a:arbol; ex:boolean; nom:string;
begin
	randomize;
	GenerarArbol(a);
	writeln('Ingresar nombre a buscar del arbol');
	readln(nom);
	ex:=Buscar(a,nom);
	writeln('Esta el nombre?', ex);
	EnOrden(a);
end.

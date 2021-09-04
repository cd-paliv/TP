program Imp;
const
	fin=20;
type
	arbol=^nodo;
	nodo=record
		dato:integer;
		HI:arbol;
		HD:arbol;
	end;

//Genero Arbol
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

procedure GenerarArbol (var a:arbol);
var n,i:integer;
begin
	n:=random(10)+1;
	for i:=1 to fin do begin
		CrearNodo(a,n);
		n:=random(10)+1;
	end;
end;

//LEO DE IZQUIERDA A DERECHA -RAIZ PRIMERO- (IMPRIMO RAIZ, TODO IZQ, TODO DER)
procedure PreOrden(a:arbol);
begin
  if(a<>NIL)then begin
       write(' ',a^.dato,'|');
       PreOrden(a^.HI);
       PreOrden(a^.HD);
  end;
end;

//LEO DE MENOR A MAYOR
procedure EnOrden(a:arbol);
begin
  if(a<>NIL)then begin
       EnOrden(a^.HI);
       write(' ',a^.dato,'|');
       EnOrden(a^.HD);
  end;
end;

//DE MAYOR A MENOR
procedure EnOrden2(a:arbol);
begin
  if(a<>NIL)then begin
       EnOrden(a^.HD);
       write(' ',a^.dato,'|');
       EnOrden(a^.HI);
  end;
end;

//LEO DE ABAJO PARA ARRIBA -RAIZ ULTIMA- (TODO IZQ, TODO DER, RAIZ)
procedure PosOrden(a:arbol);
begin
  if(a<>NIL)then begin
       PosOrden(a^.HI);
       PosOrden(a^.HD);
       write(' ',a^.dato,'|');
  end;
end;


var a:arbol;
begin
	GenerarArbol(a);
	writeln();
	PreOrden(a);
	readln();
	EnOrden(a);
	readln();
	EnOrden2(a);
	readln();
	PosOrden(a);
end.

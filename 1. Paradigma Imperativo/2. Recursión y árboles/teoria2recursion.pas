program teoria2;

{Realice un programa que lea números hasta leer el valor 0 e imprima sus dígitos en el orden en que aparecen en el número.
 Ejemplo si se lee el valor 256, se debe imprimir 2  5  6}

const
	fin=0;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;


procedure AgregarAdelante (var l:lista; n:integer);
var aux:lista;
begin
	new(aux);
	aux^.dato:=n;
	aux^.sig:=l;
	l:=aux;
end;

procedure GenerarLista (var l:lista);
var num:integer;
begin
	num:=random(200);
	while (num<>0) do begin
		AgregarAdelante(l,num);
		num:=random(200);
	end;
end;


procedure Digitos (l:lista);

	procedure EnOrden (num:integer);
	begin
		if (num<>0) then begin
			EnOrden(num DIV 10);
			write(' ',num MOD 10,' ');
		end;
	end;

begin
	if (l<>NIL) then begin
		writeln(' ');
		writeln('----------------------------------------');
		writeln('Numero: ',l^.dato);
		EnOrden(l^.dato);
		Digitos(l^.sig);
	end;
end;


var l:lista;
begin
	randomize;
	GenerarLista(l);
	Digitos(l);
end.

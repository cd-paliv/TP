program teoria1;

{Realice un programa que lea 8 valores enteros. Genere una lista donde los elementos se inserten adelante.
 Al finalizar implemente un modulo recursivo que imprima los valores de la lista}


const
	fin=8;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;

procedure AgregarAdelante (var l:lista; n:integer);            //Si quiero que imprima en orden inverso debo utilizar AgregarAlFinal
var aux:lista;
begin
	new(aux);
	aux^.dato:=n;
	aux^.sig:=l;
	l:=aux;
end;

procedure GenerarLista (var l:lista);
var num,i:integer;
begin
	num:=random(200);
	for i:=1 to fin do begin
		AgregarAdelante(l,num);
		num:=random(200);
	end;
end;


procedure Imprimir (l:lista);
begin
	if(l<>NIL) then begin
		writeln ('Numero ',l^.dato);
		Imprimir(l^.sig);
	end;
end;



//PP
var l:lista;
begin
	randomize;
	GenerarLista(l);
	Imprimir(l);
end.

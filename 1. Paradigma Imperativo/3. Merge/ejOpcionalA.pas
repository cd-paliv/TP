  
program actividad1;

{Una empresa de energía eléctrica maneja la información de sus clientes, de cada cliente conoce apellido y nombre, dni, categoría y monto que paga del servicio. Se pide:
 a.	Generar una lista con la información de clientes hasta leer el cliente con apellido y nombre ‘ZZZ’.
 b.	A partir de la lista generada en a, generar un árbol ordenado por dni con los clientes. Los hijos más chicos  deben agregarse a la izquierda y los más grandes o iguales a la derecha.
 c.	A partir de la estructura generada en b, imprimir los dni de los clientes ordenados de menor a mayor.
 d.	A partir de la estructura generada en b, imprimir el cliente con mayor categoría.
}

Type
 cliente = record
  apeynom:string;
  dni:integer;
  categoria:integer;
 end;
 lista = ^nodo;
 nodo = record
  dato:cliente;
  sig:lista;
 end; 
 arbol= ^nodoA;
 nodoA= record
  dato: cliente;
  HI:arbol;
  HD:arbol;
 end;

 

procedure leerCliente (var cli:cliente);
begin
 writeln('Ingresar apellido y nombre del cliente');
 readln(cli.apeynom);
if (cli.apeynom <> 'ZZZ') then begin
	cli.dni:=random(500)+1;
	cli.categoria:=random(100)+1;
end;

{ readln(cli.apeynom);
 if (cli.apeynom <> 'ZZZ') then begin
 readln(cli.dni);
 readln(cli.categoria);
 end;}
end;    

procedure cargarLista (var L:lista);
var
 c:cliente;
 aux:lista;
begin
 randomize;
 leerCliente (c);
 while (c.apeynom <> 'ZZZ') do
  begin
   if (L= nil) then //agregarAdelante
    begin
     new(L);
     L^.dato:= c;
     L^.sig:= nil; 
    end
   else begin
    new(aux);
    aux^.dato:=c;
    aux^.sig:= L;
    L:=aux;
   end; 
   leerCliente(c);
 end;
end;

procedure imprimir (A:arbol);
begin    
 if (A <> nil) then 
  begin
   imprimir (A^.HI);
   writeln (A^.dato.dni);
   imprimir (A^.HD);
   //writeln (A^.dato.dni);
  end;
end;

procedure agregarEnArbol (var A:arbol; c:cliente);
begin    
 if (A = nil) then 
  begin
   new(A);
   A^.dato:= c;
   A^.HI:= nil;
   A^.HD:= nil;
  end
 else 
  if (c.dni <= A^.dato.dni) then agregarEnArbol(A^.HI, c) //ordeno por dni -b-
  else  agregarEnArbol(A^.HD,c); 
end;

procedure generarArbol (L:lista; var A:arbol);
begin
 if (l=NIL) then a:=NIL
  else begin
   generarArbol(L^.sig, A);
   agregarEnArbol(A, L^.dato);
  end;
end;

procedure mayorCategoria (A:arbol; var c:cliente);
begin
 if (A = nil) then c.categoria:=-1
 else begin
  //if (A^.HD <> nil) then
    mayorCategoria (A^.HI,c);
    mayorCategoria (A^.HD,c);
  //else
    if (c.categoria<a^.dato.categoria) then    c := A^.dato;
 end;      
end;
{
begin
	if (a=NIL) then Max:=-1
	else begin
		Max(a^.HD);
		if (m<a^.dato) then
			m:=a^.dato;
	end;
end;}
procedure ImprimirL(l:lista);
begin
	if (l<>NIL) then begin
		writeln(l^.dato.apeynom,' ',l^.dato.dni,' ',l^.dato.categoria);
		ImprimirL(l^.sig);
	end;
end;



VAR
 L:lista;
 A: arbol;
 c:cliente;
 
BEGIN
 L:=NIL;
 cargarLista (L);
 {writeln('imprimo lista');
 ImprimirL(L);}
 generarArbol(L,A);	
 writeln ('Muestro los dni ordenados de menor a mayor');
 imprimir(A);
 writeln;
 writeln;
 mayorCategoria(A,c); 	
 write('El cliente ',c.apeynom, ' es el de mayor categoria');
 readln;
END.


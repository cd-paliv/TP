program ej11;

{ Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada 
película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 
4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado 
por las críticas.  
Implementar un programa que contenga: 
 a. Un módulo que lea los datos de películas y los almacene ordenados por código de 
película y agrupados por código de género, en una estructura de datos adecuada. La 
lectura finaliza cuando se lee el código de película -1.  
 b. Un módulo que reciba la estructura generada en el punto a y retorne una estructura 
de datos donde estén todas las películas almacenadas ordenadas por código de película. 
}


const
	fin=-1;
	df=8;
type
	rango=1..df;
	pelicula=record
		codp:integer;
		codg:rango;
		punt:real;
	end;
	peli=record
		codp:integer;
		punt:real;
	end;
	lista=^nodo;
	nodo=record
		dato:peli;
		sig:lista;
	end;
	vector=array[rango] of lista;


//PUNTO A
procedure CargarVector(var v:vector);  //Creo vector de listas de peliculas

	procedure Inicializar (var v:vector);
	var i:integer;
	begin
		for i:=1 to df do
			v[i]:=NIL;
	end;

	procedure LeerDatos (var p:pelicula);
	begin
		with p do begin
			codp:=random(101)-1;
			if (codp<>fin) then begin
				codg:=random(8)+1;
				punt:=random(100)+random();
			end;
		end;
	end;

	procedure CrearNuevo(var p1:peli; p:pelicula); //GUARDO PELICULAS EN NUEVO RECORD
	begin                                                   //PARA VECTOR
		p1.codp:=p.codp;
		p1.punt:=p.punt;
	end;

	procedure InsertarOrdenado (var l:lista; p:peli);        //ordenado por codigo de peli
	var ant,act,aux:lista;
	begin
		new(aux);
		aux^.dato:=p;
		aux^.sig:=l;
		if (l=NIL) then
			l:=aux
		  else begin
			  ant:=l; act:=l;
			  while (act<>NIL) AND (act^.dato.codp<aux^.dato.codp) do begin
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


var  p:pelicula; p1:peli;
begin
	Inicializar (v);
	LeerDatos(p);
	while (p.codp<>fin) do begin
		CrearNuevo(p1,p);
		InsertarOrdenado(v[p.codg],p1);  //GUARDO LO QUE ME INTERESA (p1) EN LA POSICION DEL VECTOR QUE ME INDICA p.codg
		LeerDatos(p);
	end;
end;

//PUNTO B
procedure Merge (v:vector; var l:lista);

	{MINIMO}
	procedure Min (var v:vector; var min:peli; var ok:boolean);
	var i,indice:integer; aux:lista;
	begin
		min.codp:=999;
		for i:=1 to df do
			if (v[i]<>NIL) then
				if (v[i]^.dato.codp<min.codp) then begin
					indice:=i;
					min:=v[indice]^.dato;
				end;
		if (min.codp<>999) then begin
			aux:=v[indice];
			v[indice]:=v[indice]^.sig;
			dispose(aux);
		end
		else ok:=false
	end;

	{AGREGARATRAS}
	procedure AgregarAtras (var pri,ult:lista; x:peli);
	var aux:lista;
	begin
		new(aux);
		aux^.dato:=x;
		aux^.sig:=NIL;
		if (pri=NIL) then pri:=aux
		else ult^.sig:=aux;
		ult:=aux;
	end;

var p:peli; ult:lista; ok:boolean;
begin
	l:=NIL; ult:=NIL;
	ok:=true;
	Min(v,p,ok);				//busco el minimo para verificar que v[i]=/=NIL
	while (ok) do begin 		//mientras el vector tiene elementos
		AgregarAtras(l,ult,p);	//agrego el elemento a la nueva lista
		Min(v,p,ok);			//busco el minimo
	end;
end;

//IMPRIMIR
procedure ImprimirL(l:lista);
begin
	if (l<>NIL) then begin
		writeln('| Pelicula codigo: ',l^.dato.codp, '| Puntaje: ',l^.dato.punt:2:2);
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



//PP
var v:vector; l:lista;
begin
	randomize;
	CargarVector(v);
	ImprimirV(v);
	Merge(v,l);
	writeln('----------------------------------------');
	writeln('Lista merge');
	writeln(' ');
	ImprimirL(l);
end.

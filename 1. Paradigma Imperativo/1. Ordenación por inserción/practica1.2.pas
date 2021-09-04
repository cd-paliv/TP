program ej2;

{ Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada 
película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 
4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado 
por las críticas.  
Implementar un programa modularizado que: 
 a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código 
de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el 
código de película -1.  
 b. Una vez almacenada la información, genere un vector que guarde, para cada género, 
el código de película con mayor puntaje obtenido entre todas las críticas. 
 c. Ordene los elementos del vector generado en b) por puntaje. 
 d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el 
código de película con menor puntaje. 
}

uses crt;
const
	fin=0;
	df=8;
type
	rango=1..df;
	peliculas=record
		codp:integer;
		codg:rango;
		punt:integer;
	end;
	peli=record
		cod:integer;
		prom:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:peli;
		sig:lista;
	end;
	vector=array[rango] of lista;
	vectorB=array[rango] of peli;


//INICIALIZO VECTOR EN NIL
procedure Inicializar (var v:vector);
var i:integer;
begin
	for i:=1 to df do
		v[i]:=NIL;
end;

procedure LeerPeliculas (var p:peliculas); //Leo las peliculas de la lista del cine
begin
	with p do begin
		codp:=random(101);
		if (codp<>fin) then begin
			codg:=random(8)+1;
			punt:=random(100)+1;
		end;
	end;
end;

procedure CrearNuevaPeli(var p1:peli; p:peliculas); //GUARDO PELICULAS EN NUEVO RECORD
begin                                                           //PARA VECTOR
	p1.cod:=p.codp;
	p1.prom:=p.punt;
end;


procedure AgregarAtras (var pri,ult:lista; p:peli);
var aux:lista;
begin
	new(aux);
	aux^.dato:=p;
	aux^.sig:=NIL;
	if (pri=NIL) then pri:=aux
	else ult^.sig:=aux;
	ult:=aux;
end;

//CARGO VECTOR POR ORDEN DE LLEGADA -PUNTO A-
procedure CargarVector(var v:vector);
var  p:peliculas; ult:lista; p1:peli;
begin
	ult:=NIL;
	Inicializar (v);
	LeerPeliculas(p);
	while (p.codp<>fin) do begin
		CrearNuevaPeli(p1,p);
		AgregarAtras(v[p.codg],ult,p1);
		LeerPeliculas(p);
	end;
end;

//PUNTO B
procedure Mayor(puntaje,codigo:integer; var max,codmax:integer);
begin
	if (puntaje>max) then begin
		max:=puntaje;
		codmax:=codigo;
	end;
end;


procedure RecorrerVector1 (v:vector; var v2:vectorB);
var i,max,codmax:integer;
begin
	for i:=1 to df do begin
		if (v[i]=NIL) then                                   //si la lista está vacía
			v[i]^.dato.prom:=-1                                   //promedio:-1;
		else begin
			max:=-1;
			writeln('----------------------------------------');
			writeln ('Lista ', i);
			readln();
			while (v[i]<>NIL) do begin
				Mayor(v[i]^.dato.prom, v[i]^.dato.cod, max, codmax);
				writeln ('Codigo de la pelicula: ', v[i]^.dato.cod, ' | Puntaje: ', v[i]^.dato.prom);
				v[i]:=v[i]^.sig;
			end;
			v2[i].prom:=max;                                   //CARGO NUEVO VECTOR
			v2[i].cod:=codmax;
		end;
	end;
end;

//PUNTO C
procedure Ordenar (var v:vectorB);
var i,j:integer; actual:peli;
begin
	for i:=2 to df do begin
		actual:=v[i];
		j:=i-1;
		while (j>0) AND (v[j].prom>actual.prom) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
	readln();
	writeln('----------------------------------------');
	writeln ('Vector de puntajes ordenado');
end;

//PUNTO D
procedure ImprimirV2 (v:vectorB);
var i:integer;
begin
	writeln('----------------------------------------');
	writeln('Puntajes:');
	readln();
	i:=1;
	while (v[i].prom=-1) AND (i<8) do
		i:=i+1;
	if (i<8) then begin
		writeln ('La pelicula codigo: ', v[i].cod, ' |genero ', i, '| tiene el menor puntaje: ',v[i].prom);
		readln();
		i:=8;
		writeln('La pelicula codigo: ', v[i].cod, ' |genero ', i, '| tiene el mayor puntaje: ',v[i].prom);
	end
	else
		writeln('La pelicula codigo: ', v[i].cod, ' |genero ', i, '| tiene el mayor puntaje: ',v[i].prom);
end;


procedure Vector2 (var v:vectorB);
begin
	Ordenar(v);
	ImprimirV2(v);
end;



//PROGRAMA PRINCIPAL
var v:vector; v2:vectorB;
begin
	randomize;
	CargarVector(v);
	writeln ('Vector de listas: ');
	readln();
	RecorrerVector1 (v,v2);
	Vector2(v2);
end.

program ej3;

{ Una librería requiere el procesamiento de la información de sus productos. De cada 
producto se conoce el código del producto, código de rubro (del 1 al 6) y precio.  
Implementar un programa modularizado que: 
 a. Lea los datos de los productos y los almacene ordenados por código de producto y 
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos 
finaliza cuando se lee el precio -1 
Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro: 
 b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. 
Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de 
productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e 
ignore el resto.  
 c. Ordene, por precio, los elementos del vector generado en b). 
 d. Muestre los precios del vector ordenado. 
}

uses crt;
const
	df=6;
	fin=0;
type
	rango=1..df;
	producto=record
		codp:integer;
		codr:rango;
		precio:integer;
	end;
	prod=record
		cod:integer;
		pre:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:prod;
		sig:lista;
	end;
	vector=array[rango] of lista;
	vectorB=array[1..30] of prod;


//INICIALIZO VECTOR EN NIL
procedure Inicializar (var v:vector);
var i:integer;
begin
	for i:=1 to df do
		v[i]:=NIL;
end;

procedure LeerProducto (var p:producto);                   //leo las peliculas de la lista del cine
begin
	with p do begin
		precio:=random(50);
		if (codp<>fin) then begin
			codr:=random(6)+1;
			codp:=random(101);
		end;
	end;
end;

procedure InsertarOrdenado (var l:lista; p:prod);        //ordenado por codigo de prod
var ant,act,aux:lista;
begin
    new(aux);
    aux^.dato:=p;
    aux^.sig:=l;
    if (l=NIL) then
        l:=aux
      else begin
          ant:=l; act:=l;
          while (act<>NIL) AND (act^.dato.cod<aux^.dato.cod) do begin
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

procedure CrearNuevaPeli(var p1:prod; p:producto); //GUARDO PELICULAS EN NUEVO RECORD
begin                                                           //PARA VECTOR
	p1.cod:=p.codp;
	p1.pre:=p.precio;
end;

//CARGO VECTOR -PUNTO A-
procedure CargarVector(var v:vector);
var  p:producto; p1:prod;
begin
	Inicializar (v);
	LeerProducto(p);
	while (p.codp<>fin) do begin
		CrearNuevaPeli(p1,p);
		InsertarOrdenado(v[p.codr],p1);
		LeerProducto(p);
	end;
	writeln('Vector de listas cargado');
end;


//RECORRO V1 Y CARGO V2 -PUNTO B-
procedure RecorrerVector1 (l:lista; var v2:vectorB; var cont:integer);
begin
	if (l=NIL) then
		writeln('El rubro no tiene productos')
	else begin
		while (l<>NIL) AND (cont<30) do begin
			cont:=cont+1;
			v2[cont].cod:=l^.dato.cod;
			v2[cont].pre:=l^.dato.pre;
			l:=l^.sig;
		end;
		writeln('----------------------------------------');
		writeln('Arreglo 2 listo');
	end;
end;

//PUNTO C
procedure Ordenar (var v:vectorB; dl:integer);
var i,j:integer; actual:prod;
begin
	for i:=2 to dl do begin
		actual:=v[i];
		j:=i-1;
		while (j>0) AND (v[j].pre>actual.pre) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
	writeln ('Arreglo ordenado');
end;

//PUNTO D
procedure ImprimirV2(v:vectorB;dl:integer);
var i:integer;
begin
	for i:=1 to dl do begin
		writeln('----------------------------------------');
		writeln('Producto: ', v[i].cod, '| Precio: ', v[i].pre);
	end;
end;

procedure Vector2 (var v:vectorB; dl:integer);
begin
	Ordenar(v,dl);
	writeln('----------------------------------------');
	writeln('Rubro 3:');
	ImprimirV2(v,dl);
end;


//PROGRAMA PRINCIPAL
var v:vector; v2:vectorB; dl:integer;
begin
	randomize;
	dl:=0;
	CargarVector(v);
	RecorrerVector1(v[3],v2,dl);
	if (v[3]<>NIL) then
		Vector2(v2,dl);
end.

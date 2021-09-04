program ej6;

{Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el 
siguiente encabezado: 
    Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);  
 
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se 
encuentra en el vector. 
}


const
	df=20;
type
	indice=1..df;
	vector=array[indice] of integer;


procedure Imprimir(v:vector);
var i:integer;
begin
	for i:=1 to df do begin
		writeln ('Posicion ',i,' numero ',v[i]);
	end;
end;   //chequear nros en vector

procedure CargarVector (var v:vector);
var i,n:integer;
begin
	for i:=1 to df do begin
		n:=random(100);
		v[i]:=n;
	end;
end;

procedure ordenar(var v : vector);  //de menor a mayor
var i,j:indice; actual:integer;
begin
	for i:=2 to df do begin
		actual:=v[i];
		j:=i-1;
		while (j>0) AND (v[j]>actual) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;


{Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: integer);   //cambie pos:indice por pos:integer xq sino no puede tener -1
var medio:indice;
begin
	medio:=(ini+fin) DIV 2;
	while (ini<=fin) AND (dato<>v[medio]) do begin
		if (dato<v[medio]) then
			fin:=medio-1
			else ini:=medio+1;
		medio:=(ini+fin) DIV 2;
	end;
	if (ini<=fin) then pos:=medio
	else pos:=-1;
end;}

procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: integer);  //Busqueda recursiva
begin
	if (ini>fin) then pos:=-1
	else begin
		pos:=(ini+fin) DIV 2;
		if (v[pos]<>dato) then
			if(dato<v[pos]) then busquedaDicotomica(v,ini,pos-1,dato,pos)
			else busquedaDicotomica (v,pos+1,fin,dato,pos);
	end;
end;


//PP.
var v:vector; i,f:indice; x,pos:integer;
begin
	randomize;
	i:=1; f:=df;
	CargarVector(v);
	ordenar(v);
	Imprimir(v);
	writeln ('Ingresar nro entre 0 y 99 a buscar en arreglo');
	readln(x);
	busquedaDicotomica(v,i,f,x,pos);
	if (pos=-1) then writeln ('El nro no se encuentra en el vector')
	else writeln ('El nro se encuentra en la posicion ',pos);
end.

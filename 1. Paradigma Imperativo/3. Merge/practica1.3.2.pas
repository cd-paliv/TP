program ej12;

{ Implementar un programa que procese la información de las ventas de productos de una 
librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto 
vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se 
lee el código de sucursal 0. 
Implementar un programa que: 
  a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en 
una estructura de datos adecuada.  
  b. Contenga un módulo que reciba la estructura generada en el punto a y retorne una 
estructura donde esté acumulada la cantidad total vendida para cada código de producto. 
}

const
	df=4;
	fin=0;
type
	{vector de listas}
	d=1..31; m=1..12; a=1999..2020;
	fecha=record
		dia:d;
		mes:m;
		ano:a;
	end;
	producto=record //ventas de productos
		fec:fecha;
		codp:integer;
		cods:0..4;		//CODIGO DE SUCURSAL CERO NO SE PUEDE?????
		cant:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:producto;
		sig:lista;
	end;
	vector=array[1..df] of lista;
	{lista merge}
	prod=record
		codp:integer;
		cant:integer;
	end;
	lista2=^nodo2;
	nodo2=record
		dato:producto;
		sig:lista2;
	end;


//PUNTO A
procedure CargarVector(var v:vector);  //Creo vector de listas de peliculas

	procedure Inicializar (var v:vector);
	var i:integer;
	begin
		for i:=1 to df do
			v[i]:=NIL;
	end;

	procedure LeerDatos (var p:producto);
	begin
		with p do begin
			cods:=random(5);
			if (cods<>fin) then begin
				codp:=random(51);
				cant:=random(100)+1;
				with fec do begin
					dia:=random(31)+1;
					mes:=random(11)+1;
					ano:=random(21)+1999;
				end;
			end;
		end;
	end;

	procedure InsertarOrdenado (var l:lista; p:producto);        //ordenado
	var ant,act,aux:lista;
	begin
		new(aux);
		aux^.dato:=p;
		aux^.sig:=l;
		if (l=NIL) then l:=aux
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


var  p:producto;
begin
	Inicializar (v);
	LeerDatos(p);
	while (p.cods<>fin) do begin
		InsertarOrdenado(v[p.cods],p);  //GUARDO LO QUE ME INTERESA (p1) EN LA POSICION DEL VECTOR QUE ME INDICA p.cod
		LeerDatos(p);
	end;
end;


//PUNTO B
procedure Merge (v:vector; var l:lista2; var ok:boolean);

	{AGREGARATRAS}
	procedure AgregarAtras (var pri,ult:lista2; x:prod);
	var aux:lista2;
	begin
		new(aux);
		aux^.dato.codp:=x.codp;
		aux^.dato.cant:=x.cant;
		aux^.sig:=NIL;
		if (pri=NIL) then pri:=aux
		else ult^.sig:=aux;
		ult:=aux;
	end;

	{MINIMO}
	procedure Min (var v:vector; var min:prod);
	var i,indice:integer; aux:lista;
	begin
		min.codp:=999;
		for i:=1 to df do
			if (v[i]<>NIL) then
				if (v[i]^.dato.codp<min.codp) then begin
					indice:=i;
					min.codp:=v[indice]^.dato.codp;
					min.cant:=v[indice]^.dato.cant;
				end;
		if (min.codp<>999) then begin
			aux:=v[indice];
			v[indice]:=v[indice]^.sig;
			dispose(aux);
		end
	end;


var act,p:prod; ult:lista2;
begin
	l:=NIL; ult:=NIL;
	Min(v,p);
	while (p.codp<>999) do begin //si quiero que esto corte tengo que verificar con el mismo valor que le pongo a la var al inicializarla en el proceso min
		act.codp:=p.codp; act.cant:=0;
		while (p.codp<>999) AND (act.codp=p.codp) do begin
			act.cant:=act.cant+p.cant;
			Min(v,p);
		end;
		AgregarAtras(l,ult,act);
		ok:=true;
	end;
end;

//Imprimir
procedure ImprimirL(l:lista);
begin
	if (l<>NIL) then begin
		writeln('| Producto codigo: ',l^.dato.codp, '| Fecha: ',l^.dato.fec.dia,'/',l^.dato.fec.mes,'/',l^.dato.fec.ano, '| Cantidad total: ',l^.dato.cant);
		ImprimirL(l^.sig);
	end;
end;

procedure ImprimirV(v:vector);
var i:integer;
begin
	for i:=1 to df do begin
		writeln('----------------------------------------');
		writeln('Codigo de sucursal ',i);
		writeln(' ');
		ImprimirL(v[i]);
	end;
end;

procedure ImprimirMerge(l:lista2); //hago otro imprimir porque la fecha no me interesa
begin
	if (l<>NIL) then begin
		writeln('| Producto codigo: ',l^.dato.codp, '| Cantidad total: ',l^.dato.cant);
		ImprimirMerge(l^.sig);
	end;
end;


//PP
var v:vector; l:lista2; ok:boolean;
begin
	randomize;
	ok:=false;
	CargarVector(v);
	ImprimirV(v);
	Merge(v,l,ok);
	writeln('----------------------------------------');
	if (ok) then begin
		writeln('Lista merge');
		writeln(' ');
		ImprimirMerge(l);
	end
	else writeln('El vector de listas esta vacio');
end.

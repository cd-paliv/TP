program ej1;

{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de 
las expensas de dichas oficinas.  
Implementar un programa modularizado que: 
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada 
oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa. La 
lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa. 
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la 
oficina. 
}

uses crt;
type
	oficina=record
		cod:integer;
		dni:integer;
		valor:integer;
	end;
	vector=array[1..300] of oficina;

procedure LeerOf (var o:oficina);
begin
	o.cod:=random(305)-5;
	if (o.cod<>-1) then begin
		o.dni:=random(8000)+1;
		o.valor:=random(500)+1;
	end;
end;

//PUNTO A
procedure CargarVector (var v:vector; var dl:integer);
var ofi:oficina;
begin
	LeerOf (ofi);
	while (dl<=300) AND (ofi.cod <> -1) do begin
		dl:=dl+1;
		v[dl]:=ofi;
		LeerOf (ofi);
	end;
end;

procedure Imprimir (v:vector; dl:integer);
var i:integer;
begin
	for i:=1 to dl do
		writeln ('|Oficina cod ', v[i].cod,'| DNI de propietario ', v[i].dni,'| Valor: ',v[i].valor);
end;

//PUNTO B
procedure Ordenar (var v:vector; dl:integer);
var i,j:integer; actual:oficina;
begin
	for i:=2 to dl do begin
		actual:=v[i];
		j:=i-1;
		while (j>0) AND (v[j].cod>actual.cod) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
	writeln ('Vector ordenado');
end;



var v:vector; dl:integer;
begin
	dl:=0;
	CargarVector(v,dl);
	Ordenar(v,dl);
	Imprimir(v,dl);
end.

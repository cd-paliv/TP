program ej10;

{Implementar un programa que contenga: 
 a. Un módulo que lea información de alumnos de Taller de Programación y almacene en 
una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior al 
2000. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la 
búsqueda por dicho criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de 
ingreso. 
 b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de aquellos 
alumnos cuyo legajo sea superior a 12803.  
 c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de aquellos 
alumnos cuyo legajo este comprendido entre 2803 y 6982.  
}

const
	fin=2000;
	v1=6982;
	v2=2803;
	valmin=12803;
type
	alumno=record
		leg:integer;
		ape:string;
		nom:string;
		dni:integer;
		ingr:integer;
	end;
	arbol=^nodo;
	nodo=record
		dato:alumno;
		HI:arbol;
		HD:arbol;
	end;


//PUNTO A.
procedure LeerAlumno(var a:alumno);
begin
	writeln('Ingresar ano de ingreso del alumno');
	read(a.ingr);
	if (a.ingr>fin) then begin
		writeln('Ingresar legajo del alumno');
		readln(a.leg);
		writeln('Ingresar apellido del alumno');
		readln();
		read(a.ape);
		writeln('Ingresar nombre del alumno');
		readln();
		read(a.nom);
		writeln('Ingresar DNI del alumno');
		read(a.dni);
	end;
end;

procedure CrearNodo (var a:arbol; n:alumno);
begin
	if (a=NIL) then begin
		new (a);
		a^.dato:=n; a^.HI:=NIL; a^.HD:=NIL;
		end
	else
		if (n.leg<a^.dato.leg) then CrearNodo(a^.HI,n)
		else if (n.leg>a^.dato.leg) then CrearNodo(a^.HD,n);
end;

procedure GenerarArbol (var a:arbol);
var n:alumno;
begin
	LeerAlumno(n);
	while (n.ingr>fin) AND (n.ingr<>0) do begin
			CrearNodo(a,n);
			LeerAlumno(n);
	end;
end;

//PUNTO B.
procedure LegajoSup (a:arbol);
begin
	if (a<>NIL) then
		if (a^.dato.leg>valmin) then begin
			LegajoSup(a^.HI);
			writeln('|Nombre ', a^.dato.nom, ' |Apellido: ', a^.dato.ape);
			LegajoSup(a^.HD);
		end
		else LegajoSup(a^.HD);
end;

//PUNTO C.
procedure EntreVal (a:arbol);
var aux:integer;
begin
	if (a<>NIL) then
		aux:=a^.dato.leg;
		if (aux>=v1) then
			EntreVal(a^.HI);
			if (aux<=v2) then begin 	//si cumple las dos condiciones me sirve
				writeln('|Nombre ', a^.dato.nom, ' |Apellido: ', a^.dato.ape);
				EntreVal(a^.HD);
			end
		else EntreVal(a^.HD); 	////si es menor a 6982 el hijo der puede estar entre valores
end;


//PP.
var a:arbol;
begin
	randomize;
	writeln('----------------------------------------');
	writeln('Generando  arbol');
	GenerarArbol(a);
	writeln('Cargar finalizada');
	readln();
	writeln('----------------------------------------');
	writeln('Nombres con legajo sup a 12803');
	LegajoSup(a);
	readln();
	writeln('----------------------------------------');
	writeln('Nombres con legajo entre 2803 y 6982');
	EntreVal(a);
end.

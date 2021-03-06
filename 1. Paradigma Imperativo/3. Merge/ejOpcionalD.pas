{*  **********************  ACTIVIDAD ************************
*
*
* El programa intenta dar solución al siguiente enunciado.
* 
* El programa no funciona. Tiene módulos incompletos y errores.
* Solucione y complete el código e manera tal que resuelva el problema. 
* 
* 
* Para confirmar que funciona debe realizar las pruebas necesarias   
* 
* 
* ---------------------------------------------------------------------
* ENUNCIADO
* Una empresa de logistica tiene 3 sucursales. Cada sucursal envía paquetes 
* a diferentes localiades de la Provincia de Bs. As.
* 
* Cada sucursal dispone de un listado de los paquetes enviados ordenada 
* por localidad de destino. De cada paquete se conoce: localidad, peso y 
* costo.
* 
* Se desea totalizar la cantidad de paquetes enviados a cada localidad y 
* el monto total facturado para cada una.
* 
* Se pide: 
*  - Informar para cada localidad cantidad de paquetes y ganancia total.
*  
* ---------------------------------------------------------------------
* 
* --------------------------------------------------------------------
* NOTA
* * Se creo una estructura adicional (nombreLocalidad) para que puedan hacer 
* * un random y puedan probar con strings aleatorios **
* * Es algo opcional, solo para que les facilite las pruebas
* --------------------------------------------------------------------
* 
* 
* 
* }

program Ejercicio;

CONST 
	MAX = 3; //cantidad de sucursales
	
TYPE 
	subrango = 1 .. MAX;
	  
	paquete = record
	  localidad: string;
	  costo: real;
	  peso: integer;
	end; 
	
	lista = ^nodo;
	nodo = record
		dato: paquete;
		sig: lista;
	end;
	
	sucursales = array[subrango] of lista;
	
	
	//Lista nueva
	totalLocalidad = record
	  nombre: string;
	  cantidadPaquetes: integer;
	  ganancia: real;
	end;
		
	listaNueva = ^nodoNuevo;
	nodoNuevo = record
	  dato: totalLocalidad;
	  sig: listaNueva;
	end;




    //Estructura para cargar estantes de manera automatica
	nombreLocalidad = array[1..10] of string;
	



//----------------------------------------------------------------------	
// ---------------CARGA ESTRUCTURA--------------------------------------
 	
procedure generarNombreLocalidad(var nom: nombreLocalidad);
begin
	nom[1] := 'Adrogue';
	nom[2] := 'Burzaco';
	nom[3] := 'Claypole';
	nom[4] := 'Don Orione';
	nom[5] := 'Glew';
	nom[6] := 'Avellaneda';	
	nom[7] := 'Longchamps';
	nom[8] := 'Rafael Calzada';	
	nom[9] := 'La Plata';
	nom[10] := 'General Alvear';
end;	


procedure insertarOrdenado(var L: lista; p: paquete);
var
  act, ant, aux: lista;
begin
   //INSERTAR ORDENADO
	begin
		new(aux);
		aux^.dato:=p;
		aux^.sig:=l;
		if (l=NIL) then
			l:=aux
		  else begin
			  ant:=l; act:=l;
			  while (act<>NIL) AND (act^.dato.localidad<aux^.dato.localidad) do begin
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
end;



procedure cargarPaquetes(var todos: sucursales);
var
	e: subrango;
	i: integer;
	nomLoc: nombreLocalidad;
	p: paquete;
begin
  generarNombreLocalidad(nomLoc);
  randomize;
  for i:= 1 to 20 do begin  // En esta prueba nos aseguramos 20 gastos. Podriamos usar  while posNom <> 0
	e:= random(MAX);
	p.localidad:= nomLoc[random(10)+1];  //random de 1 a 10
	p.costo:= random(1000) + random(); //random sin parametro retorna valores reales enre 0 y 1.
	p.peso:= random(500);
	insertarOrdenado(todos[e], p);
  end;
end;

// ----------------------FIN CARGA ESTRUCTURA---------------------------
//----------------------------------------------------------------------

	
	
procedure inicializar( var todos: sucursales);
var 
	i: subrango;
begin
	for i:= 1 to MAX do
	  todos[i]:= NIL;
end;





//----------------------------------------------------------------------
//--------------------------IMPRIMIR-----------------------------------

procedure imprimirLista(l: lista); //<-- parametro por referencia ¿?  No, por valor
begin
	while(l <> nil) do begin
	  writeln ('- Destino: ', l^.dato.localidad, ' - Peso: ',l^.dato.peso,'kg.  - $', l^.dato.costo:1:2 ); 
	  l:= l^.sig;
	end;
end;

procedure mostrarPaquetes(todos: sucursales); //<-- parametro por referencia ¿? No, por valor
var
	i: subrango;
begin
   writeln('-----------------------------------');	
  writeln('-------- SURCURSALES --------------');	
  writeln('-----------------------------------');	
  writeln(' ');
  for i:= 1 to MAX do begin
	writeln(' -------------- ');
	writeln('SUCURSAL ',i, ' - PAQUETES ');
	writeln(' -------------- ');
	imprimirLista(todos[i]);
	end;
end;


procedure imprimirListaNueva( l: listaNueva);
begin
	while(l <> nil) do begin
	  writeln ('- Destino: ', l^.dato.nombre, ' - Cant: ',l^.dato.cantidadPaquetes,'  - $', l^.dato.ganancia:1:2 ); 
	  l:= l^.sig;
	end;
	writeln(' ---------- ');
end;


//--------------------------FIN IMPRIMIR--------------------------------
//----------------------------------------------------------------------








//------------------------------------------------------------------
//---------------------------MERGE--------------------------------------

procedure AgregarAtras(var L,ult: listaNueva; t: totalLocalidad);
var
	aux: listaNueva;
begin
	//Agregar atras
		new(aux);
		aux^.dato:=t;
		aux^.sig:=NIL;
		if (l=NIL) then l:=aux
		else ult^.sig:=aux;
		ult:=aux;
	end;



procedure determinarMinimo(var todos: sucursales; var pMin: paquete); //todos va por referencia, sino no termina nunca
var
  i, sucMin: subrango;
  
begin
  
  pMin.localidad:= 'ZZZ';
  
for i:= 1 to MAX do
	if(todos[i] <> NIL)then
		if(todos[i]^.dato.localidad < pMin.localidad)then begin
				pMin:= todos[i]^.dato; 
				sucMin:= i;
		end;
	if(pMin.localidad <> 'ZZZ')then
		todos[sucMin] := todos[sucMin]^.sig;
end;





procedure merge(var nuevaL: listaNueva; todos: sucursales); 
var
  pMin: paquete; 
  pActual: totalLocalidad; 
  ult: listaNueva;
begin
  nuevaL:=NIL; ult:=NIL;
  determinarMinimo(todos, pMin);
  
  while(pMin.localidad<>'ZZZ') do begin  
	
	pActual.nombre := pMin.localidad;  
	pActual.ganancia := 0;
	pActual.cantidadPaquetes:= 0;
	
	while(pMin.localidad<>'ZZZ') AND (pActual.nombre = pMin.localidad)do begin // corte de control por nombre de localidad
		pActual.cantidadPaquetes:= pActual.cantidadPaquetes +1; 
		pActual.ganancia := pActual.ganancia + pMin.costo;
		determinarMinimo(todos, pMin);
    end;
    agregarAtras(nuevaL, ult,pActual ); //agrego el total de la localidad que terminé de procesar
  end;
  
end;
//----------------------------FIN MERGE --------------------------------
//----------------------------------------------------------------------	
	
	
	
//----------------------------------------------------------------------
//-------------------------PROG PPAL------------------------------------	
VAR 
		todos : sucursales;
		nuevaL : listaNueva;
BEGIN
	inicializar(todos);
	cargarPaquetes(todos);
	mostrarPaquetes(todos); //no imprime v[3]
	merge(nuevaL, todos);
	writeln(' ');
	writeln(' ');
	writeln('-----------------------------------');
	writeln('    TOTALES POR LOCALIDAD');
	writeln('-----------------------------------');
	imprimirListaNueva(nuevaL); 
	
end.		

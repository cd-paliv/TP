program ej7;

{Realizar un programa que lea números y que utilice un procedimiento recursivo que escriba 
el equivalente en binario de un número decimal. El programa termina cuando el usuario 
ingresa el número 0 (cero).  
Ayuda:  Analizando las posibilidades encontramos que: Binario (N) es N si el valor es 
menor a 2. ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos 
el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa 
debe mostrar: 10111. 
}

procedure Binario (num:integer);
begin
	if (num<2) then write(num)
	else begin
		Binario(num DIV 2);
		write(num MOD 2);
	end;
end;

var n:integer;
begin
	writeln('Ingrese numero');
	readln(n);
	while (n<>0) do begin
		write('Numero binario de ',n,': ');
		Binario(n);
		readln();
		writeln('Ingrese numero |0 para finalizar|');
		readln(n);
	end;
end.

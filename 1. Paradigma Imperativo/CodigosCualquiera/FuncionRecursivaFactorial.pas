program FactorialRecursivo;

function Factorial (n:integer):integer;
begin
	if (n=0) then Factorial:=1
	else
		Factorial:=n*Factorial(n-1);
end;

var n:integer;
begin
	n:=random(10)+1;
	writeln ('El factorial de ',n,' es: ', Factorial(n));
end.

program RandomDecimales;
var i,valor:integer; decimal:real;
begin
	randomize;
	for i:=1 to 10 do begin
		valor:=random(10)+1;
		decimal:=random();
		writeln('El numero random es: ', (valor+decimal):2:2);
	end;
end.

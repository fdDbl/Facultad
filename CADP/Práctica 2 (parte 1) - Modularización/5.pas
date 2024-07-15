program cinco;
var
i:integer; x,y:real;
begin
i:=0;
WriteLn('Ingresar el valor de X:');
ReadLn(x);
repeat
begin
WriteLn('Ingresar el doble de X:');
ReadLn(y);
i:=i+1;
end;
until((y=x*2)or(i=10));
if(y<>(2*x)) then
WriteLn('No se ha ingresado el doble de X')
end.
program cuatro;
var
    x,n:real;
    i:integer;
begin
    readln(x);
    readln(n);
    i := 1;
    while(n <> 2*x) and (i < 10) do begin
        readln(n);
        i := i + 1;
    end;
    if(n <> 2*x) then
        writeln('No se ha ingresado el doble de X');
end.
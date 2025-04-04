program uno;
var
    n1,n2:integer;
begin
    readln(n1);
    readln(n2);
    if(n1 > n2) then
        writeln(n1, ' es mayor que ', n2)
    else if(n2 > n1) then
        writeln(n2, ' es mayor que ', n1)
    else
        writeln('Los números leídos son iguales.');
end.
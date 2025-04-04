program seis;
var
    code:integer;
    precioAct:real;
    precioNuevo:real;
begin
    readln(code);
    readln(precioAct);
    readln(precioNuevo);
    if(precioAct * 1.10 < precioNuevo) then
        writeln('El aumento de precio del producto ',code,' supera el 10% ')
    else
        writeln('El aumento de precio del producto ',code,' NO supera el 10% ');

    while(code <> 32767) do begin
        readln(code);
        readln(precioAct);
        readln(precioNuevo);
        if(precioAct * 1.10 < precioNuevo) then
            writeln('El aumento de precio del producto ',code,' supera el 10% ')
        else
            writeln('El aumento de precio del producto ',code,' NO supera el 10% ');
    end;
end.
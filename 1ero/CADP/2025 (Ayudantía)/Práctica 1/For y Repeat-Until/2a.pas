program dos;
var
    i:integer;
    max:integer;
    num:integer;
    pos:integer;
begin
    max := -1;
    for i := 1 to 10 do begin
        readln(num);
        if(num > max) then begin
            max := num;
            pos := i;
        end;
    end;
    writeln('El mayor numero leido fue el ', max, ' en la posicion ', pos);
end.
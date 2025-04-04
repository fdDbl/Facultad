program ocho;
var
    operador:char;
    num:integer;
    res:integer;
begin
    readln(operador);
    if(operador = '+') or (operador = '-') then begin
        readln(num);
        res := num;
        while(num <> 0) do begin
            readln(num);
            if(operador = '+') then
                res := res + num
            else
                res := res - num;
        end;
        writeln(res);
    end else
        writeln('ERROR');
end.
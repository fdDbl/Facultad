program dos;
var
    i:integer;
    max:integer;
    num:integer;
begin
    max := -1;
    for i := 1 to 10 do begin
        readln(num);
        if(num > max) then
            max := num;
    end;
    writeln('El mayor numero leido fue: ', max);
end.
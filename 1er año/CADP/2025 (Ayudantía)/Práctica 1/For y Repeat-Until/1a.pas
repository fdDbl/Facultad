program uno;
var
    i:integer;
    num:integer;
    suma:integer;
    cantMayores5:integer;
begin
    cantMayores5 := 0;
    suma := 0;
    for i := 1 to 10 do begin
        readln(num);
        suma := suma + num;
        if(num > 5) then
            cantMayores5 := cantMayores5 + 1;
    end;
    writeln(suma);
    writeln(cantMayores5);
end.
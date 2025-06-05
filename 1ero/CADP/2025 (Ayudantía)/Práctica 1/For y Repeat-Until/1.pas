program uno;
var
    i:integer;
    num:integer;
    suma:integer;
    cantMayores5:integer;
begin
    suma := 0;
    // 1.
    for i := 1 to 10 do begin
        readln(num);
        suma := suma + num;
    end;
    writeln(suma);
end.
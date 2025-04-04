program siete;
var
    i:integer;
    c:char;
    cantVocales:integer;
begin
    i := 0;
    cantVocales := 0;
    while(i < 3) do begin
        readln(c);
        if(c = 'a') or 
          (c = 'e') or 
          (c = 'i') or 
          (c = 'o') or 
          (c = 'u') then
            cantVocales := cantVocales + 1;

        i := i + 1;
    end;

    if(cantVocales = 3) then
        writeln('Los tres son vocales')
    else if(cantVocales < 3) then
        writeln('Al menos un carácter no era vocal');
end.
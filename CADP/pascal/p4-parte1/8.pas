program ocho;
type
    vector1 = array[1 .. 10] of integer;
var
    nDecimales:vector1;
    num:integer;
    i:integer;
    ultDigit:integer;
    maxDigit:integer;
begin
    for i := 1 to 10 do 
        nDecimales[i] := 0;

    write('Ingrese un numero: ');
    readln(num);
    while(num<>-1) do begin
        while (num <> 0) do begin
            ultDigit:=num MOD 10;
            nDecimales[ultDigit]:=nDecimales[ultDigit]+1;
            num:=num DIV 10;
        end;
        write('Ingrese un numero: ');
        readln(num);
    end;

    maxDigit:=0;
    for i:= 1 to 10 do
    if(nDecimales[i]>maxDigit) then
        maxDigit:=i;

    for i := 1 to 10 do 
        if(nDecimales[i]<>0) then begin
            writeln('Numero ',i,': ',nDecimales[i],' veces.');
        end;


    writeln('El digito mas leido fue el ',maxDigit,'.');

    writeln('Los digitos que no tuvieron ocurrencias son:');
    for i := 1 to 10 do 
        if(nDecimales[i]=0) then begin
            write(i,' ');
        end;
end.
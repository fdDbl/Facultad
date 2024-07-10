{ a) Realice un procedimiento que reciba como parámetro un número entero y
retorne la cantidad de dígitos impares y la cantidad de dígitos pares que
posee el número recibido. }

program a;
procedure recibir(num: integer; var dIm: integer; var dP: integer);
var
    digit: integer;
begin
    dIm:=0;
    dP:=0;
    while(num <> 0) do begin
        digit:=num mod 10;
        if((digit mod 2)=0) then
            dP:=dP+1
        else
            dIm:=dIm+1;
            num := num div 10;
    end;
end;

{ b) Utilizando el procedimiento definido en a) realice un programa que lea
20 números enteros e informe la cantidad de números que tienen más dígitos
pares que impares. }

var
    i,num,cantDIM,cantDP:integer;
    cantNPI:integer;
begin
    cantNPI:=0;
    for i:= 1 to 5 do begin
        readLn(num);
        recibir(num,cantDIM,cantDP);
        if(cantDP>cantDIM) then
            cantNPI:=cantNPI+1
    end;
    WriteLn('La cantidad de números que tienen más dígitos pares que impares son: ', cantNPI)
end.
program siete;
var
    digit:integer;
    cantD:integer;  
    sumaD:integer;
    int:integer;
    cantTotalD:integer;
    sumaDGlobal:integer;

procedure descomponer(intNumber:integer);
    begin
        cantD:=0;
        sumaD:=0;
        while(intNumber <> 0) do begin
            digit := intNumber MOD 10;
            sumaD:=sumaD+digit;
            cantD:=cantD+1;
            intNumber := intNumber div 10;
        end;
        WriteLn('Cantidad de digitos: ',cantD);
        WriteLn('Suma de digitos: ',sumaD);
    end;

procedure secuencia(intNumber:integer);
    begin
        cantTotalD:=0;
        sumaDGlobal:=0;
        repeat
            readln(int);
            descomponer(int);
            cantTotalD:=cantTotalD+cantD;
            sumaDGlobal:=sumaDGlobal+sumaD;
        until(sumaDGlobal=10);
        WriteLn('');
        WriteLn('Cantidad total de digitos: ',cantTotalD);
        WriteLn('Suma total de digitos: ',sumaDGlobal);
    end;

begin
    secuencia(int)
end.

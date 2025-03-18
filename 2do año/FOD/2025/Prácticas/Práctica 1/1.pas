program uno;
var
    aE:file of integer;
    nomFisico:string;
    num:integer;
begin
    writeln('Ingrese el nombre del archivo: '); readln(nomFisico);
    assign(aE,nomFisico);
    rewrite(aE); reset(aE);
    writeln('Ingrese numeros (<>30000): ');
    readln(num);
    while(num <> 30000) do begin
        write(aE,num);
        readln(num);
    end;
    close(aE);
end.
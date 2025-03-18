program dos;
type
    archivoEnteros = file of integer;
procedure imprimirMenores1500(var aE:archivoEnteros);
var
    num:integer;
begin
    reset(aE);
    writeln('Contenido menor a 1500:');
    while(not EOF(aE)) do begin
        read(aE,num);
        if(num < 1500) then
            writeln(num);
    end;
    close(aE);
end;
procedure listarContenido(var aE:archivoEnteros);
var
    num:integer;
begin
    reset(aE);
    writeln('Listado de contenido:');
    while(not EOF(aE)) do begin
        read(aE,num);
        writeln(num);
    end;
    close(aE);
end;
var
    aE:archivoEnteros; archivoF:string;
begin
    writeln('Ingrese el nombre del archivo a listar:');
    readln(archivoF);
    assign(aE,archivoF);
    imprimirMenores1500(aE);
    listarContenido(aE);
end.
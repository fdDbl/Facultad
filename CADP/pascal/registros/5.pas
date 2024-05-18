program autos;
type
        automoviles = record
        marca : string;
        modelo : string;
        precio : real;
    end;
var
    vehiculo:automoviles;
    marcaMasCara:string;
    modMasCaro:string;
procedure leer(var auto: automoviles);
var
    marcaActual:string;
    nAuto:integer;
    maxPrecio:real;
    pTotalPorMarca:real;
    promedio:real;
begin
    maxPrecio:=0;
    write('Ingrese la marca del auto: ');
    readln(auto.marca);
    while(auto.marca<>'ZZZ') do begin
        marcaActual:=auto.marca;
        nAuto:=0;
        pTotalPorMarca:=0;
        while(auto.marca=marcaActual) do begin
            write('Ingrese el modelo del auto: ');
            readln(auto.modelo);
            write('Ingrese el precio del auto: ');
            readln(auto.precio);
            nAuto:=nAuto+1;
            pTotalPorMarca:=pTotalPorMarca+auto.precio;
            if(auto.precio>maxPrecio) then begin
                    marcaMasCara:=auto.marca;
                    modMasCaro:=auto.modelo;
                end;
            write('Ingrese la marca del auto: ');
            readln(auto.marca);
            end;
        promedio:=(pTotalPorMarca/nAuto);
        writeln('El precio promedio de la marca ',marcaActual,' es: ',promedio);
        end;
    writeln('Marca del auto mas caro: ',marcaMasCara,', modelo: ',modMasCaro);
end;
begin
    leer(vehiculo);
end.
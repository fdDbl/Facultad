program tres;
type
    empleado = record
        nro:integer;
        nombre:string;
        apellido:string;
        edad:integer;
        dni:integer;
    end;
    archivoEmpleados = file of empleado;
procedure leer(var e:empleado);
begin
    write('Nro: '); readln(e.nro);
    write('Nombre: '); readln(e.nombre);
    write('Apellido: '); readln(e.apellido);
    if(e.apellido <> 'fin') then begin
        write('Edad: '); readln(e.edad);
        write('DNI: '); readln(e.dni);
    end;
end;
procedure cargarArchivo(var aE:archivoEmpleados);
var
    e:empleado;
begin
    reset(aE);
    leer(e);
    while(e.apellido <> 'fin') do begin
        write(aE,e);
        leer(e);
    end;
    close(aE);
end;
procedure imprimirEmpleado(e:empleado);
begin
    writeln(e.nro,', ',e.nombre,', ',e.apellido,', ',e.edad,', ',e.dni,'.');
end;
procedure listarNomAp(var aE:archivoEmpleados);
var
    nom,ap:string; e:empleado;
begin
    writeln('Ingrese un nombre y apellido:');
    readln(nom); readln(ap);
    reset(aE);
    writeln('Empleados con ese nombre o apellido:');
    while(not EOF(aE)) do begin
        read(aE,e);
        if(e.nombre = nom) or (e.apellido = ap) then
            imprimirEmpleado(e);
    end;
    close(aE);
end;
procedure listarDeAUno(var aE:archivoEmpleados);
var
    e:empleado;
begin
    reset(aE);
    writeln('Todos los empleados:');
    while(not EOF(aE)) do begin
        read(aE,e);
        imprimirEmpleado(e);
    end;
    close(aE)
end;
procedure listarMayores70(var aE:archivoEmpleados);
var
    e:empleado;
begin
    reset(aE);
    writeln('Empleados mayores de 70:');
    while(not EOF(aE)) do begin
        read(aE,e);
        if(e.edad > 70) then
            imprimirEmpleado(e);
    end;
    close(aE);
end;
procedure agregarAlFinal(var aE:archivoEmpleados);
begin

end;
var
    aE:archivoEmpleados; nomArc:string;
begin
    write('Ingrese el nombre del archivo: '); readln(nomArc);
    assign(aE,nomArc);
    rewrite(aE);
    cargarArchivo(aE);
    listarNomAp(aE);
    listarDeAUno(aE);
    listarMayores70(aE);
    agregarAlFinal(aE);
end.
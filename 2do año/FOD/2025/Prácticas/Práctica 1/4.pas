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
    e:empleado; nomArc: string;
begin
    writeln('----- NUEVO ARCHIVO -----');
    write('Ingrese el nombre del archivo: '); readln(nomArc);
    assign(aE,nomArc);
    rewrite(aE);
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
    nomap:string; e:empleado;
begin
    writeln('Ingrese un nombre o apellido:');
    readln(nomap);
    reset(aE);
    writeln('Empleados con ese nombre o apellido:');
    while(not EOF(aE)) do begin
        read(aE,e);
        if(e.nombre = nomap) or (e.apellido = nomap) then
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
function menu1():integer;
var
    opt:integer;
begin
    writeln('----- MENU DE OPCIONES -----');
    writeln('1. Nuevo archivo');
    writeln('2. Abrir archivo');
    readln(opt);
    menu1:= opt;
end;
function menu2():integer;
var
    opt:integer;
begin
    writeln('----- ABRIR ARCHIVO -----');
    writeln('1. Listar empleados con determinado nombre o apellido');
    writeln('2. Listar todos los empleados');
    writeln('3. Listar empleados mayores de 70');
    writeln('4. Agregar empleado/s al final del archivo');
    writeln('5. Modificar edad de un empleado');
    writeln('6. Exportar todos los empleados a un archivo de texto');
    writeln('7. Exportar empleados con DNI distinto de 00');
    readln(opt);
    menu2:= opt;
end;
function existe(var aE:archivoEmpleados; nro:integer): boolean;
var
    e:empleado; ok:boolean;
begin
    ok:=false;
    reset(aE);
    while(not EOF(aE))and(not ok) do begin
        read(aE,e);
        if(e.nro = nro) then
            ok:=true;
    end;
    close(aE);
    existe:=ok;
end;
procedure agregarAtras(var aE:archivoEmpleados);
var
    cant:integer; i:integer; e:empleado;
begin
    writeln('----- AGREGAR EMPLEADO/S AL FINAL DEL ARCHIVO -----');
    write('¿Cuantos empleados desea agregar?: '); readln(cant);
    for i:= 1 to cant do begin
        leer(e);
        while(existe(aE,e.nro)) do begin
            writeln('ERROR: nro de empleado ya existente. Intente con otro');
            leer(e);
        end;
        reset(aE);
        seek(aE,filesize(aE));
        write(aE,e);
        close(aE);
    end;
end;
procedure modificarEdad(var aE:archivoEmpleados);
var
    nro:integer; e:empleado; edad:integer; encontre:boolean;
begin
    writeln('----- MODIFICAR EDAD DE UN EMPLEADO -----');
    write('Ingrese el nro de empleado a modificar su edad: '); readln(nro);
    if(existe(aE,nro)) then begin
        reset(aE);
        encontre:=false;
        while(not EOF(aE))and(not encontre) do begin
            read(aE,e);
            if(e.nro = nro) then begin
                encontre:=true;
                write('Ingrese la nueva edad de ',e.nombre,' (edad actual: ',e.edad,'): '); readln(edad);
                e.edad:=edad;
                seek(aE, filePos(aE)-1);
                write(aE,e);
            end;
        end;
        close(aE);
    end else
        writeln('Empleado no encontrado');
end;
procedure exportarTodos(var aE:archivoEmpleados);
var
    aTexto:text; e:empleado;
begin
    assign(aTexto,'todos_empleados.txt');
    rewrite(aTexto);
    reset(aE);
    while(not EOF(aE)) do begin
        read(aE,e);
        writeln(aTexto,'NRO: ',e.nro,', Nombre: ',e.nombre,', Apellido: ',e.apellido,', Edad: ',e.edad,', DNI: ',e.dni,'.');
    end;
    close(aE); close(aTexto);
end;
procedure exportarSinDNI(var aE:archivoEmpleados);
var
    aSinDNI:text; e:empleado;
begin
    assign(aSinDNI,'faltaDNIEmpleado.txt');
    rewrite(aSinDNI);
    reset(aE); reset(aSinDNI);
    while(not EOF(aE)) do begin
        read(aE,e);
        if(e.dni = 00) then
            write(aSinDNI,'NRO: ',e.nro,', Nombre: ',e.nombre,', Apellido: ',e.apellido,', Edad: ',e.edad,', DNI: ',e.dni,'.');
    end;
end;
procedure abrirArchivo(var aE:archivoEmpleados);
var
    nomArc:string;
begin
    write('Ingrese el nombre del archivo a abrir (con su extension): '); readln(nomArc);
    assign(aE,nomArc);
    case menu2() of
        1: listarNomAp(aE);
        2: listarDeAUno(aE);
        3: listarMayores70(aE);
        4: agregarAtras(aE);
        5: modificarEdad(aE);
        6: exportarTodos(aE);
        7: exportarSinDNI(aE);
    else
        writeln('Opcion incorrecta.');
    end;
end;
procedure menuPrincipal(var aE:archivoEmpleados);
begin
    while(true) do
        case menu1() of
            1: cargarArchivo(aE);
            2: abrirArchivo(aE);
        else
            writeln('Opcion incorrecta.');
        end;
end;
var
    aE:archivoEmpleados;
begin
    menuPrincipal(aE);
end.
program atletismo;
type
    alumno = record
        nombre:string;
        dni:integer;
        tiempo:real;
    end;
    
    arbol = ^nodo;
    nodo = record
        dato:alumno;
        HI,HD:arbol;
    end;

procedure leer(var a:alumno);
begin
    writeln('NOMBRE:');
    readln(a.nombre);
    writeln('DNI:');
    readln(a.dni);
    if(a.dni <> 0) then begin
        writeln('TIEMPO:');
        readln(a.tiempo);
    end;
end;

procedure agregarArbol(var a:arbol; alu:alumno);
begin
    if(a=nil) then begin
        new(a);
        a^.dato:=alu;
        a^.HI:=nil; a^.HD:=nil;
    end else
    if(alu.dni <= a^.dato.dni) then
        agregarArbol(a^.HI, alu)
    else agregarArbol(a^.HD, alu);
end;

procedure cargarArbolAlumnos(var a:arbol);
var
    alu:alumno;
    i:integer;
begin
    i:=1;
    writeln('---------- CARGA DE ALUMNOS ----------');
    writeln('----- ALUMNO ',i,' -----');
    leer(alu);
    while(alu.dni <> 0) do begin
        agregarArbol(a,alu);
        i:=i+1;
        writeln('----- ALUMNO ',i,' -----');
        leer(alu);
    end;
end;

function alumnosEnRango(a:arbol;r1,r2:real):lista;
begin

end;

var
    a : arbol;
    rango1,rango2:real;
begin
    a := nil;
    cargarArbolAlumnos(a);
    writeln('----- MINIMO DEL RANGO -----');
    readln(rango1);
    writeln('----- MAXIMO DEL RANGO -----');
    readln(rango2);
    alumnosEnRango(a,rango1,rango2);
end.

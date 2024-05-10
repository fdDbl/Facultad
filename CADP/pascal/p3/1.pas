// 1) a.
program Registros;
type
        str20 = string[20];
        alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
    end; 
var
    a : alumno;
    cantA: integer;
    maxPromedio: real;
    nombreMaxPromedio: str20;
procedure analizar(var maxProm:real; var nomMaxProm:str20);
begin
    if(a.promedio > maxProm) then begin 
        maxProm:=a.promedio;
        nomMaxProm:=a.nombre;
    end;
end;

procedure leer(var alu : alumno);
begin
    write('Ingrese el codigo del alumno: ');
    readln(alu.codigo);
    if (alu.codigo <> 0) then begin
        write('Ingrese el nombre del alumno: ');
        readln(alu.nombre);
        write('Ingrese el promedio del alumno: ');
        readln(alu.promedio);
        analizar(maxPromedio,nombreMaxPromedio);
    end;
end;


begin
    maxPromedio:=0;
    cantA:=0;
    leer(a);
    while(a.codigo <> 0) do begin
        leer(a);
        cantA:=cantA+1;
    end;
    writeln('Alumno con mejor promedio: ',nombreMaxPromedio);
    writeln(cantA);
end.
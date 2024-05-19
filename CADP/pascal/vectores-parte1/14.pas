program catorce;
const
    dimF1 = 3;
type
    registro1 = record
        pais : string;
        codeProyecto : integer;
        proyecto : string;
        codeRol : integer;
        rol : string;
        horas : real;
        salario : real;
    end;
    vector1 = array[1 .. dimF1] of registro1;
var
    tEmpleados : registro1;
    vEmpleados : vector1;
    i : integer;
procedure convertir(vectorEmp:vector1);
begin
    if(vectorEmp[i].codeRol = 1) then begin
        vectorEmp[i].rol:='Analista funcional';
        vectorEmp[i].salario:=vectorEmp[i].horas * 35.20;
        end
        else if(vectorEmp[i].codeRol = 2) then begin
            vectorEmp[i].rol:='Programador';
            vectorEmp[i].salario:=vectorEmp[i].horas * 27.45;
        end
        else if(vectorEmp[i].codeRol = 3) then begin
            vectorEmp[i].rol:='Administrador de bases de datos';
            vectorEmp[i].salario:=vectorEmp[i].horas * 31.03;
        end
        else if(vectorEmp[i].codeRol = 4) then begin
            vectorEmp[i].rol:='Arquitecto de software';
            vectorEmp[i].salario:=vectorEmp[i].horas * 44.28;
        end
        else if(vectorEmp[i].codeRol = 5) then begin
            vectorEmp[i].rol:='Administrador de redes y seguridad';
            vectorEmp[i].salario:=vectorEmp[i].horas * 39.87;
        end;
end;

procedure leer(vectorEmp:vector1);
var
    i : integer;
    ok : boolean;
begin
    i := 1;
    ok := true;
    writeln('Por favor, ingrese la información de los desarrolladores de 2017:');
    while (ok) and (i <= dimF1) do begin
        writeln('Pais de residencia: '); readln(vectorEmp[i].pais);
        writeln('Codigo de proyecto: '); readln(vectorEmp[i].codeProyecto);
        if(vectorEmp[i].codeProyecto <> -1) then begin
            ok:=true;
            writeln('Nombre de proyecto: '); readln(vectorEmp[i].proyecto);
            writeln('Codigo de rol: '); readln(vectorEmp[i].codeRol);
            writeln('Horas trabajadas: '); readln(vectorEmp[i].horas);
            convertir(vectorEmp);
            i := i + 1;
        end
        else
            ok:=false;
        end;
    end;
begin
    leer(vEmpleados);
end.
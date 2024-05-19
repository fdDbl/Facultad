program catorce;
const
    dimF1 = 1000;
type
    registro1 = record
        pais : string;
        codeProyecto : integer;
        proyecto : string;
        montoProyecto : real;
        codeRol : integer;
        rol : string;
        horas : integer;
        salario : real;
    end;
    vector1 = array[1 .. dimF1] of registro1;
var
    tEmpleados : registro1;
    vEmpleados : vector1;
    i : integer;
    dimL : integer;
    dimP : integer;

procedure convertir(var vectorEmp : vector1);
begin
    if(vectorEmp[i].codeRol = 1) then begin
        vectorEmp[i].rol := 'Analista funcional';
        vectorEmp[i].salario := (vectorEmp[i].horas * 35.20);
        end
        else if(vectorEmp[i].codeRol = 2) then begin
            vectorEmp[i].rol := 'Programador';
            vectorEmp[i].salario := (vectorEmp[i].horas * 27.45);
        end
        else if(vectorEmp[i].codeRol = 3) then begin
            vectorEmp[i].rol := 'Administrador de bases de datos';
            vectorEmp[i].salario := (vectorEmp[i].horas * 31.03);
        end
        else if(vectorEmp[i].codeRol = 4) then begin
            vectorEmp[i].rol := 'Arquitecto de software';
            vectorEmp[i].salario := (vectorEmp[i].horas * 44.28);
        end
        else if(vectorEmp[i].codeRol = 5) then begin
            vectorEmp[i].rol := 'Administrador de redes y seguridad';
            vectorEmp[i].salario := (vectorEmp[i].horas * 39.87);  
        end;
end;

procedure leer(var vectorEmp : vector1);
var
    ok : boolean;
begin
    i := 1;
    ok := true;
    writeln('Por favor, ingrese la informacion de los desarrolladores de 2017:');
    while (ok) and (i <= dimF1) do begin
        writeln('Pais de residencia: '); readln(vectorEmp[i].pais);
        writeln('Codigo de proyecto (1 - 1000): '); readln(vectorEmp[i].codeProyecto);
        if(vectorEmp[i].codeProyecto <> -1) then begin
            ok := true;
            dimL := i;
            writeln('Nombre de proyecto: '); readln(vectorEmp[i].proyecto);
            writeln('Codigo de rol (1 - 5): '); readln(vectorEmp[i].codeRol);
            writeln('Horas trabajadas: '); readln(vectorEmp[i].horas);
            convertir(vectorEmp);
            i := i + 1;
        end
        else
            ok := false;
        end;
    end;

function inversionArg(vectorEmp:vector1) : real;
var
  cantInvert : real;
  pais : string;
begin
    pais := 'argentina';
    cantInvert := 0;
    for i := 1 to dimL do begin
        if(vectorEmp[i].pais = pais) then begin
            cantInvert := (cantInvert + vectorEmp[i].salario);
        end;
    end;
    inversionArg := cantInvert;
end;

function horasAdmins(vectorEmp : vector1) : integer;
var
    cantHoras : integer;
begin
    cantHoras := 0;
    for i := 1 to dimL do begin
        if(vectorEmp[i].rol = 'Administrador de bases de datos') then
            cantHoras := cantHoras + vectorEmp[i].horas;
    end;
    horasAdmins := cantHoras;
end;

function menorMonto(vectorEmp : vector1) : integer;
var
    min : real;
    code : integer;
begin
    min := 9999999;
    for i := 1 to dimL do begin
        if(vectorEmp[i].salario < min) then begin
            min := vectorEmp[i].salario;
            code := vectorEmp[i].codeProyecto;
        end;    
    end;
    menorMonto := code;
end;

procedure arquiProyects(vectorEmp:vector1);
type
    vProyectos = array[1 .. 1000] of integer;
var
    vectorProyectos : vProyectos;
    codePActual : integer;
begin
    for i := 1 to 1000 do begin
        vectorProyectos[i] := 0;
    end;
    for i := 1 to dimL do begin
        if(vectorEmp[i].codeRol = 4) then begin
            codePActual := vectorEmp[i].codeProyecto;
            vectorProyectos[codePActual] := vectorProyectos[codePActual] + 1;
        end;
    end;

    writeLn('La cantidad de Arquitectos de software de cada proyecto es:');
    for i := 1 to 1000 do begin
        writeLn('Proyecto ',i,': ',vectorProyectos[i],' arquitecto(s) de software.')
    end;
end;

procedure informar(vectorEmp:vector1);
var
    funcInvert : real;
    funcHoras : integer;
    funcMin : integer;
begin
    funcInvert := inversionArg(vectorEmp);
    writeLn('El monto total invertido en desarrolladores con residencia en Argentina es de: $', funcInvert); writeLn('');

    funcHoras := horasAdmins(vectorEmp);
    writeLn('La cantidad total de horas trabajadas por Administradores de bases de datos son: ', funcHoras, ' horas'); writeLn('');

    funcMin := menorMonto(vectorEmp);
    writeLn('El codigo del proyecto con menor monto invertido es: ', funcMin); writeLn('');

    arquiProyects(vectorEmp);
end;

begin
    leer(vEmpleados);
    informar(vEmpleados);
end.
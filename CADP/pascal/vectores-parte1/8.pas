program ocho;
const
    dimF = 2;
type
    alu = record
        nro: integer;
        dni: integer;
        apellido: string;
        nombre: string;
        ano: integer;
    end;

    vector1 = array[1 .. dimF] of alu;
procedure cargarDatos(var aluVector:vector1);
var
    i:integer;
begin
    for i:= 1 to dimF do
    begin
        write('Nombre: '); readln(aluVector[i].nombre);
        write('Apellido: '); readln(aluVector[i].apellido);
        write('Nro de inscripcion: '); readln(aluVector[i].nro);
        write('DNI: '); readln(aluVector[i].dni);
        write('Año de nacimiento: '); readln(aluVector[i].ano);
    end;
end;
function porcentaje(aluVector:vector1):real;
var
    ultDigit:integer;
    cantDigitPares:integer;
    cantDigitTotal:integer;
    dni:integer;
    cantAluPares:integer;
    porc:real;
    i:integer;
begin
    cantAluPares:=0;
    for i:= 1 to dimF do
    begin
        cantDigitPares:=0;
        cantDigitTotal:=0;
        dni:=aluVector[i].dni;
        while(dni <> 0) do begin
            ultDigit:=dni MOD 10;
            cantDigitTotal:=cantDigitTotal+1;
            if(ultDigit MOD 2 = 0) then
                begin
                    cantDigitPares:=cantDigitPares+1;
                end;
            dni:= dni DIV 10;
        end;
        if(cantDigitPares=cantDigitTotal) then
            begin
                cantAluPares:=cantAluPares+1;
            end;
    end;
    porc:=(cantAluPares * 100)/dimF;
    porcentaje:=porc;
end;
procedure mayorEdad(aluVector:vector1);
var
    edad,mayorEdad1,mayorEdad2:integer;
    apMayorEdad1,apMayorEdad2,nomMayorEdad1,nomMayorEdad2:string;
    i:integer;
begin
    mayorEdad1:=0;
    mayorEdad2:=0;
    for i:= 1 to dimF do
    begin
        edad:=2024-aluVector[i].ano;
        if(edad>mayorEdad1) then begin
            nomMayorEdad1:=aluVector[i].nombre;
            apMayorEdad1:=aluVector[i].apellido;
            mayorEdad1:=edad;
        end
        else if(edad>mayorEdad2) then begin
            nomMayorEdad2:=aluVector[i].nombre;
            apMayorEdad2:=aluVector[i].apellido;
            mayorEdad2:=edad;
        end;
    end;
    writeln('El primer alumno con mayor edad es: ',nomMayorEdad1,' ',apMayorEdad1);
    writeln('El segundo alumno con mayor edad es: ',nomMayorEdad2,' ',apMayorEdad2);
end;
var
    v1:vector1;
    prc:real;
begin
    cargarDatos(v1);
    prc:=porcentaje(v1);
    writeln(prc);
    mayorEdad(v1);
end.
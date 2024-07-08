{ La cátedra de CADP necesita un programa para generar el listado 
de alumnos ingresantes que rendirán el parcial. Para ello, la cátedra 
DISPONE de un listado con todos alumnos que ingresaron este año a la 
facultad. De cada alumno se conoce su DNI, nombre y apellido, nota 
obtenida en curso de ingreso (entre 4 y 10), turno (entre 1 y 4) y 
si estuvo presente o ausente en cada una de las 12 clases de práctica.
a) Realizar un módulo que reciba la información de los alumnos y 
retorne una nueva estructura de datos que contenga sólo aquellos 
alumnos que podrán rendir el parcial. Para poder rendir el parcial, 
los alumnos deben contar con al menos 8 asistencias en las 12 clases 
de práctica.
b) Realizar un módulo que reciba la estructura de datos generada en 
el inciso anterior, e IMPRIMA en pantalla:
1) Apellido y nombre y el DNI de los alumnos que hayan obtenido nota 
8 o superior en el ingreso
2) Turno con mayor cantidad de alumnos en condiciones de rendir el 
examen.
3) Cantidad de alumnos que no posean ningún dígito cero en su DNI.
NOTA: Implementar el programa principal. }

program repaso;
const
    cClases = 12;
type
    sNotaIng = 4..10;
    sTurnos = 1..4;
    vClasesPracticas = array[1..cClases] of boolean;
    alumno = record
        dni : integer;
        nomyap : string;
        notaIng : sNotaIng;
        turno : sTurnos;
        estuvoPresente : vClasesPracticas;
    end;
    listaAlumnos = ^nodo;
    nodo = record
        dato : alumno;
        sig : lista;
    end;
    vectorTurnos = array[sTurnos] of integer;

procedure agregarNodos(var L:listaAlumnos; a:alumno);
var
    nuevo:listaAlumnos;
begin
    new(nuevo);
    nuevo^.dato:=a;
    nuevo^.sig:=L;
    L:=nuevo;
end;
function cumple(vPresentes:vClasesPracticas):boolean;
var
    ok:boolean;
    i:integer; cantClasesPresente:integer;
begin
    ok:=false;
    cantClasesPresente:=0;
    for i := 1 to cClases do
        if(vPresentes[i]) then
            cantClasesPresente:=cantClasesPresente+1;
    if(cantClasesPresente >= 8) then ok:=true;
end;
procedure cargarNuevaLista(L1:listaAlumnos;var L2:listaAlumnos);
var
    a:alumno;
begin
    L2:=nil;
    while(L1 <> nil) do begin
        a:=L1^.dato;
        if(cumple(a.estuvoPresente)) then
            agregarNodos(L2,a);
        L1:=L1^.sig;
    end;
end;
procedure cumplePunto1(a:alumno);
begin
    if(a.notaIng >= 8) then
        writeLn(a.nomyap,a.dni);
end;
procedure iniVectorTurnos(var v:vectorTurnos);
var
    i:integer;
begin
    for i := 1 to 4 do v[i] := 0;
end;
function cumplePunto3(dni:integer):boolean;
var
    ultDigit:integer; ok:boolean;
begin
    ok := true;
    while(dni <> 0) and (ok) do begin
        ultDigit:=dni MOD 10;
        if(ultDigit <> 0) then dni:=dni DIV 10
        else ok := false;
    end;
    cumplePunto3:=ok;
end;
procedure informarTurnos(v:vectorTurnos);
var
    i:integer; max:integer; maxTurno:integer;
begin
    max:=-1;
    for i := 1 to 4 do
        if(v[i] > max) then begin
            max:=v[i];
            maxTurno:=i;
        end;
    writeLn(maxTurno);
end;
procedure recorrerNuevaLista(L:listaAlumnos);
var
    vTurnos:vectorTurnos;
    cantDNISinCero:integer;
begin
    cantDNISinCero := 0;
    iniVectorTurnos(vTurnos);
    while(L <> nil) do begin
        cumplePunto1(L^.dato);
        vTurnos[L^.dato.turno] := vTurnos[L^.dato.turno]+1;
        if(cumplePunto3(L^.dato.dni)) then cantDNISinCero := cantDNISinCero +1;
        L := L^.sig;
    end;
    informarTurnos(vTurnos);
    writeLn(cantDNISinCero);
end;
var
    L1,L2:listaAlumnos;
begin
    cargarListaAlumnos(L1); {SE DISPONE}
    cargarNuevaLista(L1,L2); {PUNTO A}
    L2:=nil;
    recorrerNuevaLista(L2); {PUNTO B}
end.
program futbol;
const
    cF = 27;
    cE = 28;
type
    sCode = 1..cE;
    sCalif = 1..10;
    vCalifFechas = array[1..cF] of sCalif; {SE DISPONE}
    vEquiposMas35 = array[sCode] of integer;

    jugador = record
        cod : integer;
        apynom : string;
        codEquipo : sCode;
        anioNac : integer;
        cFechas : vCalifFechas;
    end;

    lista = ^nodo;
    nodo = record
        dato : jugador;
        sig : lista;
    end;

procedure cargarLista(var pI:lista);
var
    j:jugador
begin
    {SE DISPONE}
end;

procedure iniVEquipos35(var v:vEquiposMas35);
var
    i:integer;
begin
    for i := 1 to cE do
        v[i] := 0;
end;
procedure cantJMayores35(L:lista;var v:vEquiposMas35);
var
    anioNac,edadActual:integer;
    equipoActual : sCode;
begin
    anioNac := L^.dato.anioNac;
    edadActual := 2024 - anioNac;
    equipoActual := L^.dato.codEquipo;
    if(edad > 35) then
        v[equipoAct] := v[equipoAct]+1;
end;

function cantFechasJugadas(fechas:vCalifFechas):integer;
var
    ok:boolean;
    i:integer;
    cantFechas:integer;
begin
    cantFechas := 0;
    for i := 1 to cF do begin
        if(fechas[i] <> 0) then
            cantFechas:=cantFechas+1;
    end;
    cantFechasJugadas := cantFechas;
end;
function calcularPromedio(L:lista,cantFechas:integer):real;
var
    prom:real;
    totalCal:integer;
    i:integer;
begin
    totalCal:=0;
    i:=1;
    while(i < cF) do begin
        if(L^.dato.cFechas[i] <> 0) then
            totalCal:=totalCal+L^.dato.cFechas[i];
        i:=i+1;
    end;
    prom := totalCal / cantFechas;
    calcularPromedio := prom;
end;
procedure top2jugadores(L:lista;prom:real;var cod1,cod2:integer;var mejorProm1,mejorProm2:real);
begin
    if(prom > mejorProm1) then begin
        mejorProm2 := mejorProm1;
        mejorProm1 := prom;
        cod1 := L^.dato.cod;
    end
    else if(prom > mejorProm2) then begin
        mejorProm2 := prom;
        cod2 := L^.dato.cod;
    end;
end;
procedure puntoB(L:lista;var cod1,cod2:integer;var mejorProm1,mejorProm2:real);
var
    cantFechas : integer;
    prom : real;
begin
    cantFechas:=cantFechasJugadas(L^.dato.cFechas);
    if(cantFechas>14) then begin
        prom := calcularPromedio(L,cantFechas);
        top2jugadores(L,prom,cod1,cod2,mejorProm1,mejorProm2);
    end;
end;
procedure recorrer(L:lista; var v1:vEquiposMas35);
var
    codMejCal1,codMejCal2:integer;
    mejProm1,mejProm2:real;
begin
    MejProm1:=-1;
    MejProm2:=-1;
    iniVEquipos35(v1);
    while(L <> nil) do begin
        cantJMayores35(L,v1);
        puntoB(L,codMejCal1,codMejCal2,mejProm1,mejProm2);
        L:=L^.sig;
    end;
end;

var
    L:lista;
    v1:vEquiposMas35;
begin
    L:=nil;
    cargarLista(L);
    recorrer(L,v1);
    generarListaPuntoC();
end.
program p;
const
    cP = 200;
type
    sP = 1 .. cP;
    vP = array[sP] of string;
    vCantR = array[sP] of integer;
    repuesto = record
        cod:integer;
        precio:real;
        codP:sp;
    end;
    vPunto2 = array[sP] of real;
    lista = ^nodo;
    nodo = record
        dato:repuesto;
        sig:lista;
    end;
procedure nomPaises(var vector:vP);
begin
    {SE DISPONE}
end;
procedure leer(var r:repuesto);
begin
    writeLn('Codigo de repuesto:'); readLn(r.cod);
    if(r.cod <> -1) then begin
        writeLn('Precio de repuesto:'); readLn(r.precio);
        writeLn('Codigo de pais:'); readLn(r.codP);
    end;
end;
procedure agAdelante(var pI:lista; r:repuesto);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=r;
    if(pI = nil) then
        pI:=nuevo
    else begin
        nuevo^.sig:=pI;
        pI:=nuevo;
    end;
end;
procedure cargar(var L:lista);
var
    r:repuesto;
begin
    leer(r);
    while(r.cod <> -1) do begin
        agAdelante(L,r);
        leer(r);
    end;
end;

procedure iniVCantR(var vector:vCantR);
var
    i:integer;
begin
    for i := 1 to cP do
        vector[i] := 0;
end;
procedure cantRxPaisyTotal(L:lista;var v:vCantR;var cantT : integer);
begin
    v[L^.dato.codP] := v[L^.dato.codP] + 1;
    cantT:=cantT+1;
end;
procedure iniRMinimos(var v:vPunto2);
var
    i:integer;
begin
    for i := 1 to cP do
        v[i]:=-1;
end;
procedure analizarPais(L:Lista;var v:vPunto2);
var
    paisActual:integer; precioActual:real;
begin
    paisActual:=L^.dato.codP;
    precioActual:=L^.dato.precio;
    if(precioActual > v[paisActual]) then
        v[paisActual]:=precioActual;
end;
procedure repTresCeros(L:lista;var cant:integer);
var
    code,ultDigit,cantCeros:integer;
begin
    code:=L^.dato.cod;
    cantCeros:=0;
    while(code <> 0) and (cantCeros < 3) do begin
        ultDigit:=code MOD 10;
        if(ultDigit = 0) then
            cantCeros:=cantCeros+1;
        if(cantCeros >= 3) then
            cant:=cant+1;
        code:=code DIV 10;
    end;
end;
procedure informarP1(v1:vCantR;cantRepuestos:integer);
var
    prom:real;
    cantCumple:integer;
    i:integer;
begin
    cantCumple:=0;
    prom:=cantRepuestos/cP;
    for i := 1 to cP do begin
        if(v1[i] < prom) then
            cantCumple:=cantCumple+1;
    end;
    writeLn('Cantidad de países para los que la cantidad de repuestos comprados es menor que el promedio de repuestos comprados a todos los países: ',cantCumple);
end;
procedure NyPMasCaros(v:vPunto2;vNombres:vP);
var
    nomPais:string;
    i:integer;
    pMasCaro:real;
begin
    for i := 1 to cP do begin
        nomPais:=vNombres[i];
        pMasCaro:=v[i];
        writeLn('El repuesto mas caro de ',nomPais,' vale: ',pMasCaro);
    end;
end;
procedure informarP3(cant:integer);
begin
    writeLn('Cantidad de repuestos que poseen al menos 3 ceros en su codigo: ',cant);
end;
procedure recorrerLista(L:lista; var vector1:vCantR; var vector2:vPunto2; vNom:vP);
var
    LInicial:lista;
    cantRTotal:integer;
    cantRepTresCeros:integer;
begin
    LInicial:=L;
    iniVCantR(vector1);
    iniRMinimos(vector2);
    cantRTotal := 0;
    cantRepTresCeros:=0;
    while(L <> nil) do begin
        cantRxPaisyTotal(L,vector1,cantRTotal);
        analizarPais(L,vector2);
        repTresCeros(L,cantRepTresCeros);
        L:=L^.sig;
    end;
    informarP1(vector1,cantRTotal);
    NyPMasCaros(vector2,vNom);
    informarP3(cantRepTresCeros);
end;
var
    L:lista;
    v1:vCantR;
    v2:vPunto2;
    v3:vP;
begin
    L:=nil;
    nomPaises(v3); {SE DISPONE}
    cargar(L);
    recorrerLista(L,v1,v2,v3);
end.
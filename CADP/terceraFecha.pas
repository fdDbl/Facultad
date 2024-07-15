program CONMEBOL;
const
    cantPaises = 1; cPart = 10; cI = 4;
type
    sP = 1..cPart; sI = 1..cI;
    participacion = record
        anio : integer;
        instF : sI;
    end;
    vPart = array[sP] of participacion;
    pais = record
        nombre : string;
        cantP : sP;
        infoP : vPart;
    end;
    lista = ^nodo;
    nodo = record
        dato : pais;
        sig : lista;
    end;

procedure leer(var p:pais);
var
    i:sP;
begin
    writeln('NOMBRE:');
    readln(p.nombre);
    writeln('CANTIDAD DE PARTICIPACIONES:');
    readln(p.cantP);
    for i := 1 to p.cantP do begin
        writeln('AÑO DE PARTICIPACION ',i,':');
        readln(p.infoP[i].anio);
        writeln('INSTANCIA:');
        readln(p.infoP[i].instF);
    end;
end;
procedure agregarNodo(var L:lista; p:pais);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=p;
    nuevo^.sig:=L;
    L:=nuevo;
end;
procedure cargarPaises(var L:lista);
var
    i:integer; p:pais;
begin
    for i:= 1 to cantPaises do begin
        writeln('PAIS ',i);
        leer(p);
        agregarNodo(L,p);
    end;
end;

procedure cantParticipaciones(var cantP:sP;p:pais);
var
    i:sP;
begin
    for i := 1 to p.cantP do
        if(p.infoP[i].anio < 2020) and (p.infoP[i].instF > 1) then
            cantP := cantP + 1;
end;
procedure instanciasFinal(p:pais;var m1,m2:sP;var n1,n2:string);
var
    cantInsF : sP; i:sP;
begin
    cantInsF := 0;
    for i := 1 to p.cantP do begin
        if(p.infoP[i].instF = 4) then
            cantInsF := cantInsF + 1;
    end;
    if(cantInsF < m1) then begin
        m2 := m1;
        n2 := n1;
        m1 := cantInsF;
        n1 := p.nombre;
    end
    else if(cantInsF < m2) then begin
        m2 := cantInsF;
        n2 := p.nombre;
    end;
end;
procedure recorrerInformar(L:lista);
var
    cantPartAct : sP;
    max1,max2:sP; nom1,nom2:string;
    cantTotalP : integer; cantPaisesTotal : integer; prom : real;
begin
    max1:=11; max2:=11;
    cantTotalP := 0;
    cantPaisesTotal := 0;
    while(L <> nil) do begin
        cantPartAct := 0;
        cantParticipaciones(cantPartAct,L^.dato);
        writeln('Cantidad de participaciones antes del 2020 que hayan superado fase de grupos: ',cantPartAct);
        instanciasFinal(L^.dato,max1,max2,nom1,nom2);
        cantTotalP := cantTotalP + L^.dato.cantP;
        cantPaisesTotal := cantPaisesTotal + 1;
        L := L^.sig;
    end;
    writeln(nom1,nom2);
    prom:=cantTotalP/cantPaisesTotal;
    writeln(prom);
end;

procedure leerPaisNuevo(var L:lista);
var
    p:pais;
begin
    leer(p);
    agregarNodo(L,p);
end;
var
    L1 : lista;
begin
    L1 := nil;
    cargarPaises(L1);
    leerPaisNuevo(L1);
    recorrerInformar(L1);
end.
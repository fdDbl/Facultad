program tema2;
type
    sAños = 1980..2024;
    compra = record
        code : integer;
        año : sAños;
        monto : real;
        dni : integer;
    end;
    lista = ^nodo;
    nodo = record
        dato : compra;
        sig : lista;
    end;
    vFactAños = array[2010..2024] of real;
procedure insOrdenadoxDNI(var L:lista;c:compras);
var
    nuevo,act,ant:lista;
begin
    new(nuevo);
    nuevo^.dato:=c;
    act:=L; ant:=L;
    while (act <> nil) and (act^.dato.dni < c.dni) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act=ant) then
        L:=nuevo
    else
        ant^.sig:=nuevo;
    nuevo^.sig:=act;
end;    
procedure cargarLista2(var L2:lista;L1:lista;año1,año2:sAños);
var
begin
    while(L1 <> nil) do begin
        if(L1^.dato.año >= año 1) and (L1^.dato.año <= año2) then
            insOrdenadoxDNI(L2,L1^.dato);
        L1:=L1^.sig;
    end;
end;
procedure iniVectorAños(var v:vFactAños);
var
    añoAct:2010..2024;
begin
    for añoAct := 2010 to 2014 do
        v[añoAct] := 0;
end;
procedure analizarCantCompras(cant:integer;dniAct:integer;var dni1,dni2:integer;var min1,min2:integer);
begin
    if(cant > min1) then begin
        min2:=min1;
        dni2:=dni1;
        min1:=cant;
        dni1:=dniAct;
    end
    else if (cant > min2) then begin
        min2:=cant;
        dni2:=dniAct;
    end;
end;
procedure analizarAños(v:vFactAños);
var
    max:real;
    añoAct:2010..2020;
    peorAño:2010..2020;
begin
    max:=9999;
    for añoAct := 2010 to 2020 do
        if(v[añoAct] < max) then begin
            peorAño := añoAct;
            max:=v[añoAct]
        end;
    writeLn(peorAño);
end;
procedure procesarCompras(L:lista);
var
    v:vFactAños;
    dniAct:integer; montoAct:real; cantCompras10:integer; cantComprasCliente : integer;
    dni1,dni2:integer; minCompras1,minCompras2:integer;
begin
    iniVectorAños(v);
    cantCompras10:=0;
    minCompras1:=-1;
    minCompras2:=-1;
    dni1:=1;
    dni2:=1;
    while(L<>nil) do begin
        dniAct:=L^.dato.dni;
        montoAct := 0;
        cantComprasCliente := 0;
        while(L<>nil) and (L^.dato.dni = dniAct) do begin
            montoAct:=montoAct+L^.dato.monto;
            v[L^.dato.año] := v[L^.dato.año] + montoAct;
            if(L^.dato.code MOD 10 = 0) then cantCompras10:=cantCompras10+montoAct;
            cantComprasCliente := cantComprasCliente + 1;
        end;
        analizarCantCompras(cantComprasCliente,dniAct,dni1,dni2,minCompras1,minCompras2);
    end;
    writeLn(dni1,dni2);
    analizarAños(v);
    writeLn('Facturado de compras con codigo multiplo de 10: ',cantCompras10);
end;

var
    L1,L2:lista;
begin
    cargarListaCompras(L1); {SE DISPONE}
    L2:=nil;
    cargarLista2(L2,L1,2010,2020);
    procesarCompras(L2);
end.
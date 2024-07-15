program trenes;
const
    cDestinos = 20;
type
    sMeses = 1..12;
    sDestino = 1..cDestinos;

    viaje = record
        codeT:integer;
        mes:sMeses;
        cantP:integer;
        codeCD:sDestino;
    end;
    lista = ^nodo;
    nodo = record
        dato:viaje;
        sig:lista;
    end;

    vCostos = Array[sDestino] of real;
    vMontosMeses = Array[sMeses] of real;

    viajes2 = record
        codeT:integer;
        cantViajes:integer;
    end;
    lista2 = ^nodo2;
    nodo2 = record
        dato:viajesXTren;
        sig:lista2;
    end;

procedure iniVMeses(var v:vMontosMeses);
var
    i:sMeses;
begin
    for i := 1 to 12 do v[i] := 0;
end;
procedure agregarAtras(var pI,pF:lista2; t:viajes2);
var
    nuevo:lista2;
begin
    new(nuevo);
    nuevo^.dato:=t;
    nuevo^.sig:=nil;

    if(pI=nil) then
        pI:=nuevo;
    else
        pF^.sig:=nuevo;
    pF:=nuevo;
end;

procedure generarListaNueva(LViajes:lista; var L2:lista2; var vMeses:vMontosMeses; vC:vCostos);
var
    t:viajes2; codeAct:integer; cantViajesAct:integer; cantPasAct:integer;
    pUlt:lista2;
begin
    while(LViajes <> nil) do begin
        codeAct:=LViajes^.dato.code;
        cantViajesAct:=0;
        cantPasAct:=0;
        while(LViajes <> nil) and (LViajes^.dato.code = codeAct) do begin
            cantViajesAct := cantViajesAct+1;
            cantPasAct := cantPasAct+LViajes^.dato.cantP;
            vMeses[LViajes^.dato.mes] := vMeses[LViajes^.dato.mes] + 
                (vC[LViajes^.dato.codeCD] * LViajes^.dato.cantP);
            LViajes := LViajes^.sig;
        end;
        t.codeT := codeAct;
        t.cantViajes := cantViajesAct;
        agregarAtras(L2,pUlt,t);
        writeLn(cantPasAct/cantViajesAct); {PUNTO C LISTO}
    end;
end;
function mesMayorMonto(v:vMontosMeses):sMeses;
var
    i:sMeses; mesMax:sMeses; max:real;
begin
    max := -1;
    for i := 1 to 12 do
        if(v[i] > max) then begin
            max:=v[i];
            mesMax:=i;
        end;
    mesMayorMonto := mesMax;
end;

var {PP}
    L1:lista; L2:lista2;
    vC:vCostos; v1:vMontosMeses; v2:vCostos;
begin
    L1 := nil;
    cargarListaViajes(L1); cargarCostos(vC);

    L2 := nil;
    iniVMeses(v1);
    generarListaNueva(L1,L2,v1,v2);
    writeLn(mesMayorMonto(v1)); {PUNTO B}
end.
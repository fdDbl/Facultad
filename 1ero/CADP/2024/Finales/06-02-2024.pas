program empresa;
type
    venta = record
        nro:integer;
        cantP:integer;
        tipoPago:string;
    end;
    
    lista1 = ^nodo1;
    nodo1 = record
        dato:venta;
        sig:lista1;
    end;
    
    lista2 = ^nodo2;
    
    punteros = record
        pI:lista2;
        pU:lista2;
    end;
    
    nodo2 = record
        dato:venta;
        sig:lista2;
    end;

procedure agregarAdelante(v:venta; var p:punteros);
var
    nue:lista2;
begin
    new(nue);
    nue^.dato:=v;
    nue^.sig:=p.pI;
    p.pI := nue;
end;

procedure agregarAtras(v:venta; var p:punteros);
var
    nue:lista2;
begin
    new(nue);
    nue^.dato:=v;
    nue^.sig:=nil;
    if(p.pI = nil) then
        p.pI:=nue
    else
        p.pU^.sig:=nue;
    p.pU := nue;
end;

procedure cargarVentas(var L1:lista1);  // se dispone

procedure cargarVentasDigPares(L1:lista1; var p:punteros);

    function masPares(num:integer):boolean;
    var
        ultDigit,cantP,cantImp:integer;
    begin
        cantP:=0;
        cantImp:=0;
        while(num <> 0) do begin
            ultDigit := num MOD 10;
            if(ultDigit MOD 2 = 0) then
                cantP := cantP + 1
            else
                cantImp := cantImp + 1;
            num := num DIV 10;
        end;
        masPares := cantP > cantImp;
    end;

begin
    while(L1 <> nil) do begin
        if(masPares(L1^.dato.cantP)) then begin
            if(L1^.dato.tipoPago = 'Efectivo') then
                agregarAdelante(L1^.dato,p)
            else if(L1^.dato.tipoPago = 'Tarjeta') then
                agregarAtras(L1^.dato,p)
        end;
        L1:=L1^.sig;
    end;
end;

var
    L1:lista1; p:punteros;
begin
    L1:=nil;
    cargarVentas(L1);  // se dispone
    p.pI := nil;
    p.pU := nil;
    cargarVentasDigPares(L1,p);
end.

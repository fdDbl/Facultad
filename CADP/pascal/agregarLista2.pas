procedure agregarAdelante(var L:lista; j:jugador);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=j;
    nue^.sig:=L;
    L:=nue;
end;

procedure agregarAtras(var L,ULT:lista; j:jugador);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=j;
    nue^.sig:=nil;
    if(L=nil) then
        L:=nue;
    else
        ult^.sig:=nue;
    ult:=nue;
end;

procedure insertarOrdenado(var L:lista;j:jugador);
var
    nue,act,ant:lista;
begin
    new(nue);
    nue^.dato:j;
    act:=L;
    ant:=L;
    while(act<>nil)and(j.altura>act^.dato.altura) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act=ant) then
        L:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;
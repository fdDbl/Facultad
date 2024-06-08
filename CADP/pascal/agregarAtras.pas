program repaso;
type
  jugador = record
    dni: integer;
    nombre: string[30];
    nomyAp: string[30];
    altura: integer;
  end;

  lista = ^nodo;

  nodo = record
    dato: jugador;
    sig: lista;
  end;
procedure agregarAtras(var L:lista;var ult:lista;j:jugador);
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
procedure cargarLista(var L:lista);
var
    j:jugador;
    ult:lista;
begin
    leer(j);
    while(j.dni<>0) do begin
        agregarAtras(L,ult,j);
        leer(j);
    end;
end;
var {PROGRAMA PRINCIPAL}
  L: lista;
begin
  L:= nil;
  cargarLista(L);
end.


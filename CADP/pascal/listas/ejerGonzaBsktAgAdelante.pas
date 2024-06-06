program basket;
type
    jugador = record
        dni : integer;
        nomyAp : string[30];
        altura : real;
    end;

    lista = ^nodo;

    nodo = record
        datos : jugador;
        sig : lista;
    end;
procedure agregarAdelante(var L:lista; j:jugador);
var
    nue:lista;
begin
    new(nue);
    nue^.datos := j;
    nue^.sig := L;
    L:=nue;
end;
procedure leerDato(var jug:jugador);
begin
    writeln('DNI del jugador (sin puntos):');
    readln(jug.dni);
    if(jug.dni <> 0) then begin
        writeln('Nombre(s) y apellido(s) del jugador:');
        readln(jug.nomyAp);
        writeln('Estatura del jugador (cm):');
        readln(jug.altura);
    end
end;
procedure cargarLista(var L:lista);
var
    j:jugador;
begin
    leerDato(j);
    while(j.dni <> 0) do begin
        agregarAdelante(L,j);
        leerDato(j);
    end;
end;
function esPar(n:integer):boolean;
begin
    esPar := n MOD 2 = 0;
end;
function cantDNIPar(L:lista):integer;
var
    cantP:integer;
begin
    cantP:=0;
    while(L<>nil) do begin
        if(esPar(L^.datos.dni)) then 
            cantP:=cantP+1;
        L:=L^.sig;
    end;
    cantDNIPar:=cantP;
end;
var
    L:lista;
begin
    L:=nil;
    cargarLista(L);
    writeLn('Cantidad de jugadores con DNI pares: ',cantDNIPar(L));
end.
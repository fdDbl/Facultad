program libros;
const

type
    sDias :  1..31;
    prestamo = record
        nro : integer;
        isbn : integer;
        nroSocio : integer;
        dia : sDias;
    end;

    cantxISBN = record
        isbn:integer;
        cant:integer;
    end;

    lista = ^nodo;
    nodo = record
        dato:prestamo;
        sig:lista;
    end;

    listaISBN = ^nodosISBN;
    nodosISBN = record
        datoISBN : cantxISBN;
        sig : listaISBN;
    end;

procedure leer(var p:prestamo);
begin
    writeLn('Numero de prestamo:');
    readln(p.nro);
    writeLn('ISBN:');
    readln(p.isbn);
    if(p.isbn <> -1) then begin
        writeLn('Numero de socio:');
        readln(p.nroSocio);
        writeLn('Dia que se presto (1-31):');
        readln(p.dia);
    end;
end;
procedure insertarOrdenado(var pI:lista;p:prestamo);
var
    act,ant,nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=p;
    act:=pI;
    ant:=pI;
    while(act <> nil) and (p.isbn < act^.dato.isbn) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act = ant) then
        pI:=nuevo;
    else
        ant^.sig:=nuevo;
    nuevo^.sig:=act;
end;
procedure cargarLista(var L:lista);
var
    p:prestamo;
begin
    leer(p);
    while(p.isbn <> -1) do begin
        insertarOrdenado(L,p);
        leer(p);
    end;
end;

procedure insertarISBNOrdenados();
procedure actualizarISBN(L:lista;var L2:listaISBN);
var

begin

end;
procedure recorrerLista(L:lista;var L2:listaISBN);
var

begin
    while(L <> nil) do begin
        actualizarISBN(L,L2);
    
        L:=L^.sig;
    end;
end;

var
    L:lista;
begin
    L:=nil;
    cargarLista(L);
    recorrerLista(L,)
end.
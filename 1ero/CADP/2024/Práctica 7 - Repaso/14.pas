program libros;

type
    sDias = 1..31;
    vDias = array[sDias] of integer;
    prestamo = record
        nro: integer;
        isbn: integer;
        nroSocio: integer;
        dia: sDias;
    end;

    cantxISBN = record
        isbn: integer;
        cant: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: prestamo;
        sig: lista;
    end;

    listaISBN = ^nodosISBN;
    nodosISBN = record
        datoISBN: cantxISBN;
        sig: listaISBN;
    end;

procedure leer(var p: prestamo);
begin
    writeln('Numero de prestamo:');
    readln(p.nro);
    writeln('ISBN:');
    readln(p.isbn);
    if (p.isbn <> -1) then
    begin
        writeln('Numero de socio:');
        readln(p.nroSocio);
        writeln('Dia que se presto (1-31):');
        readln(p.dia);
    end;
end;

procedure insertarOrdenado(var pI: lista; p: prestamo);
var
    act, ant, nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := p;
    act := pI;
    ant := pI;
    while (act <> nil) and (p.isbn > act^.dato.isbn) do
    begin
        ant := act;
        act := act^.sig;
    end;
    if (act = ant) then
        pI := nuevo
    else
        ant^.sig := nuevo;
    nuevo^.sig := act;
end;

procedure cargarLista(var L: lista);
var
    p: prestamo;
begin
    leer(p);
    while (p.isbn <> -1) do
    begin
        insertarOrdenado(L, p);
        leer(p);
    end;
end;

procedure insertarLISBN(var L:listaISBN; isbn:integer);
begin

end;

procedure recorrerLista(L1: lista; var L2: listaISBN);
var
    maxP : integer; peorDia : sDias; iD : sDias; isbnAct : integer;
    vD : vDias; cantPrestamos : integer; cantPCumpleC : integer; promP : real;
begin
    maxP := 9999; cantPrestamos := 0; cantPCumpleC := 0;
    for iD := 1 to 31 do vD[iD] := 0;
    while (L1 <> nil) do
        begin
            isbnAct := L1^.dato.isbn; 
            while(L1^.dato.isbn = isbnAct) then begin
                cantISBNAct := cantISBNAct + 1;
                insertarLISBN(L2, L1^.dato.isbn);
            end;
            vD[L1^.dato.dia] := vD[L1^.dato.dia] + 1;
            if(L1^.dato.nro MOD 10 <> 0) and (L1^.dato.nroSocio MOD 10 = 0) then cantPCumpleC := cantPCumpleC + 1;
            cantPrestamos := cantPrestamos + 1;
            L1 := L1^.sig;
        end;
    for iD := 1 to 31 do
        if(vD[iD] < maxP) and (vD[iD] <> 0)  then begin
            maxP := vD[iD];
            peorDia := iD;
        end;
    writeLn('Dia del mes en que se realizaron menos prestamos: ', peorDia);
    promP := (cantPCumpleC/cantPrestamos);
    writeLn('Porcentaje de prestamos que poseen nro. de prestamo impar y nro. de socio par: ', promP);
end;
procedure verificarListaISBN(L: listaISBN);
var
    i : integer;
begin
    i := 1;
    while (L <> nil) do begin
        writeLn('');
        writeLn('NODO ',i);
        writeLn('ISBN: ', L^.datoISBN.isbn);
        writeLn('Cantidad de veces prestado: ', L^.datoISBN.cant);
        writeLn('');
        i := i + 1;
        L := L^.sig;
    end;
end;

var
    L: lista;
    LISBN: listaISBN;
begin
    L := nil;
    cargarLista(L);
    LISBN := nil;
    recorrerLista(L, LISBN);
    verificarListaISBN(LISBN); {SOLO PRUEBA}
end.
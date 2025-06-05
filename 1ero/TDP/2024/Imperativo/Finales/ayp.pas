program ayp;
type
    alumno = record
        nombre: string;
        legajo: integer;
        cantAAprob: integer;
    end;
    arbol = ^nodoA;
    nodoA = record
        dato: alumno;
        HI, HD: arbol;
    end;
    lista = ^nodoL;
    nodoL = record
        dato: alumno;
        sig: lista;
    end;

procedure leer(var a: alumno);
begin
    readln(a.nombre);
    readln(a.legajo);
    if (a.legajo <> 0) then
        a.cantAAprob := 0;
end;

procedure insertar(var a: arbol; al: alumno);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := al;
        a^.HI := nil;
        a^.HD := nil;
    end else if (al.legajo < a^.dato.legajo) then
        insertar(a^.HI, al)
    else
        insertar(a^.HD, al);
end;

procedure cargarAlumnos(var a: arbol);
var
    al: alumno;
begin
    leer(al);
    while (al.legajo <> 0) do begin
        insertar(a, al);
        leer(al);
    end;
end;

procedure aumentarAprobadoXLegajo(a: arbol; legajo: integer);
begin
    if (a <> nil) then begin
        if (legajo < a^.dato.legajo) then
            aumentarAprobadoXLegajo(a^.HI, legajo)
        else if (legajo > a^.dato.legajo) then
            aumentarAprobadoXLegajo(a^.HD, legajo)
        else if (legajo = a^.dato.legajo) then
            a^.dato.cantAAprob := a^.dato.cantAAprob + 1;
    end;
end;

procedure insertarOrdenado(var L: lista; al: alumno);
var
    nue, act, ant: lista;
begin
    new(nue);
    nue^.dato := al;
    act := L;
    ant := L;
    while (act <> nil) and (act^.dato.nombre < al.nombre) do begin
        ant := act;
        act := act^.sig;
    end;
    if (act = ant) then begin
        L := nue;
    end else
        ant^.sig := nue;
    nue^.sig := act;
end;

procedure cargarLista3Aprobados(a: arbol; var L: lista);
begin
    if (a <> nil) then begin
        cargarLista3Aprobados(a^.HI, L);
        if (a^.dato.cantAAprob >= 3) then
            insertarOrdenado(L, a^.dato);
        cargarLista3Aprobados(a^.HD, L);
    end;
end;

procedure imprimirArbol(a: arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.HI);
        writeln('Nombre: ', a^.dato.nombre, ' Legajo: ', a^.dato.legajo, ' Cant. Aprob.: ', a^.dato.cantAAprob);
        imprimirArbol(a^.HD);
    end;
end;

procedure imprimirLista(L: lista);
begin
    while (L <> nil) do begin
        writeln('Nombre: ', L^.dato.nombre, ' Legajo: ', L^.dato.legajo, ' Cant. Aprob.: ', L^.dato.cantAAprob);
        L := L^.sig;
    end;
end;

var
    a: arbol; 
    leg: integer; 
    L: lista;
begin
    a := nil;
    cargarAlumnos(a);
    imprimirArbol(a);
    readln(leg);
    aumentarAprobadoXLegajo(a, leg);
    L := nil;
    cargarLista3Aprobados(a, L);
    imprimirLista(L);
end.

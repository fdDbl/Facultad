program siete;
const
    cM = 24;
type
    sNotas = 4 .. 10;
    vM = array[1 .. cM] of sNotas;
    alumno = record
        nro : integer;
        ap : string;
        nom : string;
        email : string;
        anoing : integer;
        anoeg : integer;
        notas : vM;
    end;

    lista = ^nodo;
    nodo = record
        dato : alumno;
        sig : lista;
    end;
procedure ordVector(var v:vM);
var
    i,j,p:integer;
    item:real;
begin
    for i := 1 to cM-1 do begin
        p:=i;
        for j := i+1 to cM do
            if(v[j] > v[p]) then
                p:=j;
        item := v[p];
        v[p] := v[i];
        v[i] := item;
    end;
end;
procedure leerNotas(var v:vM);
var
    i:integer;
begin
    for i := 1 to cM do begin
        writeLn('Materia ',i,':');
        readLn(v[i]);
    end;
end;
procedure leer(var a:alumno);
begin
    writeLn('Nro del alumno:'); readLn(a.nro);
    if(a.nro <> -1) then begin
        writeLn('Apellido del alumno:'); readLn(a.ap);
        writeLn('Nombre del alumno:'); readLn(a.nom);
        writeLn('Email del alumno:'); readLn(a.email);
        writeLn('Año de ingreso del alumno:'); readLn(a.anoing);
        writeLn('Año de egreso del alumno:'); readLn(a.anoeg);
        writeLn('Notas del alumno (no aplazos):'); leerNotas(a.notas); ordVector(a.notas);
    end;
end;
procedure agAdelante(var pI:lista;a:alumno);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=a;
    if(pI = nil) then
        pI:=nuevo
    else begin
        nuevo^.sig:=pI;
        pI:=nuevo;
    end;
end;
procedure cargarLista(var L:lista);
var
    a:alumno;
begin
    leer(a);
    while(a.nro <> -1) do begin
        agAdelante(L,a);
        leer(a);
    end;
end;

procedure p2a(L:lista);
var
    i:integer;
    nTotal:real;
    prom:real;
begin
    nTotal:=0;
    for i := 1 to cM do
        nTotal:=nTotal + L^.dato.notas[i];
    prom := nTotal / cM;
    writeLn('Promedio de notas obtenido por ',L^.dato.nom,' ',L^.dato.ap,': ',prom);
end;

procedure recorrerLista(L:lista);
begin
    while(L<>nil) do begin
        p2a(L);
        p2b(L);

        L:=L^.sig;
    end;
end;

var
    alu:alumno;
    L:lista;
begin
    L := nil;
    cargarLista(L);
    recorrerLista(L);
end.
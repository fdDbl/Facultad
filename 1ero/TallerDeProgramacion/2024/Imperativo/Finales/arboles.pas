program arboles;
type
    persona = record
        dni:integer;
        nombre:string;
        apellido:string;
        fechaNacimiento:integer;
    end;
    arbol = ^nodo;
    nodo = record
        dato:persona;
        HI,HD:arbol;
    end;
    dniXfecha = record
        dni:integer;
        fechaNacimiento:integer;
    end;
    lista = ^nodoL;
    nodoL = record
        dato:dniXfecha;
        sig:lista;
    end;
    listaRango = ^nodoRango;
    nodoRango = record
        dato:persona;
        sig:listaRango;
    end;
procedure leer(var p:persona);
begin
    write('DNI: '); readln(p.dni);
    if(p.dni <> -1) then begin
        write('Nombre: '); readln(p.nombre);
        write('Apellido: '); readln(p.apellido);
        write('Fecha de nacimiento:' ); readln(p.fechaNacimiento);
    end;
end;
procedure insertarPorDNI(var a:arbol; p:persona);
begin
    if(a=nil) then begin
        new(a);
        a^.dato:=p;
        a^.HI:=nil; a^.HD:=nil;
    end
    else if(p.dni < a^.dato.dni) then insertarPorDNI(a^.HI,p)
    else insertarPorDNI(a^.HD,p);
end;
procedure cargarPorDNI(var a:arbol);
var
    p:persona;
begin
    leer(p);
    while(p.dni <> -1) do begin
        insertarPorDNI(a,p);
        leer(p);
    end;
end;
procedure enOrden(a:arbol);
begin
	if(a<>nil) then begin
		enOrden(a^.HI);
		writeln(a^.dato.dni);
		enOrden(a^.HD);
	end;
end;
procedure preOrden(a:arbol);
begin
	if(a<>nil) then begin
		writeln(a^.dato.dni);
		preOrden(a^.HI);
		preOrden(a^.HD);
	end;
end;
procedure postOrden(a:arbol);
begin
	if(a<>nil) then begin
		postOrden(a^.HI);
		postOrden(a^.HD);
		writeln(a^.dato.dni);
	end;
end;
procedure agregarAdelante1(var L:lista; p:persona);
var
    nue:lista;
begin
    new(nue);
    nue^.dato.dni:=p.dni;
    nue^.dato.fechaNacimiento:=p.fechaNacimiento;
    nue^.sig:=L;
    L:=nue;
end;
procedure cargarLista(var L:lista; a:arbol);
begin
    if(a<>nil) then begin
        cargarLista(L,a^.HD);
        agregarAdelante1(L,a^.dato);
        cargarLista(L,a^.HI);
    end;
end;
procedure imprimirLista(L:lista);
begin
    while(L<>nil) do begin
        writeln('DNI: ',L^.dato.dni,', Fecha de nacimiento: ',L^.dato.fechaNacimiento);
        L:=L^.sig;
    end;
end;
procedure agregarAdelante2(var L:listaRango; p:persona);
var
    nue:listaRango;
begin
    new(nue);
    nue^.dato:=p;
    nue^.sig:=L;
    L:=nue;
end;
procedure cargarListaRango(var L:listaRango; a:arbol; r1,r2:integer);
begin
    if(a<>nil) then begin
        cargarListaRango(L,a^.HD,r1,r2);
        if(a^.dato.fechaNacimiento <= r2)and(a^.dato.fechaNacimiento >= r1) then
            agregarAdelante2(L,a^.dato);
        cargarListaRango(L,a^.HI,r1,r2);
    end;
end;
var
    a:arbol; L1:lista; r1,r2:integer; L2:listaRango;
begin
    a:=nil;
    cargarPorDNI(a);
    enOrden(a);
    // Hacer una lista que, para cada DNI, tenga una fecha de nacimiento. debe quedar ordenada por DNI.
    L1:=nil;
    cargarLista(L1,a);
    imprimirLista(L1);
    // Hacer una lista que extraiga personas del arbol en un determinado rango de fecha de nacimiento ingresado por teclado. La lista debe quedar ordenada por DNI.
    write('Ingrese un rango de fecha de nacimiento: ');
    readln(r1);
    readln(r2);
    L2:=nil;
    cargarListaRango(L2,a,r1,r2);
end.
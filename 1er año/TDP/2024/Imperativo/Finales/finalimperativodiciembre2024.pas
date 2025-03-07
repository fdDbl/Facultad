program muni;
type
    vehiculo = record
        patente:string;
        marca:string;
        anioF:integer;
        colorP:string;
        dniP:integer;
    end;
    arbol = ^nodo;
    nodo = record
        dato:vehiculo;
        HI,HD:arbol;
    end;
    lista = ^nodoL;
    nodoL = record
        dato:vehiculo;
        sig:lista;
    end;
procedure cargarVehiculos(var a:arbol);
    procedure leerVehiculo(var v:vehiculo);
    begin
        readln(v.patente);
        if(v.patente <> 'ZZZ') then begin
            readln(v.marca);
            readln(v.anioF);
            readln(v.colorP);
            readln(v.dniP);
        end;
    end;
    procedure insertar(var a:arbol; v:vehiculo);
    begin
        if(a = nil) then begin
            new(a);
            a^.dato := v;
            a^.HI := nil;
            a^.HD := nil;
        end
        else if(v.dniP <= a^.dato.dniP) then
            insertar(a^.HI,v)
        else
            insertar(a^.HD,v);
    end;
var
    v:vehiculo;
begin
    leerVehiculo(v);
    while(v.patente <> 'ZZZ') do begin
        insertar(a,v);
        leerVehiculo(v);
    end;
end;
function cantVEnAnios(a:arbol; a1,a2:integer):integer;
begin
    if(a<>nil) then begin
        if(a^.dato.anioF > a1) and (a^.dato.anioF < a2) then
            cantVEnAnios := 1 + cantVEnAnios(a^.HI,a1,a2) + cantVEnAnios(a^.HD,a1,a2)
        else
            cantVEnAnios := cantVEnAnios(a^.HI,a1,a2) + cantVEnAnios(a^.HD,a1,a2);
    end else
        cantVEnAnios := 0;
end;
procedure cargarListaMenorDNI(a:arbol; var L:lista; dni:integer);
    procedure agregarAdelante(var L:lista; v:vehiculo);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:=v;
        nue^.sig:=L;
        L:=nue;
    end;
begin
    if(a<>nil) then begin
        if(a^.dato.dniP < dni) then begin
            cargarListaMenorDNI(a^.HD,L,dni);
            agregarAdelante(L,a^.dato);
            cargarListaMenorDNI(a^.HI,L,dni);
        end else
            cargarListaMenorDNI(a^.HI,L,dni);
    end;
end;
procedure imprimirArbol(a: arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.HI);
        writeln('Patente: ', a^.dato.patente, ' - Marca: ', a^.dato.marca, 
                ' - Año: ', a^.dato.anioF, ' - Color: ', a^.dato.colorP, 
                ' - DNI: ', a^.dato.dniP);
        imprimirArbol(a^.HD);
    end;
end;

procedure imprimirLista(L: lista);
begin
    while (L <> nil) do begin
        writeln('Patente: ', L^.dato.patente, ' - Marca: ', L^.dato.marca, 
                ' - Año: ', L^.dato.anioF, ' - Color: ', L^.dato.colorP, 
                ' - DNI: ', L^.dato.dniP);
        L := L^.sig;
    end;
end;
var
    a:arbol; anio1,anio2:integer; dni:integer; L:lista;
begin
    a:=nil;
    cargarVehiculos(a);
    imprimirArbol(a);
    readln(anio1);
    readln(anio2);
    writeln('La cantidad de vehiculos fabricados entre ',anio1,' y ',anio2,' es de: ',cantVEnAnios(a,anio1,anio2));
    readln(dni);
    L:=nil;
    cargarListaMenorDNI(a,L,dni);
    imprimirLista(L);
end.
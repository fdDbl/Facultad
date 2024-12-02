program atletismo;
type
    alumno = record
        nombre:string;
        dni:integer;
        tiempo:real;
    end;
    
    alumnoRapido = record
		nombre:string;
		dni:integer;
	end;
    
    arbol = ^nodo;
    nodo = record
        dato:alumno;
        HI,HD:arbol;
    end;
    
    lista = ^nodo2;
    nodo2 = record
		dato:alumno;
		sig:lista;
	end;

procedure leer(var a:alumno);
begin
    writeln('NOMBRE:');
    readln(a.nombre);
    writeln('DNI:');
    readln(a.dni);
    if(a.dni <> 0) then begin
        writeln('TIEMPO:');
        readln(a.tiempo);
    end;
end;

procedure agregarArbol(var a:arbol; alu:alumno);
begin
    if(a=nil) then begin
        new(a);
        a^.dato:=alu;
        a^.HI:=nil; a^.HD:=nil;
    end else
    if(alu.tiempo <= a^.dato.tiempo) then
        agregarArbol(a^.HI, alu)
    else agregarArbol(a^.HD, alu);
end;

procedure cargarArbolAlumnos(var a:arbol);
var
    alu:alumno;
    i:integer;
begin
    i:=1;
    writeln('---------- CARGA DE ALUMNOS ----------');
    writeln('----- ALUMNO ',i,' -----');
    leer(alu);
    while(alu.dni <> 0) do begin
        agregarArbol(a,alu);
        i:=i+1;
        writeln('----- ALUMNO ',i,' -----');
        leer(alu);
    end;
end;

function alumnosEnRango(a:arbol;r1,r2:real):lista;
	
	procedure insertarOrdenado(var L:lista; alu:alumno);
	var
		nue,ant,act:lista;
	begin
		new(nue);
		nue^.dato:=alu;
		act:=L;
		while(act<>nil)and(alu.tiempo < act^.dato) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(L = act) then
			L := nue
		else
			ant^.sig := nue;
		nue^.sig := act;
	end;
	
	procedure recorrerArbolYCargarLista(var L:lista;a:arbol;r1,r2:real);
	begin
		if(a<>nil)and(a^.dato.) then begin
			if(a^.dato.tiempo > r1)and(a^.dato.tiempo < r2) then
				insertarOrdenado(L,a^.dato);
			recorrerArbolYCargarLista(L,a^HD,r1,r2);
		end;
	end;
	
{		PRUEBA
	procedure imprimirLista(L:lista);
	begin
		while(L <> nil) do begin
			writeln(L^.dato.tiempo);
			L:=L^.sig;
		end;
	end;
}
	
var
	L:lista;
begin
	L:=nil;
	recorrerArbolYCargarLista(L,a,r1,r2);
	imprimirLista(L);
	
	alumnosEnRango:=L;
end;

function alumnoMasRapido(a:arbol):alumnoRapido;
var
	min:real;
begin
	min:=999999;
	
end;

var
    a : arbol; L : lista;
    aMR : alumnoMasRapido;
    rango1,rango2:real;
begin
    a := nil;
    cargarArbolAlumnos(a);	// PUNTO A
    writeln('----- MINIMO DEL RANGO -----');
    readln(rango1);
    writeln('----- MAXIMO DEL RANGO -----');
    readln(rango2);
    L := alumnosEnRango(a,rango1,rango2);	// PUNTO B
    
    aMR := alumnoMasRapido(a);	// PUNTO C
end.

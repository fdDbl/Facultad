program mantenimiento;
type
	sNivel = 1..5;
	sSector = 1..50;
	llamada = record
		nivel:sNivel;
		sector:sSector;
		cantEmp:integer;
	end;
	
	lista1 = ^nodo1;
	nodo1 = record
		dato:llamada;
		sig:lista1;
	end;
	
	vLlamadas = Array[1..100] of llamada;
	vImportancias = Array[sNivel] of lista1;
	
	arbol = ^nodo2;
	nodo2 = record
		dato:llamada;
		HI,HD:arbol;
	end;

procedure cargarLlamadas(var v1:vLlamadas; var v2:vImportancias);

	procedure insertarOrdenado(var L:lista1; ll:llamada);
	var
		nue,ant,act: lista1;
	Begin
		new(nue);
		nue^.dato:=ll;
		act:=L;
		while (act <> nil) and (act^.dato.sector < ll.sector) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (L = act) then
			L := nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	
	procedure agregarAVector2(ll:llamada; var v:vImportancias);
	begin
		insertarOrdenado(v[ll.nivel],ll);
	end;

var
	i:integer;
begin
	for i := 1 to 5 do	// inicializo listas de v2
		v2[i] := nil;
		
	for i:= 1 to 100 do begin
		v1[i].nivel := Random(5)+1;
		v1[i].sector := Random(50)+1;
		v1[i].cantEmp := Random(100)+1;
		
		agregarAVector2(v1[i],v2);
	end;
end;
procedure recorrerv2(v:vImportancias);
var
	i:integer;
begin
	for i:= 1 to 5 do begin
		writeln('----- IMPORTANCIA ',i,' -----');
		while(v[i] <> nil) do begin
			writeln(v[i]^.dato.nivel);
			writeln(v[i]^.dato.sector);
			writeln(v[i]^.dato.cantEmp);
			
			v[i]:=v[i]^.sig;
		end;
	end;
end;

procedure cargarArbolDeImportanciaN(var a:arbol; v:vImportancias; N:sNivel);

	procedure cargarArbol(var a:arbol; ll:llamada);
	begin
		if(a=nil) then begin
			new(a);
			a^.dato:=ll;
			a^.HI:=nil; a^.HD:=nil;
		end
		else begin
			if(ll.cantEmp > a^.dato.cantEmp) then
				cargarArbol(a^.HD,ll)
			else cargarArbol(a^.HI,ll);
		end;
	end;

var
	L:lista1;
begin
	L := v[N];
	while(L <> nil) do begin
		cargarArbol(a,L^.dato);
		L:=L^.sig;
	end;
end;

procedure recorrerA(a:arbol);
begin
	if(a <> nil) then begin
		recorrerA(a^.HI);
		writeln(a^.dato.nivel);
		writeln(a^.dato.sector);
		writeln(a^.dato.cantEmp);
		recorrerA(a^.HD);
	end;
end;

function InformarPeorSector(a:arbol):sSector;
begin
	if(a <> nil) then 
		if(a^.HD <> nil) then
			InformarPeorSector := InformarPeorSector(a^.HD)
		else
			InformarPeorSector := a^.dato.sector;
end;

var
	v1:vLlamadas; v2:vImportancias; a:arbol;
	n:sNivel;
begin
	Randomize;
	cargarLlamadas(v1,v2);
	recorrerv2(v2);		// DEBUG
	
	writeln;
	readln(n);
	writeln;
	
	cargarArbolDeImportanciaN(a,v2,n);
	recorrerA(a);
	
	write('Peor sector: ');
	writeln(InformarPeorSector(a));
end.

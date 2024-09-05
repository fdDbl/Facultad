program biblioteca;
type
	prestamoCompleto = record
		ISBN : integer;
		nroSocio : integer;
		dia : integer;
		mes : integer;
		cantDiasP : integer;
	end;
	
	prestSinISBN = record
		nroSocio : integer;
		dia : 1..31;
		mes : 1..12;
		cantDiasP : integer;
	end;
	
	lista = ^nodo0;
	nodo0 = record
		dato : prestSinISBN;
		sig : lista;
	end;

	prestamosXISBN = record
		ISBN : integer;
		prest : lista;
	end;

	arbol1 = ^nodo1;
	nodo1 = record
		dato : prestamoCompleto;
		HI , HD : arbol1;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato : prestamosXISBN ;
		HI , HD : arbol2;
	end;

procedure cargarPrestamos(var a1:arbol1; var a2:arbol2);

	procedure leerPrestamo(var p:prestamoCompleto);
	begin
		write('ISBN: '); readln(p.ISBN);
		if(p.ISBN <> 0) then begin
			write('Nro de socio: '); readln(p.nroSocio);
			write('Dia del prestamo: '); readln(p.dia);
			write('Mes del prestamo: '); readln(p.mes);
			write('Cantidad de dias a prestar: '); readln(p.cantDiasP);
		end;
	end;

	procedure agregarArbol1(var a:arbol1; p:prestamoCompleto);
	begin
		if(a=nil) then begin
			new(a);
			a^.dato := p;
			a^.HI := nil;
			a^.HD := nil;
		end
		else if(p.ISBN >= a^.dato.ISBN) then
			agregarArbol1(a^.HD,p)
		else agregarArbol1(a^.HI,p);
	end;
	
	procedure agregarAdelante(var L:lista; nSocio,dia,mes,cantDiasP:integer);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato.nroSocio := nSocio;
		nue^.dato.dia := dia;
		nue^.dato.mes := mes;
		nue^.dato.cantDiasP := cantDiasP;
		nue^.sig:=L;
		L:=nue;
	end;
	
	procedure agregarArbol2(var a:arbol2; p1:prestamoCompleto);
	begin
		if(a=nil) then begin
			new(a);
			a^.dato.ISBN := p1.ISBN;
			a^.dato.prest := nil;
			agregarAdelante(a^.dato.prest,p1.nroSocio,p1.dia,p1.mes,p1.cantDiasP);

			a^.HI := nil;
			a^.HD := nil;
		end
		else if(p1.ISBN > a^.dato.ISBN) then
			agregarArbol2(a^.HD,p1)
		else if(p1.ISBN < a^.dato.ISBN) then
			agregarArbol2(a^.HI,p1)
		else
			agregarAdelante(a^.dato.prest,p1.nroSocio,p1.dia,p1.mes,p1.cantDiasP);
	end;
	
var
	p1:prestamoCompleto; i:integer;
begin
	i:=1;
	writeln('<---------- LECTURA DE PRESTAMOS ---------->');
	writeln('<----- PRESTAMO ',i,' ----->');
	leerPrestamo(p1);
	while(p1.ISBN <> 0) do begin
		agregarArbol1(a1,p1);
		agregarArbol2(a2,p1);
		i:=i+1;
		writeln('<----- PRESTAMO ',i,' ----->');
		leerPrestamo(p1);
	end;
end;

var
	arb1 : arbol1; arb2 : arbol2; L:lista;
begin
	arb1 := nil;
	arb2 := nil;
	L:=nil;
	cargarPrestamos(arb1,arb2);
end.

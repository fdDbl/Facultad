program biblioteca;
type
	sDias = 1..31;
 	sMeses = 1..12;
  
	prestamoCompleto = record
		ISBN : integer;
		nroSocio : integer;
		dia : sDias;
		mes : sMeses;
		cantDiasP : integer;
	end;
	
	prestSinISBN = record
		nroSocio : integer;
		dia : sDias;
		mes : sMeses;
		cantDiasP : integer;
	end;
	
	lista = ^nodo0;
	nodo0 = record
		dato : prestSinISBN;
		sig : lista;
	end;
	
	lista2 = ^nodoLista2;
	nodoLista2 = record
		dato : cantXISBN;
		sig : lista2;

	prestamosXISBN = record
		ISBN : integer;
		prest : lista;
	end;

	cantXISBN = record
		ISBN : integer;
		cant : integer;
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
	
	procedure agregarAdelante(var L:lista; nSocio:integer; dia:sDias; mes:sMeses; cantDiasP:integer);
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

procedure ISBNMasGrande(a:arbol1);

	function calcular(a:arbol1):arbol1;
	begin
		if(a=nil) then calcular := nil
		else if(a^.HD = nil) then calcular := a
		else calcular := calcular(a^.HD);
	end;

var
	ISBNMayor : arbol1;
begin
	writeln('<---------- ISBN MAS GRANDE ---------->');
	ISBNMayor := calcular(a);
	if(ISBNMayor = nil) then writeln('El arbol esta vacio.')
	else writeln('Resultado: ',ISBNMayor^.dato.ISBN);
end;

procedure ISBNMasChico(a:arbol2);

	function calcular(a:arbol2):arbol2;
	begin
		if(a=nil) then calcular := nil
		else if(a^.HI = nil) then calcular := a
		else calcular := calcular(a^.HI);
	end;

var
	ISBNMenor : arbol2;
begin
	writeln('<---------- ISBN MAS CHICO ---------->');
	ISBNMenor := calcular(a);
	if(ISBNMenor = nil) then writeln('El arbol esta vacio.')
	else writeln('Resultado: ',ISBNMenor^.dato.ISBN);
end;

procedure CantPrestamosDeSocio1(a:arbol1);

	function calcular(a:arbol1; nro:integer):integer;
	begin
		if(a=nil) then calcular := 0
		else if(a^.dato.nroSocio = nro) then calcular := 1 + calcular(a^.HI,nro) + calcular(a^.HD,nro)
		else calcular := calcular(a^.HI,nro) + calcular(a^.HD,nro);
	end;

var
	nroIngresado:integer;
begin
	writeln('<---------- CANTIDAD DE PRESTAMOS DE UN SOCIO: ARBOL 1 ---------->');
	write('Ingresar numero de socio: '); readln(nroIngresado);
	writeln('Prestamos efectuados al socio numero ',nroIngresado,': ',calcular(a,nroIngresado));
end;

procedure CantPrestamosDeSocio2(a:arbol2);
	
	function contarLista(L:lista; nro:integer):integer;
	begin
		if(L = nil) then contarLista := 0
		else if(L^.dato.nroSocio = nro) then 
			contarLista := 1 + contarLista(L^.sig,nro)
		else contarLista := contarLista(L^.sig,nro);
	end;

	function contarNodos(a:arbol2; nro:integer):integer;
	begin
		if(a = nil) then contarNodos := 0
		else contarNodos := 
				contarLista(a^.dato.prest,nro) +
				contarNodos(a^.HI,nro) +
				contarNodos(a^.HD,nro);
	end;

var
	nroIngresado:integer;
begin
	writeln('<---------- CANTIDAD DE PRESTAMOS DE UN SOCIO: ARBOL 2 ---------->');
	write('Ingresar numero de socio: '); readln(nroIngresado);
	writeln('Prestamos efectuados al socio numero ',nroIngresado,': ',contarNodos(a,nroIngresado));
end;

procedure PuntoF(a:arbol1);

	procedure cargarNodos(a:arbol1; var L:lista2);
	var
		r:cantXISBN;
	begin
		
	end;

var
	L:lista2;
begin
	L := nil;
	cargarNodos(a,L);
end;

var
	arb1 : arbol1; arb2 : arbol2;
begin
	arb1 := nil;
	arb2 := nil;
	
	cargarPrestamos(arb1,arb2);
	writeln;
	ISBNMasGrande(arb1);
	writeln;
	ISBNMasChico(arb2);
	writeln;
	CantPrestamosDeSocio1(arb1);
	writeln;
	CantPrestamosDeSocio2(arb2);
	writeln;
	PuntoF(arb1);
end.

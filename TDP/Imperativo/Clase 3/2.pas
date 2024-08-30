program comercio;

type
	sDias = 1..31;
	sMeses = 1..12;
	sAnio = 1900..2024;
	
	fecha = record
		dia : sDias;
		mes : sMeses;
		anio : sAnio;
	end;
	
	ventaCompleta = record
		code : integer;
		date : fecha;
		cantV : integer;
	end;
	
	ventaSinCode = record
		date : fecha;
		cantV : integer;
	end;
	
	ventaSinFecha = record
		code : integer;
		cantV : integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato : ventaSinCode;
		sig : lista;
	end;
	
	ventaConLista = record
		code : integer;
		listaVendidos : lista;
	end;
	
	arbol1 = ^nodo1;
	nodo1 = record
		dato : ventaCompleta;
		HI : arbol1;
		HD : arbol1;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato : ventaSinFecha;
		HI : arbol2;
		HD : arbol2;
	end;

	arbol3 = ^nodo3;
	nodo3 = record
		dato : ventaConLista;
		HI : arbol3;
		HD : arbol3;
	end;
	
procedure generarVentasCompletas(var a : arbol1);

	procedure insertarNodo(var a : arbol1; v : ventaCompleta);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato := v;
			a^.HI := nil;
			a^.HD := nil;
		end
		else if(v.code >= a^.dato.code) then
			InsertarNodo(a^.HD,v) else InsertarNodo(a^.HI,v);
	end;

var
	v : ventaCompleta;
begin
	v.code := random(100);
	while(v.code <> 0) do begin

		v.date.dia := random(31)+1;
		v.date.mes := random(12)+1;
		v.date.anio := 1900 + random(124) +1;
		v.cantV := random(100)+1;
		InsertarNodo(a,v);
		v.code := random(100);
	end;
end;

procedure retornarArbol1(a:arbol1);
begin
	if (a <> nil) then begin
		retornarArbol1(a^.HI);
		writeln('----- PRODUCTO #',a^.dato.code,' -----');
		writeln('Fecha: ',a^.dato.date.dia,'/',a^.dato.date.mes,'/',a^.dato.date.anio);
		writeln('Unidades vendidas: ',a^.dato.cantV);
		retornarArbol1(a^.HD);	
	end;	
end;


procedure GenerarVentasSinFecha(var a:arbol2);

	procedure InsertarNodo(var a:arbol2; v:ventaSinFecha);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato := v;
			a^.HI := nil;
			a^.HD := nil;
		end
		else if(v.code >= a^.dato.code) then
			InsertarNodo(a^.HD,v) else InsertarNodo(a^.HI,v);
	end;

var
	v : ventaSinFecha;
begin
	v.code := random(10);
	while(v.code <> 0) do begin
		v.cantV := random(100)+1;
		InsertarNodo(a,v);
		v.code := random(10);
	end;
end;

procedure retornarArbol2(a:arbol2);
begin
	if (a <> nil) then begin
		retornarArbol2(a^.HI);
		writeln('----- PRODUCTO #',a^.dato.code,' -----');
		writeln('Unidades vendidas: ',a^.dato.cantV);
		retornarArbol2(a^.HD);	
	end;	
end;

procedure generarVentasConListas(var a:arbol3);

	procedure agregarAdelante(var L:lista; f:fecha; cantV:integer);
	var
		nue : lista;
	begin
		new(nue);
		nue^.dato.date:=f;
		nue^.dato.cantV:=cantV;
		nue^.sig:=L;
		L:=nue;
	end;
	
	procedure InsertarNodo(var a:arbol3; L:lista; v:ventaCompleta);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.code := v.code;
			a^.dato.listaVendidos := nil;
			agregarAdelante(a^.dato.listaVendidos,v.date,v.cantV);
			a^.HI := nil;
			a^.HD := nil;
		end
		else if(v.code < a^.dato.code) then InsertarNodo(a^.HI,L,v)
		else if(v.code > a^.dato.code) then InsertarNodo(a^.HD,L,v)
		else agregarAdelante(a^.dato.listaVendidos,v.date,v.cantV);
	end;

var
	v : ventaCompleta; L : lista;
begin
	L := nil;
	v.code := random(50);
	while(v.code <> 0) do begin
		v.date.dia := random(31)+1;
		v.date.mes := random(12)+1;
		v.date.anio := 1900 + random(124) +1;
		v.cantV := random(100)+1;
		insertarNodo(a,L,v);
		v.code := random(50);
	end;
end;

procedure retornarArbol3(a:arbol3);
var
	L:lista; i:integer;
begin
	if (a <> nil) then begin
		retornarArbol3(a^.HI);
		writeln('----- PRODUCTO #',a^.dato.code,' -----');
		L:=a^.dato.listaVendidos; i:=0;
		while(L<>nil) do begin
			i := i + 1;
			writeln('--- VENTA ',i,' ---');
			writeln('Fecha: ',L^.dato.date.dia,'/',L^.dato.date.mes,'/',L^.dato.date.anio);
			writeln('Unidades vendidas: ',L^.dato.cantV);
			L:=L^.sig;
		end;
		writeln();
		retornarArbol3(a^.HD);	
	end;	
end;

function contarProductos(a:arbol1;f:fecha):integer;
begin
	if(a=nil) then contarProductos:=0
	else if (a^.dato.date.dia = f.dia) and 
			(a^.dato.date.mes = f.mes) and
			(a^.dato.date.anio = f.anio) then
				contarProductos := 1 + contarProductos(a^.HI,f) + contarProductos(a^.HD,f)
	else
        contarProductos := contarProductos(a^.HI, f) + contarProductos(a^.HD, f);
end;

function obtenerProductoMasVendido(a: arbol2): integer;

	procedure productoMasVendido(a: arbol2; var maxCodigo: integer; var maxUnidades: integer);
	begin
		if (a <> nil) then
		begin
			if (a^.dato.cantV > maxUnidades) then
			begin
				maxUnidades := a^.dato.cantV;
				maxCodigo := a^.dato.code;
			end;
			productoMasVendido(a^.HI, maxCodigo, maxUnidades);
			productoMasVendido(a^.HD, maxCodigo, maxUnidades);
		end;
	end;

var
    maxCodigo, maxUnidades: integer;
begin
    maxUnidades := -1;  
    maxCodigo := -1;     
    
    productoMasVendido(a, maxCodigo, maxUnidades);
    
    obtenerProductoMasVendido := maxCodigo;
end;



var
	arb1 : arbol1; arb2 : arbol2; arb3 : arbol3;
	fecB : fecha;
begin
	Randomize;
	
	writeln;
	writeln;
	writeln('////////// ARBOL CON VENTAS COMPLETAS //////////');
	writeln;
	arb1 := nil;
	generarVentasCompletas(arb1);
	retornarArbol1(arb1);
	
	
	writeln;
	writeln;
	writeln('////////// ARBOL CON VENTAS SIN FECHA //////////');
	writeln;
	arb2 := nil;
	generarVentasSinFecha(arb2);
	retornarArbol2(arb2);
	
	writeln;
	writeln;
	writeln('////////// ARBOL CON VENTAS Y VENTAS DE CADA PRODUCTO //////////');
	writeln;
	arb3 := nil;
	generarVentasConListas(arb3);
	retornarArbol3(arb3);
	
	writeln('////////// Fecha de retorno de cantidad de productos: //////////');
	write('Dia (1-31): '); readln(fecB.dia);
	write('Mes (1-12): '); readln(fecB.mes);
	write('Año: '); readln(fecB.anio);
	writeln('Cantidad de productos vendidos el día ',fecB.dia,'/',fecB.mes,'/',fecB.anio,': ',contarProductos(arb1,fecB));
	
	writeln(obtenerProductoMasVendido(arb2)); {CORREGIR}
end.

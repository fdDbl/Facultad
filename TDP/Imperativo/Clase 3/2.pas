program comercio;

type
	sDias = 1..31;
	sMeses = 1..12;
	sAnio = 1..2024;
	
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
		writeln('----- VENTA #',v.code,' -----');
		v.date.dia := random(31)+1;
		v.date.mes := random(12)+1;
		v.date.anio := random(2024)+1;
		writeln('Fecha: ',v.date.dia,'/',v.date.mes,'/',v.date.anio);
		v.cantV := random(100)+1;
		writeln('Cantidad de ventas: ',v.cantV);
		InsertarNodo(a,v);
		v.code := random(100);
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
	v.code := random(100);
	if(v.code <> 0) then begin
		v.cantV := random(100)+1;
		InsertarNodo(a,v);
		generarVentasSinFecha(a);
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
	v.code := random(100);
	while(v.code <> 0) do begin
		v.date.dia := random(31)+1;
		v.date.mes := random(12)+1;
		v.date.anio := random(2024)+1;
		v.cantV := random(100)+1;
		insertarNodo(a,L,v);
		v.code := random(100);
	end;
end;

var
	arb1 : arbol1; arb2 : arbol2; arb3 : arbol3;
begin
	Randomize;
	
	writeln('---------- ARBOL CON VENTAS COMPLETAS ----------');
	arb1 := nil;
	generarVentasCompletas(arb1);
	
	writeln('---------- ARBOL CON VENTAS SIN FECHA ----------');
	arb2 := nil;
	generarVentasSinFecha(arb2);
	
	arb3 := nil;
	generarVentasConListas(arb3);
end.

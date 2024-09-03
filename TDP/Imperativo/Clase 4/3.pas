program libreria;
const
    codeInvalido = -1;
type 
    venta = record
        code : integer;
        codeP : integer;
        cantUV : integer;
        precioU : real;
    end;
    
    producto = record
        code : integer;
        cantUV : integer;
        montoT : real;
    end;
    
    arbol = ^nodo1;
    nodo1 = record
        dato : venta;
        HI , HD : arbol;
    end;
    
    lista = ^nodo2;
    nodo2 = record
		dato : producto;
		sig : lista;
	end;

procedure cargarVentas(var a:arbol; var l:lista);
	
	procedure insertarProductoEnLista(var L:lista; code, cant : integer; precioU : real);
	var
		nue: lista;
		act, ant: lista;
		p:producto;
	begin
		p.code := code;
		p.cantUV := cant;
		p.montoT := cant * precioU;
		
		new (nue);
		nue^.dato := p;
		act := L;
		ant := L;
		while(act <> nil)and(p.code < act^.dato.code) do
		begin
			ant := act;
			act:= act^.sig;
		end;
		if (act = ant) then
			L:= nue
		else begin
			ant^.sig:= nue;
			nue^.sig:= act;
		end;
	end;

	procedure insertarVentaEnArbol(var a:arbol; v:venta);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:=v;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(v.codeP > a^.dato.codeP) then
			insertarVentaEnArbol(a^.HD,v)
		else
			insertarVentaEnArbol(a^.HI,v);
	end;

var
	v:venta; i:integer;
begin
	i:=1;
	writeln('<----- CARGA DE VENTAS ----->');
	writeln('--- VENTA ',i,' ---');
	writeln('Codigo de venta:'); readln(v.code);
	while(v.code <> codeInvalido) do begin
		i:=i+1;
		writeln('Codigo de producto vendido:'); readln(v.codeP);
		writeln('Cantidad de unidades vendidas:'); readln(v.cantUV);
		writeln('Precio unitario:'); readln(v.precioU);
		insertarProductoEnLista(l,v.codeP,v.cantUV,v.precioU);
		insertarVentaEnArbol(a,v);
		writeln();
		
		writeln('--- VENTA ',i,' ---');
		writeln('Codigo de venta:'); readln(v.code);
	end;
end;

procedure imprimirArbol(a:arbol);
begin
	if(a <> nil) then begin
		imprimirArbol(a^.HI);
			writeln('--- VENTA CODIGO #',a^.dato.code,' ---');
			writeln('Codigo de producto vendido: ',a^.dato.codeP);
			writeln('Cantidad de unidades vendidas: ',a^.dato.cantUV);
			writeln('Precio unitario: ',a^.dato.precioU);
			writeln();
		imprimirArbol(a^.HD);
	end;
end;

procedure ProductoConMasUnidadesVendidas(L:lista);
var
	max,codeAct,cantTotal,mejorCode:integer;
begin
	max:=-1;
	codeAct:=-1;
	while(L<>nil) do begin
		codeAct:=L^.dato.code;
		cantTotal:=0;
		while(L<>nil) and (codeAct = L^.dato.code)do begin
			cantTotal:=cantTotal+L^.dato.cantUV;
			L:=L^.sig;
		end;
		if(cantTotal > max) then begin
			max := cantTotal;
			mejorCode := codeAct;
		end;
	end;
	writeln('<----- CODIGO DEL PRODUCTO CON MAS UNIDADES VENDIDAS ----->');
	writeln(mejorCode);
	writeln();
	
end;

var
	a:arbol; L:lista;
begin
	a:=nil;
	CargarVentas(a,L);
	writeln;
	writeln('<---------- RECORRIDO DEL ARBOL ---------->');
	ImprimirArbol(a);
	ProductoConMasUnidadesVendidas(L);
end.

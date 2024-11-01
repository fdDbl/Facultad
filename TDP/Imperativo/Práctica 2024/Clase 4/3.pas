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
		while(act <> nil)and(p.code > act^.dato.code) do
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
	aux:lista;
begin
	max:=-1;
	while(L<>nil) do begin
		aux := L;
		codeAct:=L^.dato.code;
		cantTotal:=0;
        while (aux <> nil) and (codeAct = aux^.dato.code) do begin
            cantTotal := cantTotal + aux^.dato.cantUV;
            aux := aux^.sig;
		end;
		if(cantTotal > max) then begin
			max := cantTotal;
			mejorCode := codeAct;
		end;
		L := L^.sig;
	end;
	writeln('<----- CODIGO DEL PRODUCTO CON MAS UNIDADES VENDIDAS ----->');
	writeln(mejorCode);
	writeln;
end;

procedure CantCodigosMenoresQueValor(a:arbol);

	function calcular(a:arbol;val:integer):integer;
	begin
		if(a=nil) then calcular := 0
		else if(a^.dato.code < val) then calcular := 1 + calcular(a^.HI,val) + calcular(a^.HD,val)
		else calcular := calcular(a^.HI,val);
	end;

var
	valor:integer;
begin
	writeln('<----- CANTIDAD DE CODIGOS DE VENTA MENORES QUE UN VALOR ----->');
	writeln('Ingrese el valor:');
	readln(valor);
	writeln('Resultado: ',calcular(a,valor));
	writeln;
end;

procedure MontoTotalEntreDosCodigos(L:lista);
var
	code1,code2:integer; montoTotal:real;
begin
	writeln('<----- MONTO TOTAL ENTRE DOS CODIGOS DE PRODUCTO ----->');
	writeln('Codigo 1:');
	readln(code1);
	writeln('Codigo 2:');
	readln(code2);
	montoTotal := 0;
	
	while(L <> nil)and(L^.dato.code < code2) do begin
		if(L^.dato.code > code1) then
			montoTotal := montoTotal + L^.dato.montoT;
		L:=L^.sig
	end;
	writeln('Resultado: ',montoTotal);
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
	CantCodigosMenoresQueValor(a);
	MontoTotalEntreDosCodigos(L);
end.

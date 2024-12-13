program ABB1;
const
	DIMF = 9;
type
	arbol = ^nodo;
	nodo = record
		dato:integer;
		HI,HD:arbol;
	end;
	
	vNumeros = Array[1..DIMF] of Integer;

procedure llenarArbol(var a:arbol;v:vNumeros);
	procedure cargar(var a:arbol;n:integer);
	begin
		if(a=nil) then begin
			new(a);
			a^.dato:=n;
			a^.HI:=nil; a^.HD:=nil;
		end else if(n < a^.dato) then
			cargar(a^.HI,n)
			else
				cargar(a^.HD,n);
	end;
var
	i:integer;
begin

	for i:= 1 to DIMF do
		cargar(a,v[i]);
end;

procedure imprimirArbol(a:arbol);
begin
	if(a<>nil) then begin
		
		imprimirArbol(a^.HI);
		writeln(a^.dato);
		imprimirArbol(a^.HD);
		
	end;
end;

var
	a:arbol; v:vNumeros = (8,3,10,1,6,14,4,7,13);
begin
	a:=nil;
	llenarArbol(a,v);
	imprimirArbol(a);
end.

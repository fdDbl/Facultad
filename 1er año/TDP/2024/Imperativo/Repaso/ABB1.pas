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

procedure enOrden(a:arbol);
begin
	if(a<>nil) then begin
		enOrden(a^.HI);
		writeln(a^.dato);
		enOrden(a^.HD);
	end;
end;
procedure preOrden(a:arbol);
begin
	if(a<>nil) then begin
		writeln(a^.dato);
		preOrden(a^.HI);
		preOrden(a^.HD);
	end;
end;
procedure postOrden(a:arbol);
begin
	if(a<>nil) then begin
		postOrden(a^.HI);
		postOrden(a^.HD);
		writeln(a^.dato);
	end;
end;

var
	a:arbol; v:vNumeros = (8,3,10,1,6,14,4,7,13);
begin
	a:=nil;
	llenarArbol(a,v);
	enOrden(a);
end.

program supermercado;
type
	entrada = record
		hora:integer;
		dni:integer;
	end;

	lista = ^nodo;
	nodo = record
		dato:entrada;
		sig:lista;
	end;
	
	v1 = Array[1..7] of lista;

procedure generar7Listas(var v:v1);
var
	i:integer;
begin
	for i:=1 to 7 do begin
		
	end;
end;

var
	vDias : v1;
begin
	generar7listas(vDias);
	
end;

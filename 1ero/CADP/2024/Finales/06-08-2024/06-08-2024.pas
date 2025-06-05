program facultad;
const
	DIMFIRREGULARES = 1000;
type
	estudiante = record
		dni:integer;
		apellido:String;
		legajo:String;
	end;
	lista = ^nodo;
	nodo = record
		dato:estudiante;
		sig:lista;
	end;
	
	vDNIs = Array[1..DIMFIRREGULARES] of integer;

procedure eliminarAlumnosIrregulares(var L:lista; v:vDNIs; dimL:integer);
	procedure eliminarAlumno(var L:lista; dni:integer);
	var
		act,ant:lista;
	begin
		if(L <> nil) then begin
			act:=L;
			while(act <> nil)and(act^.dato.dni < dni) do begin
				ant:=act;
				act:=act^.sig;
			end;
			if(act <> nil) and (act^.dato.dni <> dni) then
				writeln('El alumno requerido no se encuentra en la lista')
			else begin
				if(act=L) then
					L := L^.sig
					else
						ant^.sig := act^.sig;
				dispose(act);
				act := ant;
			end;
		end;
	end;
var
	dniAct:integer; i:integer;
begin
	for i:= 1 to dimL do begin
		dniAct := v[i];
		eliminarAlumno(L,dniAct);
	end;
end;

var
	L:lista; v1:vDNIs; dimL:integer;
begin
	L:=nil;
	cargarLista(L);
	dimL := 0;
	cargarVectorIrregulares(v1,dimL);
	eliminarAlumnosIrregulares(L,v1,dimL);
end.

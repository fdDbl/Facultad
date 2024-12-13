{1- Una empresa dispone de la información de las asistencias de sus empleados durante un período de tiempo. 
    De cada empleado conoce: DNI, apellido y nombre, código de departamento en el que trabaja (entre 1 y 100), 
    fecha y si estuvo presente o no ese día (no todos los días se pasa asistencia y los empleados pueden haber estado 
    trabajando o haber faltado). Esta estructura se encuentra ordenada por código de departamento. Se pide realizar 
    un programa que informe el departamento con más empleados presentes durante el período evaluado por la empresa. }

program empresa;
const
    CANTDEPTOS = 100;
type
    fecha = record
        dia:integer;
        mes:integer;
        año:integer;
    end;

    sCodeDepto = 1..CANTDEPTOS;
    empleado = record
        dni:integer;
        apynom:String;
        codeDepto:sCodeDepto;
        fecha:rFecha;
        presente:boolean;
    end;

    listaAsistencias = ^nodo;
    nodo = record
        dato:empleado;
        sig:listaAsistencias;
    end;
    
    vDeptos = Array[1..CANTDEPTOS] of integer;

procedure cargarAsistencias(var L:listaAsistencias);    // se dispone

procedure analizarAsistencias(L:listaAsistencias; var v:vDeptos);
	procedure iniVDeptos(var v:vDeptos);
	var
		i:integer;
	begin
		for i:= 1 to CANTDEPTOS do
			v[i] := 0;
	end;
	function mejorDepartamento(v:vDeptos):sCodeDepto;
	var
		i:integer;
		max:integer;
		maxCode:integer;
	begin
		max:=0;
		maxCode:=0;
		for i:= 1 to CANTDEPTOS do
			if(v[i] > max) then begin
				max := v[i];
				maxCode := i;
			end;
		mejorDepartamento := maxCode;
	end;
var
    i:integer;
    codeDeptoAct:sCodeDepto;
    mejorDepto:sCodeDepto;
begin
	iniVDeptos(v);
	while(L<>nil) do begin
		codeDeptoActual := L^.dato.codeDepto;
		while(codeDeptoActual = L^.dato.codeDepto) do begin
			if(L^.dato.presente) then
				v[codeDeptoActual] := v[codeDeptoActual] + 1;
			L:=L^.sig;
		end;
	end;
	
	mejorDepto:=mejorDepartamento(v);
	if(mejorDepto <> 0) then
		writeln("El departamento con mayor cantidad de empleados presentes es el #", mejorDepto)
	else
		writeln("No hay asistencias registradas.")
end;

var
    L:listaAsistencias;
    v:vDeptos;
begin
    L:=nil;
    cargarAsistencias(L);   // se dispone
    analizarAsistencias(L,v);
end.

{2- Suponga que se quiere implementar un módulo que retorne verdadero o falso si un valor entero existe o no en un vector. 
	Indique para cada una de estas opciones (A y B) si realiza de forma correcta y/o eficiente la búsqueda de un valor 
	entero en un vector. Justificar. 
	
	type
		vector = array [1..1000] of integer;
		
		OPCIÓN A:
			procedure busqueda (v: vector; dimL: integer; valor: integer; var ok: boolean);
			var 
				i: integer;
			begin
				i:=1;
				for i:= 1 to dimL do
					if (valor = v(i)) then ok:= true
					else ok: false;
			end;
		
		OPCIÓN B:
			procedure busqueda (v: vector; dimL: integer; valor: integer; var ok: boolean);
			var 
				i: integer;
			begin
				i:=1; ok:= false;
				while (i < dimL) and (not ok) do begin
					if (valor = v(i)) then ok: true
					i:=i + 1;
				end;
			end;
		
		La opción correcta es la B. La opción A es errónea porque recorre todo el vector, sin importar si ya encontró o no el valor. 
		Además, si lo encontró, a menos que el último que encontró sea el último, el valor true de ok va a ser reemplazado por el false 
		del siguiente elemento analizado (que probablemente no sea el mismo) En cambio, la opción B deja de recorrer cuando ya encontró el elemento.
	}

program edificio;
const
    dimF = 300;
type
    sOficinas = 0..dimF;
    oficina = record
        codID : integer;
        DNI : integer;
        valExp : real;
    end;

    vOficinas = Array[1..dimF] of oficina;

procedure cargarVector(var v:vOficinas; var i : sOficinas);
var
    o:oficina;
begin
    i:=0;
    writeln('----- OFICINA ',i+1,' -----'); 
    writeln('Codigo de identificacion:'); readLn(o.codID);
    i:=0;
    while(o.codID <> -1)and(i<300) do begin
        i:=i+1;
        writeln('DNI:'); readLn(o.DNI);
        writeln('Valor de la expensa:'); readLn(o.valExp);
        v[i]:=o;
        
        writeln('----- OFICINA ',i+1,' -----'); 
        writeln('Codigo de identificacion:'); readLn(o.codID);
    end;
    if(o.codID = -1) then writeln('----- LECTURA FINALIZADA CON ',i,' OFICINA(S) LEIDA(S) -----');
end;

procedure imprimirVector(v:vOficinas; dimL : sOficinas);
var
    i : sOficinas;
begin
    for i:= 1 to dimL do begin
        writeln('----- OFICINA ',i,' -----'); 
        writeln('Codigo de identificacion:'); writeln(v[i].codID);
        writeln('DNI:'); writeln(v[i].DNI);
        writeln('Valor de la expensa:'); writeln(v[i].valExp);
        writeln(''); 
    end;
end;

procedure ordenarInsercion(var v:vOficinas; dimL:sOficinas);
var 
	i, j: sOficinas {indices}; actual: oficina {tipo de datos del vector};
begin
	for i:= 2 to dimL do begin
		actual:= v[i]; {casilla actual}
		j:= i-1;
		while (j > 0) and (v[j].codID > actual.codID) do begin {compara los datos (DEBEN SER DATOS SIMPLES, por eso se indica un campo del registro)}
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= actual;
	end;
end;

procedure ordenarSeleccion(var v:vOficinas; dimL:sOficinas);
var 
	i, j, pos: sOficinas; item: oficina; {lo mismo que en insercion}
begin
	for i:=1 to dimL-1 do begin {busca el mínimo y guarda en pos la posición}
		pos := i;
		for j:=i+1 to dimL do
			if v[j].codID < v[pos].codID then pos:=j;

		{intercambia v[i] y v[p]}
		item := v[pos];
		v[pos] := v[i];
		v[i]:= item;
	end;
end;

var
    v1 : vOficinas;
    dimL : sOficinas;
begin
    cargarVector(v1,dimL);
    imprimirVector(v1,dimL);
    ordenarInsercion(v1,dimL);
    writeln('ORDENACION POR INSERCION')
    imprimirVector(v1,dimL);
    ordenarSeleccion(v1,dimL);
    writeln('ORDENACION POR SELECCION')
    imprimirVector(v1,dimL);
end.
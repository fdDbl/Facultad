program netflix;
const
    cantGeneros = 8;
type
    sGeneros = 1..cantGeneros;
    pelicula = record
        codP : integer;
        codG : sGeneros;
        puntProm : real;
    end;

    lista = ^nodo;
    nodo = record
        dato:pelicula;
        sig:lista;
    end;

    vPelisXGenero = Array[sGeneros] of lista;
    vMejoresPunt = Array[sGeneros] of integer;

procedure leerPelicula(var p:pelicula);
begin
    write('ID de pelicula: ');
	readln(p.codP);
	if(p.codP <> -1) then begin
		write('Genero (1-8): ');
		readln(p.codG);
		write('Puntaje promedio: ');
		readln(p.puntProm);
	end;
	writeln;
end;

procedure agregarAtras(p:pelicula;var pri,ult:lista);
var
    nue:lista;
begin
    new(nue);
	nue^.dato := p;
	nue^.sig := nil;
	if(pri = nil) then
		pri := nue
	else
		ult^.sig := nue;
	ult := nue;
end;

procedure cargarPeliculas(var v:vPelisXGenero);
var
    p:pelicula;
    ult:vPelisXGenero;
begin
    leerPelicula(p);
    while(p.codP <> -1) do begin
        agregarAtras(p,v[p.codG],ult[p.codG]);
        leerPelicula(p);
    end;
end;

procedure generarVMejoresPuntajes(vCompleto:vPelisXGenero; vMP:vMejoresPunt);
var
    i:sGeneros; min:real; mejorCod:integer;
begin
    for i := 1 to cantGeneros do begin
        min:=-1;
        while(vCompleto[i] <> nil) do
            if(vCompleto[i].puntProm > min) then begin
                min := vCompleto[i].puntProm;
                mejorCod := vCompleto[i].codP;
            end;
        vMP[i]:=mejorCod;
    end;
end;

procedure ordenarVectorPuntajes(var v:vMejoresPunt);
var 
	i, j: sGeneros {indices}; actual: integer; {tipo de datos del vector};
begin
	for i:= 2 to cantGeneros do begin
		actual:= v[i]; {casilla actual}
		j:= i-1;
		while (j > 0) and (v[j] > actual) do begin {compara los datos (DEBEN SER DATOS SIMPLES, por eso se indica un campo del registro)}
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= actual;
	end;
end;

procedure mejorYPeorPunt(v:vMejoresPunt);
var
    max,min:real; mejorCode,peorCode:integer; puntAct:real; i:sGeneros; vPelis : vPelisXGenero;
begin
    max:=999999; min:=-1; encontre:boolean;
    for i := 1 to cantGeneros do begin
        encontre:=false;
        while(vPelis[i] <> nil)and(encontre=false) do begin
                if(vPelis[i].codP = v[i]) then begin
                    puntAct:= vPelis[i].puntProm;
                    encontre:=true;
                end
                else vPelis[i] := vPelis[i] + 1;
        end;
        if(puntAct > min) then begin
            mejorCode:=v[i];
            min:=puntAct;
        end
        else if(puntAct < max) then begin
	    peorCode:=v[i];
            max:=puntAct;
	end;
    end;
end;

var
    L1:lista; v1:vPelisXGenero; v2:vMejoresPunt;
begin
    cargarPeliculas(v1);
    generarVMejoresPuntajes(v1,v2);
    ordenarVectorPuntajes(v2);
    mejorYPeorPunt(v2);
end.

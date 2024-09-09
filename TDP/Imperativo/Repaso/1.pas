program administrador;
const
	cantOficinas = 300;
type
	oficina = record
		codID : integer;
		DNI : integer;
		valExp : real;
	end;
	vOficinas = array[1..cantOficinas] of oficina;

procedure CargarVectorOficinas(var v:vOficinas;var dimL:integer);
begin
	dimL:=0;
	v[dimL+1].codID := random(30);
	while(v[dimL+1].codID <> 0) do begin
		dimL:=dimL+1;
		v[dimL].DNI := random(9999);
		v[dimL].valExp := random(9999999);
		
		v[dimL+1].codID := random(30);
	end;
end;

procedure RetornarVectorOficinas(v:vOficinas;dimL:integer);
var
	i:integer;
begin
	for i := 1 to dimL do begin
		writeln('<----- OFICINA ',i,' ----->');
		writeln('Codigo ID: ',v[i].codID);
		writeln('DNI Propietario: ',v[i].DNI);
		writeln('Valor de la expensa: ',v[i].valExp);
		writeln;
	end;
end;

procedure OrdenarRetornarVectorSeleccion(var v:vOficinas;dimL:integer); // SELECCIÓN
var
	i,j:integer;
	posMin:integer;
	item:oficina;
begin
	for i := 1 to dimL-1 do begin
		posMin := i;			// posMin por ahora es i
		for j := (i+1) to dimL do			// Desde i (no incluido) hasta dimL
			if(v[j].codID < v[posMin].codID) then			// Si el valor de esta posición es menor al de la posición posMin...
				posMin:=j;			// ...entonces la posición posMin ahora será donde estoy parado
			
		item := v[posMin];			// Intercambio
		v[posMin] := v[i];
		v[i] := item;
	end;
end;

procedure OrdenarRetornarVectorInsercion(var v:vOficinas; dimL:integer); // INSERCIÓN
var
	i,j:integer;
	act:oficina;
begin
	for i := 2 to dimL do begin
		j := i-1;
		act := v[i];
		while(j > 0) and (v[j].codID > act.codID) do begin
			v[j+1] := v[j];
			j := j-1;
		end;
		v[j+1] := act;
	end;
end;

procedure BusquedaDicotomica(v:vOficinas;dimL:integer);

	function buscar(v:vOficinas;dimL:integer;x:integer):integer;
	var
		pri,ult,medio:integer;
	begin
		pri:=1; ult:=dimL;
		medio := (pri+ult) DIV 2;
		while(pri<=ult)and(x<>v[medio].codID) do begin
			if(x>v[medio].codID) then pri := medio + 1
			else ult := medio - 1;
			
			medio := (pri+ult) DIV 2;
		end;
		if(pri<=ult) then buscar:=medio else buscar:=0;
	end;

var
	valor:integer;
begin
	writeln('<----- INGRESE UN CODIGO DE ID A BUSCAR ----->');
	readln(valor);
	if(buscar(v,dimL,valor)<>0) then begin
		writeln('ENCONTRADO');
		writeln('DNI del propietario: ',v[buscar(v,dimL,valor)].DNI);
	end
	else writeln('NO ENCONTRADO');
	
end;

procedure MontoTotalExpensas(v:vOficinas;dimL:integer);

	function sumarExpensas(v:vOficinas;dimL:integer;i:integer):real;
	begin
		if(i<dimL) then
			sumarExpensas := v[i+1].valExp + sumarExpensas(v,dimL,i+1);
	end;

var
	mTotal:real; i:integer;
begin
	i:=0;
	mTotal:=sumarExpensas(v,dimL,i);
	writeln('Monto total de expensas: ',mTotal);
end;

var
	v1:vOficinas; dimL:integer;
begin
	Randomize;
	CargarVectorOficinas(v1,dimL);
	RetornarVectorOficinas(v1,dimL);
	writeln;
	OrdenarRetornarVectorSeleccion(v1,dimL);
	OrdenarRetornarVectorInsercion(v1,dimL);
	RetornarVectorOficinas(v1,dimL);
	writeln;
	BusquedaDicotomica(v1,dimL);
	writeln;
	MontoTotalExpensas(v1,dimL);
end.

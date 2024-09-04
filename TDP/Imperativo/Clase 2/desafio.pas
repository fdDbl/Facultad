program desafio;

procedure convertirABinario(dec:integer;var bin:integer);
begin
	if(dec<>0) then begin
		{INCOMPLETO}
	end;
end;

var
	nDecimal:integer; nBinario:integer;
begin
	writeln('----- CONVERTIRDOR DE DECIMAL A BINARIO -----');
	writeln('Ingrese el valor decimal a convertir:'); readln(nDecimal);
	while(nDecimal <> 0) do begin
		nBinario:=0;
		convertirABinario(nDecimal,nBinario);
		writeln('Ingrese el valor decimal a convertir:'); readln(nDecimal);
	end;
end.

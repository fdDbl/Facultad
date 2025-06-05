	program empresa;
	type
		venta = record
			nro:integer;
			cantProd:integer;
			tipoPago:String;
		end;
		lista = ^nodo;
		nodo = record
			dato:venta;
			sig:lista;
		end;

	procedure cargarSegundaEstructura(L1:lista; var L2:lista);
		procedure cargarNodo(v:venta; var L:lista);
		var
			act,ant,nue:lista;
		begin
			new(nue);
			nue^.dato:=v;
			act:=L;	
			ant:=L;
			if(v.tipoPago = 'Efectivo')or(act = nil) then
				L:=nue
			else begin
				while(act <> nil) and (act^.dato.tipoPago = 'Efectivo') do begin
					ant:=act;
					act:=act^.sig;
				end;
				ant^.sig:=nue;
			end;
			nue^.sig:=act;
		end;
		function masPares(nro:integer):boolean;
		var
			ultDigit:integer;
			cantP,cantImp:integer;
		begin
			masPares := false;
			cantP:=0; cantImp:=0;
			while(nro <> 0) do begin
				ultDigit:=nro MOD 10;
				if(ultDigit MOD 2 = 0) then
					cantP := cantP + 1
				else
					cantImp := cantImp + 1;
				nro := nro DIV 10;
			end;
			if(cantP > cantImp) then
				masPares := true;
		end;
	begin
		while(L1 <> nil) do begin
			if(masPares(L1^.dato.cantProd)) then
				cargarNodo(L1^.dato,L2);
			L1:=L1^.sig;
		end;
	end;
	var
		L1,L2:lista;
	begin
		L1:=nil;
		cargarVentas(L1);	// se dispone
		L2:=nil;
		cargarSegundaEstructura(L1,L2);
	end.

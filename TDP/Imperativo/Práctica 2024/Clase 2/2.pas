program recursivo;
type
  lista = ^nodo;
  nodo = record
    dato:integer;
    sig:lista;
  end;

procedure agregarAdelante(var L:lista;num:integer);
var nue:lista;
begin
  new(nue);
  nue^.dato:=num;
  nue^.sig:=L;
  L:=nue;
end;

procedure enteros100a200(var L:lista);
var
  n:integer;
begin
  n := Random(101)+100;
  if(n<>100) then begin
    agregarAdelante(L,n);
    enteros100a200(L);
  end; 
end;

procedure imprimirLista(L:lista);
begin
	if(L<>nil) then begin
		writeLn(L^.dato);
		imprimirLista(L^.sig);
	end;
end;

procedure imprimirAlReves(L:lista);
begin
  if(L <> nil) then begin
    imprimirAlReves(L^.sig);
    writeLn(L^.dato);  
  end;
end;

function hallarMinimo(L:lista;max:integer):integer;
begin
	if(L<>nil) then begin
	
		if(L^.dato<max) then
			max:=L^.dato;
		hallarMinimo:=hallarMinimo(L^.sig,max);
	end else hallarMinimo:=max;
end;

function buscarValor(L:lista;val:integer):boolean;
begin
	if(L<>nil) then begin
		if(L^.dato=val) then
			buscarValor:=true
		else begin
			buscarValor:=buscarValor(L^.sig,val);
		end;
	end else
	buscarValor:=false;
end;

var
  L1:lista; max:integer; encontreValor:boolean; valor:integer;
begin
  L1:=nil;
  randomize;
  enteros100a200(L1);
  writeln('----- LISTA ORDENADA NORMALMENTE -----');
  imprimirLista(L1);
  writeln('----- LISTA ORDENADA AL REVES -----');
  imprimirAlReves(L1);
  max:=201;
  writeln('----- VALOR MINIMO DE LA LISTA -----');
  writeln(hallarMinimo(L1,max));
  writeln('----- Ingrese el valor a buscar en la lista: -----');
  readLn(valor);
  encontreValor:=buscarValor(L1,valor);
  writeln('----------');
  if(encontreValor) then writeLn('Se ha encontrado el ',valor,' en la lista.') else
					writeLn('No se ha encontrado el ',valor,' en la lista.');
end.

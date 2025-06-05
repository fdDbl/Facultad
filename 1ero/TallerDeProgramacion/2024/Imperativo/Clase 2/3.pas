program recursivo;
const
	dimF=20;
type
	vEnteros = Array[1..dimF] of integer;

procedure enterosRandom(var v:vEnteros);
	procedure insertarRandom(var v:vEnteros;n:integer;i:integer);
	begin
		if(i<=dimF) then begin
			v[i]:=n;
			n := Random(1251)+300;
			insertarRandom(v,n,i+1);
		end;
	end;
var
	i:integer; nRandom:integer;
begin
	i:=0;
	nRandom := Random(1251)+300;
	insertarRandom(v,nRandom,i+1);
end;

procedure ordenarVector(var v:vEnteros);
var
 i, j: integer; actual: integer;	
		
begin
 for i:= 2 to dimF do begin 
     actual:= v[i];
     j:= i-1; 
     while (j > 0) and (v[j] > actual) do      
       begin
         v[j+1]:= v[j];
         j:=j-1;                  
       end;  
     v[j+1]:= actual; 
 end;
end;

Procedure busquedaDicotomica (v: vEnteros; pri,ult: integer; dato:integer; var pos: integer);
var
	medio:integer;
begin
	pos:=-1;
	medio:=(pri+ult) DIV 2;
	while(pri<=ult)and(dato<>v[medio]) do begin
		if(dato<v[medio]) then
			ult:=medio-1 else
			pri:=medio+1;
		medio:=(pri+ult) DIV 2;
	end;
	if(pri<=ult) then
		pos:=medio else
		pos:=-1;
end;

var
	v1:vEnteros; i:integer; valor:integer;
begin
	Randomize;
	enterosRandom(v1);
	writeln('----- VECTOR RESULTANTE -----');
	for i := 1 to dimF do writeln(v1[i]);
	ordenarVector(v1);
	writeln('----- VECTOR ORDENADO -----');
	for i := 1 to dimF do writeln(v1[i]);
	
	writeln('Ingrese el valor a buscar:');
	readln(valor);
	busquedaDicotomica(v1,1,dimF,valor,i);
	if(i=-1) then writeln('El valor ingreso no se encuentra.') else
				  writeln('El valor se encuentra en la posicion ',i,' del vector.');
end.

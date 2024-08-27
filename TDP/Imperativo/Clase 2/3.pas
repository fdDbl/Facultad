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

var
	v1:vEnteros; i:integer;
begin
	Randomize;
	enterosRandom(v1);
	writeln('----- VECTOR RESULTANTE -----');
	for i := 1 to dimF do writeln(v1[i]);
	ordenarVector(v1);
	writeln('----- VECTOR ORDENADO -----');
	for i := 1 to dimF do writeln(v1[i]);
	
	{FALTA BUSQUEDA DICOTOMICA}
end.

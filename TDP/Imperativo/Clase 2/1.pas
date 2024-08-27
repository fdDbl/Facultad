

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;
 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; dimL: integer; i:integer);
begin    
    if(i<=dimL) then begin
        writeLn(v[i]);
        ImprimirVectorRecursivo(v,dimL,i+1);
    end;
end; 
    
function Sumar (v: vector; dimL: integer): integer; 

  function SumarRecursivo (v: vector; pos, dimL: integer): integer;

  Begin
    if (pos <= dimL) then
		if(v[pos] MOD 2 = 0) then
			SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos]
		else SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL)
	else SumarRecursivo:=0;
	
  End;
 
var pos: integer; 
begin
 pos:= 1;
 Sumar:= SumarRecursivo (v, pos, dimL);
end;

function  ObtenerMaximo (v: vector; dimL: integer; min:integer;i:integer): integer;
begin
	if(i<=dimL) then begin
		if(v[i]>min) then
			min:=v[i];
		ObtenerMaximo:= ObtenerMaximo(v,dimL,min,i+1);
	end else 
	ObtenerMaximo:=min;
end;     
     
function  BuscarValor (v: vector; dimL, valor: integer;i:integer): boolean;
begin
  if(i<=dimL) then begin
	if(v[i]=valor) then 
		BuscarValor:=true 
	else
	    BuscarValor:= BuscarValor(v,dimL,valor,i+1);
  end
  else BuscarValor:= false;
end; 

procedure ImprimirDigitos (v: vector; dimL: integer;i:integer);
var
  numAct: integer;
  numDigits: integer;
  divisor: integer;
begin
  if(i<=dimL) then begin
      numAct := v[i];
      { Calcula el número de dígitos }
      numDigits := 0;
      divisor := 1;
      while (numAct DIV divisor > 0) do
      begin
        divisor := divisor * 10;
        numDigits := numDigits + 1;
      end;
      { Imprime los dígitos de izquierda a derecha }
      divisor := divisor DIV 10;
      while (divisor > 0) do
      begin
        writeln(numAct DIV divisor);
        numAct := numAct MOD divisor;
        divisor := divisor DIV 10;
      end;
  writeln;
  ImprimirDigitos(v,dimL,i+1);
  end;
end;

var dimL, suma, maximo, valor: integer; 
    v: vector; maxNum:integer;
    encontre: boolean; pos:integer;
Begin 
  Randomize;
  pos:=1;
  CargarVector (v, dimL);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL);
                       ImprimirVectorRecursivo (v, dimL, pos);
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL);
  writeln;
  writeln;
  writeln('La suma de los valores pares del vector es ', suma); 
  writeln;
  writeln;
  maxNum:=-1;
  maximo:= ObtenerMaximo(v, dimL,min,pos);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor,pos);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL,pos);
end.

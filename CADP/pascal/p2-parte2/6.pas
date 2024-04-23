program seis;
var
    i:integer;
    precio:integer;
    code:integer;
    tipo:string;
    max:integer;
    precioMasB1:integer;
    precioMasB2:integer;
    prodCodeMasB1:integer;
    prodCodeMasB2:integer;
    codeMasBarato1:integer;
    codeMasBarato2:integer;
    codePantMasCaro:integer;
    totalPrecios:integer;
    cantProd:integer;
    promedio:real;

    procedure leer(var precio:integer; var code:integer; var tipo:string);
        begin
            readln(precio);
            readln(code);
            readln(tipo);
        end;

    procedure codeMasBaratos(precio:integer; code:integer; var precioMasB1:integer; var precioMasB2:integer;
                            var codeMasBarato1:integer; var codeMasBarato2:integer);
        begin
            if(precio<precioMasB1) then begin
                precioMasB1:=precio;
                codeMasBarato1:=code;  
                prodCodeMasB1:=codeMasBarato1;
            end
            else if(precio<precioMasB2) then begin
                precioMasB2:=precio;
                codeMasBarato2:=code; 
                prodCodeMasB2:=codeMasBarato2;
            end;
        end;

    procedure pantMasCaro(var precio:integer; var code:integer; var tipo:string ; var max:integer);
        begin
            if(tipo='pantalon')and(precio>max) then
                begin
                    max:=precio;
                    codePantMasCaro:=code;
                end
        end;

    procedure total(precio:integer);
        begin
            totalPrecios:=totalPrecios+precio;
            cantProd:=cantProd+1;
        end;

    procedure precioPromedio();
        begin
            promedio:=totalPrecios DIV cantProd;
        end;
    
    procedure informar(codePantMasCaro:integer; prodCodeMasB1:integer; prodCodeMasB2:integer; precioPromedio:real);
        begin
            writeln('El codigo del pantalon mas caro es: ',codePantMasCaro);
            writeln('El codigo de los dos productos mas baratos es: ',prodCodeMasB1,' y ',prodCodeMasB2);
            writeln('El precio promedio es: ',precioPromedio);
        end;    
    procedure repetir();
        begin
            max:=-1;
            precioMasB1:=32767;
            precioMasB2:=32767;
            codeMasBarato1:=0;
            codeMasBarato2:=0;
            totalPrecios:=0;
            cantProd:=0;
            promedio:=0;
            for i:= 1 to 3 do begin
                leer(precio,code,tipo);
                codeMasBaratos(precio,code,precioMasB1,precioMasB2,codeMasBarato1,codeMasBarato2);
                pantMasCaro(precio,code,tipo,max);
                total(precio);
            end;
        end;

    procedure programa();
        begin
            repetir();
            precioPromedio();
            informar(codePantMasCaro,codeMasBarato1,codeMasBarato2,promedio);
        end;

begin
    programa();
end.
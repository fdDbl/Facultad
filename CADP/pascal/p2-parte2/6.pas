program seis;
Uses math;
var
    i:integer;
    precio:real;
    code:integer;
    tipo:string;
    max:real;
    precioMasB1:real;
    precioMasB2:real;
    prodCodeMasB1:integer;
    prodCodeMasB2:integer;
    codeMasBarato1:integer;
    codeMasBarato2:integer;
    codePantMasCaro:integer;
    totalPrecios:real;
    cantProd:real;
    promedio:real;

    procedure leer();
        begin
            writeln('');
            writeln('Ingrese el precio del producto ',i,':');
            readln(precio);
            writeln('Ingrese el codigo del producto ',i,':');
            readln(code);
            writeln('Ingrese el tipo del producto ',i,' (pantalon, remera, camisa, medias, campera, etc.):');
            readln(tipo);
        end;

    procedure codeMasBaratos(precio:real; code:integer; var precioMasB1:real; var precioMasB2:real;
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

    procedure pantMasCaro(var precio:real; var code:integer; var tipo:string ; var max:real);
        begin
            if(tipo='pantalon')and(precio>max) then
                begin
                    max:=precio;
                    codePantMasCaro:=code;
                end
        end;

    procedure total(precio:real);
        begin
            totalPrecios:=totalPrecios+precio;
            cantProd:=cantProd+1;
        end;

    procedure precioPromedio();
        begin
            promedio:=totalPrecios / cantProd;
        end;
    
    procedure informar(codePantMasCaro:integer; prodCodeMasB1:integer; prodCodeMasB2:integer; precioPromedio:real);
        begin
            writeln('');
            writeln('El codigo del pantalon mas caro es: ',codePantMasCaro);
            writeln('Los codigos de los dos productos mas baratos son: ',prodCodeMasB1,' y ',prodCodeMasB2);
            writeln('El precio promedio es: ',precioPromedio);
        end;    
    procedure repetir();
        begin {INICIALIZACION DE VARIABLES}
            max:=-1;
            precioMasB1:=32767;
            precioMasB2:=32767;
            codeMasBarato1:=0;
            codeMasBarato2:=0;
            totalPrecios:=0;
            cantProd:=0;
            promedio:=0;
            for i:= 1 to 100 do begin
                leer();
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
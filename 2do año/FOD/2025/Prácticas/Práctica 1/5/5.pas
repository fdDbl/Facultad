program cinco;

type
    celular = record
        code: integer;
        nombre: string;
        desc: string;
        marca: string;
        precio: double;
        stockMin: integer;
        stockAct: integer;
    end;

    a1 = file of celular;

procedure asignarBin(var a: a1);
var
    aFisico: string;
begin
    write('Ingrese nombre del archivo binario: ');
    readln(aFisico);
    assign(a, aFisico);
end;
procedure nuevoArchivo(var a: a1);
var
    aTXT: text;
    c: celular;
    nomTXT: string;
begin
    writeln('-- NUEVO ARCHIVO --');
    write('Archivo .txt para extraer informacion: ');
    readln(nomTXT);
    assign(aTXT, nomTXT);
    asignarBin(a);
    
    rewrite(a);
    reset(aTXT);
    
    while not EOF(aTXT) do
    begin
        with c do
        begin
            readln(aTXT, code, precio, marca);
            readln(aTXT, stockAct, stockMin, desc);
            readln(aTXT, nombre);
        end;
        write(a, c);
    end;
    
    close(a);
    close(aTXT);
    writeln('(!) Archivo binario creado.');
end;

procedure informarCelular(c: celular);
begin
    writeln('Codigo: ', c.code);
    writeln('Nombre: ', c.nombre);
    writeln('Descripcion: ', c.desc);
    writeln('Marca: ', c.marca);
    writeln('Precio: ', c.precio:0:2);
    writeln('Stock minimo: ', c.stockMin, '; Stock actual: ', c.stockAct);
end;

procedure listarStockMin(var a: a1);
var
    c: celular;
begin
    writeln('-- LISTADO DE CELULARES CON STOCK MENOR AL MINIMO --');
    asignarBin(a);
    reset(a);
    
    while not EOF(a) do
    begin
        read(a, c);
        if c.stockAct < c.stockMin then
            informarCelular(c);
    end;
end;

procedure listarDesc(var a: a1);
var
    c: celular;
    descr: string;
begin
    writeln('-- LISTADO DE CELULARES CON DESCRIPCION DETERMINADA --');
    asignarBin(a);
    reset(a);
    
    write('Ingrese una descripcion: ');
    readln(descr);
    
    while not EOF(a) do
    begin
        read(a, c);
        if c.desc = descr then
            informarCelular(c);
    end;
end;

procedure exportarTXT(var a: a1);
var
    nomTXT: string;
    aTXT: text;
    c: celular;
begin
    writeln('-- EXPORTAR A TXT --');
    asignarBin(a);
    reset(a);
    
    write('Nombre del archivo nuevo .txt: ');
    readln(nomTXT);
    assign(aTXT, nomTXT);
    rewrite(aTXT);
    
    while not EOF(a) do
    begin
        read(a, c);
        with c do
        begin
            writeln(aTXT, code, ' ', precio:0:2, marca);
            writeln(aTXT, stockAct, ' ', stockMin, desc);
            writeln(aTXT, nombre);
        end;
    end;
    
    close(aTXT);
    close(a);
    writeln('(!) Archivo .txt creado.');
end;

procedure menuPrincipal(var aC: a1);
var
    opc: integer;
begin
    writeln('----- MENU DE OPCIONES -----');
    opc := 0;
    
    repeat
        writeln('1. Nuevo archivo a partir de .txt existente');
        writeln('2. Listar celulares con stock menor al minimo');
        writeln('3. Listar celulares con descripcion determinada');
        writeln('4. Exportar archivo a .txt');
        writeln('99. X SALIR X');
        readln(opc);
        
        case opc of
            1: nuevoArchivo(aC);
            2: listarStockMin(aC);
            3: listarDesc(aC);
            4: exportarTXT(aC);
            99: writeln('Programa finalizado.');
        else
            writeln('(!) ERROR: Opcion incorrecta');
        end;
    until opc = 99;
end;

var
    aC: a1;
begin
    menuPrincipal(aC);
end.
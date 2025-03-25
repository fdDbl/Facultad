program uno;
const
    VALOR_ALTO=9999;
type
    empleado = record
        code:integer;
        nombre:string;
        comision:double;
    end;

    a1 = file of empleado;
procedure leer(var a:a1; var e:empleado);
begin
    if(not EOF(a)) then
        read(a,e)
    else
        e.code := VALOR_ALTO;
end;
procedure cargarDetalles(var aD:a1);
var
    e:empleado;
begin
    assign(aD,'archivoDetalle');
    rewrite(aD);
    readln(e.code);
    while(e.code <> -1) do begin
        readln(e.nombre);
        readln(e.comision);
        write(aD,e);

        readln(e.code);
    end;
    close(aD);
end;
procedure cargarMaestro(var aD,aM:a1);
var
    codeAct:integer; eDetalle,eMaestro:empleado;
begin
    reset(aD);
    assign(aM,'archivoMaestro');
    rewrite(aM);
    leer(aD,eDetalle);
    while(eDetalle.code <> VALOR_ALTO) do begin
        codeAct := eDetalle.code;
        eMaestro := eDetalle;
        leer(aD,eDetalle);
        while(codeAct = eDetalle.code) and (eDetalle.code <> VALOR_ALTO) do begin
            eMaestro.comision := eMaestro.comision + eDetalle.comision;
            leer(aD,eDetalle);
        end;
        write(aM,eMaestro);
    end;
    close(aD);
    close(aM);
end;

procedure exportarATXT(var a:a1);
var
    aTexto:text; e:empleado;
begin
    assign(aTexto,'archivo.txt');
    rewrite(aTexto);
    reset(a);
    while(not EOF(a)) do begin
        read(a,e);
        writeln(aTexto,'Codigo: ',e.code,', Nombre: ',e.nombre,', Comision: ',e.comision:0:2);
        writeln('Codigo: ',e.code,', Nombre: ',e.nombre,', Comision: ',e.comision:0:2); // debug
    end;
    close(a); close(aTexto);
end;
var
    aDetalle:a1;
    aMaestro:a1;
begin
    cargarDetalles(aDetalle);
    cargarMaestro(aDetalle,aMaestro);
    exportarATXT(aMaestro);
end.
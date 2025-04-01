program cinco;
const
    DEL = 50;
type
    direccion = record
        calle:string;
        nro:integer;
        piso:integer;
        depto:char;
        ciudad:string;
    end;
    tutorLegal = record
        nom:string[20];
        ap:string[20];
        dni:longint;
    end;

    nacimiento = record
        nroPartida:integer;
        nombre:string[20];
        apellido:string[20];
        dir:direccion;
        matriculaMed:string[10];
        madre,padre:tutorLegal;
    end;
    fallecimiento = record
        nroPartida:integer;
        nombre:string[20];
        apellido:string[20];
        dni:longint;
        matriculaMed:string[10];
        lugar:direccion;
        fecha:string[10];
        hora:string[5];
    end;

    registroMaestro = record
        nroPartida:integer;
        nombre:string[20];
        apellido:string[20];
        dir:direccion;
        matriculaMedNac:string[10];
        madre,padre:tutorLegal;
        fallecido:boolean;
        matriculaMedFac:string[10];
        lugar:direccion;
        fecha:string[10];
        hora:string[5];
    end;

    archivoDetalleNacimiento = file of nacimiento;
    archivoDetalleFallecimiento = file of fallecimiento;
    delegacion = record
        nacimientos:archivoDetalleNacimiento;
        fallecimientos:archivoDetalleFallecimiento
    end;
    vectorDelegaciones = Array[1..DEL] of delegacion;

    archivoMaestro = file of registroMaestro;
procedure generarMaestro(var aM:archivoMaestro; v:vectorDelegaciones);
var
    i:integer;
    regMae:registroMaestro;
    nAct:archivoDetalleNacimiento;
    regNac:nacimiento;
    fAct:archivoDetalleFallecimiento;
    regFac:fallecimiento;
begin
    assign(aM,'archivoMaestro.bin');
    rewrite(aM):
    for i:= 1 to DEL do begin
        nAct := v[i].nacimientos;
        fAct := v[i].fallecimientos;

        // continuar
    end;
end;
var
    vD:vectorDelegaciones;
    a1:archivoMaestro;
begin
    generarMaestro(aM,vD);
    listarTXT(aM);
end;
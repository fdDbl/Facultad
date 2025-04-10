program ocho;
const
    VALOR_ALTO = 32700;
    DIMF = 16;
type
    registroMaestro = record
        codeP:integer;
        nomP:string[30];
        cantH:longint;
        cantKHistorico:real;
    end;
    registroRelev = record
        codeP:integer;
        cantK:real;
    end;

    archivoMaestro = file of registroMaestro;
    archivoRelevamiento = file of registroRelev;

    vRelevamientos = Array[1..DIMF] of archivoRelevamiento;
    vRegDet = Array[1..DIMF] of registroRelev;

procedure recibirRelevamientos(var v:vRelevamientos); // se dispone
procedure actualizarMaestro(var aM:archivoMaestro; var vR:vRelevamientos);
var
    
begin

end;
var
    aM:archivoMaestro;
    vR:vRelevamientos;
begin
    recibirRelevamientos(vR);
    actualizarMaestro(aM,vR);
end.
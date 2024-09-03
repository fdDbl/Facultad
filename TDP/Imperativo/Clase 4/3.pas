program libreria;
const
    codeInvalido = -1;
type 
    venta = record
        code : integer;
        codeP : integer;
        cantUV : integer;
        precioU : real;
    end;
    
    producto = record
        code : integer;
        cantUV : integer;
        montoT : integer;
    end;
    
    arbol = ^nodo;
    nodo = record
        dato : venta;
        HI , HD : arbol;
    end;
        

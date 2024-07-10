{
    Una lista es una colección de nodos. Estos nodos contienen el dato, y la 
    dirección del siguiente nodo a apuntar.
    En este curso, se enseña a agregar nodos a una lista:
        1. agregando "adelante";
        2. agregando "atrás";
        3. de forma ordenada.
}

    { CREACIÓN DE UNA LISTA }
    program listas;
    type
        rDato = record
            campo1 : integer;
            campo2 : integer;
            campo3 : integer;
        end;

        lista = ^nodo;
        nodo = record
            dato : rDato; { variable que contenga el dato del nodo }
            sig : lista; { por ahora la lista está vacía, 
                            entonces el nodo siguiente es la lista misma}
        end;
    end;

    { LEER REGISTRO }
    procedure leer(var r:rDato);
    begin
        writeln('Campo 1:');
        readln(r.campo1);
        if({condición}) then begin
            writeln('Campo 2:');
            readln(r.campo2);
            writeln('Campo 3:');
            readln(r.campo3);
        end;
    end;

    { CARGAR LISTA }
    { Para cargar nodos a la lista, utilizaremos un proceso. }
    procedure cargarLista(var pI:lista {y solo si se va a agregar atrás: }; var pF:lista);
    var
        r:rDato;
    begin
        leerRegistro(r);
        while({condición}) do begin
            agregarAdelante(pI,r) / agregarAtras(pI,pF,r) / insertarOrdenado(pI,r);
            leerRegistro(r);
        end;
    end;

    { RECORRER LISTA }
    procedure recorrerLista(pI:lista); { pI es el "puntero inicial", 
                                        que apunta a la cabeza de la lista }
    begin
        while(pI <> nil) do begin { mientras que el nodo actual exista... }
            write(pI^.dato); { ...se escribe el dato del nodo (solo por hacer algo) }
            pI:=pI^.sig; { ahora, el nodo actual será el siguiente }
        end;
    end;

    { AGREGAR ADELANTE }
    { Implica agregar un nodo, y que ese nodo se agregue adelante de todo.
        Gráficamente: 
            pI -> nodo1:[ÚLTIMO AGREGADO] -> nodo2:[] -> nodo3:[PRIMERO AGREGADO] }
    
    procedure agregarAdelante(var pI:lista; r:rDato); { se recibe la lista por referencia 
                                                        ya que hay que modificarla 
                                                        agregándole nodos, y el registro 
                                                        por valor porque solo hay que 
                                                        leerlo }

                                                    { pI es el "puntero inicial", que apunta 
                                                    a la cabeza de la lista }
    var
        nuevo:lista; { variable auxiliar de la lista }
    begin
        new(nuevo); { se reserva espacio en memoria dinámica para el auxiliar }
        nuevo^.dato:=r; { el dato del nodo auxiliar es el registro }

        if(pI = nil) then { si la lista está vacía... }
            pI:=nuevo { ...L apunta al nuevo nodo (por ahora, la cabeza de la lista) }
        else begin
            nuevo^.sig:=pI; { sino, el nuevo nodo apunta a donde apunta L (la cabeza) }
            pI:=nuevo; { pero como estamos agregando adelante, 
                        ahora L va a apuntar al nodo nuevo }
        end;
    end;

    { AGREGAR ATRÁS }
    { Implica agregar un nodo, y que ese nodo se agregue atrás de todo.
        Gráficamente: 
            pI -> nodo1:[PRIMERO AGREGADO] -> nodo2:[] -> nodo3:[ÚLTIMO AGREGADO] <- pF }
    
    procedure agregarAtras(var pI:lista; var pF:lista; r:rDato);
                          { pF es el "puntero final", que apunta a la cola de la lista }
    var
        nuevo:lista;
    begin
        new(nuevo); 
        nuevo^.dato:=r; 

        if(pI = nil) then begin { si la lista está vacía... }
            pI:=nuevo; { ...el puntero inicial apunta al nuevo nodo }
            pF:=nuevo; { el puntero final también apunta al nuevo nodo }
                        { es obvio, si la lista tiene un solo nodo, 
                        este es el primero y el último a la vez}
        end
        else begin { si la lista no está vacía... }
            pF^.sig:=nuevo; { el nodo que acabamos de crear, 
                            ahora es el siguiente del último nodo de la lista }
            pF:=nuevo; { el puntero final apunta a este último nodo }
        end;
    end;

    { INSERTAR ORDENADO }
    procedure insOrdenado(var pI:lista; r:rDato);
    var
        nuevo:lista;
        act,ant:lista;
    begin
        new(nuevo);
        nuevo^.dato:=r;
        act:=L;
        ant:=L;
        while((act <> nil) and (r.{campoDelRegistro} < act^.dato.{campoDelRegistro})) do
        begin
            ant:=act;
            act:=act^.sig;
        end;
        if(act=ant) then
            pI:=nuevo
        else
            ant^.sig:=nuevo;
        nuevo^.sig:=act;
    end;

    { BUSCAR }
    { Para buscar algún elemento en la lista, se debe tener en cuenta si está DESORDENADA
        u ORDENADA. }
    
    { BUSCAR EN LISTA DESORDENADA }
    function buscarD(pI:lista; valor:integer):boolean;
    { se utiliza una funcion ya que simplemente se debe retornar si 
      se encontró o no el elemento buscado }
    { se pasa la lista por valor ya que simplemente hay que recorrerla y leerla }
    var
        aux:lista;
        encontre:boolean;
    begin
        encontre:=false;
        aux:=pI; { aux apunta al inicio de la lista }
        while((aux<>nil) and (encontre=false)) do begin { mientras que la lista no esté 
                                                        vacía y no haya encontrado nada... }
            if(aux^.elem = valor) then { si el dato del nodo donde estamos parados 
                                         es igual al valor buscado... }
                encontre:=true; { encontre es verdadero }
            else
                aux:=aux^.sig; { sino, aux apunta al siguiente nodo
                                 y sigue buscando a partir de ese }
        end;
        buscarD:=encontre;
    end;
    { BUSCAR EN LISTA ORDENADA }
    { Al buscar en una lista ordenada, hay cosas que ya sabemos. Como la lista está 
    ordenada, no hace falta recorrerla toda para encontrar el elemento buscado. Solo se 
    debe tener en cuenta hasta dónde debemos buscar, así cuando se llegue a ese elemento, 
    no se busque más. 
    Por ejemplo, si se busca el elemento "20" en una lista con elementos ordenados 
    de menor a mayor...
                                [4] -> [12] -> [25] -> [32]
    ...al llegar al elemento "25" no hace falta buscar más.}

    function buscarO(pI:lista; valor:integer):boolean;
    var
        aux:lista;
        encontre:boolean;
    begin
        encontre:=false;
        aux:=pI;
        while((aux <> nil) and (aux^.dato < valor)) do { mientras la lista no esté vacía 
                                                         y el dato del nodo actual 
                                                         sea menor a valor... }
            aux:=aux^.sig; { ...entonces paso al siguiente nodo }
        { sale del while o cuando se acabó la lista o cuando el dato del nodo
        ya no es menor a valor }

        if((aux <> nil) and (aux^.dato = valor)) then { pero si no se acabó la lista 
                                                        y el dato del nodo es igual 
                                                        a valor... }
            encontre:=true; { encontré el valor }
        buscarO:=encontre;
    end;
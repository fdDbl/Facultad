{
    Una lista es una colección de nodos. Estos nodos contienen el dato, y la 
    dirección del siguiente nodo a apuntar.
    En este curso, se enseña a agregar nodos a una lista:
        1. agregando "adelante";
        2. agregando "atrás";
        3. de forma ordenada.
}

    // CREACIÓN DE UNA LISTA
    program listas;
    type
        rDato = record
            campo1 : integer;
            campo2 : integer;
            campo3 : integer;
        end;

        lista = ^nodo;
        nodo = record
            dato : rDato; // variable que contenga el dato del nodo
            sig : lista; // por ahora la lista está vacía, entonces el nodo siguiente es la lista misma
        end;
    end;

    // CARGAR NODOS
    { Para cargar nodos a la lista, utilizaremos un proceso. }

    // RECORRER LISTA
    procedure recorrerLista(L:lista);
    begin
        while(L <> nil) do begin // mientras que el nodo actual exista
            write(L^.dato); // se escribe el dato del nodo (solo por hacer algo)
            L:=L^.sig; // ahora, el nodo actual será el siguiente
        end;
    end;

    // AGREGAR ADELANTE
    { Implica agregar un nodo, y que ese nodo se agregue adelante de todo.
        Gráficamente: 
                nodo1:[ÚLTIMO AGREGADO] -> nodo2:[] -> nodo3:[PRIMERO AGREGADO] }
    procedure agregarAdelante(var L:lista; r:rDato); // se recibe la lista por referencia ya que hay que modificarla agregándole nodos, y el registro por valor porque solo hay que leerlo
    var
        nuevo:lista; // variable auxiliar de la lista
    begin
        new(nuevo); // se reserva espacio en memoria dinámica para el auxiliar
        nuevo^.dato:=r; // el dato del nodo auxiliar es el registro
        nuevo^.sig:=nil; // el siguiente del nodo auxiliar es nil

        if(L = nil) then // si la lista está vacía...
            L:=nuevo // ...L apunta al nuevo nodo (por ahora, la cabeza de la lista)
        else begin
            nuevo^.sig:=L; // sino, el nuevo nodo apunta a donde apunta L (la cabeza)
            L:=nuevo; // pero como estamos agregando adelante, ahora L va a apuntar al nodo nuevo
        end;
    end;

    // AGREGAR ATRÁS
    { Implica agregar un nodo, y que ese nodo se agregue atrás de todo.
        Gráficamente: 
                nodo1:[PRIMERO AGREGADO] -> nodo2:[] -> nodo3:[ÚLTIMO AGREGADO] }
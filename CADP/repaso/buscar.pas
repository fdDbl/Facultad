{ BUSCAR EN LISTA DESORDENADA }
function buscar (pI: listaE; valor:integer):boolean;
Var
 aux:listaE; { AUXILIAR QUE VA A RECORRER LA LISTA }
 encontré:boolean;

Begin
  encontré:= false;
  aux:= pI;
  while ((aux <> nil) and (encontré = false)) do
   begin
      if (aux^.elem = valor) then  
        encontré:=true
      else
        aux:= aux^.sig;
   end;
   buscar:= encontré; 
end;

{ BUSCAR EN LISTA ORDENADA }
{ La búsqueda se detiene cuando se termina la lista o cuando el elemento buscado es mayor al elemento actual (lista ordenada ascendentemente) o viceversa (descendentemente) )}

function buscar (pI: listaE; valor:integer):boolean;
Var
 aux:listaE; 
 encontré:boolean;

Begin
  encontré:= false;
  aux:= pI;
  while ((aux <> nil) and (aux^.elem < valor)) do
   begin
      aux:= aux^.sig;
   end;

   if (aux <> nil) and (aux^.elem = valor) then encontre:= true;
  
   buscar:= encontré; 
end;

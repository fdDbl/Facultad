procedure eliminar (Var pI: listaE; valor:integer);
Var
 actual,ant:listaE; { AUXILIARES QUE VAN A RECORRER LA LISTA Y ENGANCHAR SI ES NECESARIO }
Begin
  actual:=pI; 
  while (actual <> nil) do begin
    if (actual^.elem <> valor) then begin
     ant:=actual;
     actual:= actual^.sig;
    end;
    else begin
      if (actual = pI) then 
        pI:= pI^.sig; 
      else
        ant^.sig:= actual^.sig;
      dispose (actual);
      actual:= ant;
    end;
End;

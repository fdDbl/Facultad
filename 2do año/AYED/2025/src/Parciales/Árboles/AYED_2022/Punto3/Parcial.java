package Parciales.Árboles.AYED_2022.Punto3;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.Queue;

public class Parcial {
    public GeneralTree<Integer> esCreciente(GeneralTree<Integer> arbol) {
        GeneralTree<Integer> nodoConMasHijos = new GeneralTree<>();
        if(arbol != null && !arbol.isEmpty()) {
            Queue<GeneralTree<Integer>> cola = new LinkedList<>();
            cola.add(arbol);
            GeneralTree<Integer> aux;
            boolean seguir = true;
            int maxHijos = -1;
            int nivelAct = 0;
            while(!cola.isEmpty() && seguir) {
                int cantNodosEnNivel = cola.size();
                seguir = cantNodosEnNivel == nivelAct + 1;
                for(int i = 0; i < cantNodosEnNivel; i++) {
                    aux = cola.remove();
                    if(aux.getChildren().size() > maxHijos) {
                        nodoConMasHijos = aux;
                        maxHijos = aux.getChildren().size();
                    }
                    for(GeneralTree<Integer> hijo : aux.getChildren())
                        cola.add(hijo);
                }
                nivelAct++;
            }
            if(cola.isEmpty() && seguir)
                return nodoConMasHijos;
        }
        return null;
    }
}

package Parciales.Árboles.Fecha_10_5_2025;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

public class ParcialArboles {
    public static List<Integer> caminoSignoAlternante(GeneralTree<Integer> arbol) {
        List<Integer> camino = new LinkedList<>();
        if(arbol != null && !arbol.isEmpty())
            caminoHelper(arbol,camino,new LinkedList<>(),Integer.MIN_VALUE,0);
        return camino;
    }
    private static int caminoHelper(GeneralTree<Integer> nodo, List<Integer> caminoMax, List<Integer> caminoAct, int sumaCaminoMax, int sumaCaminoAct) {
        caminoAct.add(nodo.getData());
        sumaCaminoAct += nodo.getData();
        if(nodo.isLeaf()) {
            if(sumaCaminoAct > sumaCaminoMax) {
                caminoMax.clear();
                caminoMax.addAll(caminoAct);
                sumaCaminoMax = sumaCaminoAct;
            }
        } else {
            for(GeneralTree<Integer> hijo : nodo.getChildren()) {
                if((hijo.getData() < 0 && nodo.getData() >= 0)||(hijo.getData() >= 0 && nodo.getData() < 0))
                    sumaCaminoMax = caminoHelper(hijo,caminoMax,caminoAct,sumaCaminoMax,sumaCaminoAct);
            }
        }
        caminoAct.removeLast();
        return sumaCaminoMax;
    }

    public static void main(String[] args) {
        GeneralTree<Integer> raiz = new GeneralTree<>(5);
        raiz.addChild(new GeneralTree<>(-2));
        raiz.addChild(new GeneralTree<>(-4));
        raiz.getChildren().getFirst().addChild(new GeneralTree<>(7));
        raiz.getChildren().getFirst().addChild(new GeneralTree<>(-5));
        raiz.getChildren().getFirst().addChild(new GeneralTree<>(8));
        raiz.getChildren().getFirst().getChildren().get(2).addChild(new GeneralTree<>(-1));
        raiz.getChildren().get(1).addChild(new GeneralTree<>(6));

        System.out.println(ParcialArboles.caminoSignoAlternante(raiz));
    }
}

package Practica_3.EJ11;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class ParcialArboles {
    public static boolean resolver(GeneralTree<Integer> arbol) {
        Queue<GeneralTree<Integer>> cola = new LinkedList<>();
        cola.add(arbol);
        cola.add(null);
        GeneralTree<Integer> aux;
        int nivelAct = 1;
        int cantAct = 0;
        boolean flag = true;

        while (!cola.isEmpty() && flag) {
            aux = cola.remove();
            if(aux != null) {
                flag = nivelAct >= ++cantAct;
                for(GeneralTree<Integer> hijo : aux.getChildren())
                    cola.add(hijo);
            } else if(!cola.isEmpty()) {
                flag = nivelAct++ == cantAct;
                cantAct = 0;
                cola.add(null);
            }
        }

        return flag;
    }

    public static void main(String[] args) {
        GeneralTree<Integer> nodo83 = new GeneralTree<>(83);
        List<GeneralTree<Integer>> hijos18 = new ArrayList<>();
        hijos18.add(nodo83);
        GeneralTree<Integer> nodo18 = new GeneralTree<>(18, hijos18);

        List<GeneralTree<Integer>> hijos5 = new ArrayList<>();
        hijos5.add(nodo18);
        GeneralTree<Integer> nodo5 = new GeneralTree<>(5, hijos5);

        List<GeneralTree<Integer>> hijos3 = new ArrayList<>();
        hijos3.add(new GeneralTree<>(33));
        hijos3.add(new GeneralTree<>(12));
        hijos3.add(new GeneralTree<>(17));
        hijos3.add(new GeneralTree<>(9));
        GeneralTree<Integer> nodo3 = new GeneralTree<>(3, hijos3);

        List<GeneralTree<Integer>> hijos4 = new ArrayList<>();
        hijos4.add(new GeneralTree<>(7));
        hijos4.add(new GeneralTree<>(11));
        hijos4.add(nodo3);
        GeneralTree<Integer> nodo4 = new GeneralTree<>(4, hijos4);

        List<GeneralTree<Integer>> hijos1 = new ArrayList<>();
        hijos1.add(nodo5);
        hijos1.add(nodo4);
        GeneralTree<Integer> nodo1 = new GeneralTree<>(1, hijos1);

        List<GeneralTree<Integer>> hijos25 = new ArrayList<>();
        hijos25.add(new GeneralTree<>(13));
        GeneralTree<Integer> nodo25 = new GeneralTree<>(25, hijos25);

        List<GeneralTree<Integer>> hijos2 = new ArrayList<>();
        hijos2.add(nodo1);
        hijos2.add(nodo25);

        GeneralTree<Integer> raiz = new GeneralTree<>(2, hijos2);

        raiz.porNiveles();
        System.out.println(resolver(raiz));
    }
}

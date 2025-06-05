package Parciales.Árboles.ProductoHojasProfundas;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.Queue;

public class Parcial {
    int resolver(GeneralTree<Integer> arbol) {
        int productoAct = -1;
        if((arbol != null) && (!arbol.isEmpty())) {
            Queue<GeneralTree<Integer>> cola = new LinkedList<GeneralTree<Integer>>();
            int productoNuevo = 1;
            GeneralTree<Integer> aux;
            cola.add(arbol);
            cola.add(null);

            while (!cola.isEmpty()) {
                aux = cola.remove();
                if (aux != null) {
                    for (GeneralTree<Integer> hijo : aux.getChildren()) {
                        cola.add(hijo);
                        productoAct = productoNuevo *= hijo.getData();
                    }
                } else if (!cola.isEmpty()) {
                    cola.add(null);
                    productoNuevo = 1;
                }
            }
        }
        return productoAct;
    }

    public static void main(String[] args) {
        GeneralTree<Integer> tree = new GeneralTree<>(20);
        tree.addChild(new GeneralTree<>(1));
        tree.addChild(new GeneralTree<>(45));
        tree.addChild(new GeneralTree<>(21));
        tree.getChildren().getFirst().addChild(new GeneralTree<>(6));
        tree.getChildren().getFirst().addChild(new GeneralTree<>(0));
        tree.getChildren().get(1).addChild(new GeneralTree<>(8));
        tree.getChildren().get(2).addChild(new GeneralTree<>(10));
        tree.getChildren().get(2).getChildren().getFirst().addChild(new GeneralTree<>(22));
        tree.getChildren().get(2).getChildren().getFirst().addChild(new GeneralTree<>(2));

        tree.porNiveles();
        System.out.println(new Parcial().resolver(tree));
    }
}

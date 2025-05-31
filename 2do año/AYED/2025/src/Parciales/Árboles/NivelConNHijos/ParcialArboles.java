package Parciales.Árboles.NivelConNHijos;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class ParcialArboles {
    private GeneralTree<Integer> tree;

    public ParcialArboles(GeneralTree<Integer> t) { tree = t; }

    public List<Integer> nivel(int num) {
        List<Integer> lista = new LinkedList<>();
        if(tree != null && !tree.isEmpty()) {
            Queue<GeneralTree<Integer>> cola = new LinkedList<>();
            cola.add(tree);
            GeneralTree<Integer> aux;
            boolean encontre = false;

            while (!cola.isEmpty() && !encontre) {
                int tamanio = cola.size();
                for(int i = 0; i < tamanio; i++) {
                    aux = cola.remove();
                    if(aux.getChildren().size() >= num)
                        lista.add(aux.getData());
                    for(GeneralTree<Integer> hijo : aux.getChildren())
                        cola.add(hijo);
                }
                if(lista.size() == tamanio)
                    encontre = true;
                else
                    lista.clear();
            }
        }
        return lista;
    }

    public static void main(String[] args) {
        // Crear los nodos del tercer nivel (nodos hoja)
        GeneralTree<Integer> node6 = new GeneralTree<>(-6);
        GeneralTree<Integer> node2 = new GeneralTree<>(2);
        GeneralTree<Integer> node8Leaf = new GeneralTree<>(8);

        GeneralTree<Integer> node28 = new GeneralTree<>(28);
        GeneralTree<Integer> node55 = new GeneralTree<>(55);
        GeneralTree<Integer> node18 = new GeneralTree<>(18);

        GeneralTree<Integer> node4 = new GeneralTree<>(4);
        GeneralTree<Integer> nodeMinus2 = new GeneralTree<>(2);
        GeneralTree<Integer> node9 = new GeneralTree<>(8);

        // Crear nodos del segundo nivel
        GeneralTree<Integer> node5Child = new GeneralTree<>(5);
        node5Child.addChild(node6);
        node5Child.addChild(node2);
        node5Child.addChild(node8Leaf);

        GeneralTree<Integer> node22 = new GeneralTree<>(22);
        node22.addChild(node28);
        node22.addChild(node55);
        node22.addChild(node18);

        GeneralTree<Integer> node19 = new GeneralTree<>(19);
        node19.addChild(node4);
        node19.addChild(nodeMinus2);
        node19.addChild(node9);

        // Crear nodos del primer nivel
        GeneralTree<Integer> node8 = new GeneralTree<>(8);
        node8.addChild(node5Child);
        node8.addChild(node22);

        GeneralTree<Integer> node5Parent = new GeneralTree<>(-5);
        node5Parent.addChild(node19);

        // Crear el nodo raíz
        GeneralTree<Integer> root = new GeneralTree<>(10);
        root.addChild(node8);
        root.addChild(node5Parent);

        System.out.println(new ParcialArboles(root).nivel(3));
    }
}

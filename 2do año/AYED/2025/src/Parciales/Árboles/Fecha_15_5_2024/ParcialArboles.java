package Parciales.Árboles.Fecha_15_5_2024;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class ParcialArboles {
    private GeneralTree<Integer> tree;

    public ParcialArboles(GeneralTree<Integer> t) {
        tree = t;
    }

    public List<Integer> camino(int num) {
        List<Integer> lista = new LinkedList<>();
        if(tree != null && !tree.isEmpty() && num >= 0)
            _camino(num,lista,tree);
        return lista;
    }

    private boolean _camino(int num, List<Integer> lista, GeneralTree<Integer> arbol) {
        boolean ok = false;
        lista.add(arbol.getData());
        if(arbol.isLeaf())
            return true;
        else if(arbol.getChildren().size() >= num) {
            Iterator<GeneralTree<Integer>> I = arbol.getChildren().iterator();
            while(I.hasNext() && !ok)
                ok = _camino(num, lista, I.next());
        }
        if(!ok)
            lista.removeLast();
        return ok;
    }

    public static void main(String[] args) {
        GeneralTree<Integer> nodeMinus6 = new GeneralTree<>(-6);
        GeneralTree<Integer> node28 = new GeneralTree<>(28);
        GeneralTree<Integer> node55 = new GeneralTree<>(55);
        GeneralTree<Integer> node18 = new GeneralTree<>(18);
        GeneralTree<Integer> node4 = new GeneralTree<>(4);
        GeneralTree<Integer> nodeMinus9 = new GeneralTree<>(-9);

        GeneralTree<Integer> node5 = new GeneralTree<>(5);
        node5.addChild(nodeMinus6);

        GeneralTree<Integer> node22 = new GeneralTree<>(22);
        node22.addChild(node28);
        node22.addChild(node55);
        node22.addChild(node18);

        GeneralTree<Integer> node19 = new GeneralTree<>(19);
        node19.addChild(node4);

        GeneralTree<Integer> node8 = new GeneralTree<>(8);
        node8.addChild(node5);
        node8.addChild(node22);

        GeneralTree<Integer> node42 = new GeneralTree<>(42);

        GeneralTree<Integer> nodeMinus5 = new GeneralTree<>(-5);
        nodeMinus5.addChild(node19);
        nodeMinus5.addChild(nodeMinus9);

        GeneralTree<Integer> root = new GeneralTree<>(10);
        root.addChild(node8);
        root.addChild(node42);
        root.addChild(nodeMinus5);

        System.out.println("Árbol por niveles:");
        root.porNiveles();

        System.out.println();

        System.out.print(new ParcialArboles(root).camino(2));
    }
}
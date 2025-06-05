package Practica_3.EJ10;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

public class ParcialArboles {
    public static List<Integer> resolver(GeneralTree<Integer> arbol) {
        List<Integer> camino = new LinkedList<>();
        int num = 0;
        if(arbol != null && !arbol.isEmpty())
            num = _resolver(arbol,camino,new LinkedList<>(),0,0,0);
        System.out.println(num);
        return camino;
    }
    private static int _resolver(GeneralTree<Integer> nodo, List<Integer> caminoFiltrado, List<Integer> caminoAct, int sumaCaminoFiltrado, int sumaCaminoAct, int nivel) {
        sumaCaminoAct += nodo.getData() * nivel;
        if(nodo.getData() == 1) caminoAct.add(nodo.getData());

        if(nodo.isLeaf()) {
            if(sumaCaminoAct > sumaCaminoFiltrado) {
                caminoFiltrado.clear();
                caminoFiltrado.addAll(caminoAct);
                sumaCaminoFiltrado = sumaCaminoAct;
            }
        } else
            for(GeneralTree<Integer> hijo : nodo.getChildren())
                sumaCaminoFiltrado = _resolver(hijo,caminoFiltrado,caminoAct,sumaCaminoFiltrado,sumaCaminoAct,nivel+1);

        if(nodo.getData() == 1) caminoAct.removeLast();
        return sumaCaminoFiltrado;
    }

    public static void main(String[] args) {
        GeneralTree<Integer> root = new GeneralTree<>(1);
        GeneralTree<Integer> node1_1 = new GeneralTree<>(0);
        GeneralTree<Integer> node1_2 = new GeneralTree<>(1);
        GeneralTree<Integer> node1_3 = new GeneralTree<>(1);
        root.addChild(node1_1);
        root.addChild(node1_2);
        root.addChild(node1_3);
        GeneralTree<Integer> node2_1 = new GeneralTree<>(1);
        GeneralTree<Integer> node2_2 = new GeneralTree<>(1);
        node1_1.addChild(node2_1);
        node1_1.addChild(node2_2);
        GeneralTree<Integer> node2_3 = new GeneralTree<>(1);
        GeneralTree<Integer> node2_4 = new GeneralTree<>(0);
        node1_2.addChild(node2_3);
        node1_2.addChild(node2_4);
        GeneralTree<Integer> node2_5 = new GeneralTree<>(0);
        node1_3.addChild(node2_5);
        GeneralTree<Integer> node3_1 = new GeneralTree<>(1);
        GeneralTree<Integer> node3_2 = new GeneralTree<>(1);
        GeneralTree<Integer> node3_3 = new GeneralTree<>(1);
        node2_1.addChild(node3_1);
        node2_1.addChild(node3_2);
        node2_1.addChild(node3_3);
        GeneralTree<Integer> node3_4 = new GeneralTree<>(0);
        node2_4.addChild(node3_4);
        GeneralTree<Integer> node3_5 = new GeneralTree<>(0);
        node2_5.addChild(node3_5);
        GeneralTree<Integer> node4_1 = new GeneralTree<>(1);
        node3_4.addChild(node4_1);
        GeneralTree<Integer> node4_2 = new GeneralTree<>(0);
        GeneralTree<Integer> node4_3 = new GeneralTree<>(0);
        node3_5.addChild(node4_2);
        node3_5.addChild(node4_3);

        System.out.println(ParcialArboles.resolver(root));
    }
}

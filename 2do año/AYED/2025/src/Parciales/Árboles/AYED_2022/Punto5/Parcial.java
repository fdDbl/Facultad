package Parciales.Árboles.AYED_2022.Punto5;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

public class Parcial {
    public List<List<Character>> caminosPares(GeneralTree<Character> arbol) {
        List<List<Character>> lista = new LinkedList<>();
        if(arbol != null && !arbol.isEmpty())
            _caminosPares(arbol,lista,new LinkedList<>());
        return lista;
    }
    private void _caminosPares(GeneralTree<Character> nodo, List<List<Character>> caminosPares, List<Character> caminoAct) {
        caminoAct.add(nodo.getData());
        if(nodo.isLeaf() && caminoAct.size() % 2 == 0)
            caminosPares.add(new LinkedList<>(caminoAct));
        for(GeneralTree<Character> hijo : nodo.getChildren())
            _caminosPares(hijo,caminosPares,caminoAct);
        caminoAct.removeLast();
    }

    public static void main(String[] args) {
        GeneralTree<Character> root = new GeneralTree<>('A');
        root.addChild(new GeneralTree<>('B'));
        root.addChild(new GeneralTree<>('C'));
        root.addChild(new GeneralTree<>('D'));
        root.getChildren().getFirst().addChild(new GeneralTree<>('E'));
        root.getChildren().get(1).addChild(new GeneralTree<>('F'));
        root.getChildren().get(1).addChild(new GeneralTree<>('G'));
        root.getChildren().get(1).getChildren().getFirst().addChild(new GeneralTree<>('H'));
        root.getChildren().get(1).getChildren().getFirst().addChild(new GeneralTree<>('I'));

        System.out.println(new Parcial().caminosPares(root));
    }
}

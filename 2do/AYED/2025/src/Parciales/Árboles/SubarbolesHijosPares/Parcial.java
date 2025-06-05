package Parciales.Árboles.SubarbolesHijosPares;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

public class Parcial {
    public List<GeneralTree<Integer>> resolver(GeneralTree<Integer> arbol) {
        List<GeneralTree<Integer>> lista = new LinkedList<>();
        if(arbol != null && !arbol.isEmpty())
            _resolver(arbol,lista);
        return lista;
    }

    public void _resolver(GeneralTree<Integer> subarbol, List<GeneralTree<Integer>> lista) {
        if(subarbol.hasChildren())
            _resolver(subarbol.getChildren().getFirst(),lista);
        if(!subarbol.isLeaf() && subarbol.getChildren().size() % 2 == 0)
            lista.add(subarbol);
        for(int i = 1; i < subarbol.getChildren().size(); i++)
            _resolver(subarbol.getChildren().get(i),lista);
    }

    public static void main(String[] args) {
        List<GeneralTree<Integer>> subChildren1 = new LinkedList<>();
        subChildren1.add(new GeneralTree<>(2));
        GeneralTree<Integer> subAb1 = new GeneralTree<>(7, subChildren1);
        List<GeneralTree<Integer>> subChildren2 = new LinkedList<>();
        subChildren2.add(new GeneralTree<>(-4));
        subChildren2.add(subAb1);
        subChildren2.add(new GeneralTree<>(-6));
        GeneralTree<Integer> a1 = new GeneralTree<>(3, subChildren2);
        List<GeneralTree<Integer>> subChildren3 = new LinkedList<>();
        subChildren3.add(new GeneralTree<>(1));
        subChildren3.add(new GeneralTree<>(-9));
        GeneralTree<Integer> a2 = new GeneralTree<>(5, subChildren3);
        List<GeneralTree<Integer>> arbol = new LinkedList<>();
        arbol.add(a1);
        arbol.add(a2);
        GeneralTree<Integer> a = new GeneralTree<>(-7, arbol);

        a.porNiveles();
        Parcial p = new Parcial();
        List<GeneralTree<Integer>> lista = p.resolver(a);
        System.out.print("[ ");
        for(GeneralTree<Integer> t: lista)
            System.out.print(t.getData() + " ");
        System.out.println("]");
    }
}

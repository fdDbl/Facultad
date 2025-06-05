package Parciales.Árboles.PromedioRango;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

public class Parcial {
    public Integer resolver(GeneralTree<Integer> arbol, Integer min, Integer max) {
        List<Integer> lista = new LinkedList<>();
        if(min <= max && (arbol != null) && (!arbol.isEmpty()))
            _resolver(arbol,min,max,lista);
        if(lista.isEmpty())
            return 0;
        int suma = 0;
        for(Integer i : lista)
            suma += i;
        return suma / lista.size();
    }

    private void _resolver(GeneralTree<Integer> arbol, Integer min, Integer max, List<Integer> lista) {
        if(arbol.hasChildren())
            _resolver(arbol.getChildren().getFirst(),min,max,lista);
        if(arbol.getData() >= min && arbol.getData() <= max) {
            lista.add(arbol.getData());
        }
        for(int i = 1; i < arbol.getChildren().size(); i++) {
            _resolver(arbol.getChildren().get(i),min,max,lista);
        }
    }

    public static void main(String[] args) {
        GeneralTree<Integer> tree = new GeneralTree<>(10);
        tree.addChild(new GeneralTree<>(11));
        tree.addChild(new GeneralTree<>(6));
        tree.addChild(new GeneralTree<>(12));
        tree.addChild(new GeneralTree<>(8));
        tree.addChild(new GeneralTree<>(9));

        System.out.println(new Parcial().resolver(tree,6,12));
    }
}

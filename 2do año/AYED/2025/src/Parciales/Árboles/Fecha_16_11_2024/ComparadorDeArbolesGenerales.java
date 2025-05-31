package Parciales.Árboles.Fecha_16_11_2024;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.Iterator;
import java.util.List;

public class ComparadorDeArbolesGenerales {

    public boolean esInferiorProfundo(GeneralTree<Integer> arbol1, GeneralTree<Integer> arbol2) {
        boolean ok = false;
        if(arbol1 != null && arbol2 != null && !arbol1.isEmpty() && !arbol2.isEmpty() && arbol1.getData() < arbol2.getData())
            ok = _esInferiorProfundo(arbol1,arbol2);
        return ok;
    }
    private boolean _esInferiorProfundo(GeneralTree<Integer> nodo1, GeneralTree<Integer> nodo2) {
        List<GeneralTree<Integer>> hijos1 = nodo1.getChildren();
        List<GeneralTree<Integer>> hijos2 = nodo2.getChildren();
        boolean ok = true;

        if(!hijos1.isEmpty() && !hijos2.isEmpty()) {
            int suma1 = 0; int suma2 = 0;
            for(GeneralTree<Integer> hijo : hijos1)
                suma1 += hijo.getData();
            for(GeneralTree<Integer> hijo : hijos2)
                suma2 += hijo.getData();
            if(suma1 >= suma2) ok = false;
        } else if(!nodo1.isLeaf() && nodo2.isLeaf()) ok = false;

        if(ok) {
            Iterator<GeneralTree<Integer>> I1 = hijos1.iterator();
            Iterator<GeneralTree<Integer>> I2 = hijos2.iterator();
            while (ok && I1.hasNext() && I2.hasNext()) {
                GeneralTree<Integer> sig1 = I1.next();
                GeneralTree<Integer> sig2 = I2.next();
                if (sig1.getData() < sig2.getData()) ok = _esInferiorProfundo(sig1, sig2);
                else ok = false;
            }
        }
        return ok;
    }

    public static void main(String[] args) {
        GeneralTree<Integer> arbol1 = new GeneralTree<>(10);
        arbol1.addChild(new GeneralTree<>(4));
        arbol1.addChild(new GeneralTree<>(3));
        arbol1.addChild(new GeneralTree<>(2));
        arbol1.getChildren().getFirst().addChild(new GeneralTree<>(1));

        GeneralTree<Integer> arbol2 = new GeneralTree<>(15);
        arbol2.addChild(new GeneralTree<>(8));
        arbol2.addChild(new GeneralTree<>(5));
        arbol2.getChildren().getFirst().addChild(new GeneralTree<>(2));
        arbol2.getChildren().getFirst().addChild(new GeneralTree<>(-2));
        arbol2.getChildren().getFirst().addChild(new GeneralTree<>(6));
        arbol2.getChildren().get(1).addChild(new GeneralTree<>(7));

        System.out.println(new ComparadorDeArbolesGenerales().esInferiorProfundo(arbol1,arbol2));
    }
}

package Practica_3.EJ9;
import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.Iterator;
/// @author Fede Dobal

public class ParcialArboles {
    public static boolean esDeSeleccionRec(GeneralTree<Integer> arbol) {
        boolean esDeSeleccion = false;
        if((arbol != null) && (!arbol.isEmpty())) {
            esDeSeleccion = esDeSeleccionRec(arbol,true);
        }
        return esDeSeleccion;
    }
    private static boolean esDeSeleccionRec(GeneralTree<Integer> nodo, boolean seguir) {
        if(!nodo.isLeaf()) {
            int min = Integer.MAX_VALUE;
            for (GeneralTree<Integer> hijo : nodo.getChildren())
                min = Math.min(min, hijo.getData());
            if (!nodo.getData().equals(min)) seguir = false;
            else {
                Iterator<GeneralTree<Integer>> I = nodo.getChildren().iterator();
                while(I.hasNext() && seguir)
                    seguir = esDeSeleccionRec(I.next(), seguir);
            }
        }
        return seguir;
    }
//    public static boolean esDeSeleccionIt(GeneralTree<Integer> arbol) {
//
//    }

    public static void main(String[] args) {
        GeneralTree<Integer> raiz = new GeneralTree<>(12);

        GeneralTree<Integer> n12 = new GeneralTree<>(12);
        GeneralTree<Integer> n25 = new GeneralTree<>(25);

        GeneralTree<Integer> n35 = new GeneralTree<>(35);
        GeneralTree<Integer> n1212 = new GeneralTree<>(12);
        GeneralTree<Integer> n2525 = new GeneralTree<>(25);

        GeneralTree<Integer> n3535 = new GeneralTree<>(35);
        GeneralTree<Integer> n14 = new GeneralTree<>(14);
        GeneralTree<Integer> n121212 = new GeneralTree<>(12);
        GeneralTree<Integer> n33 = new GeneralTree<>(33);

        GeneralTree<Integer> n353535 = new GeneralTree<>(35);
        GeneralTree<Integer> n35353535 = new GeneralTree<>(35);
        GeneralTree<Integer> n83 = new GeneralTree<>(83);
        GeneralTree<Integer> n90 = new GeneralTree<>(90);
        GeneralTree<Integer> n3333 = new GeneralTree<>(33);

        raiz.addChild(n12);
        raiz.addChild(n25);

        n12.addChild(n35);
        n12.addChild(n1212);

        n35.addChild(n3535);
        n3535.addChild(n353535);

        n1212.addChild(n14);
        n1212.addChild(n121212);
        n1212.addChild(n33);

        n33.addChild(n35353535);
        n33.addChild(n83);
        n33.addChild(n90);
        n33.addChild(n3333);

        n25.addChild(n2525);

        raiz.porNiveles();

        System.out.println(esDeSeleccionRec(raiz));
    }
}
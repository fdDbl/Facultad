package Práctica_3.EJ8;
import Práctica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

public class Navidad {
    private GeneralTree<Integer> tree;

    public Navidad(String input) {
        tree = new GeneralTree<>();
        if(!input.isEmpty()) {
            char[] inputArray = input.toCharArray();
            int n = charToInt(inputArray[0]);
            GeneralTree<Integer>[] nodos = new GeneralTree[n];
            for (int i = 0; i < n; i++) {
                nodos[i] = new GeneralTree<>(i + 1);
            }
            for (int i = 1; i < n; i++) {
                int parent = charToInt(inputArray[i]);
                nodos[parent - 1].addChild(nodos[i]);
            }
            tree = nodos[0];
        }
    }


    private int charToInt(char c) {
        return c - '0';
    }

    public void preOrder() {
        if ((tree != null) && (!tree.isEmpty()))
            imprimirRecursivo(tree);
    }

    private void imprimirRecursivo(GeneralTree<Integer> nodo) {
        System.out.println(nodo.getData());
        for(GeneralTree<Integer> hijo : nodo.getChildren()) {
            imprimirRecursivo(hijo);
        }
    }
    public String esAbetoNavidenio() {
        String ans = "No";
        if((tree != null) && (!tree.isEmpty()) && (esAbetoNavidenio(tree)))
            ans = "Yes";
        return ans;
    }

    private boolean esAbetoNavidenio(GeneralTree<Integer> vertice) {
        if(vertice.hasChildren()) { // chequeo para el while
            int nHijosHojas = 0;
            int i = 0;
            while ((nHijosHojas < 3) && (i < vertice.getChildren().size())) { // while para que corte apenas hayan tres hijos hojas
                if(vertice.getChildren().get(i).isLeaf()) nHijosHojas++;
                i++;
            }
            if(nHijosHojas < 3) return false;
            for(GeneralTree<Integer> hijo : vertice.getChildren())
                if(!esAbetoNavidenio(hijo)) return false;
        }
        return true; // retorno true si no habia ningun vertice con menos de tres hijos
        // (nunca me va a entrar un vertice null o vacío)
    }

    public static void main(String[] args) {
        Navidad N = new Navidad("81111333"); // ingrese el input
        N.preOrder();
        System.out.println(N.esAbetoNavidenio());
    }
}

package Practica_3.EJ8;
import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.Iterator;

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

    public void porNiveles() {
        tree.porNiveles();
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
            Iterator<GeneralTree<Integer>> I = vertice.getChildren().iterator();
            while ((nHijosHojas < 3) && (I.hasNext())) { // while para que corte apenas hayan tres hijos hojas
                if(I.next().isLeaf()) nHijosHojas++;
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
        N.porNiveles();
        System.out.println(N.esAbetoNavidenio());
    }
}

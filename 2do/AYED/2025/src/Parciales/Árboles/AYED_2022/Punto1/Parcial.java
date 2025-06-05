package Parciales.Árboles.AYED_2022.Punto1;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

public class Parcial {
    public static class LetraNumero {
        private char letra;
        private int num;

        public LetraNumero(char l, int n) {
            letra = l;
            num = n;
        }

        public char getLetra() {
            return letra;
        }

        public int getNum() {
            return num;
        }

        @Override
        public String toString() {
            return "LetraNumero{" +
                    "letra=" + letra +
                    ", num=" + num +
                    '}';
        }
    }

    public List<LetraNumero> resolver(GeneralTree<LetraNumero> arbol) {
        List<LetraNumero> camino = new LinkedList<>();
        if(arbol != null && !arbol.isEmpty()) {
            _resolver(arbol,camino);
        }
        return camino;
    }
    private void _resolver(GeneralTree<LetraNumero> nodo, List<LetraNumero> camino) {
        camino.add(nodo.getData());
        if(!nodo.isLeaf() && nodo.getChildren().size() >= nodo.getData().getNum()) {
            _resolver(nodo.getChildren().get(nodo.getData().getNum() - 1), camino);
        }
    }

    public static void main(String[] args) {
        GeneralTree<LetraNumero> raiz = new GeneralTree<>(new LetraNumero('G',1));
        raiz.addChild(new GeneralTree<>(new LetraNumero('E',3)));
        raiz.addChild(new GeneralTree<>(new LetraNumero('F',2)));
        raiz.addChild(new GeneralTree<>(new LetraNumero('J',5)));
        raiz.getChildren().getFirst().addChild(new GeneralTree<>(new LetraNumero('A',7)));
        raiz.getChildren().getFirst().addChild(new GeneralTree<>(new LetraNumero('B',9)));
        raiz.getChildren().getFirst().addChild(new GeneralTree<>(new LetraNumero('C',6)));
        raiz.getChildren().get(1).addChild(new GeneralTree<>(new LetraNumero('D',10)));
        raiz.getChildren().get(2).addChild(new GeneralTree<>(new LetraNumero('H',6)));
        raiz.getChildren().get(2).addChild(new GeneralTree<>(new LetraNumero('I',10)));

        System.out.println(new Parcial().resolver(raiz));
    }
}

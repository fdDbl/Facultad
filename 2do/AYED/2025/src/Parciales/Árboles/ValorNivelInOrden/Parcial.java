package Parciales.Árboles.ValorNivelInOrden;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

public class Parcial {
    private class ValorYNivel {
        private int valor;
        private int nivel;

        public ValorYNivel(int v, int n) {
            valor = v;
            nivel = n;
        }

        @Override
        public String toString() {
            return valor + " nivel " + nivel;
        }
    }

    public List<ValorYNivel> resolver(int valor, GeneralTree<Integer> arbol) {
        List<ValorYNivel> lista = new LinkedList<>();
        if(arbol != null && !arbol.isEmpty())
            _resolver(valor,arbol,lista,0);
        return lista;
    }

    private void _resolver(int valor, GeneralTree<Integer> nodo, List<ValorYNivel> lista, int nivel) {
        if(nodo.hasChildren())
            _resolver(valor,nodo.getChildren().getFirst(), lista, nivel+1);
        if(nodo.getData() > valor)
            lista.add(new ValorYNivel(nodo.getData(),nivel));
        for(int i = 1; i < nodo.getChildren().size(); i++)
            _resolver(valor,nodo.getChildren().get(i),lista,nivel+1);
    }

    public static void main(String[] args) {
        GeneralTree<Integer> root = new GeneralTree<>(2);
        GeneralTree<Integer> node1 = new GeneralTree<>(-7);
        GeneralTree<Integer> node2 = new GeneralTree<>(5);
        GeneralTree<Integer> node3 = new GeneralTree<>(4);
        root.addChild(node1);
        root.addChild(node2);
        root.addChild(node3);
        GeneralTree<Integer> leaf1 = new GeneralTree<>(2);
        GeneralTree<Integer> leaf2 = new GeneralTree<>(6);
        GeneralTree<Integer> leaf3 = new GeneralTree<>(-3);
        GeneralTree<Integer> leaf4 = new GeneralTree<>(11);
        GeneralTree<Integer> leaf5 = new GeneralTree<>(-9);
        GeneralTree<Integer> leaf6 = new GeneralTree<>(10);
        node1.addChild(leaf1);
        node1.addChild(leaf2);
        node2.addChild(leaf3);
        node3.addChild(leaf4);
        node3.addChild(leaf5);
        node3.addChild(leaf6);

        System.out.println(new Parcial().resolver(-10,root));
    }
}


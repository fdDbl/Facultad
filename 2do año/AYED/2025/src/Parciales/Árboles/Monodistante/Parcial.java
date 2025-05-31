package Parciales.Árboles.Monodistante;

import Practica_2.EJ1yEJ2.BinaryTree;

public class Parcial {
    private BinaryTree<Integer> arbol;
    public Parcial(BinaryTree<Integer> a) {
        arbol = a;
    }

    boolean resolver(int k) {
        boolean monodistante = false;
        if(arbol != null && !arbol.isEmpty())
            monodistante = resolverRec(arbol,k,0);
        return monodistante;
    }

    private boolean resolverRec(BinaryTree<Integer> arbol, int k, int suma) {
        suma += arbol.getData();
        if (arbol.isLeaf())
            return suma == k;
        boolean izq = true;
        boolean der = true;
        if (arbol.hasLeftChild())
            izq = resolverRec(arbol.getLeftChild(), k, suma);
        if (arbol.hasRightChild())
            der = resolverRec(arbol.getRightChild(), k, suma);
        return izq && der;
    }

    public static void main(String[] args) {
        BinaryTree<Integer> nodo5 = new BinaryTree<>(5);
        BinaryTree<Integer> nodo1_hoja = new BinaryTree<>(1);
        BinaryTree<Integer> nodo3_hoja = new BinaryTree<>(3);

        BinaryTree<Integer> nodo4 = new BinaryTree<>(4);
        nodo4.addRightChild(nodo1_hoja);
        BinaryTree<Integer> nodo1_izq = new BinaryTree<>(1);
        nodo1_izq.addLeftChild(nodo5);
        nodo1_izq.addRightChild(nodo4);

        BinaryTree<Integer> nodo1_der = new BinaryTree<>(1);
        nodo1_der.addRightChild(nodo3_hoja);
        BinaryTree<Integer> nodo2_der = new BinaryTree<>(2);
        nodo2_der.addRightChild(nodo1_der);

        BinaryTree<Integer> raiz = new BinaryTree<>(2);
        raiz.addLeftChild(nodo1_izq);
        raiz.addRightChild(nodo2_der);

        raiz.porNiveles();
        Parcial P = new Parcial(raiz);
        System.out.println(P.resolver(8));
    }
}

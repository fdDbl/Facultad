package Parciales.Árboles.ProcesadorDeArbol;

import Practica_2.EJ1yEJ2.BinaryTree;

import java.util.LinkedList;
import java.util.List;

public class ProcesadorDeArbol {
    private BinaryTree<Integer> tree;

    public ProcesadorDeArbol(BinaryTree<Integer> t) { tree = t; }

    public DosValores procesar() {
        List<Integer> lista = new LinkedList<>();
        int i = 0;
        if(tree != null && !tree.isEmpty()) {
            i = _procesar(tree,lista);
        }
        return new DosValores(lista,i);
    }

    private int _procesar(BinaryTree<Integer> arbol, List<Integer> lista) {
        int sumaImpares = 0;
        if(arbol.hasLeftChild())
            sumaImpares += _procesar(arbol.getLeftChild(),lista);
        if(arbol.hasRightChild())
            sumaImpares += _procesar(arbol.getRightChild(),lista);
        if(arbol.getData() % 2 != 0) {
            sumaImpares++;
            if((arbol.hasLeftChild() && !arbol.hasRightChild() || !arbol.hasLeftChild() && arbol.hasRightChild()))
                lista.add(arbol.getData());
        }
        return sumaImpares;
    }

    public static void main(String[] args) {
        BinaryTree<Integer> root = new BinaryTree<>(10);
        BinaryTree<Integer> node6 = new BinaryTree<>(6);
        BinaryTree<Integer> node2 = new BinaryTree<>(2);
        BinaryTree<Integer> node1 = new BinaryTree<>(1);
        BinaryTree<Integer> node9 = new BinaryTree<>(9);
        BinaryTree<Integer> node8 = new BinaryTree<>(8);
        BinaryTree<Integer> node3 = new BinaryTree<>(3);
        BinaryTree<Integer> node20 = new BinaryTree<>(20);
        BinaryTree<Integer> node11 = new BinaryTree<>(11);
        BinaryTree<Integer> node2Child = new BinaryTree<>(2);
        BinaryTree<Integer> node4Child1 = new BinaryTree<>(4);
        BinaryTree<Integer> node4Child2 = new BinaryTree<>(4);
        root.addLeftChild(node6);
        root.addRightChild(node2);
        node6.addLeftChild(node1);
        node6.addRightChild(node9);
        node1.addRightChild(node20);
        node9.addLeftChild(node11);
        node2.addLeftChild(node8);
        node2.addRightChild(node3);
        node8.addLeftChild(node2Child);
        node8.addRightChild(node4Child1);
        node3.addRightChild(node4Child2);

        ProcesadorDeArbol P = new ProcesadorDeArbol(root);
        DosValores D = P.procesar();
        System.out.println(D.toString());
    }
}

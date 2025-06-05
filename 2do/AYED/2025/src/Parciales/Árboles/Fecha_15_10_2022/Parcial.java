package Parciales.Árboles.Fecha_15_10_2022;

import Practica_2.EJ1yEJ2.BinaryTree;

import java.util.LinkedList;
import java.util.List;

public class Parcial {
    public List<Integer> resolver(BinaryTree<Integer> ab, int min) {
        List<Integer> camino = new LinkedList<>();
        if(ab != null && !ab.isEmpty())
            _resolver(ab,camino,min,0);
        return camino;
    }
    private boolean _resolver(BinaryTree<Integer> nodo, List<Integer> camino, int min, int cantPares) {
        boolean encontre = false;
        camino.add(nodo.getData());
        if(nodo.getData() % 2 == 0)
            cantPares++;
        if(nodo.isLeaf()) {
            if(cantPares >= min)
                encontre = true;
        } else {
            if(nodo.hasLeftChild())
                encontre = _resolver(nodo.getLeftChild(),camino,min,cantPares);
            if(nodo.hasRightChild() && !encontre)
                encontre = _resolver(nodo.getRightChild(),camino,min,cantPares);
        }
        if(!encontre)
            camino.removeLast();
        return encontre;
    }

    public static void main(String[] args) {
        // Create all nodes
        BinaryTree<Integer> root = new BinaryTree<>(7);

        // Left subtree of root
        BinaryTree<Integer> node56 = new BinaryTree<>(56);
        BinaryTree<Integer> node38 = new BinaryTree<>(38);
        BinaryTree<Integer> node31 = new BinaryTree<>(31);
        BinaryTree<Integer> node87 = new BinaryTree<>(87);
        BinaryTree<Integer> node77 = new BinaryTree<>(77);
        BinaryTree<Integer> node94 = new BinaryTree<>(94);
        BinaryTree<Integer> node16 = new BinaryTree<>(16);
        BinaryTree<Integer> node43 = new BinaryTree<>(43);
        BinaryTree<Integer> node2 = new BinaryTree<>(2);
        BinaryTree<Integer> node1 = new BinaryTree<>(1);
        BinaryTree<Integer> node9 = new BinaryTree<>(9);
        BinaryTree<Integer> node10 = new BinaryTree<>(10);

        // Right subtree of root
        BinaryTree<Integer> node25 = new BinaryTree<>(25);
        BinaryTree<Integer> node5 = new BinaryTree<>(5);
        BinaryTree<Integer> node6 = new BinaryTree<>(6);

        // Connect all nodes according to the image
        root.addLeftChild(node56);
        root.addRightChild(node25);

        node56.addLeftChild(node38);
        node56.addRightChild(node31);

        node38.addLeftChild(node87);
        node38.addRightChild(node77);

        node31.addRightChild(node94);

        node77.addLeftChild(node16);

        node16.addRightChild(node43);

        node43.addLeftChild(node9);
        node43.addRightChild(node10);

        node94.addRightChild(node2);

        node2.addLeftChild(node1);

        node25.addLeftChild(node5);
        node25.addRightChild(node6);

        System.out.println(new Parcial().resolver(root,2));
    }
}

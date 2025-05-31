package Parciales.Árboles.IsTwoTree;

import Practica_2.EJ1yEJ2.BinaryTree;

public class ParcialArboles {
    private BinaryTree<Integer> tree;
    public ParcialArboles(BinaryTree<Integer> t) { tree = t; }
    public Boolean isTwoTree(int num) {
        boolean es = false;
        if(tree != null && !tree.isEmpty())
            es = _isTwoTree(tree,num);
        return es;
    }
    private BinaryTree<Integer> buscarNodo(BinaryTree<Integer> nodo, int num) {
        BinaryTree<Integer> nodoNum = new BinaryTree<>();
        if(nodo.getData().equals(num))
            nodoNum = nodo;
        else {
            if (nodo.hasLeftChild())
                nodoNum = buscarNodo(nodo.getLeftChild(), num);
            if (nodo.hasRightChild() && nodoNum.isEmpty())
                nodoNum = buscarNodo(nodo.getRightChild(), num);
        }
        return nodoNum;
    }
    private int cantNodosDosHijos(BinaryTree<Integer> nodo) {
        int cant = 0;
        if(!nodo.isLeaf()) {
            if (nodo.hasLeftChild() && nodo.hasRightChild()) {
                cant = 1;
                cant += cantNodosDosHijos(nodo.getLeftChild());
                cant += cantNodosDosHijos(nodo.getRightChild());
            } else if (nodo.hasLeftChild())
                cant += cantNodosDosHijos(nodo.getLeftChild());
            else
                cant += cantNodosDosHijos(nodo.getRightChild());
        }
        return cant;
    }
    private boolean _isTwoTree(BinaryTree<Integer> arbol, int num) {
        BinaryTree<Integer> nodoNum = buscarNodo(arbol,num);
        if(nodoNum.isEmpty())
            return false;
        int cantIzq = 0;
        int cantDer = 0;
        if(nodoNum.hasLeftChild())
            cantIzq += cantNodosDosHijos(nodoNum.getLeftChild());
        else cantIzq = -1;
        if(nodoNum.hasRightChild())
            cantDer += cantNodosDosHijos(nodoNum.getRightChild());
        else cantDer = -1;
        return cantDer == cantIzq;
    }
    public static void main(String[] args) {
        // Create all nodes
        BinaryTree<Integer> root = new BinaryTree<>(2);

        // Level 1 nodes
        BinaryTree<Integer> node7 = new BinaryTree<>(7);
        BinaryTree<Integer> nodeMinus5 = new BinaryTree<>(-5);

        // Level 2 nodes
        BinaryTree<Integer> node23 = new BinaryTree<>(23);
        BinaryTree<Integer> node6 = new BinaryTree<>(6);
        BinaryTree<Integer> node19 = new BinaryTree<>(19);
        BinaryTree<Integer> node4 = new BinaryTree<>(4);

        // Level 3 nodes
        BinaryTree<Integer> nodeMinus3 = new BinaryTree<>(-3);
        BinaryTree<Integer> node55 = new BinaryTree<>(55);
        BinaryTree<Integer> node18 = new BinaryTree<>(18);

        // Level 4 nodes
        BinaryTree<Integer> node9 = new BinaryTree<>(9);
        BinaryTree<Integer> node16 = new BinaryTree<>(16);
        BinaryTree<Integer> node8 = new BinaryTree<>(8);
        BinaryTree<Integer> node24 = new BinaryTree<>(24);

        // Connect nodes according to the image
        // Level 0 -> Level 1
        root.addLeftChild(node7);
        root.addRightChild(nodeMinus5);

        // Level 1 -> Level 2
        node7.addLeftChild(node23);
        node7.addRightChild(node6);
        nodeMinus5.addLeftChild(node19);
        nodeMinus5.addRightChild(node4);

        // Level 2 -> Level 3
        node23.addLeftChild(nodeMinus3);
        node6.addLeftChild(node55);
        node4.addRightChild(node18);

        // Level 3 -> Level 4
        node55.addLeftChild(node9);
        node55.addRightChild(node16);
        node18.addLeftChild(node8);
        node18.addRightChild(node24);

        root.porNiveles();
        ParcialArboles p = new ParcialArboles(root);
        System.out.println(p.isTwoTree(55));
    }
}

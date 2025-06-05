package Parciales.Árboles.Fecha_29_6_2024;

import Practica_2.EJ1yEJ2.BinaryTree;


public class ParcialArboles {
    private BinaryTree<Integer> tree;

    public ParcialArboles(BinaryTree<Integer> t) {
        tree = t;
    }

    public BinaryTree<Integer> nuevoTree() {
        BinaryTree<Integer> nuevoTree = new BinaryTree<>();
        if(tree != null && !tree.isEmpty()) {
            nuevoTree.setData(tree.getData());
            _nuevoTree(tree, nuevoTree);
        }
        return nuevoTree;
    }

    private void _nuevoTree(BinaryTree<Integer> originalTree, BinaryTree<Integer> nuevoTree) {
        if(originalTree.hasLeftChild()) {
            nuevoTree.addLeftChild(new BinaryTree<>(originalTree.getData() + originalTree.getLeftChild().getData()));
            _nuevoTree(originalTree.getLeftChild(), nuevoTree.getLeftChild());
        }
        if(originalTree.hasRightChild()) {
            nuevoTree.addRightChild(new BinaryTree<>(originalTree.getRightChild().getData()));
            _nuevoTree(originalTree.getRightChild(), nuevoTree.getRightChild());
        }
    }

    public static void main(String[] args) {
        BinaryTree<Integer> root = new BinaryTree<>(1);
        BinaryTree<Integer> node2 = new BinaryTree<>(2);
        BinaryTree<Integer> node3 = new BinaryTree<>(3);
        BinaryTree<Integer> node4 = new BinaryTree<>(4);
        BinaryTree<Integer> node5 = new BinaryTree<>(5);
        BinaryTree<Integer> node6 = new BinaryTree<>(6);
        BinaryTree<Integer> node7 = new BinaryTree<>(7);
        root.addLeftChild(node2);
        root.addRightChild(node3);
        node2.addLeftChild(node4);
        node3.addLeftChild(node5);
        node3.addRightChild(node6);
        node5.addLeftChild(node7);

        root.porNiveles();
        ParcialArboles P = new ParcialArboles(root);
        BinaryTree<Integer> nuevoTree = P.nuevoTree();
        nuevoTree.porNiveles();
    }
}

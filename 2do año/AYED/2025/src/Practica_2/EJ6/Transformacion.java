package Practica_2.EJ6;

import Practica_2.EJ1yEJ2.BinaryTree;

/**
 *
 * @author Federico Dobal>
 */
public class Transformacion {
    private BinaryTree<Integer> tree;
    
    public Transformacion(BinaryTree<Integer> tree) {
        this.tree = tree;
    }
    
    public BinaryTree<Integer> suma() {
        suma(this.tree);
        return this.tree;
    }
    
    private int suma(BinaryTree<Integer> tree) {
        int aux = 0;
        if(tree.isLeaf()) {
            aux = tree.getData();
            tree.setData(0);
            return aux;
        }
        if(tree.hasLeftChild())
            aux += suma(tree.getLeftChild());
        if(tree.hasRightChild())
            aux += suma(tree.getRightChild());
        int data = tree.getData();
        tree.setData(aux);
        return data + aux;
    }
    
    /* Esta solución recorre una sola vez cada subárbol */
}

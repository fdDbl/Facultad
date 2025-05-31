package Practica_2.EJ4;

import Practica_2.EJ1yEJ2.BinaryTree;

/**
 *
 * @author Federico Dobal
 */
public class RedBinariaLlena {
    private BinaryTree<Double> tree;
    
    public RedBinariaLlena(BinaryTree<Double> tree) {
        this.tree = tree;
    }
    
    public double retardoReenvio() {
        return (tree == null) ? 0 : rRAux(tree);
    } 
    
    public double rRAux(BinaryTree<Double> aux) {
        double cont = aux.getData();
        if(aux.hasLeftChild() && aux.hasRightChild()) {
            if(aux.getLeftChild().getData() > aux.getRightChild().getData()) 
                cont += rRAux(aux.getLeftChild());
            else 
                cont += rRAux(aux.getRightChild());
        }
        return cont;
    }
}

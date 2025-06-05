package Practica_2.EJ5;

import Practica_2.EJ1yEJ2.BinaryTree;

/**
 *
 * @author Federico Dobal
 */
public class ProfundidadDeArbolBinario {
    private BinaryTree<Integer> tree;
    
    public ProfundidadDeArbolBinario(BinaryTree<Integer> tree) {
        this.tree = tree;
    }
    
    public int sumaElementosProfundidad(int p) {
        return sEPAux(this.tree,p,0);
    }
    
    private int sEPAux(BinaryTree<Integer> tree, int p, int prof) {
        if((prof > p) || (tree == null))
            return 0;
        else
            return tree.getData() + sEPAux(tree.getLeftChild(),p,prof+1) + sEPAux(tree.getRightChild(),p,prof+1);
    }
}

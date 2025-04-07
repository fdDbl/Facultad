package Práctica_2.EJ9;

import Práctica_2.EJ1.BinaryTree;
import java.util.Objects;

/**
 *
 * @author Fede Dobal
 */
public class ParcialArboles {
    private BinaryTree<Integer> tree;
    
    public BinaryTree<?> sumAndDif(BinaryTree<Integer> arbol) {
        BinaryTree<DobleInteger> arbolSumDif = new BinaryTree();
    }

    
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree();
        
        arbol.setData(8);
        arbol.addRightChild(new BinaryTree<>(15));
        arbol.addLeftChild(new BinaryTree<>(15));
        
        ParcialArboles p = new ParcialArboles();
        p.sumAndDif(arbol).inOrder();
    }
    

}
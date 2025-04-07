package Práctica_2.EJ9;

import Práctica_2.EJ1.BinaryTree;
import java.util.Objects;

/**
 *
 * @author Fede Dobal
 */
public class ParcialArboles {
    private BinaryTree<Integer> tree;
    
    public BinaryTree<DobleInteger> sumAndDif(BinaryTree<Integer> arbol) {
        BinaryTree<DobleInteger> nuevoArbol = new BinaryTree();
        if(!arbol.isEmpty())
            nuevoArbol.setData(new DobleInteger(arbol.getData(),arbol.getData()));
        Integer sum = 0;
        Integer dif = 0;
        sumAndDifAux(arbol,nuevoArbol,sum,dif);
        return nuevoArbol;
    }
    
    private BinaryTree<DobleInteger> sumAndDifAux(BinaryTree<Integer> arbol, BinaryTree<DobleInteger> nuevoArbol, Integer sum, Integer dif) {
        
    }
    
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree();
        
        arbol.setData(8);
        arbol.addRightChild(new BinaryTree<>(10));
        arbol.addLeftChild(new BinaryTree<>(15));
        
        ParcialArboles p = new ParcialArboles();
        p.sumAndDif(arbol).inOrder();
    }
    

}
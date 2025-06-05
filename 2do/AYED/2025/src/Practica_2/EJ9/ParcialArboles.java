package Practica_2.EJ9;

/*  1. si el recorrido no es por niveles, usar helper 
*/

import Practica_2.EJ1yEJ2.BinaryTree;
/**
 *
 * @author Fede Dobal
 */
public class ParcialArboles {
    private BinaryTree<Integer> tree;
    
    public BinaryTree<DobleInteger> sumAndDif(BinaryTree<Integer> arbol) {
        BinaryTree<DobleInteger> nuevoArbol = new BinaryTree();
        if(!arbol.isEmpty())
            sumAndDif(arbol,nuevoArbol,0,0);
        return nuevoArbol;
    }
    
    private void sumAndDif(BinaryTree<Integer> arbol, BinaryTree<DobleInteger> nuevoArbol, Integer sum, Integer padre) {
        int suma = sum + arbol.getData();
        int dif = arbol.getData() - padre;
        
        nuevoArbol.setData(new DobleInteger(suma,dif));
        
        if(arbol.hasLeftChild()) {
            nuevoArbol.addLeftChild(new BinaryTree());
            sumAndDif(arbol.getLeftChild(),nuevoArbol.getLeftChild(),suma,arbol.getData());
        }
        if(arbol.hasRightChild()) {
            nuevoArbol.addRightChild(new BinaryTree());
            sumAndDif(arbol.getRightChild(),nuevoArbol.getRightChild(),suma,arbol.getData());
        }
    }
    
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree();
        
        arbol.setData(8);
        arbol.addRightChild(new BinaryTree<>(10));
        arbol.addLeftChild(new BinaryTree<>(15));
        
        ParcialArboles p = new ParcialArboles();
        arbol.inOrder();
        System.out.println("");
        p.sumAndDif(arbol).inOrder();
    }
}
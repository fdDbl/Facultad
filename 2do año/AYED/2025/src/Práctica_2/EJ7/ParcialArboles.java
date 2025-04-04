package Práctica_2.EJ7;

import Práctica_2.EJ1.BinaryTree;

/**
 *
 * @author Fede Dobal
 */
public class ParcialArboles {
    private BinaryTree<Integer> tree;
    
    public ParcialArboles(BinaryTree<Integer> tree) {
        this.tree = tree;
    }
    
    private BinaryTree<Integer> buscarNodo(BinaryTree<Integer> tree, int num) {
        if(tree == null)
            return null;
        if(tree.getData() == num)
            return tree;
        if(tree.hasLeftChild())
            return buscarNodo(tree.getLeftChild(),num);
        return buscarNodo(tree.getRightChild(),num);
    }
    
    private int contarNodosConUnicoHijo(BinaryTree<Integer> nodo) {
        if(nodo == null)
            return -1;
        int aux = 0;
        if((nodo.getLeftChild() != null && nodo.getRightChild() == null) || (nodo.getLeftChild() == null && nodo.getRightChild() != null))
            aux = 1;
        aux += contarNodosConUnicoHijo(nodo.getLeftChild());
        aux += contarNodosConUnicoHijo(nodo.getRightChild());
        return aux;
    }
    
    public boolean isLeftTree(int num) {
        BinaryTree<Integer> nodo = buscarNodo(tree,num);
        if(nodo == null)
            return false;
        
        int cantIzq = contarNodosConUnicoHijo(nodo.getLeftChild());
        int cantDer = contarNodosConUnicoHijo(nodo.getRightChild());
        
        return cantIzq > cantDer;
    }
    
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree();
        arbol.setData(40);
        arbol.addRightChild(new BinaryTree<>(4));
        arbol.addLeftChild(new BinaryTree<>(15));
        arbol.getLeftChild().addLeftChild(new BinaryTree<>(100));
        arbol.getLeftChild().addRightChild(new BinaryTree<>(-64));
        arbol.getRightChild().addLeftChild(new BinaryTree<>(-2));
        arbol.getRightChild().addRightChild(new BinaryTree<>(24));
        arbol.inOrder();
        System.out.println();
       
        ParcialArboles p = new ParcialArboles(arbol);
        System.out.println(p.isLeftTree(55));
    }
}
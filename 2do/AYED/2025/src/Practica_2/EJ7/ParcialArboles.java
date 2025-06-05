package Practica_2.EJ7;

import Practica_2.EJ1yEJ2.BinaryTree;

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
        BinaryTree<Integer> nodo = new BinaryTree<>();
        if(tree.getData() == num)
            return tree;
        if(tree.hasLeftChild() && nodo.isEmpty())
            nodo = buscarNodo(tree.getLeftChild(),num);
        if(tree.hasRightChild() && nodo.isEmpty())
            nodo = buscarNodo(tree.getRightChild(),num);
        return nodo;
    }
    
    private int contarNodosConUnicoHijo(BinaryTree<Integer> nodo) {
        int aux = 0;
        if(nodo.isLeaf())
            return aux;
        if((nodo.hasLeftChild() && !nodo.hasRightChild()) || (!nodo.hasLeftChild() && nodo.hasRightChild()))
            aux = 1;
        if(nodo.hasLeftChild())
            aux += contarNodosConUnicoHijo(nodo.getLeftChild());
        if(nodo.hasRightChild())
            aux += contarNodosConUnicoHijo(nodo.getRightChild());
        return aux;
    }
    
    public boolean isLeftTree(int num) {
        BinaryTree<Integer> nodo = buscarNodo(tree,num);
        if(nodo.isEmpty())
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

        arbol.getRightChild().addLeftChild(new BinaryTree<>(-2));
        arbol.getRightChild().addRightChild(new BinaryTree<>(24));
        arbol.inOrder();
        System.out.println();
       
        ParcialArboles p = new ParcialArboles(arbol);
        System.out.println(p.isLeftTree(40));
    }
}
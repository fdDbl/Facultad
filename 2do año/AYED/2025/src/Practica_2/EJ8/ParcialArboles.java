package Practica_2.EJ8;

import Practica_2.EJ1yEJ2.BinaryTree;

/**
 *
 * @author Fede Dobal
 */
public class ParcialArboles {
    private BinaryTree<Integer> tree;
    
    public boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2) {
        if(arbol1.isEmpty() || arbol2.isEmpty())
            return arbol1.isEmpty() && arbol2.isEmpty();
        return esPrefijoAux(arbol1, arbol2);
    }
    
    private boolean esPrefijoAux(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2) {
        /* arbol1 es prefijo de arbol2 si y solo si los elementos de arbol1 están estrictamente contenidos en arbol2
        (no al revés) */

        if((!arbol1.getData().equals(arbol2.getData())) || 
            (arbol1.hasLeftChild() && !arbol2.hasLeftChild()) || 
            (arbol1.hasRightChild() && !arbol2.hasRightChild()))
                return false;   // descarto todos los casos falsos
        
        boolean ok = true;
        if(arbol1.hasLeftChild() && arbol2.hasLeftChild())
            ok = esPrefijoAux(arbol1.getLeftChild(),arbol2.getLeftChild());
        if(arbol1.hasRightChild() && arbol2.hasRightChild() && ok)
            ok = esPrefijoAux(arbol1.getRightChild(),arbol2.getRightChild());
        // recorro los hijos y guardo los resultados en booleano...
        
        return ok;
        // ...para luego compararlos y retornarlos
    }
    
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree<>(8);
        BinaryTree<Integer> arbolPRE = new BinaryTree<>(8);
        arbol.addRightChild(new BinaryTree<>(15));
        
        ParcialArboles p = new ParcialArboles();
        System.out.println(p.esPrefijo(arbolPRE,arbol));
    }
}
package Practica_2.EJ1yEJ2;

import java.util.LinkedList;
import java.util.Queue;

public class BinaryTree<T> {

    private T data;
    private BinaryTree<T> leftChild;
    private BinaryTree<T> rightChild;

    public BinaryTree() {
        super();
    }

    public BinaryTree(T data) {
        this.data = data;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public BinaryTree<T> getLeftChild() {
        return leftChild;
    }

    public BinaryTree<T> getRightChild() {
        return this.rightChild;
    }

    public void addLeftChild(BinaryTree<T> child) {
        this.leftChild = child;
    }

    public void addRightChild(BinaryTree<T> child) {
        this.rightChild = child;
    }

    public void removeLeftChild() {
        this.leftChild = null;
    }

    public void removeRightChild() {
        this.rightChild = null;
    }

    public boolean isEmpty() {
        return (this.isLeaf() && this.getData() == null);
    }

    public boolean isLeaf() {
        return (!this.hasLeftChild() && !this.hasRightChild());

    }

    public boolean hasLeftChild() {
        return this.leftChild != null;
    }

    public boolean hasRightChild() {
        return this.rightChild != null;
    }
    
    public int contarHojas() {
        int leftLeaves = 0;
        int rightLeaves = 0;
        if(isEmpty())
            return 0;
        else if(isLeaf())
            return 1;
        else {
            if(this.hasLeftChild())
                leftLeaves = this.getLeftChild().contarHojas();
            if(this.hasRightChild())
                rightLeaves = this.getRightChild().contarHojas();
        }
        return leftLeaves + rightLeaves;
    }
    
    public BinaryTree<T> espejo() {
        BinaryTree<T> tree = new BinaryTree(this.getData());
        if(isEmpty())
            return tree;
        else {
            if(this.hasLeftChild())
                tree.addRightChild(this.getLeftChild().espejo());
            if(this.hasRightChild())
                tree.addLeftChild(this.getRightChild().espejo());
        }
        return tree;
    }

    public void entreNiveles(int n, int m) {
        if (this.isEmpty() || n < 0 || m < n) 
            return;
        Queue<BinaryTree<T>> cola = new LinkedList<>();
        cola.add(this);
        cola.add(null);
        BinaryTree<T> aux;
        int nivelActual = 0;

        while (!cola.isEmpty()) {
            aux = cola.remove();
            if(aux != null) {
                if(nivelActual <= m && nivelActual >= n)
                    System.out.print(aux.getData() + " | ");
                if (aux.hasLeftChild()) 
                    cola.add(aux.getLeftChild());
                if (aux.hasRightChild()) 
                    cola.add(aux.getRightChild());
            } else if(!cola.isEmpty()) {
                System.out.println();
                cola.add(null);
                nivelActual++;
            }
        }
    }

    @Override
    public String toString() {
        return this.getData().toString();
    }

    public void inOrder() {
        if (!this.isEmpty()) {
            if (this.hasLeftChild()) 
                this.getLeftChild().inOrder();
            System.out.print(this.getData().toString() + " ");
            if (this.hasRightChild()) 
                this.getRightChild().inOrder();
        }
    }

    public void porNiveles() {
        Queue<BinaryTree<T>> cola = new LinkedList<>();
        cola.add(this);
        BinaryTree<T> aux;
        int cantNodos;
        while (!cola.isEmpty()) {
            cantNodos = cola.size();
            for(int i = 0; i < cantNodos; i++) {
                aux = cola.remove();
                System.out.print(aux.getData() + " ");
                if(aux.hasLeftChild())
                    cola.add(aux.getLeftChild());
                if(aux.hasRightChild())
                    cola.add(aux.getRightChild());
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {

        //             1
        //           /   \
        //         2       3
        //        / \     /
        //       4   5   6

        BinaryTree<Integer> root = new BinaryTree<>(1);
        BinaryTree<Integer> nodo2 = new BinaryTree<>(2);
        BinaryTree<Integer> nodo3 = new BinaryTree<>(3);
        BinaryTree<Integer> nodo4 = new BinaryTree<>(4);
        BinaryTree<Integer> nodo5 = new BinaryTree<>(5);
        BinaryTree<Integer> nodo6 = new BinaryTree<>(6);

        root.addLeftChild(nodo2);
        root.addRightChild(nodo3);
        nodo2.addLeftChild(nodo4);
        nodo2.addRightChild(nodo5);
        nodo3.addLeftChild(nodo6);

        // Contar hojas
        System.out.println("Cantidad de hojas: " + root.contarHojas());

        // Árbol original (inOrder)
        System.out.print("Recorrido inOrder del árbol original: ");
        root.inOrder();
        System.out.println();

        // Árbol espejo
        BinaryTree<Integer> espejo = root.espejo();
        System.out.print("Recorrido inOrder del árbol espejo: ");
        espejo.inOrder();
        System.out.println();

        // Entre niveles
        System.out.println("Nodos entre niveles 1 y 2:");
        root.entreNiveles(1, 2);
    }

}

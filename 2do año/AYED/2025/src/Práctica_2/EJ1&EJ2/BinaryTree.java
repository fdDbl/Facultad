package Práctica_2.EJ1;

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
        int nivelActual = 0;

        while (!cola.isEmpty()) {
            int nodosEnNivel = cola.size();
            if (nivelActual >= n && nivelActual <= m) {
                for (int i = 0; i < nodosEnNivel; i++) {
                    BinaryTree<T> nodo = cola.remove();
                    System.out.print(nodo.getData() + " | ");
                    if (nodo.hasLeftChild()) 
                        cola.add(nodo.getLeftChild());
                    if (nodo.hasRightChild()) 
                        cola.add(nodo.getRightChild());
                }
                System.out.println();
            } else {
                for (int i = 0; i < nodosEnNivel; i++) {
                    BinaryTree<T> nodo = cola.remove();
                    if (nivelActual < n) {
                        if (nodo.hasLeftChild()) 
                            cola.add(nodo.getLeftChild());
                        if (nodo.hasRightChild()) {
                            cola.add(nodo.getRightChild());
                    }
                }
                if (nivelActual < n) 
                    System.out.println();
            }
            nivelActual++;
            if (nivelActual > m) 
                break;
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
            System.out.print(this.getData() + " ");
            if (this.hasRightChild()) 
                this.getRightChild().inOrder();
        }
    }
}

package Práctica_3.EJ1yEJ2ByEJ3;

import Práctica_1.EJ8.Queue;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class GeneralTree<T>{

    private T data;
    private List<GeneralTree<T>> children = new LinkedList<>();
    
    public GeneralTree() {	
	super();
    }
    public GeneralTree(T data) {
        this.data = data;
    }

    public GeneralTree(T data, List<GeneralTree<T>> children) {
        this(data);
	this.children = children;
    }	
    
    public T getData() {
	return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public List<GeneralTree<T>> getChildren() {
        return this.children;
    }
	
    public void setChildren(List<GeneralTree<T>> children) {
        if (children != null)
            this.children = children;
    }
	
    public void addChild(GeneralTree<T> child) {
        this.getChildren().add(child);
    }

    public boolean isLeaf() {
        return !this.hasChildren();
    }
	
    public boolean hasChildren() {
        return !this.children.isEmpty();
    }
	
    public boolean isEmpty() {
        return this.data == null && !this.hasChildren();
    }

    public void removeChild(GeneralTree<T> child) {
        if (this.hasChildren())
            children.remove(child);
    }
    
    /* PUNTO 2B) Si ahora tuviera que implementar estos métodos en la clase GeneralTree<T>, ¿qué modificaciones
    haría tanto en la firma como en la implementación de los mismos? */
    
    public List<Integer> numerosImparesMayoresQuePreOrden(Integer n) {
        List<Integer> lista = new ArrayList();
        if(!this.isEmpty())
            numerosImparesMayoresQuePreOrden(n,lista);
        return lista;
    }
    
    private void numerosImparesMayoresQuePreOrden(Integer n, List<Integer> lista) {
        if((Integer) this.getData() > n & (Integer) this.getData() % 2 != 0)
            lista.add((Integer) this.getData());
        
        List<GeneralTree<T>> hijos = this.getChildren();
        for(GeneralTree<T> hijo: hijos)
            hijo.numerosImparesMayoresQuePreOrden(n,lista);
    }
    
    public List<Integer> numerosImparesMayoresQueInOrden(Integer n) {
        List<Integer> lista = new ArrayList();
        if(!this.isEmpty())
            numerosImparesMayoresQueInOrden(n,lista);
        return lista;
    }
    
    private void numerosImparesMayoresQueInOrden(Integer n, List<Integer> lista) {
        if(this.hasChildren())
            this.children.getFirst().numerosImparesMayoresQueInOrden(n,lista);
        
        if((Integer) this.getData() > n & (Integer) this.getData() % 2 != 0)
            lista.add((Integer) this.getData());
        
        List<GeneralTree<T>> hijos = this.getChildren();
        for(GeneralTree<T> hijo: hijos.subList(1, hijos.size()))
            hijo.numerosImparesMayoresQueInOrden(n,lista);
    }
    
    public List<Integer> numerosImparesMayoresQuePostOrden(Integer n) {
        List<Integer> lista = new ArrayList();
        if(!this.isEmpty())
            numerosImparesMayoresQuePostOrden(n,lista);
        return lista;
    }
    
    private void numerosImparesMayoresQuePostOrden(Integer n, List<Integer> lista) {
        List<GeneralTree<T>> hijos = this.getChildren();
        for(GeneralTree<T> hijo: hijos)
            hijo.numerosImparesMayoresQuePreOrden(n,lista);
        
        if((Integer) this.getData() > n & (Integer) this.getData() % 2 != 0)
            lista.add((Integer) this.getData());
    }

    public List<Integer> numerosImparesMayoresQuePorNiveles(Integer n) {
        List<Integer> lista = new ArrayList();
        Queue<GeneralTree<T>> cola = new Queue<>();
        cola.enqueue(this);
        GeneralTree<T> t;
        
        while(!cola.isEmpty()) {
            t = cola.dequeue();
            if(!t.isEmpty() & (Integer) t.getData() > n & (Integer) t.getData() % 2 != 0)
                lista.add((Integer) t.getData());
            List<GeneralTree<T>> hijos = t.getChildren();
            for(GeneralTree<T> hijo: hijos)
                cola.enqueue(hijo);
        }
        
        return lista;
    }

    // PUNTO 3) Implementar los siguientes métodos:
    
    public int altura() {
        if(this.isEmpty())
            return -1;
        return alturaAux();
    }
    
    private int alturaAux() {
        if(this.isLeaf())
            return 0;
        else {
            int altAct = 0;
            List<GeneralTree<T>> hijos = this.getChildren();
            for(GeneralTree<T> hijo: hijos)
                altAct = Math.max(altAct, hijo.alturaAux());
            return altAct;
        }
    }
}
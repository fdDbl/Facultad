package Practica_3.EJ1yEJ2ByEJ3yEJ5;

import java.util.*;

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

    public void porNiveles() {
        if (this == null || this.isEmpty())
            return;

        Queue<GeneralTree<T>> cola = new LinkedList<>();
        cola.add(this);
        cola.add(null);
        GeneralTree<T> t;

        while (!cola.isEmpty()) {
            t = cola.remove();
            if (t != null) {
                System.out.print(t.getData() + " ");
                cola.addAll(t.getChildren());
            } else if (!cola.isEmpty()) {
                System.out.println();
                cola.add(null);
            }
        }
        System.out.println();
    }
    
    /* PUNTO 2B) Si ahora tuviera que implementar estos métodos en la clase GeneralTree<T>, ¿qué modificaciones
    haría tanto en la firma como en la implementación de los mismos? */
    
    public List<Integer> numerosImparesMayoresQuePreOrden(Integer n) {
        List<Integer> lista = new ArrayList();
        if(this != null && !this.isEmpty())
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
        if(this != null && !this.isEmpty())
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
        if(this != null && !this.isEmpty())
            numerosImparesMayoresQuePostOrden(n,lista);
        return lista;
    }
    
    private void numerosImparesMayoresQuePostOrden(Integer n, List<Integer> lista) {
        for(GeneralTree<T> hijo: this.getChildren())
            hijo.numerosImparesMayoresQuePostOrden(n,lista);
        
        if((Integer) this.getData() > n & (Integer) this.getData() % 2 != 0)
            lista.add((Integer) this.getData());
    }

    public List<Integer> numerosImparesMayoresQuePorNiveles(Integer n) {
        List<Integer> lista = new ArrayList();
        Queue<GeneralTree<T>> cola = new LinkedList<>();
        cola.add(this);
        cola.add(null);
        GeneralTree<T> t;
        
        while(!cola.isEmpty()) {
            t = cola.remove();
            if(!t.isEmpty() & (Integer) t.getData() > n & (Integer) t.getData() % 2 != 0)
                lista.add((Integer) t.getData());
            for(GeneralTree<T> hijo: t.getChildren())
                cola.add(hijo);
        }
        
        return lista;
    }

    // PUNTO 3) Implementar los siguientes métodos:
    
    public int altura() {
        if(this.isEmpty())
            return -1;
        return alturaHelper(0);
    }
    
    private int alturaHelper(int h) {
        if(this.isLeaf())
            return h;
        else {
            int altAct = 0;
            List<GeneralTree<T>> hijos = this.getChildren();
            for(GeneralTree<T> hijo: hijos)
                altAct = Math.max(altAct, hijo.alturaHelper(h+1));
            return altAct;
        }
    }
    
    public int nivel(T dato) {
        if (this != null && !this.isEmpty()) {
            Queue<GeneralTree<T>> cola = new LinkedList<>();
            cola.add(this);
            int level = 0;
            boolean encontre = false;
            
            while (!cola.isEmpty()) {
                int size = cola.size();
                int i = 0;
                while (i < size && !encontre) {
                    GeneralTree<T> aux = cola.remove();
                    if (aux.getData().equals(dato)) {
                        encontre = true;
                    }
                    for (GeneralTree<T> hijo : aux.getChildren()) {
                        cola.add(hijo);
                    }
                    i++;
                }
                if(encontre)
                    return level;
                level++;
            }
        }
        return -1;
    }
    
    public int ancho() {
        if(this != null && !this.isEmpty()) {
            int anchoMax = -1;
            Queue<GeneralTree<T>> cola = new LinkedList<>();
            GeneralTree<T> aux;
            cola.add(this);
            
            while(!cola.isEmpty()) {
                int colaSize = cola.size();
                anchoMax = Math.max(anchoMax, colaSize);
                for(int i=0; i < colaSize; i++) {
                    aux = cola.remove();
                    for(GeneralTree<T> hijo: aux.getChildren()) {
                        cola.add(hijo);
                    }
                }
            }
            return anchoMax;
        }
        return -1;
    }

    
    // PUNTO 5)
    
    public boolean esAncestro(T a, T b) {
        if(a == null || b == null || this.isEmpty())
            return false;
        GeneralTree<T> nodo = esAncestro(this,a);
        if(nodo == null)
            return false;
        return esAncestro(nodo,b) != null;
    }
    
    private GeneralTree<T> esAncestro(GeneralTree<T> nodo, T dato) {
        if(nodo.getData().equals(dato))
            return nodo;
        GeneralTree<T> aux = null;
        Iterator<GeneralTree<T>> it = nodo.getChildren().iterator();
        while(it.hasNext() && aux == null)
            aux = esAncestro(it.next(), dato);
        return aux;
    }
    
    public static void main(String[] args) {
        List<GeneralTree<Integer>> children = new LinkedList<>();
        
        children.add(new GeneralTree<Integer>(1));
        children.add(new GeneralTree<Integer>(2));
        children.add(new GeneralTree<Integer>(3));
        GeneralTree<Integer> a1 = new GeneralTree<>(4, children);
        
        children = new LinkedList<>();
        children.add(new GeneralTree<Integer>(5));
        children.add(new GeneralTree<Integer>(6));
        children.add(new GeneralTree<Integer>(7));
        GeneralTree<Integer> a2 = new GeneralTree<>(8, children);
        
        children = new LinkedList<>();
        children.add(new GeneralTree<Integer>(9));
        children.add(new GeneralTree<Integer>(10));
        children.add(new GeneralTree<Integer>(11));
        GeneralTree<Integer> a3 = new GeneralTree<>(12, children);
        
        children = new LinkedList<>();
        children.add(a1);
        children.add(a2);
        children.add(a3);
        GeneralTree<Integer> a = new GeneralTree<>(1000, children);
        /*
        
                            1000
                  __________/|\__________
                 /           |           \
                4            8            12
              / | \        / | \        / | \
              1 2 3        5 6 7       9 10 11

        */
        System.out.println("Altura:");
        System.out.println(a.altura());
        System.out.println("Ancho:");
        System.out.println(a.ancho());
        System.out.println("Nivel de un dato:");
        System.out.println(a.nivel(9));
    }
}
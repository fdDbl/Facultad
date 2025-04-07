package Práctica_3.EJ2;

import Práctica_3.EJ1yEJ2ByEJ3.GeneralTree;
import Práctica_1.EJ8.Queue;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Federico Dobal
 */
public class RecorridosAG {
    public List<Integer> numerosImparesMayoresQuePreOrden(GeneralTree <Integer> a, Integer n) {
        List<Integer> lista = new ArrayList();
        if(!a.isEmpty())
            numerosImparesMayoresQuePreOrden(a,n,lista);
        return lista;
    }
    
    private void numerosImparesMayoresQuePreOrden(GeneralTree <Integer> a, Integer n, List<Integer> lista) {
        if(a.getData() > n & a.getData() % 2 != 0)
            lista.add(a.getData());
        
        List<GeneralTree<Integer>> hijos = a.getChildren();
        for(GeneralTree<Integer> hijo: hijos)
            numerosImparesMayoresQuePreOrden(hijo,n,lista);
    }
    
    public List<Integer> numerosImparesMayoresQueInOrden(GeneralTree <Integer> a, Integer n) {
        List<Integer> lista = new ArrayList();
        if(!a.isEmpty())
            numerosImparesMayoresQueInOrden(a,n,lista);
        return lista;
    }
    
    private void numerosImparesMayoresQueInOrden(GeneralTree <Integer> a, Integer n, List<Integer> lista) {
        if(a.hasChildren())
            numerosImparesMayoresQueInOrden(a.getChildren().getFirst(),n,lista);
        
        if(a.getData() > n & a.getData() % 2 != 0)
            lista.add(a.getData());
        
        List<GeneralTree<Integer>> hijos = a.getChildren();
        for(GeneralTree<Integer> hijo: hijos.subList(1, hijos.size()))
            numerosImparesMayoresQueInOrden(hijo,n,lista);
    }
    
    public List<Integer> numerosImparesMayoresQuePostOrden(GeneralTree <Integer> a, Integer n) {
        List<Integer> lista = new ArrayList();
        if(!a.isEmpty())
            numerosImparesMayoresQuePostOrden(a,n,lista);
        return lista;
    }
    
    private void numerosImparesMayoresQuePostOrden(GeneralTree <Integer> a, Integer n, List<Integer> lista) {
        List<GeneralTree<Integer>> hijos = a.getChildren();
        for(GeneralTree<Integer> hijo: hijos)
            numerosImparesMayoresQuePreOrden(hijo,n,lista);
        
        if(a.getData() > n & a.getData() % 2 != 0)
            lista.add(a.getData());
    }

    public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree<Integer> a, Integer n) {
        List<Integer> lista = new ArrayList();
        Queue<GeneralTree<Integer>> cola = new Queue<>();
        cola.enqueue(a);
        GeneralTree<Integer> t;
        
        while(!cola.isEmpty()) {
            t = cola.dequeue();
            if(!t.isEmpty() & t.getData() > n & t.getData() % 2 != 0)
                lista.add(t.getData());
            List<GeneralTree<Integer>> hijos = t.getChildren();
            for(GeneralTree<Integer> hijo: hijos)
                cola.enqueue(hijo);
        }
        
        return lista;
    }
}

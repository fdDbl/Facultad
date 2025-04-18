package Práctica_3.EJ2;

import Práctica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;
import Práctica_1.EJ8.Queue;
import java.util.ArrayList;
import java.util.List;

/**Dobal
 *
 * @author Federico 
 */
public class RecorridosAG {
    public List<Integer> numerosImparesMayoresQuePreOrden(GeneralTree <Integer> a, Integer n) {
        List<Integer> lista = new ArrayList();
        if(!a.isEmpty())
            numerosImparesMayoresQuePreOrden(a,n,lista);
        return lista;
    }
    
    private void numerosImparesMayoresQuePreOrden(GeneralTree <Integer> a, Integer n, List<Integer> lista) {
        if(a.getData() > n && a.getData() % 2 != 0)
            lista.add(a.getData());
        
        for(GeneralTree<Integer> hijo: a.getChildren())
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
        
        if(a.getData() > n && a.getData() % 2 != 0)
            lista.add(a.getData());
        
        for(int i=1; i< a.getChildren().size(); i++)
            numerosImparesMayoresQueInOrden(a.getChildren().get(i),n,lista);
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
            numerosImparesMayoresQuePostOrden(hijo,n,lista);
        
        if(a.getData() > n & a.getData() % 2 != 0)
            lista.add(a.getData());
    }

    public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree<Integer> a, Integer n) {
        List<Integer> lista = new ArrayList();
        Queue<GeneralTree<Integer>> cola = new Queue<>();
        cola.enqueue(a);
        cola.enqueue(null);
        GeneralTree<Integer> t;
        
        while(!cola.isEmpty()) {
            t = cola.dequeue();
            if (t != null){
                if(t.getData() > n & t.getData() % 2 != 0)
                    lista.add(t.getData());
                for(GeneralTree<Integer> hijo: t.getChildren())
                    cola.enqueue(hijo);
            }
            else
                // incremento un nivel
                cola.enqueue(null);
            
        }
        
        return lista;
    }
}

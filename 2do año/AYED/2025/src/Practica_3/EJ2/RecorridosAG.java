package Practica_3.EJ2;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

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
        Queue<GeneralTree<Integer>> cola = new LinkedList<>();
        cola.add(a);
        cola.add(null);
        GeneralTree<Integer> t;
        
        while(!cola.isEmpty()) {
            t = cola.remove();
            if (t != null){
                if(t.getData() > n & t.getData() % 2 != 0)
                    lista.add(t.getData());
                for(GeneralTree<Integer> hijo: t.getChildren())
                    cola.add(hijo);
            }
            else
                // incremento un nivel
                cola.add(null);
            
        }
        
        return lista;
    }
}

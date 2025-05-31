package Practica_1.EJ7;

import java.util.ArrayList;

/**
 *
 * @author Federico Dobal
 */
public class PuntoJ {
    public static ArrayList<Integer> combinarOrdenado(ArrayList<Integer> l1, ArrayList<Integer> l2) {
        ArrayList<Integer> l = new ArrayList();
        while(!l1.isEmpty() & !l2.isEmpty()) {
            if(l1.getFirst() <= l2.getFirst()) {
                l.add(l1.get(0));
                l1.remove(0);
            } else {
                l.add(l2.get(0));
                l2.remove(0);
            }
        }
        while(!l1.isEmpty()) {
            l.add(l1.get(0));
            l1.remove(0);
        }
        while(!l2.isEmpty()) {
            l.add(l2.get(0));
            l2.remove(0);
        }
        return l;
    }
    public static void main(String[] args) {
        ArrayList<Integer> lista1 = new ArrayList();
        ArrayList<Integer> lista2 = new ArrayList();
        
        for(int i = 1; i <= 20; i++) {
            lista1.add(i);
            lista2.add(i-10);
        }
        
        ArrayList<Integer> listaComb = combinarOrdenado(lista1,lista2);
        
        System.out.println("LISTAS COMBINADAS:");
        for(Integer I:listaComb) 
            System.out.println(I);
        
    }

}

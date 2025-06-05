package Practica_1.EJ7;

import java.util.LinkedList;

/**
 *
 * @author Federico Dobal
 */
public class PuntoI {
    public static int sumarLinkedList(LinkedList<Integer> lista) {
        return sumarLinkedListAux(lista,0);
    }
    
    public static int sumarLinkedListAux(LinkedList<Integer> lista, int pos) {
        if(pos < lista.size())
            return lista.get(pos) + sumarLinkedListAux(lista,++pos);
        else
            return 0;
    }
    
    public static void main(String[] args) {
        LinkedList<Integer> lista = new LinkedList();
        for(int i = 1; i <= 20; i++) {
            lista.add(i);
            System.out.println(i);
        }
        System.out.println("La lista suma entre sus elementos: " + sumarLinkedList(lista));
    }

}

package Práctica_1.EJ7;

import PaqueteLectura.GeneradorAleatorio;
import java.util.LinkedList;
import java.util.Objects;

/**
 *
 * @author Federico Dobal
 */
public class PuntoF {
    public static void main(String[] args) {
        LinkedList<Integer> miLista = new LinkedList<>();
        GeneradorAleatorio.iniciar();
        for(int i=0; i<6; i++)
            miLista.add(GeneradorAleatorio.generarInt(10));
        boolean capicua = esCapicua(miLista);
        System.out.println(capicua ? "Es capicua" : "No es capicua");
    }
    
    public static boolean esCapicua(LinkedList<Integer> lista) {
        boolean ok = lista.size() > 0;
        int pri = 0;
        int ult = lista.size() - 1;
        while((ok)&&(pri<ult))
            if(!Objects.equals(lista.get(pri++), lista.get(ult--)))
                ok = false;
        return ok;
    }
}

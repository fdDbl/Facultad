
package Practica_1.EJ5;

/**
 *
 * @author Federico Dobal
 */
public class Calcular {
    static String RES;
    
    public static Resultado metodo1(int[] arreglo) {
        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;
        int suma = 0;
        for(int i=0; i<arreglo.length; i++) {
            if(arreglo[i] > max)
                max = arreglo[i];
            if(arreglo[i] < min)
                min = arreglo[i];
            suma += arreglo[i];
        }
        double prom = suma / arreglo.length;
        return new Resultado(min,max,prom);
    }
    
    public static void metodo2(int[] arreglo, Resultado r) {
        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;
        int suma = 0;
        for(int i=0; i<arreglo.length; i++) {
            if(arreglo[i] > max)
                max = arreglo[i];
            if(arreglo[i] < min)
                min = arreglo[i];
            suma += arreglo[i];
        }
        double prom = suma / arreglo.length;
        r.setMin(min);
        r.setMax(max);
        r.setProm(prom);
    }
    
    public static void metodo3(int[] arreglo) {
        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;
        int suma = 0;
        for(int i=0; i<arreglo.length; i++) {
            if(arreglo[i] > max)
                max = arreglo[i];
            if(arreglo[i] < min)
                min = arreglo[i];
            suma += arreglo[i];
        }
        double prom = suma / arreglo.length;
        setRes("Min: " + min + " Max: " + max + " Promedio: " + prom);
    }

    private static void setRes(String res) {
        Calcular.RES = res;
    }   
}
/*
    Dado un arreglo de valores tipo entero se desea calcular el valor máximo, mínimo, y promedio
    en un único método. Escriba tres métodos de clase, donde respectivamente:
        a. Devuelva lo pedido por el mecanismo de retorno de un método en Java ("return").
        b. Devuelva lo pedido interactuando con algún parámetro (el parámetro no puede ser de
        tipo arreglo).
        c. Devuelva lo pedido sin usar parámetros ni la sentencia "return".
 */
package Practica_1.EJ5;

/**
 *
 * @author Federico Dobal
 */
public class main {
    public static void main(String[] args) {
        int[] arregloValores = {12,5,6,8,9,45};
        
        System.out.println(Calcular.metodo1(arregloValores).toString()); // Método 1: la clase Calcular devuelve un objeto Resultado, y en el main imprimimos el toString() de ese resultado.
        
        Resultado r = new Resultado(); // Método 2: los objetos son mutables, entonces se modifica aunque se pase por parámetro.
        Calcular.metodo2(arregloValores, r);
        System.out.println(r.toString());
        
        Calcular.metodo3(arregloValores); // Método 3: utilizamos una variable estática ("global") para obtener el resultado sin return ni parámetros.
        System.out.println(Calcular.RES); // <-- obsérvese que RES no es un método, sino una variable de clase de Calcular.
    }
    
}

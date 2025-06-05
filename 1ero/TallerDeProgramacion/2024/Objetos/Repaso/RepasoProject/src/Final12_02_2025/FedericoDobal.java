/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

package Final12_02_2025;
import PaqueteLectura.*;
/**
 *
 * @author Federico Dobal
 */
public class FedericoDobal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Empresa E = new Empresa("Remax","Calle 39 y 7 N°602");
        
        E.nuevoAlquiler("Federico Dobal", 47222436, 250000, 3, 10);
        E.nuevoAlquiler("Fulanito de Tal", 11222333, 300000, 1, 5);
        E.nuevoAlquiler("Gerónimo Benavides", 10365222, 100000, 2, 7);
        E.nuevoAlquiler("Shakira", 33658975, 25000000, 3, 5);
        
        E.incrementarAlquileres();
        
        System.out.println("Cantidad de oficinas alquiladas en el piso 3: " + E.cantOficinasAlquiladasEnPiso(3));
        
        int elDNI = PaqueteLectura.Lector.leerInt();
        if(E.liberarOficina(elDNI))
            System.out.println("Oficina liberada correctamente");
        else
            System.out.println("Oficina no encontrada");
    }
    
}

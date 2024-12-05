/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Librería;

/**
 *
 * @author fededobal
 */
public class FedericoDobal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Libreria L = new Libreria("Dobal's",5);
        
        L.nuevoTicketDeCompra(3,47222436,5,50000,"Débito");
        L.nuevoTicketDeCompra(1,47222437,4,45674,"Efectivo");
        L.nuevoTicketDeCompra(3,47222438,1,234,"Crédito");
        L.nuevoTicketDeCompra(2,47222439,2,4567,"Efectivo");
        L.nuevoTicketDeCompra(0,47222440,3,6789,"Débito");
        
        System.out.println(L.toString());
    }
    
}

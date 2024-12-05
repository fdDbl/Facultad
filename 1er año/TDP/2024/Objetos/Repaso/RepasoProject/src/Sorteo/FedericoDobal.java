/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Sorteo;

/**
 *
 * @author fededobal
 */
public class FedericoDobal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        SorteoSolidario SC = new SorteoComun(50000);
        SorteoSolidario SA = new SorteoAvanzado(50000);
        
        SC.agregarPersona("Federico Dobal", 47222436, 50000);
        SC.agregarPersona("Lucas Dobal", 26464782, 50000);
        SC.agregarPersona("Pamela Dobal",20894343, 50000);
        SC.agregarPersona("Luciana Dobal", 30928378, 50000);
        SC.agregarPersona("Agustin Lima", 45218983, 50000);
        
        SA.agregarPersona("Federico Dobal", 47222436, 12345);
        SA.agregarPersona("Lucas Dobal", 26464782, 345664);
        SA.agregarPersona("Pamela Dobal",20894343, 4567754);
        SA.agregarPersona("Luciana Dobal", 30928378, 234556);
        SA.agregarPersona("Agustin Lima", 45218983, 343456);
        
        System.out.println(SC.ejecutarSorteo().toString());
        System.out.println(SA.ejecutarSorteo().toString());
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;

    import PaqueteLectura.Lector;

public class Punto1 {
    public static void main(String[] args) {
        System.out.println("NUEVA PERSONA");
        System.out.println("Ingrese su nombre y apellido:");
        String nomAct = Lector.leerString();
        System.out.println("Ingrese su DNI:");
        int dniAct = Lector.leerInt();
        System.out.println("Ingrese su edad:");
        int edadAct = Lector.leerInt();
        
        Persona p1 = new Persona(nomAct,dniAct,edadAct);
        System.out.println("La persona informa:");
        System.out.println(p1.toString());
    }
}

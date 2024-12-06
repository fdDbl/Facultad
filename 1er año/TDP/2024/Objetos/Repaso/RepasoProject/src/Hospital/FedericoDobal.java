/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Hospital;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author Federico Dobal
 */
public class FedericoDobal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Hospital H = new Hospital("Garrahan","Calle Pichincha nro. 1890, CABA");
        
        H.ingresarPaciente(56347899, "Gustavo", "PAMI", GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarInt(20));
        H.ingresarPaciente(34587689, "Brian", "OSDE", GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarInt(20));
        H.ingresarPaciente(45678543, "Sara", "IOMA", GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarInt(20));
        H.ingresarPaciente(87654463, "Olga", "PAMI", GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarInt(20));
        H.ingresarPaciente(23456764, "Luca", "MEDICUS", GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarInt(20));

        H.incrementarDiasOcupacionDeTodos();
        System.out.println("Cantidad de pisos llenos: " + H.cantidadPisosLlenos());
        
        System.out.println("Ingrese DNI a dar de alta: ");
        int dni = Lector.leerInt();
        H.darDeAlta(dni);
    }
    
}

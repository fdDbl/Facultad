package SistemaMunicipalidad_Examen_06_06_2020;
import PaqueteLectura.GeneradorAleatorio;
public class FedericoDobal {

    public static void main(String[] args) {
        Sistema S = new Sistema();
        GeneradorAleatorio.iniciar();
        
        int i;
        for(i=0; i<1000; i++)
            S.agregarVehiculo((GeneradorAleatorio.generarInt(8)+1), (GeneradorAleatorio.generarInt(5)+1), (GeneradorAleatorio.generarInt(120)), (GeneradorAleatorio.generarBoolean()));
        System.out.println("Se han generado " + i + " vehiculos. \n");
        
        S.graficarMatrizCantVehiculos();    // PRUEBA
        S.graficarMatrizCantMinutos();      // PRUEBA
        
        System.out.println("Promedio de minutos acumulados entre todos los controles y motivos: " + S.promedioMinutosTotal());
        System.out.println("Numero de control por el cual pasaron mas vehiculos: " + S.controlMasTransitado());
    }   
}
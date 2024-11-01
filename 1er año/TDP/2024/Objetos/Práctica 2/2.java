package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class P2 {

    public static void main(String[] args) {
            int dimF = 15;
            Persona [] vPersonas = new Persona[dimF];
            int dimL = 0;
            int edadAct;
            String nomAct;
            int dniAct;
            
            edadAct = GeneradorAleatorio.generarInt(100);
            while(dimL < dimF && edadAct != 0) {
                nomAct = GeneradorAleatorio.generarString(10);
                dniAct = GeneradorAleatorio.generarInt(100000000);
                vPersonas[dimL] = new Persona(nomAct,dniAct,edadAct);
                dimL++;
                
                edadAct = GeneradorAleatorio.generarInt(100);
            }
            
            int cant65 = 0;
            int dniMax = 100000001;
            Persona conMenorDni = null;
            
            for(int i=0;i<dimL;i++) {
                System.out.println("PERSONA " + (i+1) + ":");
                System.out.println( vPersonas[i].toString());
                if(vPersonas[i].getEdad() > 65) cant65++;
                if(vPersonas[i].getDNI() < dniMax) {
                    conMenorDni = vPersonas[i];
                    dniMax = vPersonas[i].getDNI();
                } 
            }
            System.out.println("Cantidad de personas mayores a 65 años: " + cant65);
            System.out.println("La persona con menor DNI informa: " + conMenorDni.toString());
    }
}

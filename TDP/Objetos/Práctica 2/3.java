package tema2;

import PaqueteLectura.Lector;

public class P3 {

    public static void main(String[] args) {
        int CANT_DIAS = 5;
        int CANT_TURNOS = 8;

        int cantDias = 0;
        int cantTurnos = 0;
        int totalPersonas = 0;

        Persona[][] matrizCastings = new Persona[CANT_TURNOS][CANT_DIAS];
        String nomAct;
        int edadAct;
        int dniAct;
        boolean continuar = true;

        while (cantDias < CANT_DIAS && continuar) {
            System.out.println("<---------- DÍA " + (cantDias + 1) + " ---------->");

            while (cantTurnos < CANT_TURNOS && continuar) {
                System.out.println("----- PERSONA " + (cantTurnos + 1) + " -----");
                nomAct = Lector.leerString();
                if (!nomAct.equals("ZZZ")) {
                    edadAct = Lector.leerInt();
                    dniAct = Lector.leerInt();
                    matrizCastings[cantTurnos][cantDias] = new Persona(nomAct, dniAct, edadAct);
                    cantTurnos++;
                    totalPersonas++;
                } else {
                    continuar = false;
                }
            }
            cantDias++;
        }
        
        System.out.println("cantDias: " + cantDias + " cantTurnos: " + cantTurnos);

        int cont = 0;
        for (int j = 0; j < cantDias; j++) {
            System.out.println("<---------- DÍA " + (j + 1) + " ---------->");
            for (int k = 0; k < cantTurnos && cont < totalPersonas; k++) {
                System.out.println("----- PERSONA " + (k + 1) + " -----");
                String pAct = matrizCastings[k][j].toString();
                System.out.println(pAct);
                cont++;
            }
        }
    }
}

package SistemaMunicipalidad_Examen_06_06_2020;

public class Sistema {
    private Estadistica[][] estadisticas;
    private int CANTC = 8;
    private int CANTM = 5;
    
    public Sistema() {
        estadisticas = new Estadistica[8][5];
        for(int C=0; C<CANTC; C++)
            for(int M=0; M<CANTM; M++)
                estadisticas[C][M] = new Estadistica();
    }
    
    public void agregarVehiculo(int C, int M, int minutos, boolean viajaSolo) {
        estadisticas[C-1][M-1].nuevoVehiculo(minutos, viajaSolo);
    }
    
    public double promedioMinutosTotal() {
        int cant = CANTC * CANTM;
        int cantMinutos = 0;
        for(int C=0; C<CANTC; C++)
            for(int M=0; M<CANTM; M++)
                cantMinutos += estadisticas[C][M].getCantMinutos();
        return cantMinutos / cant;
    }
    
    public int controlMasTransitado() {
        int maxCantActual = -1;
        int mejorControl = -1;
        for(int C=0; C<CANTC; C++) {
            int cantActual = 0;
            for(int M=0; M<CANTM; M++)
                cantActual += estadisticas[C][M].getCantVehiculos();
            if(cantActual > maxCantActual) {
                maxCantActual = cantActual;
                mejorControl = C;
            }
        }
        return mejorControl+1;
    }
    
    public void graficarMatrizCantVehiculos() { // PRUEBA (no juzgar la forma de la que grafiqué esta matriz)
        System.out.println("---------- MATRIZ DE CANT. VEHICULOS (Control x Motivo) ----------");
        System.out.println("+---------+- 1 -+- 2 -+- 3 -+- 4 -+- 5 -+");
        System.out.println("+--- 1 ---+- "+estadisticas[0][0].getCantVehiculos()+" -+- "+estadisticas[0][1].getCantVehiculos()+" -+- "+estadisticas[0][2].getCantVehiculos()+" -+- "+estadisticas[0][3].getCantVehiculos()+" -+- "+estadisticas[0][4].getCantVehiculos()+" -+");
        System.out.println("+--- 2 ---+- "+estadisticas[1][0].getCantVehiculos()+" -+- "+estadisticas[1][1].getCantVehiculos()+" -+- "+estadisticas[1][2].getCantVehiculos()+" -+- "+estadisticas[1][3].getCantVehiculos()+" -+- "+estadisticas[1][4].getCantVehiculos()+" -+");
        System.out.println("+--- 3 ---+- "+estadisticas[2][0].getCantVehiculos()+" -+- "+estadisticas[2][1].getCantVehiculos()+" -+- "+estadisticas[2][2].getCantVehiculos()+" -+- "+estadisticas[2][3].getCantVehiculos()+" -+- "+estadisticas[2][4].getCantVehiculos()+" -+");
        System.out.println("+--- 4 ---+- "+estadisticas[3][0].getCantVehiculos()+" -+- "+estadisticas[3][1].getCantVehiculos()+" -+- "+estadisticas[3][2].getCantVehiculos()+" -+- "+estadisticas[3][3].getCantVehiculos()+" -+- "+estadisticas[3][4].getCantVehiculos()+" -+");
        System.out.println("+--- 5 ---+- "+estadisticas[4][0].getCantVehiculos()+" -+- "+estadisticas[4][1].getCantVehiculos()+" -+- "+estadisticas[4][2].getCantVehiculos()+" -+- "+estadisticas[4][3].getCantVehiculos()+" -+- "+estadisticas[4][4].getCantVehiculos()+" -+");
        System.out.println("+--- 6 ---+- "+estadisticas[5][0].getCantVehiculos()+" -+- "+estadisticas[5][1].getCantVehiculos()+" -+- "+estadisticas[5][2].getCantVehiculos()+" -+- "+estadisticas[5][3].getCantVehiculos()+" -+- "+estadisticas[5][4].getCantVehiculos()+" -+");
        System.out.println("+--- 7 ---+- "+estadisticas[6][0].getCantVehiculos()+" -+- "+estadisticas[6][1].getCantVehiculos()+" -+- "+estadisticas[6][2].getCantVehiculos()+" -+- "+estadisticas[6][3].getCantVehiculos()+" -+- "+estadisticas[6][4].getCantVehiculos()+" -+");
        System.out.println("+--- 8 ---+- "+estadisticas[7][0].getCantVehiculos()+" -+- "+estadisticas[7][1].getCantVehiculos()+" -+- "+estadisticas[7][2].getCantVehiculos()+" -+- "+estadisticas[7][3].getCantVehiculos()+" -+- "+estadisticas[7][4].getCantVehiculos()+" -+");
        System.out.println("\n");
    }
    
    public void graficarMatrizCantMinutos() {   // PRUEBA (no juzgar la forma de la que grafiqué esta matriz)
        System.out.println("---------- MATRIZ DE MINUTOS (Control x Motivo) ----------");
        System.out.println("+---------+- 1 -+- 2 -+- 3 -+- 4 -+- 5 -+");
        System.out.println("+--- 1 ---+- "+estadisticas[0][0].getCantMinutos()+" -+- "+estadisticas[0][1].getCantMinutos()+" -+- "+estadisticas[0][2].getCantMinutos()+" -+- "+estadisticas[0][3].getCantMinutos()+" -+- "+estadisticas[0][4].getCantMinutos()+" -+");
        System.out.println("+--- 2 ---+- "+estadisticas[1][0].getCantMinutos()+" -+- "+estadisticas[1][1].getCantMinutos()+" -+- "+estadisticas[1][2].getCantMinutos()+" -+- "+estadisticas[1][3].getCantMinutos()+" -+- "+estadisticas[1][4].getCantMinutos()+" -+");
        System.out.println("+--- 3 ---+- "+estadisticas[2][0].getCantMinutos()+" -+- "+estadisticas[2][1].getCantMinutos()+" -+- "+estadisticas[2][2].getCantMinutos()+" -+- "+estadisticas[2][3].getCantMinutos()+" -+- "+estadisticas[2][4].getCantMinutos()+" -+");
        System.out.println("+--- 4 ---+- "+estadisticas[3][0].getCantMinutos()+" -+- "+estadisticas[3][1].getCantMinutos()+" -+- "+estadisticas[3][2].getCantMinutos()+" -+- "+estadisticas[3][3].getCantMinutos()+" -+- "+estadisticas[3][4].getCantMinutos()+" -+");
        System.out.println("+--- 5 ---+- "+estadisticas[4][0].getCantMinutos()+" -+- "+estadisticas[4][1].getCantMinutos()+" -+- "+estadisticas[4][2].getCantMinutos()+" -+- "+estadisticas[4][3].getCantMinutos()+" -+- "+estadisticas[4][4].getCantMinutos()+" -+");
        System.out.println("+--- 6 ---+- "+estadisticas[5][0].getCantMinutos()+" -+- "+estadisticas[5][1].getCantMinutos()+" -+- "+estadisticas[5][2].getCantMinutos()+" -+- "+estadisticas[5][3].getCantMinutos()+" -+- "+estadisticas[5][4].getCantMinutos()+" -+");
        System.out.println("+--- 7 ---+- "+estadisticas[6][0].getCantMinutos()+" -+- "+estadisticas[6][1].getCantMinutos()+" -+- "+estadisticas[6][2].getCantMinutos()+" -+- "+estadisticas[6][3].getCantMinutos()+" -+- "+estadisticas[6][4].getCantMinutos()+" -+");
        System.out.println("+--- 8 ---+- "+estadisticas[7][0].getCantMinutos()+" -+- "+estadisticas[7][1].getCantMinutos()+" -+- "+estadisticas[7][2].getCantMinutos()+" -+- "+estadisticas[7][3].getCantMinutos()+" -+- "+estadisticas[7][4].getCantMinutos()+" -+");
        System.out.println("\n");
    }
}
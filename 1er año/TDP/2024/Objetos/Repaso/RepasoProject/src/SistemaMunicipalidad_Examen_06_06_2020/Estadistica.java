package SistemaMunicipalidad_Examen_06_06_2020;

public class Estadistica {
    private int cantVehiculos;
    private int cantMinutos;
    private int cantSoloConductor;
    
    public Estadistica() {
        setCantVehiculos(0);
        setCantMinutos(0);
        setCantSoloConductor(0);
    }

    public void setCantVehiculos(int cantVehiculos) {
        this.cantVehiculos = cantVehiculos;
    }
    
    public int getCantVehiculos() {
        return this.cantVehiculos;
    }

    public void setCantMinutos(int cantMinutos) {
        this.cantMinutos = cantMinutos;
    }
    
    public int getCantMinutos() {
        return this.cantMinutos;
    }
    
    public void incrementarMinutos(int minutos) {
        this.cantMinutos += minutos;
    }

    public void setCantSoloConductor(int cantSoloConductor) {
        this.cantSoloConductor = cantSoloConductor;
    }
    
    public void nuevoVehiculo(int minutos, boolean viajaSolo) {
        this.cantVehiculos++;
        incrementarMinutos(minutos);
        if(viajaSolo)
            this.cantSoloConductor++;
    }
}

package Sorteo;
import PaqueteLectura.GeneradorAleatorio;
public abstract class SorteoSolidario {
    
    private double valorP;
    private int cantBonos;
    private Persona [] bonos;
    
    public SorteoSolidario() {
        this.bonos = new Persona[100];
    }
    
    public double getValorP() {
        return valorP;
    }

    public void setValorP(double valorP) {
        this.valorP = valorP;
    }

    public int getCantBonos() {
        return cantBonos;
    }

    public void setCantBonos(int cantBonos) {
        this.cantBonos = cantBonos;
    }
    
    public Persona bonoDePersona(int nro) {
        if(nro < 100)
            return this.bonos[nro];
        else
            return null;
    }
    
    public boolean nroDisponible(int unNumero) {
        if(this.bonos[unNumero] == null)
            return true;
        else
            return false;
    }
    
    public boolean nroExiste(int unNumero) {
        if(this.bonos[unNumero] == null)
            return false;
        else
            return true;
    }
    
    public int agregarPersona(String nombre, int dni, double colab) {
        int nroBono = 0;
        if(cantBonos < 100) {
            nroBono = GeneradorAleatorio.generarInt(100);
            while(!nroDisponible(nroBono)) 
                nroBono = GeneradorAleatorio.generarInt(100);
            this.bonos[nroBono] = new Persona(nombre,dni,colab);
        }
        return nroBono;
    }
    
    public Persona obtenerPersona(int nroBono) {
        if(this.bonos[nroBono] == null)
            return null;
        else
            return this.bonos[nroBono];
    }
    
    public abstract Persona ejecutarSorteo();
}

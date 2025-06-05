/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Librería;

/**
 *
 * @author fededobal
 */
public class Libreria {
    private String nombre;
    private int nroV;
    private Caja [] cajas;

    public Libreria(String unNombre, int T) {
        this.nombre = unNombre;
        this.nroV = 0;
        this.cajas = new Caja[4];
        
        for(int i = 0; i < 4; i++)
            this.cajas[i] = new Caja(T);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNroV() {
        return nroV;
    }

    public void setNroV(int nroV) {
        this.nroV = nroV;
    }

    public void nuevoTicketDeCompra(int N, int dni, int cantL, double monto, String pago) {
        cajas[N].nuevoTicket(dni,cantL,monto,pago,this.nroV++);
    }
    
    public void marcarNoDisponible(int X) {
        for(int i = 0; i < 4; i++)
            if(this.cajas[i].isDisponible() && this.cajas[i].cantLibrosVendidos() < X)
                this.cajas[i].setDisponible(false);
    }
    
    public Ticket mejorTicket() {
        double max = -1;
        Ticket mejorT = null;
        for(int i = 0; i < 4; i++)
            if(this.cajas[i].ticketMasMonto().getMonto() > max)
                mejorT = this.cajas[i].ticketMasMonto();
        return mejorT;
    }
    
    public String toString() {
        String aux;
        aux = "----- Librería: " + this.nombre + "-----" + "\n";
        for(int i = 0; i < 4; i++) {
            aux += "- CAJA " + i;
            if(this.cajas[i].isDisponible())
                aux += ": DISPONIBLE \n";
            else
                aux += ": NO DISPONIBLE \n";
            
            aux += "TICKETS EMITIDOS: \n";
            aux += this.cajas[i].toString();
            aux += "\n";
        }
        return aux;    
    }
}

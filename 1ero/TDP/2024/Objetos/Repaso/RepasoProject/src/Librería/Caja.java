/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Librería;

/**
 *
 * @author fededobal
 */
public class Caja {
    private boolean disponible;
    private int cantT;
    private int T;
    private Ticket [] tickets;

    public Caja(int T) {
        this.disponible = true;
        this.cantT = 0;
        this.T = T;
        this.tickets = new Ticket[T];
        
    }

    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    public int getCantT() {
        return cantT;
    }

    public void setCantT(int cantT) {
        this.cantT = cantT;
    }
    
    public void nuevoTicket(int dni, int cantL, double monto, String pago, int nroV) {
        if(this.cantT < this.T)
            this.tickets[this.cantT++] = new Ticket(nroV,dni,cantL,monto,pago);
    }
    
    public int cantLibrosVendidos() {
        int aux = 0;
        for(int i = 0; i < this.cantT; i++)
            aux += this.tickets[i].getCantLibros();
        return aux;
    }
    
    public Ticket ticketMasMonto() {
        double max = -1;
        Ticket bestTicket = null;
        for(int i = 0; i < this.cantT; i++)
            if(this.tickets[i].getMonto() > max)
                bestTicket = this.tickets[i];
        return bestTicket;
    }
    
    public String toString() {
        String aux = "";
        for(int i = 0; i < this.cantT; i++) {
            aux += "[" + this.tickets[i].toString() + "]";
            aux += "\n";
        }
        return aux;
    }
}

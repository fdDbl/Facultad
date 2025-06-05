/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sorteo;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author fededobal
 */
public class SorteoAvanzado extends SorteoSolidario {
    
    public SorteoAvanzado(double valorPremio) {
        GeneradorAleatorio.iniciar();
        this.setValorP(valorPremio);
        this.setCantBonos(0);
    }
    
    public Persona ejecutarSorteo() {
        double max = -1;
        Persona ganador = null;
        for(int i = 0; i < 100; i++)
            if(this.bonoDePersona(i) != null && this.bonoDePersona(i).getColab() > max) {
                max = this.bonoDePersona(i).getColab();
                ganador = this.bonoDePersona(i);
            }
        return ganador;
    }
}

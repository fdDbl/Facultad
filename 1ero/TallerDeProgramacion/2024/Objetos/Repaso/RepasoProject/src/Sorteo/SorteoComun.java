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
public class SorteoComun extends SorteoSolidario {
    
    public SorteoComun(double valorPremio) {
        GeneradorAleatorio.iniciar();
        this.setValorP(valorPremio);
        this.setCantBonos(0);
    }
    
    public Persona ejecutarSorteo() {
        int nroGanador = GeneradorAleatorio.generarInt(100);
        while(!this.nroExiste(nroGanador))
            nroGanador = GeneradorAleatorio.generarInt(100);
        return this.bonoDePersona(nroGanador);
    }
}

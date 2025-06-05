/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Final12_02_2025;

/**
 *
 * @author Federico Dobal
 */
public class Empresa {
    private final int CANT_PISOS = 3;
    private final int CANT_OFICINAS_X_PISO = 10;
    private String nombre;
    private String direccion;
    private Oficina[][] pisos = new Oficina[CANT_PISOS][CANT_OFICINAS_X_PISO];

    public Empresa(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        for(int i=0; i<CANT_PISOS; i++) {
            for(int j=0; j<CANT_OFICINAS_X_PISO; j++) {
                this.pisos[i][j] = new Oficina();
            }
        }
    }
    
    public boolean nuevoAlquiler(String unNombre, int unDNI, double unMonto, int unPiso, int unaOficina) {
        unPiso--;
        unaOficina--;
        if(!this.pisos[unPiso][unaOficina].isAlquilada()) {
            this.pisos[unPiso][unaOficina].alquilar(unNombre, unDNI, unMonto);
            return true;
        } else {
            return false;
        }
    }
    
    public boolean liberarOficina(int unDNI) {
        int i=0;
        boolean liberada = false;
        while(i < CANT_PISOS && !liberada) {
            int j=0;
            while(j < CANT_OFICINAS_X_PISO && !liberada) {
                liberada = (this.pisos[i][j].isAlquilada() && this.pisos[i][j].dniDePersonaAlquilando() == unDNI);
                j++;
            }
            i++;
        }
        return liberada;
    }
    
    public void incrementarAlquileres() {
        for(int i=0; i<CANT_PISOS; i++) 
            for(int j=0; j<CANT_OFICINAS_X_PISO; j++) {
                if(this.pisos[i][j].isAlquilada())
                    this.pisos[i][j].incrementarMonto((i+1)*5);
            }
    }
    
    public int cantOficinasAlquiladasEnPiso(int unPiso) {
        int suma = 0;
        unPiso--;
        for(int i=0; i<CANT_OFICINAS_X_PISO; i++) {
            if(this.pisos[unPiso][i].isAlquilada())
                suma++;
        }
        return suma;
    }
}

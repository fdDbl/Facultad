/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Hospital;
/**
 *
 * @author Federico Dobal
 */
public class Hospital {
    private String nombre, direccion;
    private Cama [][] pisos;
    
    public Hospital(String unNombre, String unaDireccion) {
        this.nombre = unNombre;
        this.direccion = unaDireccion;
        this.pisos = new Cama[10][20];
        
        int id = 1;
        for(int i=0; i < 10; i++)
            for(int j=0; j < 20; j++)
                this.pisos[i][j] = new Cama(id++);
    }
    
    public void ingresarPaciente(int dni, String nombre, String obraSocial, int nroPiso, int nroCama) {
        Cama C = this.pisos[nroPiso][nroCama];
        if(C.isOcupada())
            System.out.println("Cama ocupada");
        else {
            C.nuevoPaciente(dni,nombre,obraSocial);
            C.setOcupada(true);
            System.out.println("El paciente llamado " + nombre + " ha sido ingresado al hospital. \n");
        }
    }
    
    public void darDeAlta(int dni) {
        boolean encontre = false;
        for(int i = 0; i < 10 && !encontre; i++)
            for(int j = 0; j < 20 && !encontre; j++) {
                Cama C = this.pisos[i][j];
                if(C.checkDni(dni) == true) {
                    encontre = true;
                    System.out.println("Paciente con DNI " + dni + " dado efectivamente de alta. \n");
                }
            }
    }
    
    public void incrementarDiasOcupacionDeTodos() {
        for(int i = 0; i < 10; i++)
            for(int j = 0; j < 20; j++) {
                Cama C = this.pisos[i][j];
                if(C.isOcupada()) {
                    int dias = C.getDiasUltimoPaciente();
                    C.setDiasUltimoPaciente(dias++);
                }
            }
    }
    
    public int cantidadPisosLlenos() {
        int aux = 0;
        for(int i = 0; i < 10; i++) {
            int camasOcupadas = 0;
            for(int j = 0; j < 20; j++) {
                Cama C = this.pisos[i][j];
                if(C.isOcupada())
                    camasOcupadas++;
            }
            if(camasOcupadas == 20)
                aux++;
        }
        return aux;
    }
}

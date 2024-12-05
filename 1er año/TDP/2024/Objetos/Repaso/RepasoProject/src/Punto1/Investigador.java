/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Punto1;

/**
 *
 * @author fededobal
 */
public class Investigador {
    private String nombre, especialidad;
    private int categoria, cantSubsidios;
    private Subsidio [] subs;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.especialidad = especialidad;
        this.categoria = categoria;
        this.cantSubsidios = 0;
        this.subs = new Subsidio[5];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categroria) {
        this.categoria = categroria;
    }

    public int getCantSubsidios() {
        return cantSubsidios;
    }
    
    public void agregarSubsidios(Subsidio unSubsidio) {
        if(this.cantSubsidios < 5)
            this.subs[this.cantSubsidios++] = unSubsidio;
    }
    
    public double dineroTotalOtorgado() {
        int i = 0;
        double auxReturn = 0;
        while(i<this.cantSubsidios && this.subs[i].isOtorgado()) {
            auxReturn =+ this.subs[i].getMonto();
            i++;
        }
        return auxReturn;
    }
    
    public void otorgarSubsidios() {
        for(int i = 0; i < this.cantSubsidios; i++)
            if(!this.subs[i].isOtorgado())
                this.subs[i].setOtorgado(true);
    }

    @Override
    public String toString() {
        return "Investigador{" + "Nombre=" + this.nombre + ", Especialidad=" + this.especialidad + ", Categoria=" + this.categoria + ", Cantidad de subsidios=" + this.cantSubsidios + ", Total de dinero otorgado=" + this.dineroTotalOtorgado() + '}';
    }
}

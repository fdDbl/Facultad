/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Punto1;

/**
 *
 * @author fededobal
 */
public class Proyecto {
    private String nombre, nomDirector;
    private int codigo, cantInv;
    private Investigador [] inv;

    public Proyecto(String nombre, int codigo, String nomDirector) {
        this.nombre = nombre;
        this.nomDirector = nomDirector;
        this.codigo = codigo;
        this.cantInv = 0;
        this.inv = new Investigador[50];
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNomDirector() {
        return nomDirector;
    }

    public void setNomDirector(String nomDirector) {
        this.nomDirector = nomDirector;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCantInv() {
        return cantInv;
    }
    
    public void agregarInvestigador(Investigador unInvestigador) {
        if(this.cantInv < 50)
            this.inv[this.cantInv++] = unInvestigador;
    }
    
    public double DineroTotalOtorgado() {
        double auxReturn = 0;
        for(int i = 0; i<this.cantInv; i++) {
            auxReturn =+ this.inv[i].dineroTotalOtorgado();
            i++;
        }
        return auxReturn;
    }
    
    public void otorgarTodos(String unNombreCompleto) {
        int i = 0;
        while(i < this.cantInv && !(this.inv[i].getNombre().equals(unNombreCompleto)))
            i++;
        if(i < this.cantInv)
            this.inv[i].otorgarSubsidios();
    }

    @Override
    public String toString() {
        String auxReturn = "Nombre del proyecto: " + this.nombre +
               " - Codigo del proyecto: " + this.codigo +
               " - Director del proyecto: " + this.nomDirector +
               " - Total de dinero otorgado: " + this.DineroTotalOtorgado() +
               "\n";
        for(int i = 0; i < this.cantInv; i++)
            auxReturn += this.inv[i].toString() + "\n";
        
        return auxReturn;
    }
    
    
}

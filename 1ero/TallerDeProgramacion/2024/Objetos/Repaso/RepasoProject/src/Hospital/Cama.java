/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Hospital;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Federico Dobal
 */
public class Cama {
    private int id;
    private boolean ocupada;
    private int diasUltimoPaciente;
    private Paciente paciente;
    
    public Cama(int unId) {
        this.id = unId;
        this.ocupada = false;
    }
    
    public void nuevoPaciente(int dni, String nombre, String obraSocial) {
        this.paciente = new Paciente(dni,nombre,obraSocial);
        GeneradorAleatorio.iniciar();
        this.diasUltimoPaciente = GeneradorAleatorio.generarInt(30);
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public int getDiasUltimoPaciente() {
        return diasUltimoPaciente;
    }

    public void setDiasUltimoPaciente(int diasUltimoPaciente) {
        this.diasUltimoPaciente = diasUltimoPaciente;
    }
    
    public boolean checkDni(int dni) {
        if(this.paciente != null && this.paciente.getDni() == dni)
            return true;
        else
            return false;
    }
}

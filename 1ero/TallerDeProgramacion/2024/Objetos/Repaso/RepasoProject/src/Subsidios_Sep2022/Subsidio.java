/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Subsidios_Sep2022;

/**
 *
 * @author Federico Dobal
 */
public abstract class Subsidio {
    private String nombreInvestigador;
    private String planTrabajo;
    private Fecha fechaSolicitud;

    public Subsidio(String nombreInvestigador, String planTrabajo, Fecha fechaSolicitud) {
        this.nombreInvestigador = nombreInvestigador;
        this.planTrabajo = planTrabajo;
        this.fechaSolicitud = fechaSolicitud;
    }

    @Override
    public String toString() {
        return "nombreInvestigador: " + getNombreInvestigador() + ", planTrabajo: " + getPlanTrabajo() + ", fechaSolicitud: " + getFechaSolicitud() + '}';
    }
    
    
    
    public String getNombreInvestigador() {
        return nombreInvestigador;
    }

    public String getPlanTrabajo() {
        return planTrabajo;
    }

    public String getFechaSolicitud() {
        return fechaSolicitud.toString();
    }
    
}

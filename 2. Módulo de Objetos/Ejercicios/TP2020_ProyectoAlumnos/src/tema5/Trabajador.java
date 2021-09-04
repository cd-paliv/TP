/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

import tema2.Persona;

/**
 *
 * @author paliv
 */
public class Trabajador extends Persona{
    private String tarea;
    
    public Trabajador(String unNombre, int unDNI, int unaEdad, String tarea){
        super (unNombre, unDNI, unaEdad);
        this.tarea = tarea;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }
    
    public String toString(){
        String aux = super.toString() +
                     " - Soy: " + getTarea();
        return aux;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author paliv
 */
public class Jugador extends Empleado{
    private int partidos;
    private int goles;
    
    public Jugador (String nombre, double sueldo, int partidos, int goles){
        super (nombre, sueldo);
        this.partidos=partidos;
        this.goles=goles;
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double promedio = getGoles()/getPartidos();
        double aux;
        if (promedio < 0.5)
            aux = this.getSueldo();
        else
            aux = this.getSueldo()*2;
        
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() +
                     " - Partidos jugados: " + getPartidos() +
                     " - Goles anotados: " + getGoles();
        return aux;
    }
}

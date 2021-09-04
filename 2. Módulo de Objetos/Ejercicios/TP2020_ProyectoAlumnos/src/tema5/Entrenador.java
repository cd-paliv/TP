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
public class Entrenador extends Empleado{
    private int campeonatosGanados;
    
    public Entrenador(String nombre, double sueldo, int campeonatosGanados){
        super (nombre, sueldo);
        this.campeonatosGanados=campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double aux;
        if (getCampeonatosGanados()<5){
            aux = this.getSueldo() + 5000;
        }else if (getCampeonatosGanados()<11){
            aux = this.getSueldo() + 30000;
        }else{
            aux = this.getSueldo() + 50000;
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() +
                     " - Cantidad de campeonatos ganados: " + getCampeonatosGanados();
        return aux;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
3. Definir una clase para representar ​entrenadores de un club de fútbol. Un ​entrenador
se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados. 
 ▪Defina métodos para obtener/modificar el valor de cada atributo. 
 ▪Defina el método ​calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por el 
entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por 
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha ganado 
entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).  

Parte 2. Ej 2. ​Defina un constructor para la clase Entrenador (definida en la Act. 3) que reciba los 
datos necesarios (nombre, sueldo básico, cantidad de campeonatos ganados). Además 
defina un constructor nulo.  
* 
 * @author paliv
 */
public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int cantCampeonatosGanados;
    
    public String getNombre(){
        return nombre;
    }
    
    public double getSueldoBasico(){
        return sueldoBasico;
    }
    
    public int getCantidadDeCampeonatos(){
        return cantCampeonatosGanados;
    }
    
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    public void setSueldoBasico(double unSueldo){
        sueldoBasico=unSueldo;
    }
    
    public void setCantidadDeCampeonatos(int unaCantidad){
        cantCampeonatosGanados=unaCantidad;
    }
    
    public double calcularSueldoACobrar(){
        if (cantCampeonatosGanados<5){
            sueldoBasico = sueldoBasico + 5000;
        }else if (cantCampeonatosGanados<11){
            sueldoBasico = sueldoBasico + 30000;
        }else{
            sueldoBasico = sueldoBasico + 50000;
        }
        return sueldoBasico;
    }
    
    public Entrenador(String unNombre, double unSueldo, int cantCampeonatos){
        nombre=unNombre;
        sueldoBasico=unSueldo;
        cantCampeonatosGanados=cantCampeonatos;
    }
    
    public Entrenador(){
        
    }
    
    @Override
    public String toString(){
        String aux;
        aux= "El entrenador "+nombre+" debe cobrar "+sueldoBasico+". Ganó "+cantCampeonatosGanados+" campeonatos.";
        return aux;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

/**
3. Realizar un programa principal que instancie un ​entrenador,cargándole datos leídos desde 
teclado. Pruebe el correcto funcionamiento de cada método implementado. 

 * @author paliv
 */
public class EntrenadorEj {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        /*
        Entrenador e = new Entrenador();
        System.out.println("Ingrese nombre");
        e.setNombre(GeneradorAleatorio.generarString(5));
        System.out.println("Ingrese sueldo básico");
        e.setSueldoBasico(GeneradorAleatorio.generarDouble(50000));
        System.out.println("Ingrese cantidad de campeonatos ganados");
        e.setCantidadDeCampeonatos(GeneradorAleatorio.generarInt(20));
        
        System.out.print("Entrenador "+e.getNombre());
        System.out.print(". Sueldo a cobrar: $"+e.calcularSueldoACobrar()+" por ganar "+e.getCantidadDeCampeonatos()+" campeonatos.");
        System.out.println();
        */
        
        System.out.println("Ingrese nombre, sueldo básico y cantidad de campeonatos ganados");
        Entrenador e = new Entrenador("Jorge", 50000, 30);
        System.out.println(e.toString());
        
        Entrenador e2 = new Entrenador(); //nulo
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

import PaqueteLectura.Lector;

/**
Escriba un programa principal que instancie un ​jugador y un ​entrenador con datos 
leídos desde teclado. Pruebe el correcto funcionamiento de cada método implementado.

 * @author paliv
 */
public class Ej02Empleado {
    public static void main(String[] args) {
        Empleado [] e = new Empleado[2];
        
        System.out.println("Jugador");
        System.out.println("Ingresar nombre");
        String nombre = Lector.leerString();
        System.out.println("Ingresar sueldo básico");
        double sueldo = Lector.leerDouble();
        System.out.println("Ingresar cantidad de partidos jugados");
        int partidos = Lector.leerInt();
        System.out.println("Ingresar cantidad de goles anotados");
        int goles = Lector.leerInt();
        e[0] = new Jugador(nombre, sueldo, partidos, goles);
        
        System.out.println("Entrenador");
        System.out.println("Ingresar nombre");
        nombre = Lector.leerString();
        System.out.println("Ingresar sueldo básico");
        sueldo = Lector.leerDouble();
        System.out.println("Ingrese cantidad de campeonatos ganados");
        int campeonatos = Lector.leerInt();
        e[1] = new Entrenador(nombre, sueldo, campeonatos);
        
        for (int i=0; i<2; i++)
            System.out.println(e[i].toString());
    }
}

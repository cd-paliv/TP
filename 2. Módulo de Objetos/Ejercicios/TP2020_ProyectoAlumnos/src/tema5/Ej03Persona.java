/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

import PaqueteLectura.Lector;

/**
 ​Genere un programa que instancie una persona y un trabajador con datos leídos de 
teclado y muestre la representación de cada uno en consola.  

 * @author paliv
 */
public class Ej03Persona {
    public static void main(String[] args) {
        //Persona
        System.out.println("Ingrese nombre");
        String nombre = Lector.leerString();
        System.out.println("Ingrese DNI");
        int DNI = Lector.leerInt();
        System.out.println("Ingrese edad");
        int edad = Lector.leerInt();
        Persona p = new Persona(nombre, DNI, edad);
        
        //Trabajador
        System.out.println("Ingrese nombre");
        nombre = Lector.leerString();
        System.out.println("Ingrese DNI");
        DNI = Lector.leerInt();
        System.out.println("Ingrese edad");
        edad = Lector.leerInt();
        System.out.println("Ingrese trabajo a realizar");
        String tx = Lector.leerString();
        Trabajador t = new Trabajador(nombre, DNI, edad, tx);
        
        System.out.println(p.toString());
        System.out.println(t.toString());
    }
}

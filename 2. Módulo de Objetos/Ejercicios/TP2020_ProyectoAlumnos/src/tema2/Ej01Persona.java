/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;



/**
Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego 
muestre en consola la representación de ese objeto en formato String.
 * @author paliv
 */
public class Ej01Persona {
    public static void main(String[] args) {
        //Ingreso datos
        System.out.println("Ingrese nombre, DNI y edad");
        Persona p = new Persona(Lector.leerString(),Lector.leerInt(),Lector.leerInt()); //PUEDO PASARLE LOS PARAMETROS DE UNA SIN HACER VARIABLES

        /*
        //PERO DE ESTA FORMA TIENE VENTAJAS PORQUE LEE DATOS EN ORDEN
        System.out.println("Ingrese nombre");
        p.setNombre (Lector.leerString());
        System.out.println("Ingrese DNI");
        p.setDNI (Lector.leerInt());
        System.out.println("Ingrese edad");
        p.setEdad(Lector.leerInt());
        */
        
        //Muestro en consola
        System.out.println(p); //SI ESTÁ DEFINIDO EL toString EL OBJETO LO BUSCA SOLO, SI NO ESTA DEFINIDO PUEDE DAR ERROR
    }
}

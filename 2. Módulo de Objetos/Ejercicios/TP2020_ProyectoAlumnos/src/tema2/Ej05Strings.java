/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author paliv
 */
public class Ej05Strings {
    public static void main(String[] args) {
        String [] vector = new String [10];
        int i;
        for (i=0; i<10; i++){
            System.out.println("Ingrese string");
            //String palabra = Lector.leerString();
            vector[i] = Lector.leerString();
        }
        
        System.out.println();
        
        for (i=0; i<10; i++)
            System.out.print(vector[i].charAt(0));
        System.out.println();
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
/**
 ​Realice un programa que genere aleatoriamente números (patentes) hasta el 0, por 
cada una debe informar en consola si el auto tiene o no permitido el paso (solo pasan los 
autos con patentes de números pares)
 * @author paliv
 */
public class TeoriaEj01EstacionamientoPar {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Auto a= new Auto();
        a.setPatente(GeneradorAleatorio.generarInt(100));
        
        while (a.getPatente() != 0){
            if (a.getPatente() %2 == 0)
                System.out.println("Pasa");
            else
                System.out.println("No pasa");
            a.setPatente(GeneradorAleatorio.generarInt(100));
        }
        
    }
}

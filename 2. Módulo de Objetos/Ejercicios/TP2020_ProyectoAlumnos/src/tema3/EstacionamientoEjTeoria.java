/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import tema1.Auto;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author paliv
 */
public class EstacionamientoEjTeoria {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Estacionamiento e = new Estacionamiento();
        e.setEstacionamiento(GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarInt(500)); //genero estacionamiento
        
        Auto a = new Auto();
        a.setPatente(GeneradorAleatorio.generarInt(50));
        while (a.getPatente() != 0){ //cargo autos en la posicion que quiero en el estacionamiento
            a.setDueño(GeneradorAleatorio.generarString(5));
            e.setPosicion(a, (GeneradorAleatorio.generarInt(5)+1), (GeneradorAleatorio.generarInt(10)+1));
            a.setPatente(GeneradorAleatorio.generarInt(50));
        }
        
        System.out.println(e.toStringEstacionamiento());
        System.out.println("Ingrese patente a buscar");
        System.out.println(e.getPosicion(Lector.leerInt()));
        
    }
}
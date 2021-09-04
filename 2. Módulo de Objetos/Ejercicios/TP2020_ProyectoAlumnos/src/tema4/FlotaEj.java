/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import PaqueteLectura.Lector;

/**
 Genere un programa que cree una flota vacía. Cargue micros (sin pasajeros) a la flota 
con información leída desde teclado (hasta que se ingresa la patente “ZZZ000” o hasta 
completar la flota). Luego lea una patente y elimine de la flota el micro con esa patente; 
busque el micro con dicha patente para comprobar que ya no está en la flota. Para 
finalizar, lea un destino e informe la patente del micro que va a dicho destino. 

 * @author paliv
 */
public class FlotaEj {
    public static void main(String[] args) {
        Flota f = new Flota();
        
        System.out.println("Ingrese patente");
        String patente = Lector.leerString();
        while ((!patente.equals("ZZZ000")) && (!f.estaCompleta())){
            System.out.println("Ingrese destino y hora de salida");
            Micro m = new Micro (patente, Lector.leerString(), Lector.leerString()); //es como hacer un nuevo nodo
            
            f.setMicro(m);
            System.out.println("Ingrese patente");
            patente = Lector.leerString();
        }
        
        //elimino patente y me fijo si se eliminó o no
        System.out.println("Ingrese patente a eliminar");
        patente=Lector.leerString();
        f.eliminarPatente(patente);
        System.out.print("Se eliminó el micro? ");
        if (f.buscarPatente(patente) == null)
            System.out.println("Si.");
        else
            System.out.println("No.");
        
        //busco si hay algun micro que vaya al destino ingresado
        System.out.println("Ingrese destino para buscar patente");
        String destino = Lector.leerString();
        Micro mi = f.buscarDestino(destino); //preguntar si esto es legal
        if (mi != null)
            System.out.println("Patente del micro con destino "+destino+": "+mi.getPatente());
        else
            System.out.println("No existe un micro con destino a "+destino);
    }
}

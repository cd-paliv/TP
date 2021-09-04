/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import PaqueteLectura.Lector;

/**
B- ​Realice un programa que cree un micro con patente “ABC123”, destino “Mar del Plata” y 
hora de salida 5:00. Cargue pasajeros al micro de la siguiente manera. Leer nros. de 
asientos desde teclado que corresponden a pedidos de personas. La lectura finaliza cuando 
se ingresa el nro. de asiento -1 o cuando se llenó el micro. Para cada nro. de asiento leído 
debe: validar el nro; en caso que esté libre, ocuparlo e informar a la persona el éxito de la 
operación; en caso que esté ocupado informar a la persona la situación y mostrar el nro. 
del primer asiento libre.  Al finalizar, informe la cantidad de asientos ocupados del micro. 

 * @author paliv
 */
public class MicroEj {
    public static void main(String[] args) {
        System.out.println("Ingrese patente, destino y hora de salida");
        Micro m = new Micro(Lector.leerString(), Lector.leerString(), Lector.leerString());
        
        System.out.println("Ingrese numero de asiento");
        int asiento = Lector.leerInt();
        while ((asiento != -1) && m.estaLlenoElMicro()){
            if (m.validacionAsiento(asiento)){
                if (!m.getEstadoAsiento(asiento)){
                    m.setAsiento(asiento);
                    System.out.println("Operación exitosa");   
                }else{
                    System.out.println("Operación fallida, asiento ocupado");
                    System.out.println("Primer asiento libre: "+m.getPrimerAsientoLibre());
                }
            }else{
                System.out.println("Operación fallida, asiento invalido");
            }
            System.out.println("Ingrese numero de asiento");
            asiento = Lector.leerInt();
        }
        
        System.out.println("Cantidad de asientos ocupados del micro: "+m.getOcupados());
    }
}

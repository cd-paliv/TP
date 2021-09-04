/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

import PaqueteLectura.Lector;

/**
 ​Realice un programa que instancie una urna electoral para la mesa “203” con 5 listas y una urna de 
referéndum para la mesa “203”. Luego, lea DNIs de personas que llegan a votar a la mesa, hasta que se 
ingresa el DNI 0. Cada persona vota en ambas urnas de la siguiente manera. Para la urna electoral, la persona 
ingresa un nro. “N”: si “N” corresponde a una lista válida se debe votar por la lista “N” y en caso contrario se 
debe votar en blanco. Para la urna de referéndum, la persona ingresa un número “M”: si “M” es positivo se 
debe votar a favor, si es negativo se debe votar en contra, y si es 0 debe votar en blanco. Al finalizar la 
votación, calcular la opción ganadora en ambas urnas y mostrar el resultado en consola. Además mostrar 
para cada urna el porcentaje de votos que obtuvo la opción ganadora respecto al total de votos. 

 * @author paliv
 */
public class EjUrna {
    public static void main(String[] args) {
        UrnaElectoral urnaE = new UrnaElectoral(203, 5);
        UrnaReferendum urnaR = new UrnaReferendum(203);
        
        System.out.println("Ingrese DNI");
        int DNI = Lector.leerInt();
        
        while (DNI != 0){
            //electoral
            System.out.println("Voto electoral -> Ingrese nro lista");
            int N = Lector.leerInt();
            if (urnaE.validarNumeroDeLista(N))
                urnaE.votarPorLista(N);
            else
                urnaE.votarEnBlanco();
            
            //referendum
            System.out.println("Voto referendum -> Ingrese nro: +/-/0");
            int M = Lector.leerInt();
            if (M > 0)
                urnaR.votarAFavor();
            else
                if (M < 0)
                    urnaR.votarEnContra();
                else
                    urnaR.votarEnBlanco();
            
            System.out.println("Ingrese DNI");
            DNI = Lector.leerInt();
        }
        
        //informo resultados
        System.out.println("\n --------------------------------------- \n Urna Electoral \n --------------------------------------- \n");
        int ganador = urnaE.calcularGanador();
        int totalVotos= urnaE.calcularTotalVotos();
        int votosGanador = urnaE.devolverVotosPorLista(ganador);
        
        double porcentaje = 0;
        if (totalVotos >0)
            porcentaje = (votosGanador*100)/totalVotos;
        
        System.out.println("Ganador: "+ganador);
        System.out.println("Porcentaje: %"+porcentaje);
    }
}

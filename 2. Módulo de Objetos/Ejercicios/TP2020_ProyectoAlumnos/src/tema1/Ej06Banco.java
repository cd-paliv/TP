package tema1;

import PaqueteLectura.Lector;

/**
Escriba un programa que simule el ingreso de personas a un banco. Cada 
persona que ingresa indica la operación que desea realizar (0: “cobro de cheque” 1: 
“depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de 
jubilación” 4: “cobro de planes”). La recepción de personas culmina cuando un 
empleado ingresa la  operación 5 (cierre del banco). Informar la cantidad de 
personas atendidas por cada operación y la operación más solicitada.  

 * @author paliv
 */
public class Ej06Banco {
    public static void main(String[] args) {
        //1. crear vector contador
        int [] vector = new int[5]; //de 0 a 4
        
        //2. inicializo vector en 0 para sumar.
        int i;
        for (i=0; i<5; i++)
            vector[i]=0;
        
        //3. cargo datos
        int operacion;
        System.out.println("Ingrese operacion de 0 a 4");
        operacion = Lector.leerInt();
        while (operacion<5){
            vector[operacion]=vector[operacion] +1;
            System.out.println("Ingrese operacion de 0 a 4");
            operacion = Lector.leerInt();
        }
        
        //4. informo la cantidad de personas atendidas por cada operación y calculo e informo max
        int op=-1,maxValor=-1;
        for (i=0; i<5; i++){
            System.out.println("|Operacion: "+i+"| Cantidad de personas atendidas "+vector[i]);
            if (maxValor<vector[i]){
                op=i;
                maxValor=vector[i];
            }
        }
        System.out.println("| Operacion mas solicitada "+op);
        
        
        
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

/**
 a) Utilizando la clase Auto dada por la cátedra. Un objeto auto se crea sin valores 
iniciales. Modifique el ejercicio 2 para almacenar en la estructura de datos el auto que ocupa cada 
plaza. 
b) A partir de la estructura de autos, informar para cada número de piso y número de 
plaza ocupado, la representación del auto que la ocupa.  
 

 * @author paliv
 */
public class TeoriaEj03EstacionamientoAuto {
    public static void main(String[] args) {
        Auto [][] matriz = new Auto[5][10];
        
        //inicializo matriz
        int i,j;
        for (i=0;i<5;i++) //filas
            for(j=0;j<10;j++) //columnas
                matriz[i][j] = null; //vacío
        
        
        //Ingreso datos y marco como ocupado el lugar
        GeneradorAleatorio.iniciar();
        int piso, plaza, p = GeneradorAleatorio.generarInt(100);
        //System.out.println("Ingreso de datos - 0 para finalizar");
        while (p != 0){
            Auto a= new Auto();
            a.setPatente(p);
            a.setDueño("X");
            
            //System.out.println("Ingrese piso (0-4)");
            piso = GeneradorAleatorio.generarInt(5);  //Lector.leerInt(5);
            //System.out.println("Ingrese plaza (0-9)");
            plaza = GeneradorAleatorio.generarInt(10); //Lector.leerInt(10);
            
            matriz [piso][plaza] = a;
            p = GeneradorAleatorio.generarInt(100);
            
        }
        
        //mostrar el contenido de la matriz en consola para chequear
        System.out.println("Elementos de la matriz: ");
        for (i=0; i<5; i++) {
            System.out.print(i+": ");
            for (j=0; j<10; j++) {
                if (matriz[i][j] != null)
                System.out.print(matriz[i][j].toString()+ "| ");
        }
        System.out.println();
        }
        
        //calculo maximo
        int cantPiso, maxPiso=0, max=-1;
        for (i=0;i<5;i++){ //filas
            cantPiso=0;
            for(j=0;j<10;j++)
                if (matriz [i][j] != null)
                    cantPiso = cantPiso + 1;
            if (max<cantPiso){
                max=cantPiso;
                maxPiso=i;
            }
        }
        System.out.println(" ");
        System.out.println("El piso "+maxPiso+" es el mas ocupado con "+max+" autos estacionados");
    }
}

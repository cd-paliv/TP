/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
   a) Realice un nuevo programa considerando que ahora el estacionamiento está 
dividido en 5 pisos y cada piso tiene 10 plazas. Por cada patente generada, debe 
ingresar por teclado el número de piso y número de plaza donde debe estacionar el 
auto, debiendo marcar ese lugar como ocupado en una estructura de datos adecuada. 
Nota: considere que el lugar ingresado (número de piso, número de plaza) está 
desocupado y dichos números son válidos. 
   b)​ Informe cuál es el piso más ocupado. 

 * @author paliv
 */
public class TeoriaEj02EstacionamientoBoolean {
    public static void main(String[] args) {
        boolean [][] matriz = new boolean[5][10];
        
        //desocupo todos los lugares (inicializo estacionamiento)
        int i,j;
        for (i=0;i<5;i++) //filas
            for(j=0;j<10;j++) //columnas
                matriz[i][j] = false; //no hay autos en ningun lugar
        
        GeneradorAleatorio.iniciar();
        
        //Ingreso datos y marco como ocupado el lugar
        int piso, plaza, p = GeneradorAleatorio.generarInt(100);
        //System.out.println("Ingreso de datos - 0 para finalizar");
        while (p != 0){
            
            Auto a= new Auto();
            a.setPatente(p);
            a.setDueño("Un dueño");
            
            //System.out.println("Ingrese piso (0-4)");
            piso = GeneradorAleatorio.generarInt(5);  //Lector.leerInt(5);
            //System.out.println("Ingrese plaza (0-9)");
            plaza = GeneradorAleatorio.generarInt(10); //Lector.leerInt(10);
            
            matriz [piso][plaza] = true;
            
            p = GeneradorAleatorio.generarInt(100);
            
        }
        
        
        //mostrar el contenido de la matriz en consola para chequear
        System.out.println("Elementos de la matriz: ");
        for (i=0; i<5; i++) {
            for (j=0; j<10; j++) {
                System.out.print(matriz[i][j] + " ");
        }
        System.out.println();
        }
        
        
        //calculo maximo
        int cantPiso, maxPiso=-1, max=-1;
        for (i=0;i<5;i++){ //filas
            cantPiso=0;
            for(j=0;j<10;j++)
                if (matriz [i][j]==true)
                    cantPiso = cantPiso + 1;
            if (max<cantPiso){
                max=cantPiso;
                maxPiso=i;
            }
        }
        System.out.println("El piso "+maxPiso+" es el mas ocupado con "+max+" autos estacionados");
        
    }
}

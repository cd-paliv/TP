/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/* Escriba un programa que defina una matriz de enteros de tamaño 10x10. 
Inicialice la matriz con números aleatorios entre 0 y 200  */

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej04Matrices {

    public static void main(String[] args) {
    
    GeneradorAleatorio.iniciar();
    
    //1. definir la matriz de enteros de tamaño 10x10 e iniciarla con números aleatorios entre 0 y 200 
    int [][] matriz = new int[10][10];
    int i,j;
    
    for (i=0;i<10;i++) //filas
        for(j=0;j<10;j++) //columnas
            matriz[i][j] = GeneradorAleatorio.generarInt(201);
    
    
    //2. mostrar el contenido de la matriz en consola
    System.out.println("Elementos de la matriz: ");
    for (i=0; i<10; i++) {
      for (j=0; j<10; j++) {
        System.out.print(matriz[i][j] + " ");
      }
      System.out.println();
    }
    
    
    //3. calcular e informar la suma de todos los elementos almacenados entre las filas 2 y 9 y las columnas 0 y 3
    int suma=0;
    for (i=2;i<10;i++) //filas 2 a 9
        for(j=0;j<4;j++) //columnas 0 a 3
            suma = suma + matriz[i][j];
    System.out.println("La suma entre las fila 2a9 y las columnas 0a3 es: " + suma);
    
    
    //4. generar un vector de 10 posiciones donde cada posición i contiene la suma de la columna i de la matriz 
    int [] vector = new int[10];
    suma=0;
    for (i=0; i<10; i++){ //recorro vector
        for(j=0;j<10;j++)
            suma = suma + matriz[i][j];
        vector[i]=suma;
    }
    
    System.out.println("Elementos del vector: "); //IMPRIMO VECTOR
    for (i=0; i<10; i++)
        System.out.print (vector[i] + " ");
    
    /*5. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
                    y en caso contrario imprima "No se encontró el elemento". */
    int posFila=-1, posColumna=-1;
    System.out.println(" ");
    System.out.println("Ingrese numero entre 0 y 200");
    int numero = Lector.leerInt();
    boolean encontre=false;
    i=0;
    while ( (!encontre) && i<10){
        j=0;
        while ( (!encontre) && i<10 && j<10){
            if (matriz[i][j]==numero){
                encontre=true;
                posFila=i;
                posColumna=j;
            }
            j++;
        }
        i++;
    }

    if (encontre)
        System.out.println("El elemento se encuentra en la fila "+posFila+" columna "+posColumna);
    else
        System.out.println("No se encontró el elemento");
    }
}

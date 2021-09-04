/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;


/**
Escriba un programa que imprima en consola el factorial de todos los números 
entre 1 y 9. ¿Qué modificación debe hacer para imprimir el factorial de los 
números impares solamente? 

 * @author paliv
 */
public class Ej02FactorialImpar {
    public static void main(String[] args) {
        int i,j;
        System.out.println("IMPARES");
        for (i=1; i<10; i=i+2){
            System.out.println("El factorial de "+i+" es: "+factorial(i));
        }
    }
    
    public static int factorial (int num){
        int resultado = 1;
        for (int i=1; i<=num; i++)
            resultado = resultado * i;
        return resultado;
    }
    
}
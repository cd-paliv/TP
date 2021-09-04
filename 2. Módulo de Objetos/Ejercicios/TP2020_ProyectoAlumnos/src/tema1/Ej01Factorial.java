/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/* Escriba un programa que imprima en consola el factorial de un número N 
(ingresado por teclado, N > 0).  Ejemplo: para N=5 debería imprimir 5! = 120 */

import PaqueteLectura.Lector;
/**
 *
 * @author paliv
 */
public class Ej01Factorial {
    public static void main(String[] args) {
        System.out.println("Ingrese numero");
        int i,num = Lector.leerInt();
        System.out.print("El factorial de "+num);
        if (num==0)
            num=1;
        else
            for (i=num-1; i>0; i--)
                num = num * i;
        System.out.println(" es: "+num);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author paliv
 */
public class QueImprime {
    public static void main(String[] args) {
        ClaseC objC=new ClaseC(); 
        System.out.println(objC.cinco()); //cuando llama this.x implementa el POLIMORFISMO, llama al this de ClaseC, después busca en B y último en A
        System.out.println(objC.uno()); 
    }
}


package tema1;

/**
Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. Realice 
un programa que permita informar la cantidad de personas que concurrieron a 
cada oficina de cada piso. Para esto, simule la llegada de personas al edificio de la 
siguiente manera: a cada persona se le pide el nro. de piso y nro. de oficina a la cual 
quiere concurrir. La llegada de personas finaliza al indicar un nro. de piso 9. Al 
finalizar la llegada de personas, informe lo pedido.
 * @author paliv
 */

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej05Edificio {
    public static void main(String[] args) {
        //Paso 2: Declarar la variable matriz de 8 filas 4 columnas
        int [][] matriz = new int[8][4];
        
        //Paso 3: Inicializo matriz en cero para sumar.
        int i,j;
        for (i=0;i<8;i++) //filas - piso
            for(j=0;j<4;j++) //columnas - oficina
                matriz[i][j] = 0;
        
        //Paso 4: Pedir datos a personas hasta leer piso 9.
        int oficina=-1;
        System.out.println("Ingrese piso de 0 a 7 [9 para terminar ingreso de datos]");
        int piso = Lector.leerInt();
        while (piso != 9 && piso<8 && oficina<4){
            System.out.println("Ingrese oficina (de 0 a 3)");
            oficina = Lector.leerInt();
            matriz[piso][oficina]=matriz[piso][oficina] + 1;
            System.out.println("Ingrese piso [9 para terminar ingreso de datos]");
            piso = Lector.leerInt();
        }
        
        //Paso 5: Informar la cantidad de personas por oficina.
        for (i=0;i<8;i++){ //filas
            System.out.print((i+1)+": ");
            for(j=0;j<4;j++) //columnas
                System.out.print(matriz[i][j] + " ");
            System.out.println();
        }
        
    }
}

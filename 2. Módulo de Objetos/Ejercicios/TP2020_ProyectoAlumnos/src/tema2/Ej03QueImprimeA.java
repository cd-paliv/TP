
package tema2;

/**
 *
 * @author vsanz
 */
public class Ej03QueImprimeA {
    public static void main(String[] args) {
        String saludo1=new String("hola");
        String saludo2=new String("hola");
        System.out.println(saludo1 == saludo2); //COMPARA LA DIRECCIÓN
        System.out.println(saludo1 != saludo2); //compara la dirección
        System.out.println(saludo1.equals(saludo2)); //COMPARA EL OBJETO (el equals es solo para string)
        System.out.println(!saludo1.equals(saludo2)); //compara si lo que contienen los objetos es distinto
    } 
}

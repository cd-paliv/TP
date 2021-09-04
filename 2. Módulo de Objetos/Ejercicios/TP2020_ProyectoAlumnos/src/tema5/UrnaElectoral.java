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
public class UrnaElectoral extends Urna {
    private int cantListas;
    private int [] votosPorLista;
    
    public UrnaElectoral(int nro, int cantL){
        super(nro);
        cantListas = cantL;
        votosPorLista = new int [cantListas];
        
        //inicializa contadores
        for (int i=0; i<cantListas; i++)
            votosPorLista[i] = 0;
    }
    
    public int getCantListas(){
        return cantListas;
    }
    
    public boolean validarNumeroDeLista(int N){
        return ((N >= 0) && (N < this.getCantListas()));
    }
    
    public void votarPorLista(int nroL){
        votosPorLista[nroL]++;
    }
    
    public int devolverVotosPorLista(int nroL){
        return votosPorLista[nroL];
    }
    
        @Override
    public int calcularGanador(){
        int aux=-1, max=-1;
        for (int i=0; i<this.getCantListas(); i++)
            if (max < votosPorLista[i]){
                max = votosPorLista[i];
                aux=i;
            }
        return aux;
    }
    
    @Override
    public int calcularTotalVotos(){
        int tot=this.getVotosBlanco(); //en lugar de ponerlo en 0 tengo que tener en cuenta los votos en blanco
        for (int i=0; i<this.getCantListas(); i++)
            tot = tot + votosPorLista[i];
        return tot;
    }
    
}

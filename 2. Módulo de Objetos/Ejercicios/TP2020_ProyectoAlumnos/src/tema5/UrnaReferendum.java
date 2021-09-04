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
public class UrnaReferendum extends Urna {
    private int votosFavor;
    private int votosContra;
    
    public UrnaReferendum(int nro){
        super(nro);
        votosFavor=0;
        votosContra=0;
    }
    
    public int getVotosFavor(){
        return votosFavor;
    }
    
    public int getVotosContra(){
        return votosContra;
    }
    
    public void votarAFavor(){
        votosFavor++;
    }
    
    public void votarEnContra(){
        votosContra++;
    }
    
    @Override
    public int calcularGanador(){
        int aux;
        if (getVotosFavor() == getVotosContra())
            aux=-1;
        else
            if (getVotosFavor() < getVotosContra())
                aux=0;
            else
                aux=1;
        return aux;
    }
    
    @Override
    public int calcularTotalVotos(){
        return (this.getVotosBlanco() + this.getVotosFavor() + this.getVotosContra());
    }
}

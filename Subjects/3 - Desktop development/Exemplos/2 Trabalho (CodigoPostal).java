package codigopostal;

public class CodigoPostal {

    private int indicativo = 0;
    private int extensao = 0;
    private String rua = "0";
        
    public void setIndicativo (int aux) {
        this.indicativo = aux;
    }
    
    public void setExtensao (int aux) {
        this.extensao = aux;
    }
    
    public void setRua (String aux) {
        this.rua = aux;
    }
    
    public int getIndicativo(){     
        return indicativo;
    }
    
    public int getExtensao(){     
        return extensao;
    }
    
    public String getRua(){     
        return rua;
    }    
    
    public CodigoPostal(int aux, int aux2, String aux3) {
        indicativo = aux;
        extensao = aux2;
        rua = aux3;              
    }
    
    public CodigoPostal(int aux, String aux2) {
        indicativo = aux;
        rua = aux2;   
        extensao = 000;
    }
    
    public CodigoPostal() {
        indicativo = 0;
        rua = "0";  
        extensao = 0;
    }   
    
    public void mostra() {
        if (getIndicativo() == 0){
            System.out.println ("CEP: Indisponivel");
        } else {     
            System.out.println ("CEP: "+ getIndicativo() +"-"+ getExtensao() +" "+getRua());
        }
    }    
    
    public static void main(String[] args) {
       
        CodigoPostal cp = new CodigoPostal (86300, 100, "Alagoas");
        cp.mostra();
        CodigoPostal cp1 = new CodigoPostal (86300, "Alagoas");
        cp1.mostra();
        CodigoPostal cp2 = new CodigoPostal ();
        cp2.mostra();      
    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package exec;

/**
 *
 * @author P205
 */
public class Exec {

    //potencia
    public static int potencia(int x, int y) {
        int resultado = x;
        if (y == 0) {
            return 1;
        }
        if (y < 0) {
            return 0;
        }
        for (int i = 0; i < y - 1; i++) {
            resultado *= x;
        }
        return resultado;
    }

    //tamanho string
    public static int tamanhoString(String aux) {
        int i = 0, total = 0;
        while (aux.charAt(i) != ' ') {
            total++;
            i++;
        }
        return total;       
    }
    
    //concatena
    public static String concatena(String aux, String aux2) {
        int i = 0;
        String result;
        while (aux.charAt(i) != ' ') {
            i++;
        }
       return result = aux.substring(0,i+1) + aux2.substring(0);
    }    
    
    //copia
    public static String copiaString (String origem, String destino) {
        return destino = origem.substring(0);        
    }   
    
    //reverso
    public static String reverso (String aux) {
        int i = 0;   
        String resultado = "";
        while (aux.charAt(i) != ' ') {
            i++;
        } 
        for (int j = i; j >= 0; j--) {
            resultado += aux.charAt(j);
        }
        return resultado;        
    }
            
            
            
    public static void main(String[] args) {

        System.out.println(potencia(2,2));
        System.out.println(tamanhoString("lucas "));
        System.out.println(concatena("lucas ","joao "));
        System.out.println(copiaString("lucas ","joao "));
        System.out.println(reverso("lucas "));
    }
}

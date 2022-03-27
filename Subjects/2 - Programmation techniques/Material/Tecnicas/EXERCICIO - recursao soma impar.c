#include <stdio.h>

int somaImpar (int *vetor, int posicao, int tamanho) {
    if (posicao >= tamanho -1) {
        if (vetor[posicao] % 2 != 0)
            return vetor[posicao];
        else return 0;
    }
    if (vetor[posicao] % 2 != 0)
        return vetor[posicao] + somaImpar (vetor, posicao+1, tamanho);
    else
        return somaImpar (vetor, posicao+1, tamanho);
}

int main (void) {

    int somaImpar (int *vetor, int posicao, int tamanho);

    int v[10] = {1,2,3,4,5,6,7,8,9,0};

    printf ("%d", somaImpar (v, 0 , 10));

}

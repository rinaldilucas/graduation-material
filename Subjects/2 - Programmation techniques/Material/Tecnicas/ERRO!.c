#include <stdio.h>

int somaPar (int posicao, int tamanho, int *vetor) {

    if (posicao >= tamanho-1) {
        if (vetor[posicao] % 2 == 0)
            return vetor[posicao];
        else return 0;
    }

    if (vetor[posicao] % 2 == 0)
        return vetor[posicao] + somaPar(posicao+1, tamanho, vetor);
    else
        return somaPar(posicao + 1, tamanho, vetor);
}

    int main () {

    int somaPar (int posicao, int tamanho, int *vetor);

    int v[10] = {1,2,1,2,1,2,1,2,1,2};

    printf ("%d", somaPar (0, 10, v));

    return 0;
}



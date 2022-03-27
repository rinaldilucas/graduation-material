#include <stdio.h>

float media (float *v, int posicao, int tamanho) {

    if (posicao > tamanho) {
        return v[posicao]/tamanho;
    } else {
        return v[posicao]/tamanho + media(v, posicao +1, tamanho);
    }



}
int main () {

    float vetor[10] = {2,2,2,2,2,2,2,2,2,2};

    float media (float *v, int posicao, int tamanho);

    printf ("%f", media(vetor, 0, 10));

}

#include <stdio.h>

int somarVetor (int vetor [], const int n) {

    int soma = 0;
    int *ponteiro;
    int *const finalVetor = vetor + n;

    for (ponteiro = vetor; ponteiro < finalVetor; ponteiro++){
        soma = soma + *ponteiro;
    }
    return soma;
}

int main (void) {

    int somarVetor (int vetor [], const int n);
    int vetor[10] = {5,5,5,5,5,5,5,5,5,5};

    printf ("soma e : %d", somarVetor(vetor, 10));

    getchar ();



}

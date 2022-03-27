#include <stdio.h>

int main(void) {

    int vetor[3] = {1,2,3};

    int *ponteiro = vetor;

    *(ponteiro + 1) = 10;


    printf ("%d\n", vetor[1]);


    getchar();
    return 0;
}

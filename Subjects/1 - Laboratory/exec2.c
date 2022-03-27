#include <stdio.h>

main () {

int vetor[12], i, a, b, soma;

   for (i=0; i < 12; i++) {
     printf ("Digite um valor do vetor: ");
     scanf ("%d", &vetor[i]);
   }

    printf ("Digite o primeiro valor a ser trocado no indice: ");
    scanf ("%d", &a);
    printf ("Digite o primeiro valor a ser trocado no indice: ");
    scanf ("%d", &b);

    soma = vetor[a-1]+vetor[b-1];

    printf ("Soma : %d", soma);

    }




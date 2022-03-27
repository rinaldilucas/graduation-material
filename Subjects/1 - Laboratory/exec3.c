#include <stdio.h>

main () {

int vetor[20], i, a, sim=100;
   for (i=0; i < 20; i++) {
     printf ("Digite um valor do vetor: ");
     scanf ("%d", &vetor[i]);
   }

    printf ("Digite o valor a ser buscado: ");
    scanf ("%d", &a);


     for (i=0; i < 20; i++) {
        if (vetor[i] == a) {
        printf ("Valor encontrado na posicao %d\n", i);
        sim = i;
    }
     }
        if (sim == 100)
            printf ("Valor nao encontrado.");



}

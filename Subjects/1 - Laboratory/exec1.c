#include <stdio.h>

main () {

int vetor[15], i, par=0, impar=0;

   for (i=0; i < 15; i++) {
     printf ("Digite um valor do vetor: ");
     scanf ("%d", &vetor[i]);

    if ((vetor[i]%2)==0) {
       par++;
       printf ("%d e par.\n", vetor[i]);
     }
     else {
      impar++;
      printf ("%d e impar.\n", vetor[i]);
     }
  }

printf ("Total de numer(os) par(es): %d. Total de numer(os) impar(es): %d", par, impar);
}



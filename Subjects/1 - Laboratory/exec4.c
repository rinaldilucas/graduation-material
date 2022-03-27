#include <stdio.h>

main () {

int vetor[10], i, a, sim=100;
   for (i=0; i < 10; i++) {
     printf ("Digite um valor do vetor: ");
     scanf ("%d", &vetor[i]);

   if (vetor[i] < 0)
    vetor[i] = 0;
   }

for (i=0; i < 10; i++) {
     printf ("\n%d", vetor[i]);

}
}


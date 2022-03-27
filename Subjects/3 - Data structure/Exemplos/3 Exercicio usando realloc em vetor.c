#include <stdio.h>
#include <stdlib.h>
#include <string.h>

main () {

    int *vet;
    int i, media = 0;
    vet = (int *) malloc(5*sizeof(int));

    for (i = 0; i < 5; i++) {
         printf("Digite o valor da posicao %d: ", i);
         scanf("%d", &vet[i]);
         media += vet[i];
    }

    vet = (int *) realloc(vet, 6*sizeof(int));

    vet[5] = media;
    for (i = 0; i < 5; i++)
        printf("Valor da posicao %d: %d:\n", i, vet[i]);

    printf ("Media: %.2f.", (float)media/5);

    getch();
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

main () {

    int *vet;
    int i;
    vet = (int *) malloc(5*sizeof(int));

    for (i = 0; i < 5; i++)
        scanf("%d", &vet[i]);

    for (i = 0; i < 5; i++)
        printf("%d\n", vet[i]);

    free(vet);

    vet = (int *) realloc(vet, 8*sizeof(int));

    for (i = 5; i < 8; i++)
        scanf("%d", &vet[i]);

    for (i = 0; i < 8; i++)
        printf("%d\n", vet[i]);

    getch();
}

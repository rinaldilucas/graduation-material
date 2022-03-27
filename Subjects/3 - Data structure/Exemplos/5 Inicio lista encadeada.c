#include <stdio.h>
#include <stdlib.h>

typedef struct lista {
    int info;
    struct lista *prox;
}Lista;

main () {
    Lista *l;
    l = NULL;

    Lista *no1, *no2;
    no1 = (Lista *) malloc(sizeof(Lista));
    no1->info = 10;
    l = no1;
    no2 = (Lista *) malloc(sizeof(Lista));
    no1->prox = no2;
    no2->info = 15;
    no2->prox = NULL;

    printf ("%d %d",l->info, l->prox->info);
}

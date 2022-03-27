#include <stdio.h>
#include <stdlib.h>

typedef struct arvore {
    int info;
    struct arvore *esq;
    struct arvore *dir;
} Arvore;

main () {

Arvore *a1, *a2;
a1 = (Arvore *) malloc(sizeof(Arvore));
a2 = (Arvore *) malloc(sizeof(Arvore));

a1->info = 10;
a1->esq = NULL;
a1->dir = NULL;
a2->info = 20;
a2->esq = NULL;
a2->dir = NULL;

a1->esq = a2;

printf ("%d %d %d", a1->info, a2->info, a1->esq->info);
}

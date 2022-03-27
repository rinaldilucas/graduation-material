#include <stdio.h>
#include <stdlib.h>

typedef struct lista {
    int info;
    struct lista *prox;
}Lista;

Lista* inserirLista(Lista* l, int valor) {
    Lista* novo = (Lista *) malloc(sizeof(Lista));
    novo->info = valor;
    novo->prox = l;
    return novo;
}

void insereFim (Lista* l, int valor) {
    Lista *aux;
    aux = l;
    while (aux->prox != NULL)
        aux = aux->prox;

    Lista* novo = (Lista *) malloc(sizeof(Lista));
    aux->prox = novo;
    novo->info = valor;
    novo->prox = NULL;
}

main () {
    Lista *l;
    l = NULL;

    Lista *no1, *no2, *no3, *aux;
//    no1 = (Lista *) malloc(sizeof(Lista));
//    no1->info = 10;
//    l = no1;
//    no2 = (Lista *) malloc(sizeof(Lista));
//    no1->prox = no2;
//    no2->info = 15;
//    no2->prox = NULL;
//
//    no3 = (Lista *) malloc(sizeof(Lista));
//    no3->info = 20;
//    no3->prox = l;
//    l = no3;
//
//    l = inserirLista (l, 40);
//    aux = l;

    insereFim(l, 11);
    insereFim(l, 12);

    while (aux != NULL) {
        printf ("%d ", aux->info);
        aux = aux->prox;
    }
}

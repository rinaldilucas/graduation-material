#include <stdio.h>
#include <stdlib.h>

typedef struct lista {
    int info;
    struct lista *prox;
}Lista;

typedef struct pilha {
    Lista *topo;
}Pilha;

void imprime (Pilha *p) {
    Lista *aux = p->topo;
    while (aux != NULL) {
        printf ("%d ", aux->info);
        aux = aux->prox;
    }
}

Pilha * cria (Pilha *p, int valor) {
    Lista *novo;
    novo = (Lista *) malloc(sizeof(Lista));
    novo->info = valor;
    novo->prox = p->topo;
    p->topo = novo;
    return p;
}

void retira (Pilha *p){
    Lista *aux = p->topo;
    p->topo = p->topo->prox;
    free(aux);
}

int pilha_vazia (Pilha *p) {
    return (p->topo == NULL);
}

int pilha_pop(Pilha *p) {
    Lista *aux;
    int valor;
    if (pilha_vazia(p)) {
            printf ("Pilha vazia. \n");
            exit(1);
    }
    aux = p->topo;
    valor = aux->info;
    p->topo = aux->prox;
    free(aux);
    return valor;
}

int iguais (Pilha *p1, Pilha *p2) {
    Lista *aux1, *aux2;
    aux1 = p1->topo;
    aux2 = p2->topo;

    while (aux1 != NULL) {
        if (aux1->info != aux2->info)
            return 0;
        aux1 = aux1->prox;
        aux2 = aux2->prox;
    }
    return 1;
}

main () {
    Pilha *p1, *p2;
    Lista *novo;
    p1 = (Pilha *)malloc(sizeof(Pilha));
    p2 = (Pilha *)malloc(sizeof(Pilha));

    p1->topo = NULL;
    p1 = cria (p1, 10);
    p1 = cria (p1, 20);
    p1 = cria (p1, 430);
    p1 = cria (p1, 40);

    p2->topo = NULL;
    p2 = cria (p2, 10);
    p2 = cria (p2, 20);
    p2 = cria (p2, 430);
    p2 = cria (p2, 40);

    if (iguais(p1,p2) == 1)
        printf ("Lista igual.");
    else
        printf ("Lista diferente.");
}



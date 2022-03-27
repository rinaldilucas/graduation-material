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

Lista* inserePos (Lista* l, int valor, int nvalor) {
    Lista *aux, *novo, *ant;
    int i;
    if (l == NULL) { //testar se vazia
        novo = (Lista *) malloc(sizeof(Lista));
        novo->info = valor;
        novo->prox = NULL;
        return novo;
    }
    aux = l;
    ant = NULL;
    while (aux != NULL && aux->info != valor) { //testar se valor procurado nao existe
        ant = aux;
        aux = aux->prox;
    }
    if (aux == NULL) {
        return l; //retorna lista intacta
    }
    if (ant == NULL) {
        novo = (Lista *) malloc(sizeof(Lista));
        novo->info = nvalor;
        novo->prox = l;
        return novo;
    }
    novo = (Lista *) malloc(sizeof(Lista));
    ant->prox = novo;
    novo->info = nvalor;
    novo->prox = aux;
    return l;
}

void imprime (Lista *l) {
    if (l != NULL) {
        printf ("%d ", l->info);
        imprime (l->prox);
    }
}

int maiorElemento (Lista *l) {
    int x;
    if (l != NULL) {
        if (l->prox == NULL) {
            return l->info;
        }
        x = maiorElemento(l->prox);
        if (l->info > x)
            return l->info;
        else
            return x;
    } else {
        return l;
    }
}

Lista* busca (Lista *l, int valor) { //busca elementos
    Lista* aux;
    for (aux = l; aux != NULL; aux = aux->prox) {
        if (aux->info == valor)
        return aux;
    }
    return NULL;
}

Lista* apaga (Lista* l, int valor) {
    Lista *aux, *ant;
    aux = l;
    ant = NULL;

    while (aux != NULL && aux->info != valor) {
        ant = aux;
        aux = aux->prox;
    }

    if (aux == NULL)
        return l;

    if (ant == NULL) { //testar se vazia
        l = aux->prox;
        free (aux);
        return l;
    } else {
        ant->prox = aux->prox;
        free (aux);
        return l;
    }
}


main () {
    Lista *l;
    l = NULL;

    Lista *no1, *no2, *no3, *aux;
    no1 = (Lista *) malloc(sizeof(Lista));
    no1->info = 11111111;
    l = no1;
    no2 = (Lista *) malloc(sizeof(Lista));
    no1->prox = no2;
    no2->info = 15;
    no2->prox = NULL;

    no3 = (Lista *) malloc(sizeof(Lista));
    no3->info = 20;
    no3->prox = l;
    l = no3;

    l = inserePos (l, 20, 666);
    l = inserirLista (l, 40);
    insereFim(l, 11);
    insereFim(l, 12);
    imprime (l);

    if (busca (l, 21) != NULL)
        printf ("\nEncontrou.");
    else
        printf ("\nNao encontrou.");

    printf ("\n\n");

    l = apaga (l, 15);
    imprime (l);

    printf ("\n\nMaior elemento: %d", maiorElemento(l));

}


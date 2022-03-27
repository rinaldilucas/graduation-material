#include <stdio.h>
#include <stdlib.h>

typedef struct lista {
int info;
struct lista *prox;
struct lista *ant;
}ListaEnc;

typedef struct lista2 {
int info;
struct lista2 *prox;
}ListaSim;

int encPar (ListaSim *ls) {
    ListaSim *aux;
    aux = ls;

    while (aux != NULL) {
        if (aux->info % 2 == 0) {
            return 1;
        }
        aux = aux->prox;
    }
    return 0;
}

ListaEnc *single (ListaSim *ls, ListaEnc *le) {

    ListaEnc *dupla(ListaEnc *le, int valor);
    ListaEnc *auxe;
    ListaSim *auxs;

    auxe = le;
    auxs = ls;
    while (auxs != NULL) {
        if (auxs->info % 2 == 0) {
            auxe = dupla (auxe, auxs->info);
        }
        auxs = auxs->prox;
    }
    return auxe;
}

ListaEnc *dupla (ListaEnc *le, int valor) {

    ListaEnc *novo = (ListaEnc *) malloc(sizeof(ListaEnc));
    ListaEnc *aux;
    aux = le;

    if (le == NULL) {
        novo->info = valor;
        novo->prox = NULL;
        novo->ant = NULL;
        return novo;
    }
    if (aux->prox != NULL) {
        aux = aux->prox;
    }
    aux->prox = novo;
    novo->info = valor;
    novo->prox = NULL;
    novo->ant = aux;
    return le;
}

void imprime (ListaSim *ls, ListaEnc *le) {
    ListaSim *auxs;
    ListaEnc *auxe;

    auxs = ls;
    auxe = le;
    printf ("Lista simples: ");
    while (auxs != NULL) {
        printf ("%d ", auxs->info);
        auxs = auxs->prox;
    }
    printf ("\n");
    printf ("Lista Encadeada: ");
    while (auxe != NULL) {
        printf ("%d ", auxe->info);
        auxe = auxe->prox;
    }
}

main () {
    ListaSim *ls, *no1, *no2, *no3, *no4;
    ListaEnc *le;
    ls = NULL;
    le = NULL;


    no1 = (ListaSim *) malloc(sizeof(ListaSim));
    no2 = (ListaSim *) malloc(sizeof(ListaSim));
    no3 = (ListaSim *) malloc(sizeof(ListaSim));
    no4 = (ListaSim *) malloc(sizeof(ListaSim));

    ls = no1;
    no1->info = 10;
    no1->prox = no2;
    no2->info = 15;
    no2->prox = no3;
    no3->info = 20;
    no3->prox = no4;
    no4->info = 25;
    no4->prox = NULL;


    if (encPar(ls) == 0) {
        printf ("Na lista simples nao existem pares.");
    } else {
       le = single (ls, le);
       imprime (ls, le);
    }
}





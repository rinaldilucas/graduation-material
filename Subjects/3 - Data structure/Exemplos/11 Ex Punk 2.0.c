#include <stdio.h>
#include <stdlib.h>

typedef struct lista_s {
    int info;
    struct lista_s *prox;
} Lista_s;

typedef struct lista_d {
    int info;
    struct lista_d *prox;
    struct lista_d *ant;
} Lista_d;

Lista_s * insereLista (Lista_s *ls, int valor) {

    Lista_s *novo;
    novo = (Lista_s *) malloc (sizeof(Lista_s));
    novo->info = valor;
    novo->prox = ls;
    return novo;
}

int buscaPar(Lista_s *ls) {
    Lista_s *aux;
    aux = ls;

    while (aux != NULL) {
        if (aux->info % 2 == 0)
            return aux->info;
        aux = aux->prox;
    }
    return 0;
}

Lista_s * excluirPar (Lista_s *ls) {

    Lista_s *aux, *ant;
    aux = ls;
    ant = NULL;

    while (aux != NULL && aux->info % 2 != 0) {
        ant = aux;
        aux = aux->prox;
    }

    if (aux == NULL)
        return ls;
    if (ant == NULL) {
        ls = aux->prox;
        free (aux);
    } else {
        ant->prox = aux->prox;
        free (aux);
    }
    return ls;
}

Lista_d *InsereListaD (Lista_d *ld, int valor) {

    Lista_d *novo = (Lista_d *) malloc (sizeof(Lista_d));
    novo->info = valor;
    novo->prox = ld;
    novo->ant = NULL;
    if (ld == NULL)
        novo->ant = ld;
    return novo;
}

main () {

    Lista_s *ls, *auxs;
    Lista_d *ld, *auxd;

    int i;

    ls = NULL;
    ld = NULL;

    for (i = 1; i < 10; i++) {
        ls = insereLista(ls, i);
    }
    auxs = ls;
    printf ("Lista encadeada simples inicial:\n");
    while (auxs != NULL) {
        printf ("%d ", auxs->info );
        auxs = auxs->prox;
    }
    auxs = ls;
    while (auxs != NULL) {
        if (buscaPar(ls) == 0) {
            auxs = auxs->prox;
        } else {
            ld = InsereListaD(ld, buscaPar(ls));
            auxs = auxs->prox;
            auxs = excluirPar(ls);
        }
    }
    auxs = ls;
    printf ("\n\nLista encadeada simples apos:\n");
    while (auxs != NULL) {
        printf ("%d ", auxs->info );
        auxs = auxs->prox;
    }

    auxd = ld;
    printf ("\n\nLista encadeada dupla:\n");
    while (auxd != NULL) {
        printf ("%d ", auxd->info );
        auxd = auxd->prox;
    }

}


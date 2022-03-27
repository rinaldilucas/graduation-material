#include <stdio.h>
#include <stdlib.h>

typedef struct lista2 {
    float info;
    struct lista2 *ant;
    struct lista2 *prox;
} Lista2;

typedef struct fila2 {
    Lista2 *ini;
    Lista2 *fim;
} Fila2;

void insereFilaFim (Fila2 *f2, int valor) {
    Lista2 *novo;
    novo = (Lista2 *) malloc(sizeof(Lista2));
    novo->info = valor;
    novo->ant = f2->fim;
    novo->prox = NULL;
    if (f2->ini == NULL) {
        f2->ini = novo;
    } else {
        f2->fim->prox = novo;
    }
    f2->fim = novo;
}

void insereFilaIni (Fila2 *f2, int valor) {
    Lista2 *novo;
    novo = (Lista2 *) malloc(sizeof(Lista2));
    novo->info = valor;
    novo->ant = NULL;
    novo->prox = NULL;
    f2->ini->ant = novo;
    if (f2->ini == NULL) {
        f2->ini = novo;
        f2->fim = novo;
    } else {
        novo->prox = f2->ini;
    }
    f2->ini = novo;
}

void imprimeTudo (Lista2 *l2, int flag) {
    if (flag == 1) {
        if (l2->prox == NULL)
            printf ("%f ", l2->info);
        else {
            printf ("%f ", l2->info);
            imprimeTudo (l2->prox, 1);
        }
    } else {
        if (l2->ant == NULL)
            printf ("%f ", l2->info);
        else {
            printf ("%f ", l2->info);
            imprimeTudo (l2->ant, 0);
        }
    }
}

main() {

    Fila2 *f2;
    Lista2 *l2;
    f2 = (Fila2 *) malloc(sizeof(Fila2));
    f2->ini = f2->fim = NULL;
    l2 = (Lista2 *) malloc(sizeof(Lista2));
    l2->info = 10;
    l2->prox = NULL;
    l2->ant = NULL;
    f2->ini = l2;
    f2->fim = l2;

    insereFilaFim(f2, 20);
    insereFilaIni(f2, 5);
    imprimeTudo (f2->ini, 1);
    printf ("\n-------------------\n");
    imprimeTudo (f2->fim, 0);


}

#include <stdio.h>
#include <stdlib.h>

typedef struct arv {
    int info;
    struct arv *esq;
    struct arv *dir;
} Arv;

Arv* criaArvore(int valor, Arv* esq, Arv* dir) {
    Arv* novo = (Arv *)malloc(sizeof(Arv));
    novo->info = valor;
    novo->dir = dir;
    novo->esq = esq;
    return novo;
}

void imprimeArvore (Arv* a) {
    if (a != NULL) {
        printf ("%d ", a->info);
        imprimeArvore(a->esq);
        imprimeArvore(a->dir);
    }
}

int contaArvore (Arv *a) {
    if (a == NULL) {
        return 0;
    } else {
        if (a->esq != NULL) {
            return contaArvore(a->esq)+1;
        } else {
            return contaArvore(a->dir)+1;
        }
    }
}

    main () {
        Arv *a1, *a2, *a3;
        a1 = (Arv *) malloc(sizeof(Arv));
        a2 = (Arv *) malloc(sizeof(Arv));
        a3 = (Arv *) malloc(sizeof(Arv));

        a1->info = 10;
        a2->info = 5;
        a3->info = 15;

        a1->esq = a2;
        a1->dir = a3;

        a2->esq = a2->dir = NULL;
        a3->esq = a3->dir = NULL;

        a3->esq = criaArvore(20, NULL, criaArvore(25, NULL, NULL));

        imprimeArvore(a1);
        printf ("%d", contaArvore(a1));
    }

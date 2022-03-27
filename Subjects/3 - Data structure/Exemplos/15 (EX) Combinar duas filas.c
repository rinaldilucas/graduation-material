#include <stdio.h>
#include <stdlib.h>

typedef struct lista {
    float info;
    struct lista *prox;
} Lista;

typedef struct fila {
    Lista *ini;
    Lista *fim;
} Fila;

Fila* filaCria(void) {
    Fila* f = (Fila*) malloc(sizeof(Fila));
    f->ini = f->fim = NULL;
    return f;
}

int filaVazia(Fila* f) {
    return(f->ini==NULL);
}

void filaInsere (Fila* f, float v) {
    Lista* n = (Lista*) malloc(sizeof(Lista));
    n->info = v;          /* armazena informação  */
    n->prox = NULL;       /* novo nó passa a ser o último  */
    if (f->fim != NULL)   /* verifica se lista não estava vazia  */
        f->fim->prox = n;
    else                  /* fila estava vazia  */
        f->ini = n;

    f->fim = n;        /* fila aponta para novo elemento  */
}

void filaImprime (Fila* f) {
    Lista* q = f->ini;
    printf("FILA: ");
    if(q==NULL)
        printf("NULL");
    while (q!=NULL) {
        printf("%.2f ",q->info);
        q = q->prox;
    }
    printf ("\t");
}

float filaRetira (Fila* f) {
    Lista* t;
    float v;
    if (filaVazia(f)) {
        printf("Fila vazia.\n");
        exit(1); /* aborta programa  */
    }

    t = f->ini;
    v = t->info;
    f->ini = t->prox;
    if (f->ini ==  NULL)    /* verifica se fila ficou vazia */
        f->fim = NULL;

    free(t);
    return v;
}

void combinaFilas (Fila* res, Fila* f1, Fila* f2) {
    while (f1->ini != NULL && f2->ini != NULL) {
        filaInsere(res, filaRetira(f1));
        filaInsere(res, filaRetira(f2));
    }
}

main () {
    Fila *f1, *f2, *res;
    f1 = filaCria();
    f2 = filaCria();
    res = filaCria();

    filaInsere(f1, 2.1);
    filaInsere(f1, 4.5);
    filaInsere(f1, 1);

    filaInsere(f2, 7.1);
    filaInsere(f2, 3.1);
    filaInsere(f2, 9.8);

    filaImprime(f1);
    filaImprime(f2);

    combinaFilas (res, f1, f2);

    printf ("\n\n");
    filaImprime(res);
    printf ("\n\n");

    filaImprime(f1);
    filaImprime(f2);
}




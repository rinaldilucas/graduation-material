#include <stdio.h>
#include <stdlib.h>

/* nó da lista para armazenar valores reais */
struct lista {
    float info;
    struct lista* prox;
};
typedef struct lista Lista;

/* estrutura da fila */
struct fila {
    Lista* ini;
    Lista* fim;
};
typedef struct fila Fila;

Fila* fila_cria(void) {
    Fila* f = (Fila*) malloc(sizeof(Fila));
    f->ini = f->fim = NULL;
    return f;
}

int fila_vazia(Fila* f) {
    return(f->ini==NULL);
}

void fila_insere (Fila* f, float v) {
    Lista* n = (Lista*) malloc(sizeof(Lista));
    n->info = v;          /* armazena informação  */
    n->prox = NULL;       /* novo nó passa a ser o último  */
    if (f->fim != NULL)   /* verifica se lista não estava vazia  */
        f->fim->prox = n;
    else                  /* fila estava vazia  */
        f->ini = n;

    f->fim = n;        /* fila aponta para novo elemento  */
}

/*Retorna o valor*/
float fila_retira (Fila* f) {
    Lista* t;
    float v;
    if (fila_vazia(f)) {
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

/*Retorna o o novo inicio de Fila*/
Lista* fila_retira2 (Fila* f) {
    Lista* t, *aux;
    float v;
    if (fila_vazia(f)) {
        printf("Fila vazia.\n");
        exit(1); /* aborta programa  */
    }

    t = f->ini;
    aux = t->prox;
    v = t->info;
    free(t);
    printf("\n%.2f Removido com Sucesso!!!\n",v);
    if (aux ==  NULL)    /* verifica se fila ficou vazia */
        return NULL;
    else
        return aux;
}

void fila_libera (Fila* f) {
    Lista* q = f->ini;
    while (q!=NULL) {
        Lista* t = q->prox;
        free(q);
        q = t;
    }
    free(f);
}

void fila_imprime (Fila* f) {
    Lista* q = f->ini;
    printf("FILA: ");
    if(q==NULL)
        printf("NULL");
    while (q!=NULL) {
        printf("%.2f ",q->info);
        q = q->prox;
    }
}

main() {
    Fila* f;
    float teste;
    f = fila_cria();
    fila_insere(f,5.5);
    fila_insere(f,6.5);
    fila_insere(f,5.0);
    fila_imprime(f);
    f->ini=fila_retira2(f);

    /*teste=fila_retira(f);
    printf("\n%.2f Removido com Sucesso!!!\n",teste);
    fila_imprime(f);*/

    f->ini=fila_retira2(f);
    fila_imprime(f);
    f->ini=fila_retira2(f);
    fila_imprime(f);

    getch();

}

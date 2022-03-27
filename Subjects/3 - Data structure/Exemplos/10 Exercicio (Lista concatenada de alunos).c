#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Aluno{
   char nome[40];
   int RA;
   float P1;
   float P2;
   float T;
   float APS;
   struct Aluno *prox;
}Aluno;

Aluno * incluirAluno (Aluno *l, int RA, char *nome, float P1, float P2, float APS, int pos) {
    Aluno *aux, *ant;
    if (l == NULL) {
        Aluno *novo = (Aluno*) malloc(sizeof(Aluno));
        novo->RA = RA;
        strcpy (novo->nome, nome);
        novo->P1 = P1;
        novo->P2 = P2;
        novo->APS = APS;
        novo->prox = NULL;
        return novo;
    }
    aux = l;
    ant = NULL;
    while (aux != NULL && aux->RA != pos){
        ant = aux;
        aux = aux->prox;
    }
    if (ant == NULL) {
        Aluno *novo = (Aluno*) malloc(sizeof(Aluno));
        novo->RA = RA;
        strcpy (novo->nome, nome);
        novo->P1 = P1;
        novo->P2 = P2;
        novo->APS = APS;
        novo->prox = l;
        return novo;
    }
    Aluno *novo = (Aluno*) malloc(sizeof(Aluno));
    ant->prox = novo;
    novo->RA = RA;
    strcpy (novo->nome, nome);
    novo->P1 = P1;
    novo->P2 = P2;
    novo->APS = APS;
    novo->prox = aux;
    return l;
}

Aluno* incluirAlunoC(Aluno *l, int RA, char *nome, float P1, float P2, float APS) {

    Aluno *novo = (Aluno *) malloc(sizeof(Aluno));
    novo->RA = RA;
    strcpy (novo->nome, nome);
    novo->P1 = P1;
    novo->P2 = P2;
    novo->APS = APS;
    novo->prox = l;
    return novo;
}

void incluirFinal (Aluno *l, int RA, char *nome, float P1, float P2, float APS) {
    Aluno *novo = (Aluno *) malloc(sizeof(Aluno));
    Aluno *aux;
    aux = l;
    while (aux->prox != NULL) {
        aux = aux->prox;
    }
    aux->prox = novo;
    novo->RA = RA;
    strcpy (novo->nome, nome);
    novo->P1 = P1;
    novo->P2 = P2;
    novo->APS = APS;
    novo->prox = NULL;
}

void imprime (Aluno *l) {
    Aluno *aux;
    aux = l;
    while (aux != NULL) {
        printf ("%d %s %f %f %f\n", aux->RA, aux->nome, aux->P1, aux->P2, aux->APS);
        aux = aux->prox;
    }
}

Aluno* excluiAluno (Aluno *l, int RA) {
    Aluno *aux = l, *ant = NULL;
    while (aux != NULL && aux->RA != RA) {
        ant = aux;
        aux = aux->prox;
    }
    if (aux == NULL)
        return l;
    if (ant == NULL) {
        l = aux->prox;
        free (aux);
        return l;
    } else {
        ant->prox = aux->prox;
        free(ant);
        return l;
    }
}

main () {

    Aluno *l;
    l = NULL;

    l = incluirAlunoC(l, 123, "Lucas", 10, 9, 8);
    l = incluirAlunoC(l, 122, "Lucas", 10, 9, 8);
    incluirFinal(l, 126, "Lucas", 10, 9, 8);
    incluirAluno(l, 128, "Lucas", 10, 9, 8, 126);
    l = excluiAluno(l, 122);
    imprime (l);


}

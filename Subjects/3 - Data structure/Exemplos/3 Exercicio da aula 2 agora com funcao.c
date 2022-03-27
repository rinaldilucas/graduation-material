#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct aluno{
    char nome[40];
    int RA;
    float P1, P2, T, APS;
}ALUNO;

void imprime (ALUNO *aux) {
    printf ("Nome: %s\nRA: %d\nP1: %.2f, P2: %.2f, T: %.2f, APS: %.2f.", aux->nome, aux->RA, aux->P1, aux->P2, aux->T, aux->APS);
}

void main () {

    ALUNO *aluno1;
    aluno1 = (ALUNO*) malloc(sizeof(ALUNO));
    setbuf(stdin, NULL);
    scanf("%[^\n]s", aluno1->nome);
    setbuf(stdin, NULL);
    aluno1->RA = 1478133;
    aluno1->P1 = 10;
    aluno1->P2 = 9.5;
    aluno1->T = 8;
    aluno1->APS = 10;

    imprime(aluno1);
    free (aluno1);
    getchar();
}

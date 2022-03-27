#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct aluno{
    char nome[40];
    int RA;
    float P1, P2, T, APS;
}ALUNO;

void main () {

    ALUNO *aluno1;
    aluno1 = (ALUNO*) malloc(sizeof(ALUNO));
    strcpy (aluno1->nome, "Lucas");
    aluno1->RA = 1478133;
    aluno1->P1 = 10;
    aluno1->P2 = 9.5;
    aluno1->T = 8;
    aluno1->APS = 10;

    printf ("Nome: %s\nRA: %d\nP1: %.2f, P2: %.2f, T: %.2f, APS: %.2f.", aluno1->nome, aluno1->RA, aluno1->P1, aluno1->P2, aluno1->T, aluno1->APS);

    free (aluno1);
    getchar();
}



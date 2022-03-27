#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct trabalho {
    float T1;
    float T2;
    float APS;
} Trabalho;

typedef struct prova {
    float notaProva;
} Prova;

typedef struct nota {
    Trabalho *trabalhos;
    Prova *provas;
    float MediaFinal;
} Notas;

typedef struct aluno {
    char nome[40];
    int RA;
    Notas *nota;
    int faltas;
} Aluno;

void main () {

    float mediaFinal(Aluno *a);
    int i;

    Aluno *aluno1;
    aluno1 = (Aluno*) malloc(sizeof(Aluno));
    aluno1->nota = (Notas *) malloc(sizeof(Notas));
    printf("Entre com o nome do aluno: ");
    setbuf (stdin, NULL);
    scanf("%[^\n]s", aluno1->nome);
    setbuf (stdin, NULL);
    printf("Entre com o RA do aluno: ");
    scanf("%d", &aluno1->RA);
    aluno1->nota->provas = (Prova *) malloc(sizeof(Prova)*2);
    for (i = 0; i < 2; i++) {
        printf("Entre com a nota da %da prova do aluno: ", i+1);
        scanf("%f", &aluno1->nota->provas[i].notaProva);
    }

    aluno1->nota->trabalhos = (Trabalho *) malloc(sizeof(Trabalho));
    printf("Entre com a nota do primeiro trabalho do aluno: ");
    scanf("%f", &aluno1->nota->trabalhos->T1);
    printf("Entre com a nota do segundo trabalho do aluno: ");
    scanf("%f", &aluno1->nota->trabalhos->T2);
    printf("Entre com a nota da APS do aluno: ");
    scanf("%f", &aluno1->nota->trabalhos->APS);

    aluno1->nota->MediaFinal = mediaFinal(aluno1);
    printf ("\n -- A media final do aluno %s \202: %.2f. --", aluno1->nome, aluno1->nota->MediaFinal);

    free (aluno1->nota->provas);
    free (aluno1->nota->trabalhos);
    free (aluno1->nota);
    free (aluno1);
}

float mediaFinal(Aluno *a) {

    float media, p1, p2, t1, t2, aps;

    p1 = a->nota->provas[0].notaProva;
    p2 = a->nota->provas[1].notaProva;
    t1 = a->nota->trabalhos->T1;
    t2 = a->nota->trabalhos->T2;
    aps = a->nota->trabalhos->APS;
    media = (p1*0.4) + (p2*0.45) + (t1*0.05) + (t2*0.05) + (aps*0.05);

    return media;
}

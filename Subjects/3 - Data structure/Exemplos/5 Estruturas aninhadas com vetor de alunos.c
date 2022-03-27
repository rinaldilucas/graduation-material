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

    void mediaFinal(Aluno *a, int qde);
    int i, j, tamanho;

    printf ("Digite o tanto de alunos: ");
    scanf ("%d", &tamanho);

    Aluno *aluno1;
    aluno1 = (Aluno*) malloc(sizeof(Aluno)*2);

    for (i = 0; i < tamanho; i++) {
        aluno1[i].nota = (Notas *) malloc(sizeof(Notas));
        printf("\nEntre com o nome do aluno: ");
        setbuf (stdin, NULL);
        scanf("%[^\n]s", aluno1[1].nome);
        setbuf (stdin, NULL);
        printf("Entre com o RA do aluno: ");
        scanf("%d", &aluno1[i].RA);
        aluno1[i].nota->provas = (Prova *) malloc(sizeof(Prova)*2);
        for (j = 0; j < 2; j++) {
            printf("Entre com a nota da %da prova do aluno: ", j+1);
            scanf("%f", &aluno1[i].nota->provas[j].notaProva);
        }
        aluno1[i].nota->trabalhos = (Trabalho *) malloc(sizeof(Trabalho));
        printf("Entre com a nota do primeiro trabalho do aluno: ");
        scanf("%f", &aluno1[i].nota->trabalhos->T1);
        printf("Entre com a nota do segundo trabalho do aluno: ");
        scanf("%f", &aluno1[i].nota->trabalhos->T2);
        printf("Entre com a nota da APS do aluno: ");
        scanf("%f", &aluno1[i].nota->trabalhos->APS);
    }

    //aluno1->nota->MediaFinal = mediaFinal(aluno1);
    //printf ("\n -- A media final do aluno %s \202: %.2f. --", aluno1->nome, aluno1->nota->MediaFinal);
    mediaFinal(aluno1, tamanho);

    for (i = 0; i < tamanho; i++) {
        free (aluno1[i].nota->provas);
        free (aluno1[i].nota->trabalhos);
        free (aluno1[i].nota);
    }
    free (aluno1);
}

void mediaFinal(Aluno *a, int qde) {
    int i;
    float media, p1, p2, t1, t2, aps;

    for (i = 0; i < qde; i++) {
        p1 = a[i].nota->provas[0].notaProva;
        p2 = a[i].nota->provas[1].notaProva;
        t1 = a[i].nota->trabalhos->T1;
        t2 = a[i].nota->trabalhos->T2;
        aps = a[i].nota->trabalhos->APS;
        media = (p1*0.4) + (p2*0.45) + (t1*0.05) + (t2*0.05) + (aps*0.05);
        printf ("Media do %do aluno: %.2f.\n", i+1, media);
    }
}

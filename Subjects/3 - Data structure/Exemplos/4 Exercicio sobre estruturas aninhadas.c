#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct nota {
    float P1;
    float P2;
    float T;
    float APS;
}Nota;

typedef struct aluno {
    char nome[40];
    int RA;
    Nota *nota;
}Aluno;

main () {
    float calcMedia (Aluno *a, int qde);
    void imprime (Aluno *a, int qde);

    int i, tamanho;

    printf ("Digite o tamanho do vetor de alunos: ");
    scanf("%d", &tamanho);

    Aluno *aluno1;
    aluno1 = (Aluno*) malloc(sizeof(Aluno)*tamanho);
    for (i = 0; i < tamanho; i++) {
        aluno1[i].nota = (Nota *) malloc(sizeof(Nota));
        printf("\nEntre com o nome do aluno: ");
        setbuf (stdin, NULL);
        scanf("%[^\n]s", aluno1[i].nome);
        setbuf (stdin, NULL);
        printf("Entre com o RA do aluno: ");
        scanf("%d", &aluno1[i].RA);
        printf("Entre com a nota 1 do aluno: ");
        scanf("%f", &aluno1[i].nota->P1);
        printf("Entre com a nota 2 do aluno: ");
        scanf("%f", &aluno1[i].nota->P2);
        printf("Entre com a nota do trabalho do aluno: ");
        scanf("%f", &aluno1[i].nota->T);
    }
    printf ("\n\nA media dos trabalhos dos alunos e: %.2f\n\n", calcMedia(aluno1, tamanho));
    imprime(aluno1, tamanho);

    for (i = 0; i < tamanho; i++)
        free(aluno1[i].nota);

    free(aluno1);
}

float calcMedia (Aluno *a, int qde) {
    float soma = 0;
    int i;

    for (i = 0; i < qde; i++) {
        soma += a[i].nota->T;
    }
    return soma/qde;
}

void imprime (Aluno *a, int qde) {
    int i;
    for (i = 0; i < qde; i++) {
        printf ("%s\n%d\n%.2f\n%.2f\n%.2f\n\n", a[i].nome, a[i].RA, a[i].nota->P1, a[i].nota->P2, a[i].nota->T);
    }
}

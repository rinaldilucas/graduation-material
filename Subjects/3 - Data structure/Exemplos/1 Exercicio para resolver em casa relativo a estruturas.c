#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct aluno{
    int RA;
    char nome[40];
    float P1, P2, T;
    int faltas;
}ALUNO;

void imprimeAluno(ALUNO *vetor, int quantidade) {
    int i;
    for (i = 0; i < quantidade; i++) {
        printf ("%d,\n%s,\n%f,\n%f,\n%f,\n%d\n\n", vetor[i].RA, vetor[i].nome, vetor[i].P1, vetor[i].P2, vetor[i].T, vetor[i].faltas);
    }
}

main () {
    ALUNO vetor[4];
    int i;
    float m1 = 0, m2 = 0, m3 = 0, m4 = 0;

    for (i = 0; i <4; i++) {
        printf ("Nome: ");
        scanf ("%s", &vetor[i].nome);
        printf ("RA: ");
        scanf ("%d", &vetor[i].RA);
        printf ("P1: ");
        scanf ("%f", &vetor[i].P1);
        printf ("P2: ");
        scanf ("%f", &vetor[i].P2);
        printf ("T: ");
        scanf ("%f", &vetor[i].T);
        printf ("Faltas: ");
        scanf ("%d", &vetor[i].faltas);

        m1 += vetor[i].P1;
        m2 += vetor[i].P2;
        m3 += vetor[i].T;
    }

    printf ("A media da P1: %f, P2: %f, T: %f", m1/4, m2/4, m3/4);

    imprimeAluno(vetor, 4);

    getchar();
}

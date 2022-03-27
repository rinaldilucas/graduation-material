#include <stdio.h>

int main(void) {

    const int bimestresAnuais = 4;
    const int numeroDeAlunos = 4;
    int i, j;
    float soma = 0;

    float notasAlunos[numeroDeAlunos][bimestresAnuais];
    float mediaAlunos [numeroDeAlunos];

    for (i = 0; i < 4; ++i) {
        for (j = 0; j < 4; ++j) {
            printf ("Digite a %da nota do %do aluno: ", i+1 , j+1);
            scanf ("%f", &notasAlunos[i][j]);
            soma = soma+notasAlunos[i][j];
        }
        mediaAlunos[i] = soma/4;
        soma = 0;
    }

    for (i = 0; i < 4; ++i)
        printf ("A media do %do aluno e: %f.\n", i+1, mediaAlunos[i]);


    return 0;
}

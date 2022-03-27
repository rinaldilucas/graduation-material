#include <stdio.h>
#include <stdlib.h>

// matriz 3d
int ***alocaVetor (int l, int c, int p) {
    int ***m;
    int i, j;

    m = malloc(sizeof(int**) * l);
    for (i = 0; i < l; i++) {
        m[i] = malloc(sizeof(int*) * c);
        for (j = 0; j < c; j++)
            m[i][j] = malloc(sizeof(int) * p);
    }
    return m;
}
void libera (int ***m, int l, int c) {
    int i, j;

    for (i = 0; i < l; i++) {
        for (j = 0; j < c; j++)
            free (m[i][j]);
        free (m[i]);
    }
    free (m);
}
// media em um vetor
float media (float *v, int posicao, int tamanho) {

     if (posicao >= tamanho-1)
        return v[posicao]/tamanho;
     return v[posicao]/tamanho + media (v, posicao + 1, tamanho);
}
// quantidades de 2 em uma string
int qdeDois (int n) {

    if (n <= 9) {
        if (n == 2)
            return 1;
        return 0;
    }
    if (n % 10 == 2)
        return 1 + qdeDois (n/10);
    return qdeDois (n/10);
}
// numeros pares em uma string
int qdePar (int n) {

    if (n <= 9) {
        if (n % 2 == 0)
            return 1 ;
        return 0;
    }
    if (n % 2 == 0)
        return (n % 10) + qdePar (n/10);
    return qdePar (n/10);
}
// soma de pares em um vetor
int somaPar (int *v, int posicao, int tamanho) {

    if (posicao >= tamanho-1){
        if (v[posicao] % 2 == 0)
            return v[posicao];
        else
            return 0;
    }
    if (v[posicao] % 2 == 0)
        return v[posicao] + somaPar (v, posicao + 1, tamanho);
    else
        return somaPar (v, posicao + 1, tamanho);
}
// fibo em memoization
int fiboM (int *v, int n) {

    if (n <= 2)
        return 1;
    if (v[n] < 0)
        return (v[n] = (fiboM (v, n-1) + fiboM (v, n-2)));
    return v[n];
}
// divisao e conquista
float divisaoCon (float *v, int l, int r) {
    float solucaoD;
    float solucaoE;
    int m;

    if (l >= r)
        return v[l];

    m = (l+r)/2;

    solucaoE = divisaoCon (v, l , m);
    solucaoD = divisaoCon (v, m+1, r);
    if (solucaoE > solucaoD)
        return solucaoE;
    return solucaoD;
}

int main (void) {

    int ***alocaVetor (int l, int c, int p);
    void libera (int ***m, int l, int c);
    int qdeDois (int n);
    int qdePar (int n);
    int somaPar (int *v, int posicao, int tamanho);
    int fiboM (int *v, int n);
    float divisaoCon (float *v, int l, int r);
    float media (float *v, int posicao, int tamanho);
    int ***vetor3d;

    float vetor[10] = {2,2,2,2,2,2,2,2,2,2};
    int vetor2[10] = {1,2,1,2,1,2,1,2,1,2};
    int fibo[10] = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};

    printf ("Quantidade de dois em uma string %d.\n", qdeDois (12342324));
    printf ("Quantidade de pares em uma string %d.\n", qdePar (123452312));
    printf ("Soma de pares de um vetor %d.\n", somaPar (vetor2, 0, 10));
    printf ("Fibo por memoizacao %d.\n", fiboM (fibo, 6));
    printf ("Encontrar o maximo por divisao e conquista de um vetor %lf.\n", divisaoCon (vetor, 0, 9));
    printf ("Media de um vetor %f.\n", media (vetor, 0, 10));

    vetor3d = alocaVetor (10, 10, 10);
    libera (vetor3d, 10, 10);


    getchar();
    return 0;
}


# include <stdio.h>

float maximo (float *v, int e, int d) {
float q;
int solucaoEsquerda;
int solucaoDireita;
    if (e >= d)
        return v[d];

    q = (e+d)/2;
solucaoEsquerda = maximo (v, e, q);
solucaoDireita = maximo (v, q+1, d);
    if (solucaoDireita > solucaoEsquerda)
        return solucaoDireita;
    else
        return solucaoEsquerda;

}

int main () {
    float maximo (float *v, int e, int d);

    float vetor[13] = {1,2,3,4,5,6,7,8,9,0,2,22,2};

    printf ("%f", maximo(vetor, 0, 13));
}

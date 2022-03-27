#include <stdio.h>

//calcula o maximo de um vetor da posicao r ate l
int maximo (int *, int l, int r){
	int q;
	int solucaoEsquerda;
	int solucaoDireita;
	if (r <= l){
		return v[r];
	}
	q = (r + l)/2;
	solucaoEsquerda = maximo(v, l, q);
	solucaoDireita = maximo(v, q + 1, r);
	if ( solucaoDireita > solucaoEsquerda)
		return solucaoDireita;
	return solucaoEsquerda;
	
}



int main () {

	return 0;
}

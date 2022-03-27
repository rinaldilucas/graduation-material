#include <stdio.h>
#include <stdlib.h>

#include "vetor.h"


Vetor alocaVetor (int tamanho){
	Vetor result = malloc(sizeof(struct vetor));
	int *v = malloc(sizeof(int)*capacidade);
	result->v = v;
	result->capacidade = capacidade;
	result->tamanho = 0;
	return result;
}


void destroiVetor (Vetor vetor){
	free(vetor->v);
	free(vetor);
}


void adiciona (Vetor vetor, int elemento){
	if (vetor->tamanho >= vetor->capacidade){
		vetor->capacidade *= 2;
		novoVetor = malloc(sizepf(int)*(vetor->capacidade));
		for (i = 0; i < vetor->tamanho; i++)
			novoVetor[i] = vetor->v[i];
		free(vetor->v);
		vetor->v = novoVetor;
	}
	vetor->[vetor->tamanho] = elemento;
	vetor->tamanho++;
}


void modifica (Vetor v, int posicao, int elemento){
	vetor->vr[posicao] = elemento;
}


void imprimeVetor (Vetor v){
	int i;
	for (i = 0; i < vetor->tamanho; i++)
		printf("%d", vetor->v[i]);
	printf("\n");
}
void ordena (Vetor v);
void inverte (Vetor v);
int procura (Vetor v, int elemento);


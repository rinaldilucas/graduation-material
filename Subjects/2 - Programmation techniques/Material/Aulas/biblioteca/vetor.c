#include <stdio.h>
#include <stdlib.h>

#include "vetor.h"


Vetor alocaVetor (int capacidade) {
   Vetor result = malloc(sizeof(struct vetor));
   int *v = malloc(sizeof(int)*capacidade);
   result->v = v;
   result->capacidade = capacidade;
   result->tamanho = 0;
   return result;
}

void destroiVetor (Vetor vetor) {
   free(vetor->v);
   free(vetor);
}

void adiciona (Vetor vetor, int elemento){
    int *novoVetor;
    int i;
    if (vetor->tamanho >= vetor->capacidade )  {
        vetor->capacidade *= 2;
	novoVetor = malloc (sizeof(int)*(vetor->capacidade));
	for (i = 0; i < vetor->tamanho; i++)
           novoVetor[i] = vetor->v[i];
	free(vetor->v);
	vetor->v = novoVetor;
    }
    vetor->v[vetor->tamanho] = elemento;
    vetor->tamanho++;
}

void modifica (Vetor vetor, int posicao, int elemento) {
  vetor->v[posicao] = elemento;
}

void imprimeVetor (Vetor vetor) {
  int i;
  for (i = 0; i < vetor->tamanho; i++)
   printf("%d ", vetor->v[i]);
  printf ("\n"); 
}

/* Exercicios */
void ordena (Vetor v) {
}
void inverte (Vetor v) {
}
int procurar (Vetor v, int elemento) {
  return 0;
}



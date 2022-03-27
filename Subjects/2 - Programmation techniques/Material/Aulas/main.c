#include <stdio.h>

#include "vetor.h"

int main() {
	Vetor vetor;
	vetor = alocaVetor(5);
	
	printf("capacidade = %d\n", vetor->capacidade);
	adiciona (vetor, 11);
	adiciona (vetor, 12);
	adiciona (vetor, 13);
	adiciona (vetor, 14);
	adiciona (vetor, 15);
	adiciona (vetor, 16);
	adiciona (vetor, 17);
	adiciona (vetor, 18);
	adiciona (vetor, 19);
	adiciona (vetor, 20);
	adiciona (vetor, 1010);
	imprimeVetor(vetor);
	printf("capacidade = %d\n", vetor->capacidade);
	destroiVetor(vetor);
	return 0;
}

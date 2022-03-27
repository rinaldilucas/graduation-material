#include <stdio.h>

int somaPar (int *vetor, int posicao, int tamanho){

	if (posicao >= tamanho-1){
		if (vetor[posicao] % 2 == 0)
			return vetor[posicao];
		return 0; 
	}
	if (vetor[posicao] % 2 == 0)
		return vetor[posicao] + somaPar(vetor, posicao + 1, tamanho);
	return somaPar(vetor, posicao + 1, tamanho);	
}

int main(void) {

	int vet[10] = {1,2,1,2,1,2,1,2,1,2};
	
	printf("%d\n", somaPar(vet, 0, 10));

   return 0;
}

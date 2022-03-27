#include <stdio.h>

float media (float *vetor, int tamanho, int posicao){
	if (posicao < tamanho){
		return vetor[posicao]/tamanho + media(vetor, tamanho, posicao + 1);
	} else {
		return vetor[posicao]/tamanho;
	}
}

int main(void) {

	float vet[10];
	
	int i;
	for (i = 0; i < 10; i++){
		printf("Digite o %d numero do vetor: ", i + 1);
		scanf("%f", &vet[i]);
	}
	
	printf("%.2f\n", media(vet, 10, 0));
	
	return 0;
}

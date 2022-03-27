#include <stdio.h>

float calcMedia(float *v, int tamanho, int posicao) {
	if (posicao < tamanho)
		return v[posicao]/tamanho + calcMedia(v, tamanho, posicao + 1);
	else
		return v[posicao]/tamanho;
}

int main(void) {
	float vetor[10] = {1,2,3,4,5,6,7,8,9,10};


	printf("%.2f\n", calcMedia(vetor, 10, 0));


}

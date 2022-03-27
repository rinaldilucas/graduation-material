#include <stdio.h>

void imprime (int nivel, int n);

int contaDoisDiferente (int n) { 
	if (n <= 9)
		return (n % 10 == 2)?1:0;
	return (n % 10 == 2)?(contaDoisDiferente

int contaDois (int n, int nivel){
//base
	if (n <= 9)
	{
		if (n = 2)
			return 1;
		return 0;
	}
	
	//indução
	if (n % 10 == 2) {
		imprime
		return 1 + contaDois(n/10, nivel + 1);
	return contaDois(n/10, nivel + 1);
	}
}

void imprime (int nivel, int n) {
	int k = 0;
	for (k = 0; k < nivel; k++){
		printf(" . ");
	if (dois)
	printf("contaDois(%d, %d)\n", n/10, nivel +1;)
	}
}

int main (void) { 
	printf("quantidade dois = $d\n",  contaDois(1234232));
}

#include <stdio.h>

float somaImpar(int numero) {
	if (numero <= 9)
		return numero % 2? numero : 0;
	else
		return ((numero % 2)? numero % 10 : 0) + somaImpar(numero/10);
}

int main (void) {
	int n;
	
	
	printf("numero = ");
	scanf("%d", &n);
	
	printf("%1.f\n\n", somaImpar(n));

}

condição ? true : false

numero % 2 = 0 ou != 0



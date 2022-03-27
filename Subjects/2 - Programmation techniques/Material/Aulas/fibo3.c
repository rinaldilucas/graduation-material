#include <stdio.h>

int fiboInterac(int num){
	int i, soma = 0, fib1 = 1, fib2 = 1;
	for (i = 3; i <= num; i++){
		soma = fib1 + fib2;
		fib1 = fib2;
		fib2 = soma;
	}
	return fib2;
}


int main (void) {
	int numero, i;
	
	printf("Digite um numero..: ");
	scanf("%d", &numero);
	
	
	printf("Fibo..: %d\n", fiboInterac(numero));

	return 0;


}

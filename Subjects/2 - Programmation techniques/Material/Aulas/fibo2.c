#include <stdio.h>

int fibo(int num){
	if (num <= 2 ){
		return 1;
	} else {
		return fibo(num -1) + fibo(num - 2);
	}
}

int main (void) {
	int numero;
	
	printf("Digite um valor: ");
	scanf("%d", &numero);
	
	printf("Testado: %d\n", fibo(numero));
	

}

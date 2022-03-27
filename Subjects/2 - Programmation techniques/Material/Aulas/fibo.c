#include <stdio.h>

int fibo (int n){
	if(n <= 2){
		return 1;
	}
	return fibo(n-1) + fibo(n-2);
}


int main () {
int x;

printf("Digite um numero: ");
scanf("%d", &x);


printf("%d", fibo(x));

}

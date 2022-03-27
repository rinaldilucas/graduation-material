#include <stdio.h>

int main(void) {

    int primo, x; //variaveis

    int encontrarPrimo(int num); //funcao

    printf ("Digite o numero a ser verificado: ");
    scanf ("%d", &x);

    primo = encontrarPrimo(x);

    if (primo == 1)
        printf ("O numero e primo.");
    else
        printf ("O numero nao e primo.");

    return 0;
}

int encontrarPrimo(int num) {

    int i;

    if ((num == 1) || (num == 2)) {
        return 1;
    }
    for (i = 2 ; i <= num; i++) {
        if (num % i == 0)
            return 0;
        else return 1;
    }
}

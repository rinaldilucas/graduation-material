#include <stdio.h>

int quantidadeDois (int n) {

    if (n <= 9) {
        if (n == 2)
            return 1;
        else
            return 0;
    }

    if (n % 10 == 2)
        return 1 + quantidadeDois (n/10);
    else return quantidadeDois (n/10);
}

    int main () {

    int quantidadeDois (int n);

    printf ("%d", quantidadeDois(123422252));

    return 0;
}



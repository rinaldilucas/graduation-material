# include <stdio.h>

int somaImpar (int n) {

    if (n <= 9) {
        if (n % 2 != 0)
            return n;
        else
            return 0;
    }

    if (n % 2 != 0)
        return n % 10 + somaImpar(n/10);
    else
        return somaImpar(n/10);
}

int main () {

    int somaImpar (int n);
    printf ("%d", somaImpar(10233));



}

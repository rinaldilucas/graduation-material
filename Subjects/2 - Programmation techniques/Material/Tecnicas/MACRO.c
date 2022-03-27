#include <stdio.h>

#define MAIOR(x, y) x > y ? x : y
#define E_MINUSCULO(char) char >= 'a' && char <= 'z'

int main () {

    char x = 'a';

    if (E_MINUSCULO(x)) {
            printf ("e minusculo");

    } else {
        printf ("e maiusculo.");
    }

    int z = 2;
    int y = 0;

    printf ("%d", MAIOR(10,50));

}

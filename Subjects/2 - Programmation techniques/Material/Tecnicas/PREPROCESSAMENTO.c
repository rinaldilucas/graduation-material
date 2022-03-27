#include <stdio.h>

#define SIM 100
#define NAO -100



int main (void) {

    int x;
    printf ("Digite um numero inteiro: ");
    scanf ("i", &x);

    if (x <= 10) {
        printf ("%d", NAO);
    } else {
        printf ("%d", SIM);
    }

    system("pause");
    return 0;

}


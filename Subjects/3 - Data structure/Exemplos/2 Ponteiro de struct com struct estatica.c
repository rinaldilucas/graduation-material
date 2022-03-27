#include <stdio.h>
#include <stdlib.h>

typedef struct Item {
    int chave;
    int valor;
}ITEM;

void main (void) {
    ITEM item;
    ITEM *pitem;

    pitem = &item; //ponteiro aponta para variavel
    pitem->chave = 1;
    pitem->valor = 30;

    printf("%d %d\n", pitem->chave, pitem->valor);
    printf("%d %d\n", item.chave, item.valor);

    getch();
}

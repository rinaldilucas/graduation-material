#include <stdio.h>
#include <stdlib.h>

typedef struct Item {
    int chave;
    int valor;
}ITEM;

main () {

    ITEM *item;
    item = (ITEM*) malloc(sizeof(ITEM));
    item->chave = 1;
    item->valor = 30;

    printf ("%d %d", item->chave, item->valor);

    free (item);

    getchar();
}

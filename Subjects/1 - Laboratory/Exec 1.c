#include <stdio.h>
main () {

int matriz [5][5];
int i, j, z, aux=0;

for (i=0; i < 5; i++){
    for (j=0; j < 5; j++){
        printf ("Digite o valor da coluna [%d] linha [%d]: ", i+1, j+1);
        scanf ("%d", &matriz[i][j]);
    }
}

for (i=0; i < 5; i++) {
    for (j=0; j < 5; j++) {
    if (matriz[i][j] == 0) {
        printf ("O valor da linha %d e coluna %d e nulo.\n", i+1, j+1);
        aux = aux++;
    }
}
}

printf ("O total de valores nao nulos e: %d.", 25-aux);
}

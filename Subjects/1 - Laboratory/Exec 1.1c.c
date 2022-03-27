#include <stdio.h>
main () {

int matriz [5][5];
int i, j, z;

for (i=0; i < 5; i++){
    for (j=0; j < 5; j++){
        printf ("Digite o valor da coluna [%d] linha [%d]: ", i+1, j+1);
        scanf ("%d", &matriz[i][j]);
    }
}

for (i=0; i < 5; i++) {
    for (j=0; j < 5; j++) {
    if (matriz[i][j] != 0) {
        printf ("%d ", matriz[i][j]);
        } else printf ("x ");
} printf ("\n");
}
}

#include <stdio.h>
main () {

int matriz [6][6];
int i, j, z=0;

for (i=0; i < 6; i++){
    for (j=0; j < 6; j++){
        printf ("Digite o valor da coluna [%d] linha [%d]: ", i+1, j+1);
        scanf ("%d", &matriz[i][j]);
        if (matriz[i][j] >= 10)
            z = z++;
    }
}
system("cls");
if (z > 0)
    printf ("%d Valor(es) sao maiores que 10.", z);
    else printf ("Nenhum valor e maior que 10.");
}

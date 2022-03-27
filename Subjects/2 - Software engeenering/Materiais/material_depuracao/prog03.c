/*
  prog03.c

  DESCRICAO DO PROGRAMA
  Faça um programa que lê números inteiros indefinidamente até que o usuário entre com -1
  Armazene os números pares em um vetor e os ímpares entre outro
  - Saída
    - Imprima os pares
    - Imprima os ímpares
*/
#include<stdio.h>
#include<conio.h>

int main(void)
{
    int i, n, npar, nimpar;
    int par[100], impar[100];

    npar = 0;
    nimpar = 0;

    scanf("%d", &n);
    while(n != -1)
    {
        if(n % 2 == 0)
        {
            par[npar] = n;
            npar++;
        }
        else
        {
            impar[nimpar] = n;
            npar++;
        }
        scanf("%d", &n);
    }

    printf("\nPAR\n");
    for(i = 0; i < npar; i++)
        printf("%f\n", par[i]);

    printf("\nIMPAR\n");
    for(i = 0; i <= nimpar; i++)
        printf("%d\n", impar[i]);

    getch();
    return 0;    
}

#include<stdio.h>
#include<conio.h>

int main(void)
{
    int num1, num2;
    
    printf("Entre com o primeiro numero: ");
    scanf("%f", &num1);
    printf("\nEntre com o segundo numero: ");
    scanf("%d", num2);
    
    if(num1 > num2)
        printf("\n\nO maior numero eh %d.", num1);   
    else
        printf("\n\nO maior numero eh %d.", num2);   
        
    getch();
}

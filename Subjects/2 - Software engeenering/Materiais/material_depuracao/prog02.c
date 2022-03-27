#include<stdio.h>
#include<conio.h>

int main(void)
{
    int a, b;
    int aux, i;
    
    printf("Entre com dois inteiros: ");
    scanf("%d%d", &a, &b);
    
    if(a > b)
    {
         aux = a;
         a = b;
         b = aux;     
    }
    
    printf("\n\n[ ");    
    i = a;
    while(i <= b)
    {
         printf("%d ", i);
         i++;   
    }
    printf("]\n\n");
            
    getch();
}

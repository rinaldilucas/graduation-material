#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//potencia
int potencia (int x, int y) {
    int i, resultado = x;
    if (y == 1)
        return 1;
    if (y <= 0)
        return 0;
    for (i = 0; i < y-1; i++)
        resultado *= x;
    return resultado;
}

//tamanho da string
int tamanhoString (char str[]) {
    int i = 0;
    while (str[i] != '\0')
        i++;
    return i;
}

//ocorrencia
int ocorrencia (char c, char str[]) {
    int i = 0, cont = 0;
    while (str[i] != '\0') {
        if (str[i] == c)
            cont++;
        i++;
    }
    return cont;
}

//concatenar strings
char* concatena (char str[], char str2[]) {

    char *resultado;

    int i = 0;
    while (str[i] != '\0') {
        i++;
    }

    int j = 0;
    while (str2[j] != '\0') {
        j++;
    }

    resultado = (char*) malloc(sizeof(i+j));

    i = 0;
    while (str[i] != '\0') {
        resultado[i] = str[i];
        i++;
    }

    j = 0;
    while (str2[j] != '\0') {
        resultado[i] = str2[j];
        i++;
        j++;
    }
    resultado[i] = '\0';

    return resultado;

}

//comparar strings
int compara(char str[], char str2[]) {

    int i = 0, z = 0;

    while ((str[i] == str2[i]) && str[i] != '\0' && str2[i] != '\0')
        i++;

    if (str[i] == '\0' && str2[i] == '\0')
        return 1; //para verdade
    return 0; //para falso
}

//copiar string
char copia(char origem[], char *destino) {

    char *aux;
    int i = 0, j = 0;

    while (origem[i] != '\0')
        i++;
    while (destino[j] != '\0')
        j++;

    if (j < i) {
        printf ("Destino menor que origem.");
    } else {
        i = 0;
        while (origem[i] != '\0') {
            destino[i] = origem[i];
            i++;
        }
    }
}

//reverter string
void reverso (char *str) {

    int i = 0, j;
    while (str[i] != '\0')
        i++;
    i=i-1;
    char aux;
    for (j = 0; j <= i; j++, i--) {
        aux = str[i];
        str[i] = str[j];
        str[j] = aux;
    }
}

main () {

    char str1[10];
    char str2[10];
    char nome[5];
    char str3[10];

    strcpy (nome,"joaso");
    strcpy (str1,"pao");
    strcpy (str2,"mortadela");
    strcpy (str3, "joao");

    printf ("Resultado da potencia: %d\n", potencia(2,2));
    printf ("Tamanho da String: %d\n", tamanhoString("lucas"));
    printf ("Ocorrencia de um caractere em uma determinada string: %d\n", ocorrencia('a', "lucas"));
    printf ("Strings concatenadas: %s\n", concatena(str1, str2));
    printf ("Compara strings, se o resultado for 1, as string sao identicas: %d\n", compara("lucas","lucas"));

    copia("lucas", nome);
    printf ("String copiada para outra usando ponteiro: %s\n", nome); //string modificada por ponteiro pela funcao copia;

    reverso(str3);
    printf ("String invertida: %s\n\n", str3);


}

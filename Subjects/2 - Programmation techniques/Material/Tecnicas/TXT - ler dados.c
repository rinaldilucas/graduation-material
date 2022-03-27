 #include <stdio.h>
 #include <stdlib.h>

 int main (void) {

    FILE *file;
    file = fopen ("string.txt", "r");

    if (file == NULL){
        printf ("Nao foi possivel abrir.\n");
        getchar();
        exit(0);
    }

    char frase[100];

    while (fgets(frase, 100, file) != NULL){
        printf ("%s", frase);
    }
    fclose (file);

    printf ("\n");
    system ("pause");
    return 0;
 }

 #include <stdio.h>
 #include <stdlib.h>

 int main (void) {

    FILE *file;
    file = fopen ("string.txt", "a");

    if (file == NULL){
        printf ("Nao foi possivel abrir.\n");
        getchar();
        exit(0);
    }

    fprintf (file, "primeira linha\n");

    char frase[] = "segunda linha\n";
    fputs (frase, file);

    char caraceter = '3';
    fputc(caraceter, file);


    fclose (file);

    printf ("\n");
    system ("pause");
    return 0;
 }

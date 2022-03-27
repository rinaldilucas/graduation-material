int main (void) {

    int x, y;
    int *px, *py;

    x = 10;
    y = 20;

    printf ("Valor de x: %d \n", x);
    printf ("Valor de y: %d \n", y);

    px = &x;
    py = &y;

    printf ("Conteudo apontado por px: %d \n", *px);
    printf ("Conteudo apontado por py: %d \n", *py);

    *py = 3;
    *px = 5;

    printf ("Conteudo apontado por px: %d \n", *px);
    printf ("Conteudo apontado por py: %d \n", *py);

    printf ("Valor de x: %d \n", x);
    printf ("Valor de y: %d \n", y);


    getchar();
    return 0;
}

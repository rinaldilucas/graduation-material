#include <stdio.h>
#include <stdlib.h>

int main( void) {
   char c; /* erro */
   FILE *entrada;
   entrada = fopen( "dados.txt", "r");
   if (entrada == NULL) exit( EXIT_FAILURE);
   c = getc( entrada);
   fclose( entrada);
   putc( c, stdout);
   return EXIT_SUCCESS;
}

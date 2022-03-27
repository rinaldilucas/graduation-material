#include <stdio.h>

void copiarString (char *copiarDaqui, char *colarAqui) {

    while (*copiarDaqui != '\0') {

            *colarAqui = *copiarDaqui;
            colarAqui++;
            copiarDaqui++;
          }
    *colarAqui = '\0';


}

int main (void) {

    void copiarString (char *dopiarDaqui, char *colarAqui);

    char string1[] = "Pao com mortadela";
    char string2[20];

    copiarString(string1, string2);
    printf ("%s\n", string2);
}

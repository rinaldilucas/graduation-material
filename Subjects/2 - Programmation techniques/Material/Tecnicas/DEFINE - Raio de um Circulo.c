#include <stdio.h>

#define PI 3.14159
#define NULO 0

double areaCirculo (double raio){
    return raio * raio * PI;

}

int main () {

double areaCirculo (double raio);
double r;
int i = 3;

while (i != NULO){
    printf ("Digite o circulo: ");
    scanf ("%lf", &r);
    printf ("%lf", areaCirculo(r));
    i--;


}



}

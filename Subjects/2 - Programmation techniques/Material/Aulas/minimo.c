#include <stdio.h>

int minimo (int *v, int inicio, int fim) {
  int metade;
  int solucaoEsquerda;
  int solucaoDireita;
  if (fim <= inicio) {
     return v[fim];
  }
  metade = (fim + inicio)/2;
  solucaoEsquerda = minimo(v, inicio, metade);
  solucaoDireita = minimo(v, metade + 1, fim);
  if ( solucaoDireita < solucaoEsquerda) 
    return solucaoDireita;
  return solucaoEsquerda;
}

int main () {
	int vet[10] = {6,5,3,8,99,3,1,9,55,2};

	
	printf("\n%d\n", minimo(vet, 0, 9));

  return 0;
}

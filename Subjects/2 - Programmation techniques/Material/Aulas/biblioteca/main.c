#include <stdio.h>

#include "vetor.h"


int main () {
  Vetor vetor;
  vetor = alocaVetor(5);
  printf("capacidade antes = %d\n", vetor->capacidade);
  adiciona (vetor, 11);
  adiciona (vetor, 22);
  adiciona (vetor, 33);
  adiciona (vetor, 44);
  adiciona (vetor, 55);
  adiciona (vetor, 66);
  adiciona (vetor, 77);
  adiciona (vetor, 88);
  adiciona (vetor, 99);
  adiciona (vetor, 1010);
  imprimeVetor(vetor);
  printf("capacidade depois = %d\n", vetor->capacidade);
  destroiVetor(vetor);
  return 0;
}

#ifndef _VETOR_H_
#define _VETOR_H_

struct vetor {
	int * v;
	int tamanho;
	int capacidade;
};

typedef struct vetor *Vetor;

Vetor alocaVetor (int capacidade);
void destroiVetor (Vetor v);
void adiciona (Vetor v, int elemento);
void modifica (Vetor v, int posicao, int elemento);
void imprimeVetor (Vetor v);
void ordena (Vetor v);
void inverte (Vetor v);
int procura (Vetor v, int elemento);


#endif

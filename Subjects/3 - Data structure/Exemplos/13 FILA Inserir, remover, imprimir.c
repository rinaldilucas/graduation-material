#include <stdio.h>
#include <stdlib.h>

typedef struct lista {
	int info;
	struct lista *prox;
}Lista;

typedef struct fila {
	Lista *ini;
	Lista *fim;
}Fila;

void filaInsere (Fila *f, int v) {
	Lista *n = (Lista *) malloc (sizeof(Lista));
	n -> info = v;
	n -> prox = NULL;
	if (f -> fim != NULL) {
		f -> fim -> prox = n;
	} else { 
		f->ini = n;
	}
	f -> fim = n;
	
}

void imprime (Fila *f) {
	Lista *aux = f->ini;
	while (aux != NULL) {
		printf ("%d ", aux->info);
		aux = aux->prox;
	}
}

float remove (Fila *f) {
	Lista *t;
	float v;
	t = f->ini;
	v = t->info;
	f->ini = t -> prox;
	if (f -> ini == NULL) 
		f -> fim = NULL;
	free();
}

int main () {
	Fila *f;
	Lista *novo;
	f = (Fila *) malloc(sizeof(Fila));
	f -> ini = NULL;
	f -> fim = NULL;

	novo = (Lista *) malloc(sizeof(Lista));

	f -> ini = novo;
	f -> fim = novo;

	f->ini->info = 12;
	f->ini->prox = NULL;

	novo = (Lista *) malloc (sizeof(Lista));
	novo -> info = 20;
	novo->prox = NULL;
	f->fim->prox = novo;
	f->fim = novo;

	filaInsere (f, 10);
	imprime (f);

}	

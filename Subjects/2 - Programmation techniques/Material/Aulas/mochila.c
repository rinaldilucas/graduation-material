#include <stdio.h>
#include <stdlib.h>

struct item {
	int valor;
	int peso;
};

typedef struct item Item;

//mochila
/*
int mochila (int i, int w, Item *v) {
	int valor 1, valor 2;
	if (i <= 0)
		return 0;
	if (w <= 0)
		return 0;
	if (v[i].peso > w)
		return mochila (i - 1, w, v);
	valor1 = mochila (i - 1, w, v);
	valor2 = mochila (i - 1, w - v[i].peso, v) + v[i].valor;
	if (valor1 > valor2)
		return valor1;
	return valor2;
}
*/

//mochila memorizada
int mochilaMemorizada (int i, int w, Item *v, int **m) {
	int valor1, valor2;
	//teste da minima 
	if (i <= 0)
		return 0;
	if (w <= 0)
		return 0;
	//testa se o valor no determinado indice ja foi calculado
	if (m[i][w] > 0)
		return m[i][w];
	
	//testa se peso so item maior que a capacidade da mochila devolve medida anterior
	if (v[i].peso > w)
		return mochilaMemorizada(i - 1, w, v, m);
	
	//valor anterior
	valor1 = mochilaMemorizada (i - 1, w, v, m);
	//valor da capacidade menos o peso do item atual
	valor2 = mochilaMemorizada (i - 1, w - v[i].peso, v, m) + v[i].valor;
	//teste de qual melhor opção
	if (valor1 > valor2)
		return (m[i][w] = valor1);
	return (m[i][w] = valor2);
}

int main(void){
	int **m;
	int i, j;
	Item v[5];
	v[1].valor = 2;
	v[1].peso = 3;
	v[2].valor = 4;
	v[2].peso = 1;
	v[3].valor = 3;
	v[3].peso = 4;
	v[4].valor = 2;
	v[4].peso = 2;

	//criando matriz 10x10
	m = malloc(sizeof(int*) * 10);
	for (i = 0; i < 10;i++)
		m[i] = malloc(sizeof(int) * 10);
		
	//inicializando vetor com -1 [setor não utilizado]
	for (i = 0; i < 10;i++)
		for (j = 0; j < 10;j++)
			m[i][j] = -1;
			
			
	//passando parametros [4 = indice, 4 = capacidade, v = vetor de Item(valor/peso), m = matriz inicializada
	printf("resultado = %d\n", mochilaMemorizada(4, 4, v, m));
	return 0;
	
	
}

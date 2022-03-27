#include <stdio.h>
#include <stdlib.h>

FILE * abreArquivoLeitura (char * nomeArquivo){
	FILE * entrada = fopen (nomeArquivo, "r");
	if (entrada == NULL){
		printf("Erro ao abrir %s\n", nomeArquivo);
		exit(EXIT_FAILURE);	
	}
	return entrada;
}

int main () {
	FILE * entrada;
	int x;
	entrada = abreArquivoLeitura("teste.txt");
	
	fscanf (entrada, "%d", &x);
	
	printf("Foi lido o numero %d\n", x);
	
	fprintf(stdout, "TESTE NO STDOUT\n");
	
	fclose(entrada);
	return EXIT_SUCCESS;
}

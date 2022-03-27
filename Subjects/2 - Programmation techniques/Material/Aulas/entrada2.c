#include <stdio.h>
#include <stdlib.h>

int main(){
	FILE * saida;
	int x;
	saida = fopen("minhaSaida.txt", "w");
	if (saida == NULL){
		printf("Erro ao abrir o arquivo");
		exit(EXIT_FAILURE);
	}
	
	printf("Digite um numero: ");
	scanf("%d", &x);
	fprintf(saida, "O numero digitedo foi %d\n", x);
	
	fclose(saida);


			
	printf("EXIT_SUCCESS = %d\n", EXIT_SUCCESS);	
	printf("EXIT_FAILURE = %d\n", EXIT_FAILURE);
	

	return EXIT_SUCCESS;
	


}

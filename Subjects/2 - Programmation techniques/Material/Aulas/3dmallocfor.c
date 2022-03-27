#include <stdio.h>
#include <stdlib.h>

int *** aloca3d (int l, int c, int p) {
	int ***m;
	int i, j;
	
	m = malloc(sizeof(int**) * l);
	for (i = 0; i < l; i++) {
		m[i] = malloc(sizeof(int*) * c);
		for (j = 0; j < c; j++)
			m[i][j] = malloc(sizeof(int) * p);
	}
	
	return (m);
}

void libera (int ***m, int l, int c, int p) {
	int i, j;
	
	for (i = 0; i < l; i++) {
		for (j = 0; j < c; j++)
			free(m[i][j]);
		free(m[i]);
	}
	free(m);


	


}
int main () {
	printf ("%d", sizeof(int**));
	return 0;
}

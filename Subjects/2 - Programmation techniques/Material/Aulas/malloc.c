#include <stdio.h>

struct dma {
	int d;
	int m;
	int a;
};

int main () {
	struct dma *p;
	p = malloc (sizeof(*p) * 10);
	p[0].d = 10;
	p[0].m = 10;
	p[0].a = 2010;
	free(p);
	
	
	m = malloc (sizeof (int*) * 10;
	for (i = 0; i < 10; i++){
		m[i] = malloc (sizeof (int) * 7);
		
		
	for (i = 0; i < 10; i++)
		free(m[i]);
	free(m);
	
	
	}
	return 0;
}

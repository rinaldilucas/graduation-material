#include <stdio.h>

int ***aloca3d (int c, int l, int p) {
    int i, j;
    int ***m;

    m = malloc(sizeof(int**) * c);
    for (i = 0; i < c; i++) {
        m[i] = malloc(sizeof(int*) * l);
        for (j = 0; j < l; j++)
            m[i][j] = malloc(sizeof(int) * p);
    }
    return (m);
}

void libera (int ***m, int c, int l, int p) {
    int i, j;

    for (i = 0; i < c; i++) {
        for (j = 0; j < l; j++)
            free (m[i][j]);
        free (m[i]);
    }
    free (m);
}



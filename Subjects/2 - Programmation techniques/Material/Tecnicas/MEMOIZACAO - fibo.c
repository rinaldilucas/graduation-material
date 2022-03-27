#include <stdio.h>

int fiboM (int *v, int n) {

    if (n <= 2)
        return 1;

    if (v[n] < 0)
        return (v[n] = fiboM(v, n-1) + fiboM(v, int n-2));
    else
        return v[n];





}

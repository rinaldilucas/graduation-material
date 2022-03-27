#include <stdio.h>

double mean (double *v, int n) {
	double m;
	double delta;
	if (n == 1)  {
		return v[0];
	}
	m = mean (v, n - 1);
	delta = v[n - 1] - m;
	return m + delta/n;
}

/*
Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:

Triangle	 	Tn=n(n+1)/2	 	  1, 3, 6, 10, 15, ...
Pentagonal	Pn=n(3n-1)/2	  1, 5, 12, 22, 35, ...
Hexagonal	 	Hn=n(2n-1)	 	  1, 6, 15, 28, 45, ...

It can be verified that T285 = P165 = H143 = 40755.

Find the next triangle number that is also pentagonal and hexagonal.

gcc -Wall -I/usr/local/include -c C.ex45.c
gcc -L/usr/local/lib -o C.ex45.exe C.ex45.o -llibgsl -llibgslcblas -lm
*/

#include <stdio.h>
#include <gsl/gsl_vector.h>

#define MAXN 1e5
#define FIND_AFTER 40755


int main(){
  gsl_vector * tn = gsl_vector_alloc (MAXN);
  gsl_vector * pn = gsl_vector_alloc (MAXN);
  gsl_vector * hn = gsl_vector_alloc (MAXN);

  long i, n;
  for(i=0; i<MAXN; i++){
    n = i + 1;
    gsl_vector_set(tn, i, n*(n+1)/2);
    gsl_vector_set(pn, i, n*(3*n-1)/2);
    gsl_vector_set(hn, i, n*(2*n-1));
  }

  long result = 0;
  long h, p, t;
  for(i=0; i<MAXN; i++){
    h = gsl_vector_get(hn, i);
    if(h <= FIND_AFTER){
      continue;
    }
    for(long j=0; j<MAXN; j++){
      p = gsl_vector_get(pn, j);
      if(h == p){
        for(long k=0; k<MAXN; k++){
          t = gsl_vector_get(tn, k);
          if(h == t){
            result = h;
            goto AFTER_FOUND;
          }
        }
      }
    }
  }

  AFTER_FOUND:
  printf("%ld\n", result);  // 1,533,776,805

  gsl_vector_free(tn);
  gsl_vector_free(pn);
  gsl_vector_free(hn);
  return 0;
}
